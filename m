Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A25C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 07:12:42 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.8762.1746774758054811434
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 May 2025 00:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMwO26DU;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-60219d9812bso586289eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 May 2025 00:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746774757; x=1747379557; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx4QhVagfqXKz+MPOh++hOwO3H++pC2PbSs5svEelVY=;
        b=WMwO26DUwtwJSzVaY+CiGDqqx35PLWet82pvZrfz6nmSwnR3D5yiy2fEdABJLhmsjc
         iPU6DUK3Z4ZFP7VrSt4IKhbWk0qq+Q7ouZ9IVQuy90tvKu4tQNTu+ZVY7C2Nf4lMfvH1
         8K+pJd17eFcwX2jVlJN0qevmxGuKFZry48I0drd9SWnpLR96eeS3/k+Hbn8KQg8nG84L
         VDBnEUuwM3QySbvWDVM3BIpajG5hfHNqr+34JOiFE8pofUel6ex7PfxlAKyFA6f4nJbd
         qMJA896dYSJ2aTj6rH+EdGCPDCcW+LzqWNh/xgXB6W35RHmumRJJSe6vrvOUiqVN3F3Z
         c8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746774757; x=1747379557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx4QhVagfqXKz+MPOh++hOwO3H++pC2PbSs5svEelVY=;
        b=XPnHa8Plojfg2ROhsJJ5MCNNenrYJSfzhE+AG5wniPmmnynqkfuk9bCZS6nosYZHqi
         gu7Cz40gsthR1NmogOWdkLUw7ceDOc8PC8NbOExsuy+bViyv+4pHzTzjkI3jFc64jVxh
         h3QcNUc55eIv3s6aELFneu7+RThIPduHEnVa1kTsTy8kBRWNxA5vnTmtKvqS1M271VTQ
         Ftu9WvKL/PPAQOygmqnduTxtwM4sCGClfy2L6oxUpiJJzgRM6aHv5qjhdRjDPVxi+gmV
         FJcCq5aNAYQRgMlC8ZLVgz3uk0mrdqA59nbew2Az2E1xtFfsBNIT2hPXxgG3cyz4vUx0
         zK0A==
X-Gm-Message-State: AOJu0YxO3vR44gL1pkkpZ4bUkg5bMtWV+ekREQez+3aZ6DflABcBrQKe
	ITMiBu4y0r9WgthpAeCuu+FnIJxAbEnU/Z7/W4HRZRTJxf6uBl7bqDuWPdcmiSnrAzV0wCp7GxB
	lxg1sHI6sFejEelB7D8UQY795FGpHDA3N
X-Gm-Gg: ASbGnctHi5L8QzbQJI4PyfQjG6TkTwmabagOK+jSvAd3wKYbHGEB9FyhebadsaSsTtA
	jUhfDvpOfZuo33u7rV+pd8qfW4rUb2Qm8qB5CTEJBEV1xbnji2tLUzCg02gLiHCy0XujXYvxImy
	jHysg1TT6SHRZD5/QOyeRmiQzAgibp5JtMFI6L
X-Google-Smtp-Source: AGHT+IGVPF48nlLTGHIkFWyeaI55/pc133i6YD2Rn9PJ1X5gbY6QalEvZ0hKTcCjS1DVxCT9JnqAM3/Z27VcSfxFl3M=
X-Received: by 2002:a05:6820:1b09:b0:601:d595:3b1f with SMTP id
 006d021491bc7-6084c1076f5mr1434377eaf.6.1746774757181; Fri, 09 May 2025
 00:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250509060628.1082632-1-raj.khem@gmail.com> <812a148d-c138-4f92-8b8b-967bb62f8f3c@gmail.com>
In-Reply-To: <812a148d-c138-4f92-8b8b-967bb62f8f3c@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 May 2025 00:12:10 -0700
X-Gm-Features: ATxdqUFnrl-DSHRhinUM1jsiJNhUWQw1it_02CH2pqbIcDr55L89bzZTPWemHLQ
Message-ID: <CAMKF1sp5fJ82AROH1SXFAUQ7oowJyRfX3M7f_VQrLrSHkGpq5g@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] cockpit: Upgrade to 337
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 May 2025 07:12:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117375

