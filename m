Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2819C6FD1F
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 20:15:16 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.5655.1678824907780041356
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 13:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KFb+cCV3;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-176b90e14a9so18663135fac.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 13:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678824907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRGK7POctu/2RPeIzlVcZLinU500MkkXLHsQbmhgVYQ=;
        b=KFb+cCV3qX0bIs0wn7AD+P3mMpEx7yQcxxE5VfIjycytV/0lqBDTnssggDOU7zTJS4
         SkG7qQHUBQPqWCQsiMHlfHQImNjlcqg+8uQ0jyC7cbyc6blMz/syMcM8/6jVbWf4fg/h
         B3/NcUF2aXXgxhyU0VM1wI7QwUVlAfXzOKuP5uJN7zafW9r1j9qBZ+llEmWbiD8Tyfxn
         gHThBcFDDp5fm4ObWB6DYQE1IHUW87yinIwg8D61L3RVrRtTUzT+fGa9CmSPbvCPCfLg
         GcYCF7b9Bjlc9xOEm5Ct+C/FPwX2Le5OakY+Kz1WcW/SPwXybhSGq561mCzb3nZMoMtA
         vifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678824907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRGK7POctu/2RPeIzlVcZLinU500MkkXLHsQbmhgVYQ=;
        b=XeUcWOYa5za0mF9nIPytbqAN5C31WzFx8W6BtlEjx9wRX4dSDIti1CQ1k/CHayfMMk
         9i9CpkZfvth1Xv6M5PFOI+EuoQJhQNi8rzFcXTogrZczhzDiu4YqktAs/baL3qf4sJgL
         nJafY/4RGzAiDdT8x1GLP+6avpDDkv+WOdSs/NBIaNctB93mrrPdvZPrczbzEApXzHS7
         hwKCNy7bSf/h/13Nqb/fjp17MSy22+cAucRxcXZHde8CjPQum/mYJKMJN5eKQjZCVtln
         rn+qooek4WfmLMMju2lTjJWoW7e6epYWXoyF7LCkoXiG5d2ucnZRMyxqaU1HBHpI5VuO
         X5yQ==
X-Gm-Message-State: AO0yUKVO/HYt/0weSOL01G5pq/z/h7jloOboLLsGDZ59zQpVXRAkM78o
	ZjexdHdzDubA3eb3wLs8+KjY0JAMJjxD6AOolTq+JqKM
X-Google-Smtp-Source: AK7set+6lqQrr99duqhsWI/rnIwUWejNdVsGUzIKlxtkZ4RBXLracJZh0cQe0i94gWeFHQJneqw6yhGKqhIk/kj3BC4=
X-Received: by 2002:a05:6870:c90f:b0:177:a5ec:b41 with SMTP id
 hj15-20020a056870c90f00b00177a5ec0b41mr4436819oab.4.1678824906924; Tue, 14
 Mar 2023 13:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <174C5542A1B6DFDC.13335@lists.openembedded.org> <BY5PR11MB399225D453E45AC06715280488BE9@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB399225D453E45AC06715280488BE9@BY5PR11MB3992.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Mar 2023 13:14:41 -0700
Message-ID: <CAMKF1soBgO-78vnAMux3550=0fBtRjTP7cfPpw8nqjGgAPyzDw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] libreport: update to version 2.17.8
To: Joe Slater <joe.slater@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 20:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101526

On Tue, Mar 14, 2023 at 12:46=E2=80=AFPM Joe Slater <joe.slater@windriver.c=
om> wrote:
>
> This patch is incomplete.  Ignore it.     Joe
>

right. I was wondering too

> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Joe Slater via
> > lists.openembedded.org
> > Sent: Tuesday, March 14, 2023 9:15 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Slater, Joseph <joe.slater@windriver.com>; MacLeod, Randy
> > <Randy.MacLeod@windriver.com>
> > Subject: [oe] [meta-oe][PATCH 1/1] libreport: update to version 2.17.8
> >
> > Modify patches to apply and remove unrecognized configure option --with=
out-
> > python2.  Retain --with-python3 even though it is the default.
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  ...01-Makefile.am-remove-doc-and-apidoc.patch | 16 ++++++-----  ...mov=
e-
> > prog-test-of-xmlto-and-asciidoc.patch | 16 ++++++-----
> >  .../files/0003-without-build-plugins.patch    | 14 ++++++----
> >  ...gure.ac-remove-prog-test-of-augparse.patch | 27 +++++++++++--------
> >  .../libreport/libreport_2.17.8.bb             |  2 +-
> >  5 files changed, 46 insertions(+), 29 deletions(-)
> >
> > diff --git a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-
> > remove-doc-and-apidoc.patch b/meta-oe/recipes-
> > extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
> > index 1ee0dd2f5..934dd1778 100644
> > --- a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-=
doc-
> > and-apidoc.patch
> > +++ b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-=
d
> > +++ oc-and-apidoc.patch
> > @@ -1,28 +1,32 @@
> > -From 1f7d106c7d982fe055addc8d883b161202233175 Mon Sep 17 00:00:00
> > 2001
> > +From 73dc0c2cd942e30f5f7cb40cb5828895b96f0fb1 Mon Sep 17 00:00:00
> > 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Wed, 26 Apr 2017 03:47:58 -0400
> > -Subject: [PATCH 1/4] Makefile.am: remove doc and apidoc
> > +Subject: [PATCH] Makefile.am: remove doc and apidoc
> >
> >  There was a failure at do_install time, so remove doc to workaround.
> >
> >  Upstream-Status: Inappropriate [workaround]
> >
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> > +Context modified to apply to v2.17.8.
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> >  ---
> >   Makefile.am | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/Makefile.am b/Makefile.am
> > -index 9ad827c..34364a8 100644
> > +index 4ff2f5c5..d4e30bc2 100644
> >  --- a/Makefile.am
> >  +++ b/Makefile.am
> >  @@ -1,5 +1,5 @@
> >   ACLOCAL_AMFLAGS =3D -I m4
> > --SUBDIRS =3D po src tests doc apidoc
> > -+SUBDIRS =3D po src tests
> > +-SUBDIRS =3D data po src tests doc apidoc
> > ++SUBDIRS =3D data po src tests
> >
> >   EXTRA_DIST =3D \
> >       libreport.pc.in \
> >  --
> > -2.7.4
> > +2.25.1
> >
> > diff --git a/meta-oe/recipes-extended/libreport/files/0002-configure.ac=
-
> > remove-prog-test-of-xmlto-and-asciidoc.patch b/meta-oe/recipes-
> > extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-an=
d-
> > asciidoc.patch
> > index 2e691e95f..4fdf69c73 100644
> > --- a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove=
-
> > prog-test-of-xmlto-and-asciidoc.patch
> > +++ b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove=
-
> > +++ prog-test-of-xmlto-and-asciidoc.patch
> > @@ -1,7 +1,7 @@
> > -From 9beadcdfca9198548f06bf18f3f26e1d11542e53 Mon Sep 17 00:00:00
> > 2001
> > +From 276c45d0663124c9ccab0ddc8b97fb5cdc8b3867 Mon Sep 17 00:00:00
> > 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Tue, 31 Jul 2018 16:53:04 +0800
> > -Subject: [PATCH 2/4] configure.ac: remove prog test of xmlto and ascii=
doc
> > +Subject: [PATCH] configure.ac: remove prog test of xmlto and asciidoc
> >
> >  The prog of xmlto and asciidoc were used to generate documents,  and s=
ince
> > the doc module has already been disabled, so we should @@ -10,15 +10,19=
 @@
> > remove the prog test.
> >  Upstream-Status: Inappropriate [workaround]
> >
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> > +Modify to apply to v 2.17.8.
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> >  ---
> >   configure.ac | 18 ------------------
> >   1 file changed, 18 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac -index feafc28..aceccf4 10064=
4
> > +index da8cf898..17ece200 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -56,24 +56,6 @@ IT_PROG_INTLTOOL([0.35.0])
> > +@@ -57,24 +57,6 @@ IT_PROG_INTLTOOL([0.35.0])
> >
> >   dnl ****** END ****************************************
> >
> > @@ -42,7 +46,7 @@ index feafc28..aceccf4 100644
> >  -
> >   AC_ARG_WITH(bugzilla,
> >   AS_HELP_STRING([--with-bugzilla],[use Bugzilla plugin (default is YES=
)]),
> > - LIBREPORT_PARSE_WITH([bugzilla]))
> > + LIBREPORT_PARSE_WITH([bugzilla]),
> >  --
> > -2.7.4
> > +2.25.1
> >
> > diff --git a/meta-oe/recipes-extended/libreport/files/0003-without-buil=
d-
> > plugins.patch b/meta-oe/recipes-extended/libreport/files/0003-without-b=
uild-
> > plugins.patch
> > index c331677d8..f6ff86040 100644
> > --- a/meta-oe/recipes-extended/libreport/files/0003-without-build-
> > plugins.patch
> > +++ b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugi=
n
> > +++ s.patch
> > @@ -1,26 +1,30 @@
> > -From 41bce1de2fd2a0f79c266f245ae3e3720ccaf46a Mon Sep 17 00:00:00
> > 2001
> > +From f46610901dbac56d9631df012374c600db08453e Mon Sep 17 00:00:00
> > 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Wed, 26 Apr 2017 03:51:03 -0400
> > -Subject: [PATCH 3/4] without build plugins
> > +Subject: [PATCH] without build plugins
> >
> >  Upstream-Status: Inappropriate [workaround]
> >
> >  Rebase to 2.9.1
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> > +Modify to apply to v2.17.8.
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> >  ---
> >   src/Makefile.am | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/src/Makefile.am b/src/Makefile.am -index c15928c..bac02b1=
 100644
