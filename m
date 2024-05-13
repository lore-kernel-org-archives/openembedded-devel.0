Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0CBC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 05:13:07 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.53182.1715577177175273858
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 22:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P8PEfbY3;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-23dd52c6176so3068281fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 22:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715577176; x=1716181976; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcvOT6uCtz0SkTIttkSzUxJj6Gd8mPw2QN9CzbKp/UE=;
        b=P8PEfbY3paRKLWlXvsOepqE1OGGhvt6//rqtSiUiWWiwWRNBhIpWy9S72fz+2vI4nO
         HZ8dWGRFONxH/g6enKMTe4JdMuzb+EpqP4askGWQxApSUsfAOLqSzJyAUS9x5Mz4COuW
         0r+SnTS+YHI1/FEJLEsyNmhkT1ZO7+yUBxgumMvMtebBbsH0ZuVQ2hGuoqg82O9oRWtJ
         GxWLIbdQmyphSsTesodMDPRLTEaweQAiHcugX4LT17lPiQOSSzc55E8Y91KGKMkHut9z
         KGXSn4ymkgCUoLLhD7WrsD8u3R2rrKphuKX9LQqUnT/zRxuY/gbjmD7/CTB0/IXC93FC
         9e4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715577176; x=1716181976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcvOT6uCtz0SkTIttkSzUxJj6Gd8mPw2QN9CzbKp/UE=;
        b=qnIDsUPpgDgcGkE5K0e92Lswyuvsy2k2A+DrJerDWlkxeznqCF4N+yuqbbO7ca7eZI
         kw0Nh/gzy5UMsAN6YW5S4i5J11yqbSijqGqkq37xVk3ixk7+tSvTJk2X5W46je8k9vbX
         S7mdT3k2kmECyz+VDdQ1+R16dund06D82onZUaFL4rjRarF/D0QATGd3HxvjksOWVut+
         e/zcUVD+PA81tMrGDOXofY50DRXBRMVPf4YxIBPMp/5u5mjwMIOuked7spEwl1ogxTQO
         rD5pCAVWXMyBIuHkUO/C2VL8SGe+MMFl/uFjsnvKHQ6pyyP8vNp2WgQk/2U9vwnY/eO1
         WU+g==
X-Forwarded-Encrypted: i=1; AJvYcCUb30vC+rKLSWRhUHcI7qjgBWuhIRwvltvs8SeMnrubwCaTkGZMNvIrfRa3IksQJoPNsU9vyMwGIw3Ub2JgbdEWB/pbvpf55060WjfxPvg3MuPcgJaJ+DYDMA==
X-Gm-Message-State: AOJu0YyW+vHVhbuWtBkL3MmXVFp5pF95bqgwyYB3FS/ryJlbVJcvexiU
	SZvTtQwoNfIVaAHUL/GSDk2wwf1le255AKwfPmE9gyV77sTtrG9oI4VJacRu8Vp1eVGm8IZulqt
	NIW8bUFNFtrq4uxP9EmBoPsVbRCsSWQsG
X-Google-Smtp-Source: AGHT+IFnuXaregY+htaqwDnqmH8iYgArtbiQqseTKBCM9D0gmiYTku31PkyKoEHxt4E139A+bm2Xbv1dvW3pD7+c+YE=
X-Received: by 2002:a05:6871:1d2:b0:233:73b7:5379 with SMTP id
 586e51a60fabf-24171e10362mr4275881fac.21.1715577176130; Sun, 12 May 2024
 22:12:56 -0700 (PDT)
MIME-Version: 1.0
References: <17CD719EC1248206.5708@lists.openembedded.org> <20240508070649.1657864-1-kai.kang@windriver.com>
 <DB5PR02MB10213E807CF33DF0EC259D2B4EFE12@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <17619a5b-7ded-43d6-ab8b-626b428a7023@windriver.com>
In-Reply-To: <17619a5b-7ded-43d6-ab8b-626b428a7023@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 May 2024 22:12:30 -0700
Message-ID: <CAMKF1spUorkxPd8S9G950Ppn8XbpgtS+0aQvP_LUcPH+QBjNxg@mail.gmail.com>
Subject: Re: [oe] [PATCH v3 1/1] apache2: fix multilib file conflicts
To: kai.kang@eng.windriver.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 05:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110333

Kai

Can you add the needed bits to commit msg and send a v4 please

