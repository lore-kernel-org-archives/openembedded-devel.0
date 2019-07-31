Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id A11C27F3E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:47:02 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id r21so48494142qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 23:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SOudav6ChlsB4Dx5VsTpER4n3HVRxvx8wkHfT8slKa8=;
	b=fh75+L2JUIUSfGg9FUf8Q+MbbZ6HWhOTwHUsNjxciDD0719ztEj7K4+sYVJCI+UeSu
	LQKkCvIWfqMAMuCpEnDKfgKtjbdW1rfeP5P4UVdIxZdZAiS8vgkXYHmJQb46tvsL/PAS
	i6+I/i3MH2w+j4rQlyDZqxAMEGYJ4rpsbP+nA9Ky2SZXrwqSFinTPCfNHz7hToKJZfZl
	pDs6yYtk9CIZnHp2p9XPv1GIXWdSai4roE/CfCgmxTzuwKULWORoQBQmo34vEIxDrIRQ
	uGOdx/kUtRzCIAlNAlKa1aIGoyKSqgiKQoDjtZjqjNv4m/kkAdkuaGDQuHq8dwl4dCtG
	vI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SOudav6ChlsB4Dx5VsTpER4n3HVRxvx8wkHfT8slKa8=;
	b=cwxZCR9MpEiKI8A0k20/d92lmcxSYwfyTWGWvWfsaOEPqWZ/ElKmvax6BI2xbgzqdn
	vr5ANKvccu4l1rRlfKLK68gZWcmZ2Fr4YvaMygWLPZC6j6eA2IGV6n3i/g9mFe23lLkh
	mB5tNjvc34GYLqE0dIjVa+clBcEL/R6Mt0lIp8DRb2iZ8K/2hv3V2sqKyRy6DKCF6UjQ
	C/XPLGuZ7O8DsWibLohqLpCCfQDtwyoQ7zCIgpxLfVUE5okA4pBPJU/DPavItxNycGw+
	r7UQVLe62JZhkfxr8rGfEc3sUTQp/077RlH4pRfox9bgyupW6pV6kh8RrdScBunbop66
	qjPw==
X-Gm-Message-State: APjAAAU4DCelE9XZj/8WpS2Pyf/Z1zWb7yfbTehMuM9AvLzSnrGOqUdK
	2Nu7TOQW20PconWtAoB9a0MDDB17EnHa86pRjE1N86P3xOs=
X-Google-Smtp-Source: APXvYqxTvJ0Vh28XgWVQbQQR313cgNr+1dnKBkqzhI1+trfX/AMSzV2oc1fWGDioJbyxHY+NL/KfkRXo0rt05YJ/v+s=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr46393532qkg.337.1564555623122; 
	Tue, 30 Jul 2019 23:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190722211814.14237-1-raj.khem@gmail.com>
	<20190722211814.14237-2-raj.khem@gmail.com>
	<5D413747.3050905@windriver.com>
