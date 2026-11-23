Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48071.1795411913161290425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dGX+J40P;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38587f3de36so3516910eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411912; x=1796016712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aD3GIpiMO+kqndU6I7xMk4Ra9gyGQP5IgL/i/0OZmk=;
        b=dGX+J40PBWdYKXdpeAAs2B57zbm+DoCcm/AyRrBvnlpF7zxFWFwEwUVYdm5M/1VEJp
         YGrGIydIbsAxDr2SmORMk7dJLoto5Ft3nvpzGWc0yU+Dl6OCs88Hh9k6Oz3t2Yz1BMNq
         KktyXgihZgfYfCBFABxAEP8p/tA/Fiyt/r/+HFiUSNqwm10Y2zjIevxZuK7hcmp0Nu4i
         gztxIHzeJimrivVIvCeuDV2KB8d31lUdqYpPt575Xj/NbH2/xQ4nHuS19xF98MijQRST
         JgdUbCKn4fRSbX8nDujZ1fEVeabo/H5t5QQ6MbgNRRfmhfjJ3wMBkRK52x4ktab0fT++
         NX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411912; x=1796016712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9aD3GIpiMO+kqndU6I7xMk4Ra9gyGQP5IgL/i/0OZmk=;
        b=pVRmatUZxwOj4xO1zhztd8UBwjZLxzYMihGwRH7wf4/sszuX4ATQNZucoiYevoCuD7
         EPQB9Dp/beCGEetB+NroGRf2nJuOa/6zedlqN1ElwweHfGMKhDr4lxx1VrdJOukcT58h
         rcWJ7ZkdF+z4OecT90oI/6blPk2wBckfFNxisUJKeUAeY4VQWIZI/4U9hxKjkpXE7p4t
         u7Ep3hmTT5Aa7bZM1rrFQ8la26Bg9bIV8oQN6Z24q7zk962Sb3LehcP3w0388cIySsfo
         40GIiZgJfH728Q7ZllBIoOr3nHj6htH3aKu25XEfCC1BVpuIL6NWcng61V//cWZ537Cp
         ViEw==
X-Gm-Message-State: APuU4Z/hjHsJUEXcIqWSQwncefafhMJWkTq5EAQ2NHtqWD0IIVQ6yt15
	5h4dVNv9pXPPNLsCnNH5CoiN56DA99fcCmki4gm8N7MU6CcAJJFsQ0Br6dQ4nsssafI=
X-Gm-Gg: AZFdTZcFfJElYK49SJZo3uYdnCsfQrD4kZxwwLoMKGNPIrwjdosrmSyC8IkI4+/sgez
	TWrxyme/4KpkVtDzBIHO3Si6tKtnpRRSpqapuUwp/G3pMX459E0WuN1VPq7yIosAkLmk1adPTt5
	pPnjLwE1nD9Oc3skvWUR9CyTxbB0nkSPmZpSLdOzyKx4zRvFxORGkqlOaeAtJmm+qy+KSecDAsY
	oRs7fDL0G9MiW1Xu3XeBT4rIMQBZsROmO9FncVECDe1T0xzafB9EFENEQpYWEmwVc2E8zjB/wag
	5A2JL/tE1JgQVL7DmqNWxdGVru1GMrbQVynCaVhGKDArUFCili6E56Qh6zjtmAcbOLVtUM1HG/d
	B1bRswF083jjq50LZvDG+HT1Rd7JxIaokBMnq3WInMmPRt9Iq+6rQClmrYgTrvNTOanSkKT+eUb
	srybk4nQARmIzvcWZrWX0gylSA9z92Rj7BeBaH5pGrUHk38AD9FbrJ0fqt8NIxRy2dTdrPxboxj
	lwXGTwccmgU7u4AER5/hhB8mZZ9QNv9OsCffnIuV5tPh+puYlSHPuuHKTIn0JjTDcEmb9jUcaMY
	7B7Z4zgW9SFCPJvgx/dj15aej7fmtwQB+g5sHd91vn/Ufutx7lTFQzI2YbgxrBgjQyKebmU4eHC
	T8KVHomBoryQD9KjFXMcW8nwUA0UbsF0uGeHm3RRvyvcbc0cItkGYlr8RW9niRdp/uRp5sVyouh
	4538H7FP1xqJzXBUzrghSo8KjZY840i0aTa5euBFGsNlYvODyKBZ9fUiRDzb+Er3Z3bDfydMRtJ
	kpsRHAzu8yyUVt8XguuiKdYmKT5rmvunk4DJgolV2FsnP1yxp4GEZNZUqOJ/TmEFH5B1FBW9J0u
	Em26
