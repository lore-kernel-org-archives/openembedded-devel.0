Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Me07n-0002W3-AY
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 07:23:47 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON005SGSU7AFG1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Aug 2009 00:06:08 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 794E114AF5F; Thu,
	20 Aug 2009 01:06:07 -0400 (EDT)
Date: Thu, 20 Aug 2009 01:06:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <b6ebd0a50908192153i2dbd6a74ve0e4337d76e9a474@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820050607.GJ32010@denix.org>
MIME-version: 1.0
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
	<1250738680-20274-7-git-send-email-clarson@mvista.com>
	<1250738680-20274-8-git-send-email-clarson@mvista.com>
	<20090820041833.GG32010@denix.org>
	<b6ebd0a50908192153i2dbd6a74ve0e4337d76e9a474@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] bitbake.conf: BUILD_LDFLAGS: use $ORIGIN in the	-rpath rather than a full path.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Aug 2009 05:23:47 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Wed, Aug 19, 2009 at 09:53:49PM -0700, Chris Larson wrote:
> Yeah, its one of many changes needed to get things relocatable enou=
gh
> to be able to use prebuilt binaries / packaged staging packages
> amongst a group of developers, for example.  This is just one piece=
 of
> the puzzle, of course.  Ideally, more open source projects would be
> properly relocatable, and we wouldn't need so many hacks.  We ended=
 up
> doing a lot of things to work around reloc issues in native/cross
> recipes, for MVL6.  Everything from exporting a pile of new env var=
s
> to writing wrapper scripts and the like.. yech.  Still, it's a wort=
hy
> goal, and the benefits would be worthwhile, so I think we should st=
art
> taking the steps in that direction.

Ah, relocatable pstage - a worthy goal! :)

Acked-by: Denys Dmytriyenko <denis@denix.org>

> On Wed, Aug 19, 2009 at 9:18 PM, Denys Dmytriyenko<denis@denix.org>=
 wrote:
> > On Wed, Aug 19, 2009 at 08:24:39PM -0700, Chris Larson wrote:
> >> Signed-off-by: Chris Larson <clarson@mvista.com>
> >
> > Hmm, interesting. I didn't know about $ORIGIN...
> > But what is the benefit here? To be able to move $TMPDIR?
> >
> >> ---
> >> =A0conf/bitbake.conf | =A0 =A02 +-
> >> =A01 files changed, 1 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> >> index 371bf8e..9cb6039 100644
> >> --- a/conf/bitbake.conf
> >> +++ b/conf/bitbake.conf
> >> @@ -447,7 +447,7 @@ export SDK_CXXFLAGS =3D "${SDK_CFLAGS} -fper=
missive"
> >>
> >> =A0export BUILD_LDFLAGS =3D "-L${STAGING_LIBDIR_NATIVE} \
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wl,-rpath-li=
nk,${STAGING_LIBDIR_NATIVE} \
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wl,-rpath,${ST=
AGING_LIBDIR_NATIVE} -Wl,-O1"
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-Wl,-rpath,\\\$=
\$ORIGIN/${@base_path_relative(d.getVar('STAGING_BINDIR_NATIVE', 1), =
d.getVar('STAGING_LIBDIR_NATIVE', 1))} -Wl,-O1"
> >>
> >> =A0export LDFLAGS =3D "${TARGET_LDFLAGS}"
> >> =A0export TARGET_LDFLAGS =3D "-L${STAGING_DIR_TARGET}${layout_li=
bdir} \
> >> --
> >> 1.6.0
> >>
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-devel
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> >
>=20
>=20
>=20
> --=20
> Chris Larson
> clarson at kergoth dot com
> clarson at mvista dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Software Engineer
> MontaVista Software, Inc.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel



