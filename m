Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87B8F8E48F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 23:38:24 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29857.1776382702341800974
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 16:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=npEhXOYE;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c42a23c8eso95164c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 16:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776382701; x=1776987501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAYLzxvTZWWcR+0pns/NDxemgD/i/oi85MMGU0Bq3Cw=;
        b=npEhXOYE43gAb0iNYmK201mASKSq87xU4E/8EDSFhAbqt2Mr9YQxAF+kYlznxurucO
         ToP0L85W9JQxAPETkH57oM89iTBUgRpYkNk78kMRAcLbirjdtXBGQeL80ru8YykYKBha
         whDgOOrXo+WKQUJ2qcn5TJqnG9i6cH+fgq3zmAwzp6ofsRCj+/ig3ZoN1+Dm9AChWVt0
         Av8nYfHB0AjPRRB5WifwrwxZdDqGqws8c5QbHhFmbozNgtvucHT7RyeukSgwSFIePsDv
         7hYBNSUPIKdo0mx5t2zheuHj0drzuIrAqAd4AArdryYwG6NC30xlOnfO1/3/8KGWjLOS
         IU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776382701; x=1776987501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAYLzxvTZWWcR+0pns/NDxemgD/i/oi85MMGU0Bq3Cw=;
        b=Ae48FRXOZVhl53ZF6y/obnswU874voUWuva7UkayqAJ/9PUlHhodtGN/38bXbECgX/
         aURKTz8D5wgyApK2M7pY8EVCN7msKtHaoQvqKF0VJoclkLO5k16qdXakVL3q/APGyvru
         E4eFA3tqnRMkjdWs9Ox07qZUmg8tLT4kWOd9egP6GTc5v/8MPTtPE1CNRcRQlLkutEDC
         F4vPD9ZzWuZ8FnU2pStQ7wFduNx/Kl8vJ6YaMWF8QIgBoZcVmjHERI6jLH2v5Nq3i/dD
         GQu1ttIeFkOG78iMHqMAOW91Y73TRk7r582DxZ144PiQ3KLQrLfFKFPIXrUUE3PgF6jD
         tt0A==
X-Gm-Message-State: AOJu0YzhAh10Gh0sIXXjYTYjzguBTmaiNi8dTGW/RUZUKKjCpZwmMnY7
	auVqUF/z3wNcPYTomqbGPN7RUI/YSkM6FJT4fDRkXkdq+o6ckMYDUvMDxyBsPPZI
X-Gm-Gg: AeBDietmAP/tCNUrcg3OgcmNhYtY6JEDSd9EF8Q4QjcEkA8/exlH7Lpjxv/Ko3bZi4+
	jjlDk3EzBEEbXKcUP4VUM77MMBmE0uo/whLcOcSz+dajOCkiIr+Lo30jh6ynIpJwNwhfe193rwI
	eThK6oOPTSn0GlHEPFcFjrw8fSTXOgs9z0JtOl3lvXit6RbhrkT4jdj+0Y0Bj4Z1/WISXIs83GI
	sxk3arzuwD0JBWFvZQEi2SDrOpOhAQ+xU3FJDwergoG0MVHpBdcf1mRQqQmgkdz0pf4ILZrUuAW
	ekikk2oFnpxPBBLQGCLLaw7GjDgu7sIjknPI/B8XrG7UaKHgEFwsDxUyZZlIQwXmFMfJcwQXbSl
	s0yra4EWlMZhwnL5UJRpneW6RlmuIDY7dh9S2Ya3iU/bl07DYipGzrYxFpq/3ppAQXP6JnOxR9t
	aY1d21Ojb44ipsDKIPYmjbIXhc+f/OME3vPICNkuMjmpxTTc4COu/7uYvREdakotAMm0bIgwbxZ
	l70G6dmToaf51kiQgusgufZgMm3f+xJK0bam/Cefm93LMgJ9CxBzivGPAXW+xWWYvrQHJyUX3LD
	65g3HQzHePLtHwVcFmFo1UDW1U/CyeV/oAQRr/HG+Re5F57K7us=
