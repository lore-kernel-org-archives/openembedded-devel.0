Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1255CC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:08:01 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.146.1664557678758389280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yh2NlVRr;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id
 r15-20020a4abf0f000000b004761c7e6be1so2650148oop.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JNBcQ40XUNzR+Z5y8NEFl2OcHIVmTipCHPoQR5cUYmg=;
        b=Yh2NlVRrWEViZPMPi3zXjzrW/BDHCUksPDql+HLBT2ZBFvvjyUwlR5IdXIOqf6/p/S
         aHzBylqeueyQP2MMxgB5daueWYBztURzADS61SqZ2qJZ/LxGGAu2hbw0M0/ifV82E9LU
         GnCBEXUU5GVFGFCxd4MHv6fFZzJGGYelLbDKg0/tFKjvoCWY1GiezCLUNhEgbZ6mnkSK
         j6qTXkqhWRtsWGl7Sool0zvntr0CjjDpZQBPIjc7cy06uli0kMrW+Kiv96/KBpujhN+u
         6Iaa1t00yzKBIYdlZoPetBq1CD0a+1z6yY0prEvr2cDj9MwdYSroFiaIexsIB+zet+Nc
         qoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JNBcQ40XUNzR+Z5y8NEFl2OcHIVmTipCHPoQR5cUYmg=;
        b=rC+dcBk5dLzToHrkOiJKQeUYDzOz4uX/LsyS+2MexBLa9BxVURQgAMfkUshMeXaEqh
         PvYSu+Rlcmldn8gULRelJ9U5Pyt8KuRPeHrglCwEpJJj/D2DiD5nyGFk7nQvBVgi/+HQ
         TfPHFNJq542Iths4b4b8SjYBuiL63HMmeS27tzBcGVsjmp2Ed+3XTq8xvdCI7t53e/7J
         g2+ppNkBEIONpwCXfqUJpFXxF8fFqqh0/ukck+UBPM1y4Ai939HHBfKf/yCAIqLrL+sv
         PjSiWKniAKzoVcq2ShdIrIvKWNecswrgQ1pLrfNvaCcPAY7pwabCtdHXfpcFnvLzHQaN
         7fAA==
X-Gm-Message-State: ACrzQf2LgX08gAt31hq79I1Zloi7sGUoROQlG3rdoHP+ZKN3mkl8PdN+
	/iXzRfzrAfKmELVc6Rk/9Z6zwHb9ig5m6/GTIQU=
X-Google-Smtp-Source: 
 AMsMyM4m5t7PHnygtVgbiHhSzGxCtL9tBvy6qTM3F5oPGUm/uynwcr9UbayA12rlvDdy5RSyBHkmI8kzXHjZhl3Lpco=
X-Received: by 2002:a05:6830:2019:b0:65b:f320:8cd2 with SMTP id
 e25-20020a056830201900b0065bf3208cd2mr3921687otp.111.1664557677933; Fri, 30
 Sep 2022 10:07:57 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMKF1soDNbQF-mJL0c43=s7tm-+za0HdmvUM_PNz8Z6b4zMgHg@mail.gmail.com>
 <20220930064207.29453-1-daniel@qtec.com>
 <CAH1Ww+R_U71pt9RFrtExnePNW1_AK6-8zb9e_wUoJut7Yk89Lg@mail.gmail.com>
In-Reply-To: 
 <CAH1Ww+R_U71pt9RFrtExnePNW1_AK6-8zb9e_wUoJut7Yk89Lg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2022 10:07:32 -0700
Message-ID: 
 <CAMKF1srAryBaVnE+yGqu+4XY_zkqYQtzoDiC=K6Wbn9FJNxo-g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] v4l-utils: Update 1.22.1 -> 1.23.0+fd544473
To: Daniel Gomez <daniel@qtec.com>
Cc: openembedded-devel@lists.openembedded.org, dagmcr@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 17:08:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99026

seeing

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2067