In-Reply-To: <5D413747.3050905@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Jul 2019 23:46:45 -0700
Message-ID: <CAMKF1srck4LCAV2pGtcF6sr9JT8BguePF6z-snuBPy85SEhmbw@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] log4cplus: Fix build with gold linker
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jul 2019 06:47:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 11:36 PM Yu, Mingli <mingli.yu@windriver.com> wrote=
:
>
> Hi Khem,
>
> On 2019=E5=B9=B407=E6=9C=8823=E6=97=A5 05:18, Khem Raj wrote:
> > Fixes a potential linker error and eventual linker crash when using gol=
d
> > linker [1]
> >
> > [1] https://errors.yoctoproject.org/Errors/Details/253440/
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Adrian Bunk <bunk@stusta.de>
> > Cc: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >   ...-version-entry-from-ELF-.comment-sec.patch | 40 ++++++++++++++++++=
+
> >   .../log4cplus/log4cplus_2.0.4.bb              |  6 ++-
> >   2 files changed, 45 insertions(+), 1 deletion(-)
> >   create mode 100644 meta-oe/recipes-devtools/log4cplus/log4cplus/0001-=
Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
> >
> > diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-l=
og4cplus-version-entry-from-ELF-.comment-sec.patch b/meta-oe/recipes-devtoo=
ls/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.commen=
t-sec.patch
> > new file mode 100644
> > index 0000000000..44a835c35f
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplu=
s-version-entry-from-ELF-.comment-sec.patch
> > @@ -0,0 +1,40 @@
> > +From da5338e68f146efadab7c221291ba4c949d8f12f Mon Sep 17 00:00:00 2001
> > +From: Vaclav Haisman <vhaisman@gmail.com>
> > +Date: Sun, 21 Jul 2019 23:23:16 -0700
> > +Subject: [PATCH] Remove log4cplus version entry from ELF .comment sect=
ion
> > +
> > +Reverts
> > +https://github.com/log4cplus/log4cplus/commit/9cb0d4ade619da4e40628c9b=
95ff51de3df29f1b
> > +
> > +Upstream-Status: Backport [https://github.com/log4cplus/log4cplus/comm=
it/7e6addc70dffd2e30e902efd18eb845c5d5dd7bb]
> > +
> > +Suggested-by: Adrian Bunk <bunk@stusta.de>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/version.cxx | 12 ------------
> > + 1 file changed, 12 deletions(-)
> > +
> > +diff --git a/src/version.cxx b/src/version.cxx
> > +index ce18212..e002de9 100644
> > +--- a/src/version.cxx
> > ++++ b/src/version.cxx
> > +@@ -34,16 +34,4 @@ namespace log4cplus
> > + unsigned const version =3D LOG4CPLUS_VERSION;
> > + char const versionStr[] =3D LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_S=
TR_SUFFIX;
> > +
> > +-namespace
> > +-{
> > +-
> > +-#if defined (__ELF__) && (defined (__GNUC__) || defined (__clang__))
> > +-char const versionStrComment[]
> > +-    __attribute__ ((__used__, __section__ ((".comment"))))
> > +-    =3D "log4cplus " LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_STR_SUFF=
IX;
> > +-#endif
> > +-
> > +-
> > +-} // namespace
> > +-
> > + } // namespace log4cplus
> > +--
> > +2.22.0
> > +
> > diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb b/me=
ta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
> > index d86521aba3..b396cabf3f 100644
> > --- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
> > +++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
> > @@ -6,7 +6,9 @@ BUGTRACKER =3D "http://sourceforge.net/p/log4cplus/bugs=
/"
> >   LICENSE =3D "Apache-2.0 & BSD-2-Clause"
> >   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41e8e060c26822886b592ab476=
5c756b"
> >
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/=
${BP}.tar.gz"
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/=
${BP}.tar.gz \
> > +           file://0001-Remove-log4cplus-version-entry-from-ELF-.commen=
t-sec.patch \
> > +          "
> >   SRC_URI[md5sum] =3D "2b5b7bc294698bf30a315a259ef9eec2"
> >   SRC_URI[sha256sum] =3D "196eedbc7f2dd792dae721b1159c7ac132255bb368226=
353c24d4d5fa7c7797a"
> >
> > @@ -16,3 +18,5 @@ UPSTREAM_CHECK_REGEX =3D "log4cplus-stable/(?P<pver>\=
d+(\.\d+)+)/"
> >   inherit autotools pkgconfig
> >
> >   BBCLASSEXTEND =3D "native"
> > +
> > +CXXFLAGS +=3D "-fuse-ld=3Dgold"
>
> The logic [CXXFLAGS +=3D "-fuse-ld=3Dgold"] you added is used to fix the
> linker crash on arm though I didn't encounter.

this was not needed infact. It was for testing only please send a
patch to remove
 CXXFLAGS +=3D "-fuse-ld=3Dgold"
>
> BTW, after you add [CXXFLAGS +=3D "-fuse-ld=3Dgold"], it fails the build =
for
> "bitbake libn32-log4cplus" with below logic in local.conf
> MACHINE ??=3D "qemumips64"
> MULTILIB_GLOBAL_VARIANTS_append =3D " libn32"
> MULTILIBS ?=3D "multilib:lib32 multilib:libn32"
> DEFAULTTUNE_virtclass-multilib-lib32 ?=3D "mips"
> DEFAULTTUNE_virtclass-multilib-libn32 ?=3D "mips64-n32"
> require conf/multilib.conf
>
> Thanks,
>
> >

