Received: from [65.254.253.89] (helo=mailout11.yourhostingaccount.com)
	by linuxtogo.org with esmtp (Exim 4.63) (envelope-from
	<SRS0=Jg5agT=I3=thegnar.org=markgross@yourhostingaccount.com>)
	id 1HUbQn-0007vF-4S
	for openembedded-devel@openembedded.org; Fri, 23 Mar 2007 05:31:13 +0100
Received: from mailscan09.yourhostingaccount.com ([10.1.15.9]
	helo=mailscan09.yourhostingaccount.com)
	by mailout11.yourhostingaccount.com with esmtp (Exim)
	id 1HUbQl-0003ro-GD
	for openembedded-devel@openembedded.org; Fri, 23 Mar 2007 00:31:11 -0400
Received: from authsmtp09.yourhostingaccount.com ([10.1.18.9] ident=exim)
	by mailscan09.yourhostingaccount.com with spamscanlookuphost (Exim)
	id 1HUbQl-00082J-L6
	for openembedded-devel@openembedded.org; Fri, 23 Mar 2007 00:31:11 -0400
Received: from authsmtp09.yourhostingaccount.com ([10.1.18.9]
	helo=authsmtp09.yourhostingaccount.com)
	by mailscan09.yourhostingaccount.com with esmtp (Exim)
	id 1HUbQk-000820-9i; Fri, 23 Mar 2007 00:31:10 -0400
Received: from pool-71-117-247-154.ptldor.fios.verizon.net ([71.117.247.154]
	helo=mgross-desktop)
	by authsmtp09.yourhostingaccount.com with esmtpa (Exim)
	id 1HUbQj-00021G-SB; Thu, 22 Mar 2007 23:31:10 -0500
Received: by mgross-desktop (Postfix, from userid 1000)
	id D9B4FC2E59; Thu, 22 Mar 2007 21:31:26 -0700 (PDT)
Date: Thu, 22 Mar 2007 21:31:26 -0700
From: Mark Gross <markgross@thegnar.org>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20070323043126.GA893@thegnar.org>
References: <20070320033120.GA8678@thegnar.org>
	<1174574086.5949.32.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1174574086.5949.32.camel@localhost.localdomain>
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
X-List-Received-Date: Fri, 23 Mar 2007 04:31:14 -0000
X-Groupsio-MsgNum: 1659
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline

--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2007 at 02:34:45PM +0000, Richard Purdie wrote:
> Hi,
>=20
> On Mon, 2007-03-19 at 20:31 -0700, Mark Gross wrote:
> > I'm trying to understand the way bit bake builds the dependency trees
> > and works at a low level.   Trying to reverse engineer it from the
> > python code is difficult.  Does anyone recommend any browser tools for
> > navigating a large python code base like bit bake?
>=20
> I don't have any tools to recommend to help with this but you might find
> the recent trunk versions easier to follow as the parts are more split
> into modules.
>=20
> > I've read the documentation pages I could find but I haven't found any
> > "theory of operation" types of documents.  Are there any such things?
>=20
> Did you read the bitbake manual? If so, thats around as low level as the
> documentation goes since most OE users don't usually need to delve into
> what bitbake does behind the scenes and the manual is a mostly complete
> document of its API.

Yup, I read it.  I still have questions (I've figured out a number of
things since I posted this email.) Like, what triggers a given bbclass
file to be parsed, and what determines when if the functions withing the
class definition are executed.  I think I "get" the tasks and bb files
but the classes are still a bit mysterious.

> If you are interested, there are emails in the archive talking about
> specific changes that have been made to the code such as multithreading.
> Also, if there is anything you want clarified, I'm happy to explain
> things if I can.

Mostly I was looking for the starting point in the dynamical program
space that the represent the dependency tree within the OE recipe
trees.  I think I get this.

BB parses all the bb files which build up a network of dependencies that
is then traversed based on a seed point defined by the command line.

Some tricks I found to identify the bb files involved in my slugos-image
build was to run nohup bitbake -n -v slugos-image, and nohup bitbake -e
slugos-image.  I also got a fair amount of insight by running bitbake
in interactive mode and using the which command.

So now I know how to find all the bb files that are involved with
building my image. =20

>=20
> > The questions I have are:
> > How does a simple command line "bitbake slogos-image" translate into
> > building all the components? =20
>=20
> Bitbake only looks at a small subset of the metadata and is conceptually
> quite simple. Speaking in simply terms, bitbake looks at what each file
> PROVIDES and also what each file DEPENDS on.
>=20
> Once it has a target, it can look at what dependencies it needs (from
> DEPENDS and maybe RDEPENDS). It can then find providers for those
> dependencies which can be influenced by things like PREFERRED_PROVIDER
> and PREFERRED_VERSION. This cycle then repeats until it has a build
> chain. It converts that chain into a list of tasks and then executes
> each task in turn.
>=20
> In bitbake trunk, taskdata.py generates the metadata model in memory and
> then runqueue.py "compiles" that metedata into a single queue and builds
> it. If a task fails, it can recompile the metadata and try a different
> build path should the user wish.
>=20
> Note that bitbake 1.6 or less handles this totally differently and the
> code was rewritten in 1.7 onwards.

thanks!

>=20
> > How does bitbake push in the ./configure command line options?
>=20
> Bitbake knows nothing about this, it just knows about a list of tasks.
> autotools.bbclass defines a do_configure task which knows how to pass
> options set in an EXTRA_OECONF variable to a configure commandline. The
> classes are a powerful abstraction feature but are part of OE, not
> bitbake.

How is autotools.bbclass identified to be parsed?
What triggers do_configure to be executed and when?
What do I need to hack if I want to change the way or when they are
called?
There has to be some initial entry points for the classes.

Are there a set of pre-defined class functions that will be called or
does some bb file reference the class member functions?  (I haven't found
them referenced in the bb files I looked at, and it makes me think there
is some meta knowledge in the bitbake code that expects to call things
like do_configure, or do_patch, or do_build, but I'm having a hard time
finding them.

basically I'm trying to understand the glue that holds everything
together.  I'm staring to feel dangerous at hacking the OK bb tasks but
I'm still lost on the classes.

>=20
> > Are there tools for doing analysis on the open embedded bb library? =20
>=20
> What kind of analysis?

Dependency trees, configuration tweaking, the export of a minimal tree
of bbfiles for a specific build, a build browsing tool for exploring the
OE dependency cloud, for providers-bb files, classes and config files.

Its taken me a long time figure out all the OE files that effect the
build of my image.  It be nice to make things easier for folks that come
after me to do the same type of thing....

>=20
> Regards,
>

Thanks a lot!  I think in a few more weekends I may start to "get it".

--mgross


--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGA1gehK5OsmQOmSARAq5UAJ9QxthLGHi1R2hKxp2fk+dqXBhBogCeJsYx
qExC22eaQ+6HUgOqb+Ud3QI=
=aXR/
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
