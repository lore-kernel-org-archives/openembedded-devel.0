Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D712CD98E4
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 12:27:53 +0000 (UTC)
Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13843.1781698017577094640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 05:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=WqStNL14;
 spf=pass (domain: myspectrum.nl, ip: 149.210.149.72, mailfrom: jeroen@myspectrum.nl)
Received: from submission14.mail.transip.nl (unknown [10.103.8.165])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4ggMzL6W1HzRxDr;
	Wed, 17 Jun 2026 14:06:54 +0200 (CEST)
Received: from yellow.myspectrum.nl (unknown [IPv6:2a01:7c8:bb0c:45:5054:ff:fe01:854])
	by submission14.mail.transip.nl (Postfix) with ESMTPSA id 4ggMzK15XGz3RgQtv;
	Wed, 17 Jun 2026 14:06:53 +0200 (CEST)
Received: from yellow.myspectrum.nl (212-204-162-136.cable.dynamic.v4.ziggo.nl [212.204.162.136])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id C73072017F;
	Wed, 17 Jun 2026 12:06:51 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Wed, 17 Jun 2026 14:06:50 +0200
From: "Jeroen Hofstee" <jeroen@myspectrum.nl>
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>,
	Jason Schonberg <schonm@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH] nodejs: native: avoid target-specific signatures
Date: Wed, 17 Jun 2026 14:06:40 +0200
Message-ID: <20260617120644.2169686-1-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission14.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1781698013; h=from:subject:to:cc:date:
 mime-version; bh=jrxEhcBvMSxzj+ZkTDPb/bGIKv4agfV7Uqxv9sMJceo=;
 b=WqStNL14zwy2utzkGw/tLrFdlTtGczP3Logw1r2iSXh/7o3e2D/WZpoMqc1bR0bQ89or9D
 15yRVT88UbkX4ZIYlIR2n+aHYXHgkuhqfIMBc2XJcmbh5Uc7JT3vJ29ZWrY9b6VWQ/lWXe
 FY2jFAtRoTzwN8kdEXhcAFumEBD+kL3pGWCHg6cWW+u9TQduEbuMCweHfcKvgyUp+nAjIQ
 qFeM2dwyGo5yOAhH+mjZ0H6hQEKQGs2d3AnKuLtG+kfNOJ8HM4Mrau2NdDnKOjPBC2CJn6
 HMOU9LD9UfZRJn0TLvZo6QrLAkjjfPGnXOe0hHVPtPxg+cKSqNlKspwB1QtlLw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 12:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127658

From: Jeroen Hofstee <jhofstee@victronenergy.com>

The do_create_v8_qemu_wrapper function depends on target information,
which ends up in the task signature, but the qemu wrapper isn't needed
for native builds. This causes unnecessary rebuilds of nodejs-native.

Delete the task for nodejs-native and don't install the wrapper script
for it.

This issue was previously addressed by b2a950a ("nodejs: inherit qemu
class conditionally"), which was later reverted. This patch addresses
it by removing the unused task from native builds instead of inheriting
qemu conditionally.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
To reproduce:

Before the patch:
Start with a clean TMPDIR.
Build nodejs-native for one target architecture.
Build nodejs-native for a different target architecture.
nodejs-native will be rebuilt or restaged.

After the patch:
Building for a different target architecture no longer triggers
a rebuild or restaging of nodejs-native because the native build
is no longer target-specific.
---
 meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_24.16.0.bb
index ff40a09656..89f32f2063 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
@@ -150,9 +150,12 @@ do_configure () {
                ${PACKAGECONFIG_CONFARGS}
 }
=20
+do_compile:prepend:class-target() {
+    install -D ${B}/v8-qemu-wrapper.sh ${B}/out/Release/v8-qemu-wrapper.=
sh
+}
+
 do_compile () {
     install -D ${RECIPE_SYSROOT_NATIVE}/etc/ssl/openssl.cnf ${B}/deps/op=
enssl/nodejs-openssl.cnf
-    install -D ${B}/v8-qemu-wrapper.sh ${B}/out/Release/v8-qemu-wrapper.=
sh
     oe_runmake BUILDTYPE=3DRelease
 }
=20
@@ -199,6 +202,13 @@ python set_gyp_variables () {
 }
=20
 python __anonymous () {
+    # do_create_v8_qemu_wrapper is not needed for the native build, so m=
ake sure it
+    # gets deleted otherwise target info ends up in its signature making=
 the native
+    # build target specific.
+    if bb.data.inherits_class('native', d):
+        bb.build.deltask('do_create_v8_qemu_wrapper', d)
+        return
+
     # 32 bit target and 64 bit host (x86-64 or aarch64) have different b=
it width
     if d.getVar("SITEINFO_BITS") =3D=3D "32" and "64" in d.getVar("BUILD=
_ARCH"):
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
--=20
2.43.0