On Thu, May 8, 2025 at 11:44=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 5/9/25 08:06, Khem Raj via lists.openembedded.org wrote:
> > Get rid of remoeved configure options
> >
> > ERROR: QA Issue: cockpit: configure was passed unrecognised options: --=
disable-pcp --enable-old-bridge --with-cockpit-ws-instance-user --disable-s=
sh --disable-polkit --with-cockpit-ws-instance-group --with-cockpit-group -=
-with-cockpit-user [unknown-configure-option]
> I believe with this also the COCKPIT_WS_USER_GROUP variable became
> orphan and could be removed as part of the cleanup

Right, I have removed it and pushed the squashed change into
master-next. Thanks for looking into this

> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../{cockpit_304.bb =3D> cockpit_337.bb}        | 40 ++++++++++-------=
--
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> >  rename meta-webserver/recipes-webadmin/cockpit/{cockpit_304.bb =3D> co=
ckpit_337.bb} (82%)
> >
> > diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb b/m=
eta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
> > similarity index 82%
> > rename from meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
> > rename to meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
> > index edd51bc671..29bb771cd2 100644
> > --- a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
> > +++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
> > @@ -9,7 +9,7 @@ SRC_URI +=3D " \
> >      file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
> >      file://cockpit.pam \
> >      "
> > -SRC_URI[sha256sum] =3D "a87d090c930e2058bb3e970ca7f2bafe678687966b5c0b=
8b42a802977e391ce9"
> > +SRC_URI[sha256sum] =3D "df51ef5920fae69e1b435f657376aa93772c0c1720b954=
a3bac10ebba26bfedf"
> >
> >  inherit gettext pkgconfig autotools systemd features_check
> >  inherit ${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'pytho=
n3targetconfig', d)}
> > @@ -28,11 +28,7 @@ COCKPIT_WS_USER_GROUP ?=3D "${COCKPIT_USER_GROUP}"
> >
> >  EXTRA_AUTORECONF =3D "-I tools"
> >  EXTRA_OECONF =3D " \
> > -    --with-cockpit-user=3D${COCKPIT_USER_GROUP} \
> > -    --with-cockpit-group=3D${COCKPIT_USER_GROUP} \
> >      --with-admin-group=3D${COCKPIT_USER_GROUP} \
> > -    --with-cockpit-ws-instance-user=3D${COCKPIT_WS_USER_GROUP} \
> > -    --with-cockpit-ws-instance-group=3D${COCKPIT_WS_USER_GROUP} \
> >      --disable-doc \
> >      --with-systemdunitdir=3D${systemd_system_unitdir} \
> >      --with-pamdir=3D${base_libdir}/security \
> > @@ -40,14 +36,12 @@ EXTRA_OECONF =3D " \
> >
> >  PACKAGECONFIG ??=3D " \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
> > -    old-bridge \
> >  "
> >
> > -PACKAGECONFIG[pcp] =3D "--enable-pcp,--disable-pcp,pcp"
> > -PACKAGECONFIG[dashboard] =3D "--enable-ssh,--disable-ssh,libssh"
> > -PACKAGECONFIG[storaged] =3D ",,,udisks2"
> > -PACKAGECONFIG[polkit] =3D "--enable-polkit,--disable-polkit,polkit"
> > -PACKAGECONFIG[old-bridge] =3D "--enable-old-bridge"
> > +PACKAGECONFIG[pcp] =3D ",,pcp"
> > +PACKAGECONFIG[dashboard] =3D ",,libssh"
> > +PACKAGECONFIG[storaged] =3D ",,udisks2"
> > +PACKAGECONFIG[polkit] =3D ",,polkit"
> >
> >  PACKAGES =3D+ " \
> >      ${PN}-pcp \
> > @@ -83,27 +77,28 @@ FILES:${PN}-systemd =3D "${datadir}/cockpit/systemd=
"
> >  FILES:${PN}-users =3D "${datadir}/cockpit/users"
> >  FILES:${PN}-kdump =3D " \
> >      ${datadir}/cockpit/kdump \
> > -    ${datadir}/metainfo/org.cockpit-project.cockpit-kdump.metainfo.xml=
 \
> > +    ${datadir}/metainfo/org.cockpit_project.cockpit_kdump.metainfo.xml=
 \
> >  "
> >  FILES:${PN}-sosreport =3D " \
> >      ${datadir}/cockpit/sosreport \
> > -    ${datadir}/metainfo/org.cockpit-project.cockpit-sosreport.metainfo=
.xml \
> > +    ${datadir}/metainfo/org.cockpit_project.cockpit_sosreport.metainfo=
.xml \
> >      ${datadir}/pixmaps/cockpit-sosreport.png \
> > +    ${datadir}/icons/hicolor/64x64/apps/cockpit-sosreport.png \
> >  "
> >  FILES:${PN}-storaged =3D " \
> >      ${datadir}/cockpit/storaged \
> > -    ${datadir}/metainfo/org.cockpit-project.cockpit-storaged.metainfo.=
xml \
> > +    ${datadir}/metainfo/org.cockpit_project.cockpit_storaged.metainfo.=
xml \
> >  "
> >
> >  FILES:${PN}-networkmanager =3D " \
> >      ${datadir}/cockpit/networkmanager \
> > -    ${datadir}/metainfo/org.cockpit-project.cockpit-networkmanager.met=
ainfo.xml \
> > +    ${datadir}/metainfo/org.cockpit_project.cockpit_networkmanager.met=
ainfo.xml \
> >  "
> >  RDEPENDS:${PN}-networkmanager =3D "networkmanager"
> >
> >  FILES:${PN}-selinux =3D " \
> >      ${datadir}/cockpit/selinux \
> > -    ${datadir}/metainfo/org.cockpit-project.cockpit-selinux.metainfo.x=
ml \
> > +    ${datadir}/metainfo/org.cockpit_project.cockpit_selinux.metainfo.x=
ml \
> >  "
> >  FILES:${PN}-playground =3D "${datadir}/cockpit/playground"
> >  FILES:${PN}-dashboard =3D "${datadir}/cockpit/dashboard"
> > @@ -143,6 +138,9 @@ FILES:${PN}-ws =3D " \
> >      ${systemd_system_unitdir}/cockpit-wsinstance-https@.socket \
> >      ${systemd_system_unitdir}/cockpit-wsinstance-https@.service \
> >      ${systemd_system_unitdir}/system-cockpithttps.slice \
> > +    ${systemd_system_unitdir}/cockpit-session-socket-user.service \
> > +    ${systemd_system_unitdir}/cockpit-wsinstance-socket-user.service \
> > +    ${systemd_system_unitdir}/cockpit-issue.service \
> >      ${libdir}/tmpfiles.d/cockpit-tempfiles.conf \
> >      ${sbindir}/remotectl \
> >      ${base_libdir}/security/pam_ssh_add.so \
> > @@ -169,7 +167,8 @@ FILES:${PN} +=3D " \
> >      ${datadir}/cockpit/ssh \
> >      ${libexecdir}/cockpit-ssh \
> >      ${datadir}/cockpit \
> > -    ${datadir}/metainfo/cockpit.appdata.xml \
> > +    ${datadir}/icons/hicolor/128x128/apps/cockpit.png \
> > +    ${datadir}/metainfo/org.cockpit_project.cockpit.appdata.xml \
> >      ${datadir}/pixmaps/cockpit.png \
> >      ${nonarch_libdir}/tmpfiles.d \
> >      ${nonarch_libdir}/firewalld \
> > @@ -187,7 +186,12 @@ do_install:append() {
> >      install -p -m 0644 ${UNPACKDIR}/cockpit.pam ${D}${sysconfdir}/pam.=
d/cockpit
> >
> >      # provided by firewalld
> > -    rm -rf ${D}${libdir}/firewalld
> > +    rm -rf ${D}${libdir}/firewalld \
> > +    ${D}${PYTHON_SITEPACKAGES_DIR}/*/__pycache__ \
> > +    ${D}${PYTHON_SITEPACKAGES_DIR}/*/*/__pycache__ \
> > +    ${D}${PYTHON_SITEPACKAGES_DIR}/*/*/*/__pycache__ \
> > +    ${D}${PYTHON_SITEPACKAGES_DIR}/*/*/*/*/__pycache__ \
> > +    ${D}${PYTHON_SITEPACKAGES_DIR}/${BP}.dist-info/direct_url.json
> >
> >      if ! ${@bb.utils.contains('PACKAGECONFIG', 'storaged', 'true', 'fa=
lse', d)}; then
> >          for filename in ${FILES:${PN}-storaged}
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#117373): https://lists.openembedded.org/g/openembed=
ded-devel/message/117373
> > Mute This Topic: https://lists.openembedded.org/mt/112894260/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

