Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1566BC07548
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:28 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.5385.1699931305044066985
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DutXBxjh;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1cc3bb32b5dso46061565ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931304; x=1700536104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpfZVGkaCX8IwC05LJzdUwf++UaxvoQNG2e0xO2gl4o=;
        b=DutXBxjhm0OGU8m4rCkdrgSn+mmLg+H6rwdCwLklys0Bg+hUlQkkVGtwK9VGRLSBGJ
         CdVbDw0Rb5tcYghz+1VItMojMbuUJS8T0v6V/j1wVx79bmMd4rEHszitZwIxCdQPAnhe
         TMe0S+IrOeo6mWU38K96igNBNwQkctgtGm1iNzjIS8FwBOsVisMgALwfxZ4butl0yuLA
         FBDyS2zzaRr+uSJp2LDZaZgdMit/J11ScW+s3hm06gFMboUa+5gVbSpTaM8i3eASUdYA
         HQ3YhDzP1DABDP2SPqXtQN57dsqm6IKBOlfzqoJSVkmVmtf6LgKu8fLMX3Q210cIPv3A
         RnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931304; x=1700536104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpfZVGkaCX8IwC05LJzdUwf++UaxvoQNG2e0xO2gl4o=;
        b=R4l5wdW1aVTGfeSVWLPuKl8lWzawgmKwZAaD6Ul8mN4LlUoBOPgCg5ROobEtaHR1sh
         hQu6MsOD30o1HZeSIhBScbtvSAcXLUWGyrha2ZKRKTE69hRn0Jfs9+diZ9KGIdoJjzX0
         rLjoXm2XPQ53+q/HaWbf7B/K2vYEHeVTmmiCcrmOsIWNafN0AQm0gmyGMXglTJ2UT6cP
         31w9nF8R4Z6qjpuYI/Jv49lQcKf3XTpkfaGUS9pp8yJc2NVPP5AIcsfAzSUwvyb2ne2w
         hJi4Xt70uZt5wfHT/5+Y4JewFIHuCL0J/HzCx3GUu2Jgoq1rPJCcK0ZOMGiJXRmaVEPX
         JFUA==
X-Gm-Message-State: AOJu0Yzwt1Fus7z2T6opNSAtaz3MlvRz92eZxsKJNi/82HAUQCvwGVUI
	/b5PSv8bwOfKCCwBNerFI5iTt5DKQXoTNw==
X-Google-Smtp-Source: AGHT+IHRMutOV6nR06osijIrAJJfQfY/tL12tUc8PEICAgownaIAZc+OhJr9zS5dQK9jnrnLIaFqmA==
X-Received: by 2002:a17:902:b7c8:b0:1c3:6d97:e89e with SMTP id v8-20020a170902b7c800b001c36d97e89emr1244299plz.58.1699931304269;
        Mon, 13 Nov 2023 19:08:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 09/10] gstd: Upgrade to 0.15.0
Date: Mon, 13 Nov 2023 19:08:10 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-9-111dd5d0fe68@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
References: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106696

License-Update: Switch to LGPL-2.1 [1]=0D
=0D
Drop rpath patch its not needed anymore with meson build system=0D
Switch to using meson build system=0D
Fix packaging for python pieces and systemd=0D
=0D
[1] https://github.com/RidgeRun/gstd-1.x/commit/76d9fb61a05973b30220fcae5ff=
87de9d618ea49=0D
Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
---=0D
 .../gstd/0001-gstd-yocto-compatibility.patch       | 22 ----------------=0D
 .../recipes-multimedia/gstreamer-1.0/gstd_git.bb   | 29 ++++++++++++++----=
----=0D
 2 files changed, 18 insertions(+), 33 deletions(-)=0D
