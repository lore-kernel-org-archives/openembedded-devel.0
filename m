Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F359FCCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 04:51:32 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.web11.208.1761367878793530132
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 21:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E+C+mBUm;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63e3568f90dso2894515d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 21:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761367878; x=1761972678; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BX8dA4viKUBJLsV/Y33I8AhAwvEp8AjpxihxtlMUCQc=;
        b=E+C+mBUmiB5T0MF0x+KEIgtAxrvSzR2B1r+ehQWh5DEMIoLBiTTCneK3LQmSMt2sYc
         MHzMBGVfLMcBtt1gWBhYqL81xIuX4z9yuBNxy4lbp85lOhprP5H1arkpB8nAllODex6f
         YZ+HB3xT9HLq9r8gmzvakTCP79ZvTHXJn8xfm6bPWYwHSGIWL4QpWHH5/Yjjae9f1t5P
         sMae42R4HNGjbGz2x/2Djwg1RiZ6qtUJrn/cxLaNWcPyMMoh/BQBBe+rvI4gvSv66z6+
         +MbLjYKl4TZUR+SmsKTIwqY+Twns+nHAcPIu5C9bZYzOyZbDquroHTwGuOdWkCDMyVFE
         9HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761367878; x=1761972678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BX8dA4viKUBJLsV/Y33I8AhAwvEp8AjpxihxtlMUCQc=;
        b=AzLlxHRn7WWcfaXeQziP8YeOR8IHKmIw9YmlQUHP6OlU44YwnVeRoUFHrlIrZ4hPr+
         mHPEmrXcER1OltwTi0qoSLTQwOS9QE+YeCMBhb3Z4gCyxstC31mU/H9gJbD4a9nJOkXp
         +iKKc+NWcgPichvKSNICY/e7R4Vi8ai2ZXrjwrOMU8KK3hdonNq+o3c2Xdw03LfMUzdf
         o1UtvT91KZlNvcKqfRHucZbOnAFT+UStMPkCZLzzvT9RuYJ/aKogZb0VN7/jMP/FKFHt
         Dxc3WRGbwuZSwcgoHm1dd5I2X88yR6wtkX74jLtzsEvoGeA5ubZcbxQ377aQanu3fkfG
         LGXQ==
X-Gm-Message-State: AOJu0YxOABsJ8ohtSjv4oj5edNRz0zdq8oVDc5SyFAgt0mphBVr6afE1
	z9smXmp5CFZH13yQC2c5SjyPOE/+buVqV4kvHYJspPHeCBeSfHOtgtgcUtKnI4raGtvCvsqm9hx
	CuWU6ocsSMZKXKtD7E7MJ3J4gUfiQLXk=
X-Gm-Gg: ASbGncsk1VAoiEk8MoofGvLZbc0VoC8ko8+v8BA240yl9y2krC8DwiC6UFNghjxaSLf
	qAOXoO7s0qqDYjb41Hs+SPxmhy/IvymqHRuTDt/ZwO/uDBeurCvYTjg/5yV+1TtezMhEvh10AEQ
	IURngKgno4QIwREiDgxkie7ZU1BapoRcKUufYYvrwsGiA8SlzY48TjBGl9aa4v04SIaiNNOPg7e
	uLgbW11vskWoIXFoCMuBTdLd7xuoiSrNLPVN4TDXarF9RvmeRa9brdy1AOguhcSnBzat/4jzxbP
	yE9YvOOQxpNrOrQIxmX3DVd7zyl3I+YDQj/WIpXfuwM8ERluDIWGg1SegvV5
X-Google-Smtp-Source: AGHT+IHiKM8eo4geJZfeF7V1xdRZKSL3rgvxLS/7RUBPSn0PcREGnApKiAgQcXewzsBbhC0/NGyJVh+WvGJ/6gEwAL0=
X-Received: by 2002:a05:690e:430d:b0:63f:31f7:b956 with SMTP id
 956f58d0204a3-63f37810842mr5557314d50.27.1761367877755; Fri, 24 Oct 2025
 21:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251025031748.2728416-1-pkj@axis.com> <20251025031748.2728416-7-pkj@axis.com>
In-Reply-To: <20251025031748.2728416-7-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Oct 2025 21:50:51 -0700
X-Gm-Features: AS18NWA4lgmQC5BqBbRgBTu-gjtUVtmvARQXHhxDn_yU9tzx10oayNZr3kWUYJ4
Message-ID: <CAMKF1spn_SCNtggcC7g1hBRGWnYCYEmqD8FABUVg=q7t77Y+Fw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 7/9] lvgl: Add support for modifying the
 configuration using menuconfig
To: peter.kjellerstedt@axis.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 04:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120996