On Sun, May 12, 2024 at 8:30=E2=80=AFPM Kai Kang via lists.openembedded.org
<kai.kang=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> On 5/12/24 21:59, Peter Kjellerstedt wrote:
>
> -----Original Message-----
> From: kai.kang@windriver.com <kai.kang@windriver.com>
> Sent: den 8 maj 2024 09:07
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: [PATCH v3 1/1] apache2: fix multilib file conflicts
>
> From: Kai Kang <kai.kang@windriver.com>
>
> There are file conflicts of apache2 when multilib enabled:
>
> Error: Transaction test error:
>   file /usr/share/apache2/build/config.nice conflicts between attempted
>     installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4=
.58-r0.armv7vet2hf_vfp
>   file /usr/share/apache2/build/config_vars.mk conflicts between
>     attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apach=
e2-dev-2.4.58-r0.armv7vet2hf_vfp
>
> Install the 'build' directory to ${libexecdir} by setting
> 'installbuilddir' to fix the conflicts. ${libexecdir} is not populated
> to sysroot by default, but command apxs requires these files, then add
> the dir to SYSROOT_DIRS to populate them.
>
> And inherit bbclasses multilib_script and multilib_header to fix follow
> up conflicts:
>
>   file /usr/bin/apxs conflicts between attempted installs of
>     apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7=
vet2hf_vfp
>   file /usr/include/apache2/ap_config_layout.h conflicts between
>     attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apach=
e2-dev-2.4.58-r0.armv7vet2hf_vfp
>
> Since multilib_script inherits update-alternatives, remove it from
> inherit line for beautification.
>
> Fix buildpaths warning as well:
>
>   WARNING: lib32-apache2-2.4.58-r0 do_package_qa: QA Issue: File /usr/sha=
re/apache2/build/config.nice
>            in package lib32-apache2-dev contains reference to TMPDIR [bui=
ldpaths]
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../recipes-httpd/apache2/apache2_2.4.59.bb   | 37 ++++++++++++-------
>  1 file changed, 23 insertions(+), 14 deletions(-)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> index b96e8b4e1..59db22310 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> @@ -31,7 +31,7 @@ SRC_URI[sha256sum] =3D "ec51501ec480284ff52f637258135d3=
33230a7d229c3afa6f6c2f9040e
>
>  S =3D "${WORKDIR}/httpd-${PV}"
>
> -inherit autotools update-rc.d pkgconfig systemd update-alternatives
> +inherit autotools update-rc.d pkgconfig systemd multilib_script multilib=
_header
>
>  DEPENDS =3D "openssl expat pcre apr apr-util apache2-native "
>
> @@ -80,7 +80,9 @@ EXTRA_OECONF:class-native =3D "\
>      "
>
>  do_configure:prepend() {
> -    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' =
${S}/config.layout
> +    sed -i -e 's#\(cgidir:\s*\).*#\1${libexecdir}/cgi-bin#' \
>
> I do not know if this was intentional or not, but the above changes the
> location of the CGI directory for all layouts, where it previously only
> changed the path used by the Debian layout.
>
> It is not a problem for us as we do not use it anyway (we actually
> remove it in our bbappend), but if it was intentional, it should be
> mentioned in the commit message, and if it was not intentional, then
> it should be reverted.
>
> It is indeed to change `the CGI directory` and it has been done a long ti=
me ago for all layouts.
> It is just update the sed pattern to make it more clear this time.
>
> +           -e 's#\(installbuilddir:\s*\).*#\1${libexecdir}/${PN}/build#'=
 \
>
> This now works for us while using the RedHat layout.
>
> Thanks for your feedback.
>
> Regards,
> Kai
>
> +           ${S}/config.layout
>  }
>
>  do_install:append:class-target() {
> @@ -119,14 +121,15 @@ do_install:append:class-target() {
>             -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,=
g; s,-ffile-prefix-map[^ ]*,,g' \
>             -e 's,${HOSTTOOLS_DIR}/,,g' \
>             -e 's,APU_INCLUDEDIR =3D .*,APU_INCLUDEDIR =3D ,g' \
> -           -e 's,APU_CONFIG =3D .*,APU_CONFIG =3D ,g' ${D}${datadir}/apa=
che2/build/config_vars.mk
> +           -e 's,APU_CONFIG =3D .*,APU_CONFIG =3D ,g' ${D}${libexecdir}/=
${PN}/build/config_vars.mk
>
>      sed -i -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
>             -e 's,${DEBUG_PREFIX_MAP},,g' \
>             -e 's,${RECIPE_SYSROOT},,g' \
>             -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,=
g; s,-fmacro-prefix-map[^ ]*,,g' \
>             -e 's,APU_INCLUDEDIR =3D .*,APU_INCLUDEDIR =3D ,g' \
> -           -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/bu=
ild/config.nice
> +           -e 's,${WORKDIR}/recipe-sysroot/,,g' \
> +           -e 's,".*/configure","configure",g' ${D}${libexecdir}/${PN}/b=
uild/config.nice
>
>      if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
>          install -d ${D}${sysconfdir}/tmpfiles.d/
> @@ -143,6 +146,8 @@ do_install:append:class-target() {
>
>      rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
>      chown -R root:root ${D}
> +
> +    oe_multilib_header apache2/ap_config_layout.h
>  }
>
>  do_install:append:class-native() {
> @@ -152,20 +157,22 @@ do_install:append:class-native() {
>
>  SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " apache_sysroot_prepro=
cess"
>
> +SYSROOT_DIRS +=3D "${libexecdir}/${PN}/build"
> +
>  apache_sysroot_preprocess() {
>      install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
>      install -m 755 ${D}${bindir}/apxs ${SYSROOT_DESTDIR}${bindir_crosssc=
ripts}
>      install -d ${SYSROOT_DESTDIR}${sbindir}
>      install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}
> -    sed -i 's!my $installbuilddir =3D .*!my $installbuilddir =3D "${STAG=
ING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crosss=
cripts}/apxs
> -
> -    sed -i 's!^APR_CONFIG =3D .*!APR_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^APU_CONFIG =3D .*!APU_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^includedir =3D .*!includedir =3D ${STAGING_INCDIR}/apache=
2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^CFLAGS =3D -I[^ ]*!CFLAGS =3D -I${STAGING_INCDIR}/openssl=
!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^EXTRA_LDFLAGS =3D .*!EXTRA_LDFLAGS =3D -L${STAGING_LIBDIR=
}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^EXTRA_INCLUDES =3D .*!EXTRA_INCLUDES =3D -I$(includedir) =
-I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_=
vars.mk
> -    sed -i 's!--sysroot=3D[^ ]*!--sysroot=3D${STAGING_DIR_HOST}!' ${SYSR=
OOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> +    sed -i 's!\(my $installbuilddir =3D \)"\(.*\)"!\1"${STAGING_DIR_HOST=
}\2"!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
> +
> +    sed -i 's!^APR_CONFIG =3D .*!APR_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apr-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^APU_CONFIG =3D .*!APU_CONFIG =3D ${STAGING_BINDIR_CROSS}/=
apu-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^includedir =3D .*!includedir =3D ${STAGING_INCDIR}/apache=
2!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^CFLAGS =3D -I[^ ]*!CFLAGS =3D -I${STAGING_INCDIR}/openssl=
!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^EXTRA_LDFLAGS =3D .*!EXTRA_LDFLAGS =3D -L${STAGING_LIBDIR=
}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^EXTRA_INCLUDES =3D .*!EXTRA_INCLUDES =3D -I$(includedir) =
-I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/confi=
g_vars.mk
> +    sed -i 's!--sysroot=3D[^ ]*!--sysroot=3D${STAGING_DIR_HOST}!' ${SYSR=
OOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>  }
>
>  # Implications - used by update-rc.d scripts
> @@ -178,6 +185,8 @@ SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
>  ALTERNATIVE:${PN}-doc =3D "htpasswd.1"
>  ALTERNATIVE_LINK_NAME[htpasswd.1] =3D "${mandir}/man1/htpasswd.1"
>
> +MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/apxs"
> +
>  PACKAGES =3D "${PN}-utils ${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${=
PN}"
>
>  CONFFILES:${PN} =3D "${sysconfdir}/${BPN}/httpd.conf \
> @@ -200,7 +209,7 @@ FILES:${PN}-utils =3D "${bindir}/ab \
>  # We override here rather than append so that .so links are
>  # included in the runtime package rather than here (-dev)
>  # and to get build, icons, error into the -dev package
> -FILES:${PN}-dev =3D "${datadir}/${BPN}/build \
> +FILES:${PN}-dev =3D "${libexecdir}/${PN}/build \
>                     ${datadir}/${BPN}/icons \
>                     ${datadir}/${BPN}/error \
>                     ${includedir}/${BPN} \
> --
> 2.34.1
>
> //Peter
>
>
> --
> Kai Kang
> Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110330): https://lists.openembedded.org/g/openembedde=
d-devel/message/110330
> Mute This Topic: https://lists.openembedded.org/mt/105976652/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