=0D
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gst=
d-yocto-compatibility.patch b/meta-multimedia/recipes-multimedia/gstreamer-=
1.0/gstd/0001-gstd-yocto-compatibility.patch=0D
deleted file mode 100644=0D
index 64fd578a96..0000000000=0D
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd/0001-gstd-yocto=
-compatibility.patch=0D
+++ /dev/null=0D
@@ -1,22 +0,0 @@=0D
-From eaf51d6420c63713f62025583681007c3502d387 Mon Sep 17 00:00:00 2001=0D
-From: Carlos <carlos.rodriguez@ridgerun.com>=0D
-Date: Fri, 15 Dec 2017 10:14:05 -0600=0D
-Subject: [PATCH] gstd:yocto compatibility=0D
-=0D
-Upstream-Status: Pending=0D
-Signed-off-by: Khem Raj <raj.khem@gmail.com>=0D
----=0D
- gstd/Makefile.am                | 2 +-=0D
- 3 files changed, 9 insertions(+), 3 deletions(-)=0D
-=0D
---- a/gstd/Makefile.am=0D
-+++ b/gstd/Makefile.am=0D
-@@ -74,7 +74,7 @@ gstd_CFLAGS =3D $(GST_CFLAGS)					\=0D
- 	      -DGSTD_LOG_STATE_DIR=3D\"$(gstdlogstatedir)\"	\=0D
- 	      -DGSTD_RUN_STATE_DIR=3D\"$(gstdrunstatedir)\"=0D
- =0D
--gstd_LDFLAGS =3D $(GST_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GJSON_LIBS) $=
(LIBD_LIBS) -Wl,-rpath -Wl,$(libdir)=0D
-+gstd_LDFLAGS =3D $(GST_LIBS) $(GIO_LIBS) $(GIO_UNIX_LIBS) $(GJSON_LIBS) $=
(LIBD_LIBS)=0D
- gstd_LDADD =3D libgstd-core.la=0D
- =0D
- gstdincludedir =3D $(includedir)/gstd=0D
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb b=
/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb=0D
index 38fafe82e4..88acdb190e 100644=0D
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb=0D
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb=0D
@@ -2,26 +2,27 @@ DESCRIPTION =3D "Gstreamer Daemon"=0D
 SUMMARY =3D "GStreamer framework for controlling audio and video streaming=
 using TCP connection messages"=0D
 HOMEPAGE =3D "https://developer.ridgerun.com/wiki/index.php?title=3DGstd-1=
.0"=0D
 SECTION =3D "multimedia"=0D
-LICENSE =3D "GPL-2.0-or-later"=0D
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"=0D
+LICENSE =3D "LGPL-2.1-or-later"=0D
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc71b653a0f608a58cdc5693ae57126b=
c"=0D
 =0D
-DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-b=
ad gstreamer1.0-rtsp-server json-glib libdaemon jansson"=0D
+DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-b=
ad gstreamer1.0-rtsp-server json-glib libdaemon libsoup-2.4 jansson"=0D
 =0D
 SRCBRANCH ?=3D "master"=0D
-SRCREV =3D "a6621a5778b234651aa2adbbe304d906a3fa64d1"=0D
-SRC_URI =3D "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=3Dhttps;b=
ranch=3D${SRCBRANCH} \=0D
-           file://0001-gstd-yocto-compatibility.patch \=0D
-           "=0D
+SRCREV =3D "a011affa67f240cbc7aaff5b00fdfd6124bdaece"=0D
+SRC_URI =3D "git://git@github.com/RidgeRun/gstd-1.x.git;protocol=3Dhttps;b=
ranch=3D${SRCBRANCH}"=0D
 S =3D "${WORKDIR}/git"=0D
 =0D
 # Remove the +really when upstream version is > 1.0=0D
-PV =3D "1.0+really0.8.0"=0D
+PV =3D "1.0+really0.15.0"=0D
 =0D
-inherit autotools pkgconfig gettext gtk-doc=0D
+GTKDOC_MESON_OPTION =3D "enable-gtk-doc"=0D
+=0D
+inherit meson pkgconfig gettext gtk-doc systemd python3native python3-dir =
python3targetconfig=0D
 =0D
 do_install:append() {=0D
-        rmdir ${D}${localstatedir}/run/${BPN} ${D}${localstatedir}/run \=0D
-              ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log=0D
+        rmdir ${D}${root_prefix}${localstatedir}/run/${BPN} ${D}${root_pre=
fix}${localstatedir}/run \=0D
+              ${D}${root_prefix}${localstatedir}/log/${BPN} ${D}${root_pre=
fix}${localstatedir}/log \=0D
+              ${D}${root_prefix}${localstatedir}=0D
         rm -f ${D}${bindir}/gst-client ${D}${bindir}/gstd-client=0D
         if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fal=
se', d)}; then=0D
                 install -d ${D}${sysconfdir}/tmpfiles.d=0D
@@ -33,3 +34,9 @@ do_install:append() {=0D
         ln -sf gst-client-1.0 ${D}${bindir}/gst-client=0D
         ln -sf gst-client-1.0 ${D}${bindir}/gstd-client=0D
 }=0D
+PACKAGES =3D+ "${PN}-python"=0D
+=0D
+FILES:${PN} +=3D "${systemd_user_unitdir}"=0D
+FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}/*"=0D
+=0D
+SYSTEMD_SERVICE:${PN} =3D "gstd.service"=0D
=0D
-- =0D
2.42.1=0D
=0D

