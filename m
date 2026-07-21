Return-Path: <amery@apptly.co>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE639C44520
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 00:44:53 +0000 (UTC)
Received: from v5234.v57ae4e16.euw1.send.eu.mailgun.net (v5234.v57ae4e16.euw1.send.eu.mailgun.net [161.38.204.234])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12559.1784594687737499558
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 17:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@e.apptly.co header.s=mta header.b=Yg1WSEnc;
 spf=pass (domain: e.apptly.co, ip: 161.38.204.234, mailfrom: bounce+b4604d.b6604b-openembedded-devel=lists.openembedded.org@e.apptly.co)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=e.apptly.co; q=dns/txt; s=mta; t=1784594685; x=1784601885;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=lQwJantapy/Afgh97gb3wTRiru3eKajZQOtbyjwmD90=;
 b=Yg1WSEnc/U2mbOPmbTBtQV4+KzK8R+WSHgJxc0B0e6ijNjzwaYVHTn8XOF8RODPh6tXC08/3NdQaBvo1Oai7uclqkVy9lGX6ss5MWCrW51o7hNLW9J1UsuBcQCA9Ydnp2l3cDpguOo1YcedhdHtyDGHF4Qa34lCCSv0GEzB7DnM=
X-Mailgun-Sid: WyI4OTQ5NCIsIm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwiYjY2MDRiIl0=
Received: from localhost (unknown [51.179.224.164]) by
 58637948fab6624eb4adc178201f5a680be72420aae4e2c4982183e9d819ad2c with SMTP id
 6a5ec0fd8bbc123af5930f7a (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Tue, 21 Jul 2026 00:44:45 GMT
X-Mailgun-Sending-Ip: 161.38.204.234
Sender: amery=apptly.co@e.apptly.co
From: Alejandro Mery <amery@apptly.co>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com,
	Alejandro Mery <amery@apptly.co>
Subject: [meta-oe][PATCH] ltrace: fix PRIb64 length modifier on LP64 musl
Date: Tue, 21 Jul 2026 00:44:45 +0000
Message-ID: <20260721004445.3946753-1-amery@apptly.co>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 00:44:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128336

lens_default.c defines PRIb64 through a fallback that hardcodes
__PRI64_PREFIX as "ll". That is only correct where uint64_t is unsigned
long long (ILP32). On LP64 musl targets uint64_t is unsigned long, so the
resulting "%llb" conversion does not match the argument and do_compile
aborts under -Werror=format:

    lens_default.c:90:48: error: format '%llb' expects argument of type
    'long long unsigned int', but argument 3 has type 'uint64_t'
    {aka 'long unsigned int'}

glibc never reaches the fallback: it defines __PRI64_PREFIX itself,
wordsize aware, in <inttypes.h>. musl provides the same modifier there
under the name __PRI64 but not __PRI64_PREFIX, so the hardcoded "ll" is
used and is wrong on 64-bit. Reuse musl's __PRI64 when __PRI64_PREFIX is
absent, keeping "ll" as a last resort. glibc builds are unaffected: the
block is skipped entirely.

Signed-off-by: Alejandro Mery <amery@apptly.co>
---
 ...t-fix-PRIb64-length-modifier-on-musl.patch | 49 +++++++++++++++++++
 .../recipes-devtools/ltrace/ltrace_0.8.1.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch
new file mode 100644
index 0000000000..b644efff94
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch
@@ -0,0 +1,49 @@
+From 1a03dca3000616aa61d2c8137068706c9095a653 Mon Sep 17 00:00:00 2001
+From: Alejandro Mery <amery@geeks.cl>
+Date: Mon, 20 Jul 2026 20:13:56 +0000
+Subject: [PATCH] lens_default: fix PRIb64 length modifier on LP64 musl
+
+The fallback that defines PRIb64 hardcodes __PRI64_PREFIX as "ll", which
+is only correct where uint64_t is unsigned long long (ILP32). On LP64
+targets uint64_t is unsigned long, so the resulting "%llb" conversion
+does not match the argument and, with -Werror=format, aborts the build:
+
+    lens_default.c:90:48: error: format '%llb' expects argument of type
+    'long long unsigned int', but argument 3 has type 'uint64_t'
+    {aka 'long unsigned int'}
+
+glibc never reaches the fallback: it defines __PRI64_PREFIX itself,
+wordsize aware, in <inttypes.h>. musl provides the same modifier there
+under the name __PRI64 but not __PRI64_PREFIX, so the hardcoded "ll" is
+used and is wrong on 64-bit.
+
+Reuse musl's __PRI64 when __PRI64_PREFIX is absent, keeping the literal
+"ll" as a last resort for C libraries that expose neither.
+
+Upstream-Status: Submitted [https://gitlab.com/cespedes/ltrace/-/merge_requests/69]
+Signed-off-by: Alejandro Mery <amery@geeks.cl>
+---
+ lens_default.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lens_default.c b/lens_default.c
+index 0de6f37..28df811 100644
+--- a/lens_default.c
++++ b/lens_default.c
+@@ -64,8 +64,13 @@ READER(read_double, double)
+ 
+ #ifndef PRIb64  // Underlying format supported by bookworm glibc, but macros not exposed until 2.38
+ #ifndef __PRI64_PREFIX
++/* glibc exposes the 64-bit length modifier as __PRI64_PREFIX; musl as __PRI64 */
++#ifdef __PRI64
++#define __PRI64_PREFIX __PRI64
++#else
+ #define __PRI64_PREFIX "ll"
+ #endif
++#endif
+ #define PRIb64 __PRI64_PREFIX "b"
+ #endif
+ #define HANDLE_WIDTH(BITS)						\
+-- 
+2.47.3
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_0.8.1.bb b/meta-oe/recipes-devtools/ltrace/ltrace_0.8.1.bb
index 77bb61830b..aa377e2ec8 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_0.8.1.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_0.8.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://gitlab.com/cespedes/ltrace.git;protocol=https;branch=main;tag=$
            file://0001-proc-Make-PROC_PID_FILE-not-use-variable-length-arra.patch \
            file://0001-dwarf_prototypes-return-NULL-from-NEXT_SIBLING-on-er.patch \
            file://0001-trace-fix-1-bit-bitfield-assignments-for-clang-Wsing.patch \
+           file://0001-lens_default-fix-PRIb64-length-modifier-on-musl.patch \
            "
 SRC_URI:append:libc-musl = " file://add_ppc64le.patch"
 
-- 
2.47.3


