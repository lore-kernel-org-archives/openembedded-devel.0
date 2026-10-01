Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABF0CA5FD6
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 16:40:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15798.1790872815451372696
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 09:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=QG26SyUy;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EE34497
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 09:40:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6CC7D3F85F
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790872814; bh=ZlXAb4lgjZh2QVnrM3xEgDhDNTBCZ2EfUmYAjZYfxR4=;
	h=From:To:Subject:Date:From;
	b=QG26SyUyWIWdZS9zdgpcPZgvslEfwkbgm0PXz9AJpw1SRQi2LgADhoTb44yLLndLR
	 4wdOGEttbXUao/WtP5e1YhnU5fnVDlxOjAoOUv63fGId+Glm1rLFLDQTudlfWWGEP2
	 7ddF//xYNjR/ZwaXHph47f6C4AGEJk/IclWPTeko=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] ibus: no need for -native recipe
Date: Thu,  1 Oct 2026 17:40:02 +0100
Message-ID: <20261001164003.2854547-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 16:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130598

We were building ibus-native for the unicode-parser tool that is needed
at build time. However, ibus can correctly build that (and other tools)
in cross-compiled environments since 1.5.29[1], so there's no need to
have a native recipe anymore.

[1] ibus 18f0d9f5 ("configure: Fix cross compiling")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/ibus/ibus-native.bb       | 35 -------------------
 meta-gnome/recipes-support/ibus/ibus.bb       |  6 ----
 2 files changed, 41 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus-native.bb

diff --git a/meta-gnome/recipes-support/ibus/ibus-native.bb b/meta-gnome/=
recipes-support/ibus/ibus-native.bb
deleted file mode 100644
index 7ba9b57617..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus-native.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require ${BPN}.inc
-
-inherit native
-
-DEPENDS +=3D " \
-    glib-2.0-native \
-    dbus-native \
-    iso-codes \
-"
-
-PACKAGECONFIG =3D ""
-
-# for allarch iso-codes
-EXTRA_NATIVE_PKGCONFIG_PATH =3D ":${RECIPE_SYSROOT}${datadir_native}/pkg=
config"
-# for allarch unicode-ucd - just to make configure happy
-EXTRA_OECONF +=3D "--with-ucd-dir=3D${RECIPE_SYSROOT}${datadir_native}/u=
nicode/ucd"
-
-do_compile() {
-    cd src
-    # seems by moving to src we break dependency tracking so build what'=
s
-    # necessary step by step
-    oe_runmake ibusenumtypes.h
-    oe_runmake ibusmarshalers.h
-    oe_runmake ibusresources.h
-    oe_runmake ibusenumtypes.c
-    oe_runmake unicode-parser
-}
-
-do_install() {
-    install -d ${D}/${libdir}
-    install -m 755 ${S}/src/.libs/libibus-*.so* ${D}/${libdir}
-
-    install -d ${D}/${bindir}
-    install -m 755 ${S}/src/.libs/unicode-parser ${D}/${bindir}
-}
diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes=
-support/ibus/ibus.bb
index 08a7804ea9..99056a83d4 100644
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -1,7 +1,6 @@
 require ${BPN}.inc
=20
 DEPENDS +=3D " \
-    ${BPN}-native \
     glib-2.0-native \
     glib-2.0 \
     dbus \
@@ -26,11 +25,6 @@ do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
 }
=20
-do_configure:prepend() {
-    # run native unicode-parser
-    sed -i 's:$(builddir)/unicode-parser:unicode-parser:g' ${S}/src/Make=
file.am
-}
-
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${datadir}/GConf \
--=20
2.43.0