X-Received: by 2002:a05:7300:8807:b0:369:5583:bf4c with SMTP id 5a478bee46e88-3856ff5bb62mr11212222eec.28.1795411912446;
        Sun, 22 Nov 2026 21:31:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH] openzone: upgrade 1.2.4 -> 1.2.9
Date: Sun, 22 Nov 2026 21:29:51 -0800
Message-ID: <20261123052953.3658549-95-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132882
Content-Type: text/plain; charset="utf-8"

- Add context-menu cursor and update aliases for current Breeze,
  Adwaita and HTML5 browser cursors
- Remove arrow aliases that broke Plasma on Wayland
- Fix col-resize/row-resize aliases and a stray pixel in Black theme
- Add a make install script; repackage for KDE installation

The theme is maintained on GitHub now, and the exherbo mirror only has
the 1.2.4 tarball. Fetch the v1.2.9 tag from git and build the themes
with the upstream Makefile, which renders them with icon-slicer, instead
of unpacking the prebuilt per-theme tarballs of the old release. Copy
the built themes in do_install: the Makefile's install target moves
them and keeps the build user's ownership. The installed themes are
unchanged.

Add UPSTREAM_CHECK_GITTAGREGEX for the vX.Y.Z tags. The COPYING change
is only the copyright year.

License-Update: copyright year updated in COPYING
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{openzone_1.2.4.bb => openzone_1.2.9.bb}  | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)
 rename meta-xfce/recipes-art/cursor-themes/{openzone_1.2.4.bb => openzone_1.2.9.bb} (54%)

diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.9.bb
similarity index 54%
rename from meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
rename to meta-xfce/recipes-art/cursor-themes/openzone_1.2.9.bb
index 8ba962fbd4..c32c8cf2c4 100644
--- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.4.bb
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.9.bb
@@ -1,24 +1,22 @@
 SUMMARY = "X11 Mouse Theme"
-HOMEPAGE = "http://xfce-look.org/content/show.php/OpenZone?content=111343"
+HOMEPAGE = "https://github.com/ducakar/openzone-cursors"
 SECTION = "x11/wm"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a4dd0d1066e1f1224b3bc4bbb206b754"
+LIC_FILES_CHKSUM = "file://COPYING;md5=15c85787ab411af36a78dfc20fdf7793"
 
-inherit allarch gtk-icon-cache
+DEPENDS = "icon-slicer-native"
 
-SRC_URI = "https://mirrors.dotsrc.org/mirrors/exherbo/111343-OpenZone-${PV}.tar.xz"
-SRC_URI[sha256sum] = "db6fa6d0798aceb56998ce81382fa2246c77911d56b3b06e6aadee4cf5b4816e"
+inherit allarch gtk-icon-cache
 
-S = "${UNPACKDIR}/OpenZone"
+SRC_URI = "git://github.com/ducakar/openzone-cursors.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "18d11a476536fbf4d69bb981c4af934a44c95fc4"
 
-do_compile() {
-}
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
+# The Makefile's install target moves the themes and keeps the build user's ownership
 do_install() {
     install -d ${D}${datadir}/icons
-    for theme in `find -name '*.tar.xz'`; do
-        tar -Jxf ${theme} -C ${D}${datadir}/icons
-    done
+    cp -R --no-preserve=ownership ${B}/OpenZone_* ${D}${datadir}/icons/
 }
 
 python populate_packages:prepend () {