On Thu, Sep 29, 2022 at 11:56 PM Daniel Gomez <daniel@qtec.com> wrote:
>
> On Fri, 30 Sept 2022 at 08:51, Daniel Gomez <daniel@qtec.com> wrote:
> >
> > Use git instead of release tarball to close the gap between the latest
> > 1.22.1 and master.
> >
> > Add 'bootstrap.sh' call to fix configuration issues:
> >
> > Error:
> > config.status: error: cannot find input file:
> > `v4l-utils-po/Makefile.in.in
> >
> > Adapt patch '0007-Do-not-use-getsubopt.patch': Upstream has replaced
> > the use of getsubopt with v4l_subopt which detects if getsubopt is
> > provided via glibc or not. Otherwise it uses a static
> > v4l_getsubopt copied from glibc.
> >
> > (From v4l-utils: 6e19bb895a16a9a247524ac526ab47f576cc36f6)
> >
> > Also rename patch number to '0004-Do-not-use-getsubopt.patch'.
> >
> > Add qv4l2 and qvidcap packages support but keep them disabled as
> > they require meta-qt5.
> >
> > Enable alsa support if alsa is part of the DISTRO_FEATURES.
> >
> > Signed-off-by: Daniel Gomez <daniel@qtec.com>
> > ---
> v2
> - Remove PACKAGECONFIG new defaults (remove qv4l2 and qvidcap).
> - Fix DEPENDS for qv4l2 and qvidcap using bb.utilscontains_any.
> -
> >  ....patch => 0004-Do-not-use-getsubopt.patch} | 19 ++++++--
> >  ...4l-utils_1.22.1.bb => v4l-utils_1.23.0.bb} | 45 +++++++++++++++----
> >  2 files changed, 51 insertions(+), 13 deletions(-)
> >  rename meta-oe/recipes-multimedia/v4l2apps/v4l-utils/{0007-Do-not-use-getsubopt.patch => 0004-Do-not-use-getsubopt.patch} (73%)
> >  rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.22.1.bb => v4l-utils_1.23.0.bb} (59%)
> >
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
> > similarity index 73%
> > rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
> > rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
> > index d8d1b8d18..fb844acbe 100644
> > --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0007-Do-not-use-getsubopt.patch
> > +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0004-Do-not-use-getsubopt.patch
> > @@ -1,4 +1,4 @@
> > -From e4582c11f76b9390a3e172dcf0741dca90a9dc8d Mon Sep 17 00:00:00 2001
> > +From 6e7e52de7afe29597016952a7317faf9c3ea3268 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 30 Nov 2019 18:50:34 -0800
> >  Subject: [PATCH] Do not use getsubopt
> > @@ -11,24 +11,32 @@ Simply avoid getsubopt, since we cannot rely on it.
> >  Imported from Alpine Linux
> >
> >  Upstream-Status: Pending
> > +
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > +Adapt patch to 1.23.0.
> > +
> > +(v4l-utils rev fd544473800d02e90bc289434cc44e5aa8fadd0f).
> > +
> > +%% original patch: 0007-Do-not-use-getsubopt.patch
> > +
> > +Signed-off-by: Daniel Gomez <daniel@qtec.com>
> >  ---
> >   utils/v4l2-ctl/v4l2-ctl-common.cpp | 18 ++++++++++--------
> >   1 file changed, 10 insertions(+), 8 deletions(-)
> >
> >  diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> > -index c940171..49c0f39 100644
> > +index d77f7104..838c297d 100644
> >  --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >  +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> > -@@ -956,15 +956,17 @@ static bool parse_subset(char *optarg)
> > +@@ -994,15 +994,17 @@ static bool parse_subset(char *optarg)
> >
> >   static bool parse_next_subopt(char **subs, char **value)
> >   {
> >  -      static char *const subopts[] = {
> >  -          nullptr
> >  -      };
> > --      int opt = getsubopt(subs, subopts, value);
> > +-      int opt = v4l_getsubopt(subs, subopts, value);
> >  +      char *p = *subs;
> >  +      *value = *subs;
> >
> > @@ -47,3 +55,6 @@ index c940171..49c0f39 100644
> >   }
> >
> >   void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
> > +--
> > +2.35.1
> > +
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> > similarity index 59%
> > rename from meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb
> > rename to meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> > index 741e1030c..4a88d69f6 100644
> > --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb
> > +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.23.0.bb
> > @@ -6,7 +6,10 @@ PROVIDES = "libv4l media-ctl"
> >
> >  DEPENDS = "jpeg \
> >             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} \
> > -           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
> > +           ${@bb.utils.contains_any('PACKAGECONFIG', 'qv4l2 qvidcap', 'qtbase qtbase-native', '', d)}"
> > +
> >  DEPENDS:append:libc-musl = " argp-standalone"
> >  DEPENDS:append:class-target = " udev"
> >  LDFLAGS:append = " -pthread"
> > @@ -15,30 +18,54 @@ inherit autotools gettext pkgconfig
> >
> >  PACKAGECONFIG ??= "media-ctl"
> >  PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
> > +PACKAGECONFIG[qv4l2] = ",--disable-qv4l2"
> > +PACKAGECONFIG[qvidcap] = ",--disable-qvidcap"
> > +
> > +SRC_URI = "\
> > +    git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=master \
> > +    file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
> > +    file://0002-original-patch-mediactl-pkgconfig.patch \
> > +    file://0003-original-patch-export-mediactl-headers.patch \
> > +    file://0004-Do-not-use-getsubopt.patch \
> > +"
> > +
> > +SRCREV = "fd544473800d02e90bc289434cc44e5aa8fadd0f"
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${S}"
> >
> > -SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
> > -           file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
> > -           file://0002-original-patch-mediactl-pkgconfig.patch \
> > -           file://0003-original-patch-export-mediactl-headers.patch \
> > -           file://0007-Do-not-use-getsubopt.patch \
> > -           "
> > +do_configure:prepend() {
> > +    ${S}/bootstrap.sh
> > +}
> >
> >  SRC_URI[md5sum] = "8aa73287320a49e9170a8255d7b2c7e6"
> >  SRC_URI[sha256sum] = "65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31"
> >
> > -EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev \
> > +EXTRA_OECONF = "--enable-shared --with-udevdir=${base_libdir}/udev \
> >                  --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
> >
> >  VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
> >
> > -PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev"
> > +PACKAGES =+ "media-ctl ir-keytable rc-keymaps libv4l libv4l-dev qv4l2 qvidcap"
> >
> >  RPROVIDES:${PN}-dbg += "libv4l-dbg"
> >
> >  FILES:media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
> > +FILES:qv4l2 = "\
> > +    ${bindir}/qv4l2 \
> > +    ${datadir}/applications/qv4l2.desktop \
> > +    ${datadir}/icons/hicolor/*/apps/qv4l2.* \
> > +"
> > +FILES:qvidcap = "\
> > +    ${bindir}/qvidcap \
> > +    ${datadir}/applications/qvidcap.desktop \
> > +    ${datadir}/icons/hicolor/*/apps/qvidcap.* \
> > +"
> >
> >  FILES:ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
> >  RDEPENDS:ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
> > +RDEPENDS:qv4l2 += "qtbase"
> > +RDEPENDS:qvidcap += "qtbase"
> >
> >  FILES:rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
> >
> > --
> > 2.35.1
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99020): https://lists.openembedded.org/g/openembedded-devel/message/99020
> Mute This Topic: https://lists.openembedded.org/mt/94011567/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