X-Received: by 2002:a05:7300:dc88:b0:2be:171c:5048 with SMTP id 5a478bee46e88-2e4646cbd46mr194835eec.5.1776382701028;
        Thu, 16 Apr 2026 16:38:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e4c3f4fe72sm247993eec.3.2026.04.16.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 16:38:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/4] composefs: Fix incompatible pointer type qualifier mismatches
Date: Thu, 16 Apr 2026 16:38:15 -0700
Message-ID: <20260416233818.3790619-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 23:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126420

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-const-char-for-memchr-return-values.patch | 45 +++++++++++++++++++
 .../composefs/composefs_1.0.8.bb              |  5 ++-
 2 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/composefs/composefs/0001-mkcomposefs-use-const-char-for-memchr-return-values.patch

diff --git a/meta-oe/recipes-support/composefs/composefs/0001-mkcomposefs-use-const-char-for-memchr-return-values.patch b/meta-oe/recipes-support/composefs/composefs/0001-mkcomposefs-use-const-char-for-memchr-return-values.patch
new file mode 100644
index 0000000000..9c45d4fcc0
--- /dev/null
+++ b/meta-oe/recipes-support/composefs/composefs/0001-mkcomposefs-use-const-char-for-memchr-return-values.patch
@@ -0,0 +1,45 @@
+From 9d82303c7a3a780d481469cd8eafa016dcbff86f Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 16 Apr 2026 08:25:28 -0700
+Subject: [PATCH] mkcomposefs: use const char* for memchr return values
+
+memchr returns void*, which when assigned to char* discards the
+const qualifier of the input pointer. Cast to const char* to
+preserve const'ness.
+
+Fixes build with clang-22/glibc-2.43
+
+tools/mkcomposefs.c
+../sources/composefs-1.0.8/tools/mkcomposefs.c:413:8: error: initializing 'char *' with an expression of type 'const void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
+  413 |         char *embedded_nul_offset = memchr(line, 0, line_len);
+      |               ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~
+1 error generated.
+
+Upstream-Status: Submitted [https://github.com/composefs/composefs/pull/435]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tools/mkcomposefs.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/mkcomposefs.c b/tools/mkcomposefs.c
+index 13b505d..e14d8d0 100644
+--- a/tools/mkcomposefs.c
++++ b/tools/mkcomposefs.c
+@@ -63,7 +63,7 @@ static __attribute__((format(printf, 1, 2))) char *make_error(const char *fmt, .
+ static size_t split_at(const char **start, size_t *length, char split_char,
+ 		       bool *partial)
+ {
+-	char *end = memchr(*start, split_char, *length);
++	const char *end = (const char*)memchr(*start, split_char, *length);
+ 	if (end == NULL) {
+ 		size_t part_len = *length;
+ 		*start = *start + *length;
+@@ -410,7 +410,7 @@ static char *tree_from_dump_line(dump_info *info, const char *line,
+ 	 * We didn't document support for embedded NULs, and it only introduces
+ 	 * ambiguity in parsing, so let's just reject this early on.
+ 	 */
+-	char *embedded_nul_offset = memchr(line, 0, line_len);
++	const char *embedded_nul_offset = (const char*)memchr(line, 0, line_len);
+ 	if (embedded_nul_offset != NULL) {
+ 		size_t off = embedded_nul_offset - line;
+ 		return make_error("Invalid embedded NUL character at position %lld",
diff --git a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
index f2bae91f44..3450f9a339 100644
--- a/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
+++ b/meta-oe/recipes-support/composefs/composefs_1.0.8.bb
@@ -14,8 +14,9 @@ LIC_FILES_CHKSUM = "\
 "

 SRCREV = "858ce1b38e1534c2602eb431124b5dca706bc746"
-SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main"
-
+SRC_URI = "git://github.com/containers/composefs.git;protocol=https;branch=main;tag=v${PV} \
+           file://0001-mkcomposefs-use-const-char-for-memchr-return-values.patch \
+          "

 inherit meson


