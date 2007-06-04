Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1HvDb0-0003IF-LE
	for openembedded-devel@openembedded.org; Mon, 04 Jun 2007 16:31:50 +0200
Received: (qmail 5193 invoked by uid 813007); 4 Jun 2007 14:29:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 4 Jun 2007 14:29:36 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 4 Jun 2007 16:29:28 +0200
User-Agent: KMail/1.9.7
References: <bdb0025f0705301542s7e64e43cjb5b737e7f1958806@mail.gmail.com>
	<200706040905.31450.openembedded@hrw.one.pl>
	<bdb0025f0706040610p35c0bfa5t440111e6b3b6f08c@mail.gmail.com>
In-Reply-To: <bdb0025f0706040610p35c0bfa5t440111e6b3b6f08c@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200706041629.29644.openembedded@hrw.one.pl>
Subject: Re: strange error: missing depends...
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
X-List-Received-Date: Mon, 04 Jun 2007 14:31:52 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 4 czerwca 2007, Rodrigo Vivi napisa=B3:
> On 6/4/07, Marcin Juszkiewicz <openembedded@hrw.one.pl> wrote:
> > Dnia pi=B1tek, 1 czerwca 2007, Rodrigo Vivi napisa=B3:
> > > I believe that sometimes you just need the packageA without their
> > > rdepends, but it will be pretty useful it bitbake provided an easy
> > > option to build every depends... something like:
> > > bitbake packageA --build-rdepends
> >
> > All DEPENDS and RDEPENDS are built during build of packageA - so no
> > need for "--build-rdepends" flag.
>
> But it doesn't call for do_write_package that really creates the
> package... The idea is to have a flag to do that... Maybe this
> "--build-rdepends" are not a good label to describe what I really
> want...

do_write_packages is one of "lowest priority" tasks as nothing in build=20
depend on them. So they are started at then end of whole build.=20

When I started my last build first lot of packages started to=20
fetch/unpack/patch (independent tasks), then some of them started to=20
configure (here some depends on do_populate_staging of others) and=20
compile (depend on configure ones). After compile they start to install,=20
package and stage (order is set in configs). Creating of packages (can be=20
few formats) is done after all those tasks are done. For big builds it=20
can take a lot of time until first packages will be generated.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Life's not fair. But the root password helps.




