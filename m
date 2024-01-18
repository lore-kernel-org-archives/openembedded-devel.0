Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC5EC47DAF
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 20:37:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4269.1705610236132122034
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 12:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 624171042
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 12:38:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A27F3F766
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 12:37:14 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] mozjs-115: fix the build on ARMv5
Date: Thu, 18 Jan 2024 20:37:12 +0000
Message-Id: <20240118203712.3016674-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 20:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108352

From: Ross Burton <ross.burton@arm.com>

The JIT uses the ISB instruction, but being a multi-core barrier
instruction this doesn't exist on the single-core ARMv5 ISA. Check the
ISA level before using ISB.

Also set [cleandirs] for ${B} to ensure clean builds are done when
reconfiguring.

[ YOCTO #14572 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../mozjs/mozjs-115/armv5.patch               | 19 +++++++++++++++++++
 .../mozjs/mozjs-115_115.2.0.bb                |  2 ++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/armv5.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/armv5.patch b/meta-=
oe/recipes-extended/mozjs/mozjs-115/armv5.patch
new file mode 100644
index 0000000000..4c45955bca
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/armv5.patch
@@ -0,0 +1,19 @@
+The ISB instruction isn't available in ARMv5 or v6, so
+guard it's use to fix the build on qemuarmv5.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/js/src/jit/arm/Architecture-arm.cpp b/js/src/jit/arm/Archit=
ecture-arm.cpp
+--- a/js/src/jit/arm/Architecture-arm.cpp	2024-01-18 17:31:32.078718197 =
+0000
++++ b/js/src/jit/arm/Architecture-arm.cpp	2024-01-18 18:00:16.738921445 =
+0000
+@@ -529,7 +529,9 @@
+ void FlushExecutionContext() {
+ #ifndef JS_SIMULATOR_ARM
++#if __ARM_ARCH >=3D 7
+   // Ensure that any instructions already in the pipeline are discarded=
 and
+   // reloaded from the icache.
+   asm volatile("isb\n" : : : "memory");
++#endif
+ #else
+   // We assume the icache flushing routines on other platforms take car=
e of this
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-115_115.2.0.bb
index e1a547c339..84db3cd3c2 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/re=
leases/${PV}esr/source/fire
            file://musl-disable-stackwalk.patch \
            file://0001-add-arm-to-list-of-mozinline.patch \
            file://py3.12.patch \
+           file://armv5.patch \
            "
 SRC_URI[sha256sum] =3D "51534dd2a158d955a2cb67cc1308f100f6c9def0788713ed=
8b4d743f3ad72457"
=20
@@ -75,6 +76,7 @@ do_configure() {
         ${JIT} \
         ${ICU}
 }
+do_configure[cleandirs] +=3D "${B}"
=20
 do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
--=20
2.34.1


