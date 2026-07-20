Return-Path: <amery@apptly.co>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C02FC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 22:52:21 +0000 (UTC)
Received: from v523.v5ed9ac7d.euw1.send.eu.mailgun.net (v523.v5ed9ac7d.euw1.send.eu.mailgun.net [141.193.32.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10459.1784587931820170213
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 15:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@e.apptly.co header.s=mta header.b=JHKWC3Gq;
 spf=pass (domain: e.apptly.co, ip: 141.193.32.23, mailfrom: bounce+b4604d.b6604b-openembedded-devel=lists.openembedded.org@e.apptly.co)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=e.apptly.co; q=dns/txt; s=mta; t=1784587929; x=1784595129;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=lQwJantapy/Afgh97gb3wTRiru3eKajZQOtbyjwmD90=;
 b=JHKWC3GqK6GhvK05/KM5pH3H6Mu6Xaf+Q8tjGNDjcSO5ME4PQ9fzLiVrKFs6dS6pVWVtzypGqvwDcoCY3LxMrEsg2CF2bovYrwCJctmRyMp+G/TUtqZIbmsYdTeYby3cVPgTmqzq3m7I7+1sCXSAWBv2cHXO7xWwWi1BfsIGmrg=
X-Mailgun-Sid: WyI4OTQ5NCIsIm9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwiYjY2MDRiIl0=
Received: from localhost (unknown [51.179.224.164]) by
 57d00acbdea48da1018033e4e1c21bac7bc40d5753215abfcd9992e8ee833e10 with SMTP id
 6a5ea6990a815ede3ee1fa58 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Mon, 20 Jul 2026 22:52:09 GMT
X-Mailgun-Sending-Ip: 141.193.32.23
Sender: amery=apptly.co@e.apptly.co
From: Alejandro Mery <amery@apptly.co>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com,
	Alejandro Mery <amery@apptly.co>
Subject: [meta-oe][wrynose][PATCH] ltrace: fix PRIb64 length modifier on LP64 musl
Date: Mon, 20 Jul 2026 22:52:09 +0000
Message-ID: <20260720225209.3736953-1-amery@apptly.co>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 22:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128301

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


