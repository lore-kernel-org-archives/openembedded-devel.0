Received: from [65.254.253.89] (helo=mailout11.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.63) (envelope-from
	<SRS0=Jg5agT=I3=thegnar.org=markgross@yourhostingaccount.com>)
	id 1HUjWJ-0001DT-6m
	for openembedded-devel@openembedded.org; Fri, 23 Mar 2007 14:09:27 +0100
Received: from mailscan59.yourhostingaccount.com ([10.1.15.59]
	helo=mailscan59.yourhostingaccount.com)
	by mailout11.yourhostingaccount.com with esmtp (Exim)
	id 1HUjWI-00084d-6M
	for openembedded-devel@openembedded.org; Fri, 23 Mar 2007 09:09:26 -0400
Received: from authsmtp09.yourhostingaccount.com ([10.1.18.9] ident=exim)
	by mailscan59.yourhostingaccount.com with spamscanlookuphost (Exim)
	id 1HUjWH-0005qY-Mz
	for openembedded-devel@openembedded.org; Fri, 23 Mar 2007 09:09:25 -0400
Received: from authsmtp09.yourhostingaccount.com ([10.1.18.9]
	helo=authsmtp09.yourhostingaccount.com)
	by mailscan59.yourhostingaccount.com with esmtp (Exim)
	id 1HUjWF-0005pt-PP; Fri, 23 Mar 2007 09:09:23 -0400
Received: from pool-71-117-247-154.ptldor.fios.verizon.net ([71.117.247.154]
	helo=mgross-desktop)
	by authsmtp09.yourhostingaccount.com with esmtpa (Exim)
	id 1HUjWF-0007rn-5s; Fri, 23 Mar 2007 08:09:23 -0500
Received: by mgross-desktop (Postfix, from userid 1000)
	id A28BBC2E59; Fri, 23 Mar 2007 06:09:41 -0700 (PDT)
Date: Fri, 23 Mar 2007 06:09:41 -0700
From: Mark Gross <markgross@thegnar.org>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20070323130941.GA12609@thegnar.org>
References: <20070320033120.GA8678@thegnar.org>
	<1174574086.5949.32.camel@localhost.localdomain>
	<20070323043126.GA893@thegnar.org>
	<1174641616.5813.9.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1174641616.5813.9.camel@localhost.localdomain>
User-Agent: Mutt/1.5.11
X-EN-UserInfo: 797c2c580f2f40de3d8825fee4eaf462:2545611f8b0606d1227160eb92fd62ea
X-EN-AuthUser: markgross
Sender: Mark Gross <markgross@thegnar.org>
X-EN-OrigIP: 71.117.247.154
X-EN-OrigHost: pool-71-117-247-154.ptldor.fios.verizon.net
Cc: openembedded-devel@openembedded.org
Subject: Re: bitbake and OE opperation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2007 13:09:27 -0000
X-Groupsio-MsgNum: 1662
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2007 at 09:20:15AM +0000, Richard Purdie wrote:
> On Thu, 2007-03-22 at 21:31 -0700, Mark Gross wrote:
> > On Thu, Mar 22, 2007 at 02:34:45PM +0000, Richard Purdie wrote:
> > Yup, I read it.  I still have questions (I've figured out a number of
> > things since I posted this email.) Like, what triggers a given bbclass
> > file to be parsed, and what determines when if the functions withing the
> > class definition are executed.  I think I "get" the tasks and bb files
> > but the classes are still a bit mysterious.
>=20
> To trigger the inclusion of autotools.bbclass, you'd see "inherit
> autotools". Each .bb file has an assumed "inherit base". Also, conf
> files can add a class file for inclusion with IHHERIT =3D "xyz".
>=20

Ah, I'll take a closer look at base.


> > Mostly I was looking for the starting point in the dynamical program
> > space that the represent the dependency tree within the OE recipe
> > trees.  I think I get this.
> >=20
> > BB parses all the bb files which build up a network of dependencies that
> > is then traversed based on a seed point defined by the command line.
>=20
> Or seed points as it can have more than one, but yes.
>=20
> > > > How does bitbake push in the ./configure command line options?
> > >=20
> > > Bitbake knows nothing about this, it just knows about a list of tasks.
> > > autotools.bbclass defines a do_configure task which knows how to pass
> > > options set in an EXTRA_OECONF variable to a configure commandline. T=
he
> > > classes are a powerful abstraction feature but are part of OE, not
> > > bitbake.
> >=20
> > How is autotools.bbclass identified to be parsed?
>=20
> See above.
>=20
> > What triggers do_configure to be executed and when?
>=20
> Read base.bbclass. It sets up a number of tasks and a default task,
> "build". You'd add configure after patch, before compile. compile would
> be before build. "bitbake somefile" would cause the default task (and
> its dependent tasks) to be executed. You could also do "bitbake somefile
> -c configure" to specifically execute the configure task.

Ok.

>=20
> > What do I need to hack if I want to change the way or when they are
> > called?
> > There has to be some initial entry points for the classes.
>=20
> An assumed inherit base, then inheriting other classes like autotools
> which can change things. The order of the inherits matters.
>=20
> > Are there a set of pre-defined class functions that will be called or
> > does some bb file reference the class member functions?  (I haven't fou=
nd
> > them referenced in the bb files I looked at, and it makes me think there
> > is some meta knowledge in the bitbake code that expects to call things
> > like do_configure, or do_patch, or do_build, but I'm having a hard time
> > finding them.
> >=20
> > basically I'm trying to understand the glue that holds everything
> > together.  I'm staring to feel dangerous at hacking the OK bb tasks but
> > I'm still lost on the classes.
>=20
> Hopefully I've covered this above.
>=20
> > Dependency trees, configuration tweaking, the export of a minimal tree
> > of bbfiles for a specific build, a build browsing tool for exploring the
> > OE dependency cloud, for providers-bb files, classes and config files.
>=20
> You might fine bitbake -g interesting, particularly in trunk. It will
> dump a number of dependency graph files.

I forgot that one.  I found that the class dependencies aren't
represented in the graph.  It seems to be just the providers(?) / bb files.

>=20
> bitbake -DDD (enabling a ton of debugging) will also show you which
> files it touches and why.
>


I'll give this a spin!


> > Its taken me a long time figure out all the OE files that effect the
> > build of my image.  It be nice to make things easier for folks that come
> > after me to do the same type of thing....
>=20
> Help with the documentation is more than welcome!

That is my intention, at least to start with.

Something of a draft will be coming in a few weekends, as this all sinks
in a bit more.

Thanks so much for your help!

--mgross


--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGA9GVhK5OsmQOmSARAijUAJ40Yau3lZm7aLLi7qpef1ooHxL1+QCfXFyM
nr27JL/MCf8Ez5LRTb/lNck=
=CKnq
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