> > +index 410bfcb0..bac02b16 100644
> >  --- a/src/Makefile.am
> >  +++ b/src/Makefile.am
> >  @@ -8,4 +8,4 @@ if BUILD_NEWT
> >   sub_dirs +=3D report-newt
> >   endif
> >
> > --SUBDIRS =3D include lib plugins report-python cli client-python workf=
lows
> > $(sub_dirs)
> > +-SUBDIRS =3D include lib report-python cli client-python plugins
> > +workflows $(sub_dirs)
> >  +SUBDIRS =3D include lib report-python cli client-python workflows $(s=
ub_dirs)
> >  --
> > -2.7.4
> > +2.25.1
> >
> > diff --git a/meta-oe/recipes-extended/libreport/files/0004-configure.ac=
-
> > remove-prog-test-of-augparse.patch b/meta-oe/recipes-
> > extended/libreport/files/0004-configure.ac-remove-prog-test-of-
> > augparse.patch
> > index 986e7ec41..998ae6b50 100644
> > --- a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove=
-
> > prog-test-of-augparse.patch
> > +++ b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove=
-
> > +++ prog-test-of-augparse.patch
> > @@ -1,25 +1,29 @@
> > -From c1c301502a8f69b9889197744b301a136082f09d Mon Sep 17 00:00:00
> > 2001
> > +From 62c922f43b54585d25ba89be36c10612b479270b Mon Sep 17 00:00:00
> > 2001
> >  From: Hongxu Jia <hongxu.jia@windriver.com>
> >  Date: Thu, 27 Apr 2017 02:15:02 -0400
> > -Subject: [PATCH 4/4] configure.ac: remove prog test of augparse
> > +Subject: [PATCH] configure.ac: remove prog test of augparse
> >
> >  The build time does not require it.
> >
> >  Upstream-Status: Inappropriate [workaround]
> >
> >  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +
> > +Modify to apply to v2.17.8.
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> >  ---
> > - configure.ac | 8 --------
> > - 1 file changed, 8 deletions(-)
> > + configure.ac | 9 ---------
> > + 1 file changed, 9 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac -index aceccf4..83c101b 10064=
4
> > +index 17ece200..89b463a4 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -350,14 +350,6 @@ AC_ARG_WITH(augeaslenslibdir,
> > -                            [Directory for librepor lens (default:
> > /usr/share/augeas/lenses)])],
> > -             [], [with_augeaslenslibdir=3D"/usr/share/augeas/lenses"])
> > - AC_SUBST([AUGEAS_LENS_LIB_DIR], [$with_augeaslenslibdir])
> > +@@ -287,15 +287,6 @@ AC_ARG_WITH(largedatatmpdir,
> > +             [], [with_largedatatmpdir=3D"/var/tmp"])
> > + AC_SUBST([LARGE_DATA_TMP_DIR], [$with_largedatatmpdir])
> > +
> >  -AC_PATH_PROG(AUGPARSE, augparse, no)
> >  -[if test "$AUGPARSE" =3D "no"]
> >  -[then]
> > @@ -28,9 +32,10 @@ index aceccf4..83c101b 100644
> >  -    [echo "Then run configure again before attempting to build librep=
ort."]
> >  -    [exit 1]
> >  -[fi]
> > -
> > +-
> >   AC_ARG_WITH([defaultdumpdirmode],
> >               AS_HELP_STRING([--with-defaultdumpdirmode=3DOCTAL-MODE],
> > +                            [Default dump dir mode (default: 0x1A0
> > + (0640))]),
> >  --
> > -2.7.4
> > +2.25.1
> >
> > diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb b/m=
eta-
> > oe/recipes-extended/libreport/libreport_2.17.8.bb
> > index e21161943..a8d1db65b 100644
> > --- a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
> > +++ b/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
> > @@ -33,7 +33,7 @@ inherit gettext autotools python3native
> > python3targetconfig pkgconfig  PACKAGECONFIG ??=3D
> > "${@bb.utils.contains('DISTRO_FEATURES','x11','gtk','',d)}"
> >  PACKAGECONFIG[gtk] =3D "--with-gtk, --without-gtk, gtk+3,"
> >
> > -EXTRA_OECONF +=3D "--without-python2 --with-python3"
> > +EXTRA_OECONF +=3D "--with-python3"
> >
> >  RDEPENDS:python3-libreport +=3D "${PN}"
> >
> > --
> > 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101522): https://lists.openembedded.org/g/openembedde=
d-devel/message/101522
> Mute This Topic: https://lists.openembedded.org/mt/97607386/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