On Fri, Oct 24, 2025 at 8:18=E2=80=AFPM Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
>
> Generating a configuration fragment for a feature can now be done using:
>
>   bitbake lvgl -c menuconfig && bitbake lvgl -c diffconfig
>
> While this uses the standard cml1.bbclass, it expects that "make" is
> used to run menuconfig etc. This is not true for lvgl, so unfortunately
> the whole do_menuconfig() function had to be copied to be able to remove
> the use of "make".
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> I plan on updating cml1.bbclass so that it better supports code that
> does not use "make" to run menuconfig, maybe even giving it native
> support for kconfiglib. However, due to the current situation, I do not
> expect any such changes to be accepted until after Whinlatter is out of
> the door. Thus, the copied do_menuconfig in this recipe will have to do
> as an interim solution.
>
>  meta-oe/recipes-graphics/lvgl/lv-conf.inc | 48 ++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-=
graphics/lvgl/lv-conf.inc
> index ab3ad01a5a..cc8a2a16d9 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
> @@ -21,7 +21,7 @@ PACKAGECONFIG[gridnav] =3D ",,"
>  PACKAGECONFIG[thorvg] =3D ",,"
>  PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
>
> -inherit python3native
> +inherit cml1 python3native
>
>  EXTRA_OECMAKE +=3D "-DLV_BUILD_USE_KCONFIG=3DON"
>
> @@ -35,6 +35,7 @@ CXXFLAGS +=3D "${LVGL_FLAGS}"
>  KCONFIG_CONFIG_ROOTDIR ?=3D "${S}"
>  KCONFIG_FILE ?=3D "${KCONFIG_CONFIG_ROOTDIR}/Kconfig"
>  export KCONFIG_CONFIG ?=3D "${KCONFIG_CONFIG_ROOTDIR}/.config"
> +KCONFIG_CONFIG_COMMAND ?=3D "menuconfig ${KCONFIG_FILE}"
>
>  do_configure() {
>      cat ${UNPACKDIR}/defconfig ${@" ".join(find_cfgs(d))} > ${B}/defconf=
ig
> @@ -42,3 +43,48 @@ do_configure() {
>
>      cmake_do_configure
>  }
> +
> +# Copied from cml1.bbclass. The only modification is that
> +# ${KCONFIG_CONFIG_COMMAND} is not prefixed with "make" when called by
> +# oe_terminal.

I wonder if we can add this flexibility to cml1.bbclass and use the
class directly then here.

> +python do_menuconfig() {
> +    import shutil
> +
> +    if not bb.utils.to_boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFI=
G")):
> +        bb.fatal("do_menuconfig is disabled, please check KCONFIG_CONFIG=
_ENABLE_MENUCONFIG variable.")
> +        return
> +
> +    config =3D os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config=
")
> +    configorig =3D os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".co=
nfig.orig")
> +
> +    try:
> +        mtime =3D os.path.getmtime(config)
> +        shutil.copy(config, configorig)
> +    except OSError:
> +        mtime =3D 0
> +
> +    # setup native pkg-config variables (kconfig scripts call pkg-config=
 directly, cannot generically be overriden to pkg-config-native)
> +    d.setVar("PKG_CONFIG_DIR", "${STAGING_DIR_NATIVE}${libdir_native}/pk=
gconfig")
> +    d.setVar("PKG_CONFIG_PATH", "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NAT=
IVE}/pkgconfig")
> +    d.setVar("PKG_CONFIG_LIBDIR", "${PKG_CONFIG_DIR}")
> +    d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
> +    # ensure that environment variables are overwritten with this tasks =
'd' values
> +    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH =
PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
> +
> +    oe_terminal("sh -c '%s; if [ $? -ne 0 ]; then echo \"Command failed.=
\"; printf \"Press any key to continue... \"; read r; fi'" % d.getVar('KCON=
FIG_CONFIG_COMMAND'),
> +                d.getVar('PN') + ' Configuration', d)
> +
> +    try:
> +        newmtime =3D os.path.getmtime(config)
> +    except OSError:
> +        newmtime =3D 0
> +
> +    if newmtime > mtime:
> +        bb.plain("Changed configuration saved at:\n %s\nRecompile will b=
e forced" % config)
> +        bb.build.write_taint('do_compile', d)
> +}
> +
> +do_savedefconfig() {
> +    bbplain "Saving defconfig to:\n${B}/defconfig"
> +    savedefconfig --kconfig ${KCONFIG_FILE} --out ${B}/defconfig
> +}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120979): https://lists.openembedded.org/g/openembedde=
d-devel/message/120979
> Mute This Topic: https://lists.openembedded.org/mt/115939735/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

