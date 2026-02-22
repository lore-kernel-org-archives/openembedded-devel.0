Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CECC636C2
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 22:00:31 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22919.1771797627061112182
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Feb 2026 14:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LL5BB2mj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260222220023ca358055de000207dc-kbzayu@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260222220023ca358055de000207dc
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 22 Feb 2026 23:00:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qnj7z3iwmj7L5Z1Uo6lXBsjHycqoxf8K1zwA83py9F4=;
 b=LL5BB2mjfhq4K35oBdi5I2MzpY5UkpG4VSb8kiOYsOIo5l7b0TgO2vJXfHvVqMYh7S4p5Q
 JtC3TfaZK3/gGZGopeXexkhgnjFOn5vwJrkH06hc/L5sTVGpB56CQnjm66PMtQrvHG5mkB7F
 l1tdRx89NqvTx/tviXYGMxwf+7y9cyW1OkCD3QTZ4lhXJqN8YTfVGgGgRw0IlHwJ7SjJxAD7
 cs3fZz+jhb4w89a6IxRmCNTcRMZQkLdIWHDfSCMezhASxKdOcoKc1serDBi6WMVLaPxXealr
 afyOYaOMbbr5Q47MP9V6GFPFeboD7d8AklDqYUPDnd9B2as6mJe9YQdA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][scarthgap][PATCH] fcgi: add follow-up patch for CVE-2025-23016
Date: Sun, 22 Feb 2026 23:00:17 +0100
Message-Id: <20260222220017.3828181-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 22:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124533

From: Peter Marko <peter.marko@siemens.com>

New release [1] added additional fir for this CVE.

[1] https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.7

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...25-23016.patch => CVE-2025-23016-01.patch} |  0
 .../fcgi/fcgi/CVE-2025-23016-02.patch         | 83 +++++++++++++++++++
 .../recipes-support/fcgi/fcgi_git.bb          |  3 +-
 3 files changed, 85 insertions(+), 1 deletion(-)
 rename meta-webserver/recipes-support/fcgi/fcgi/{CVE-2025-23016.patch => CVE-2025-23016-01.patch} (100%)
 create mode 100644 meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-02.patch

diff --git a/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch b/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-01.patch
similarity index 100%
rename from meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016.patch
rename to meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-01.patch
diff --git a/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-02.patch b/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-02.patch
new file mode 100644
index 0000000000..1f855db3e0
--- /dev/null
+++ b/meta-webserver/recipes-support/fcgi/fcgi/CVE-2025-23016-02.patch
@@ -0,0 +1,83 @@
+From 7c476394e799f39f749d7a7a50f62e5d3ec8db61 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Mon, 19 May 2025 13:49:32 +0200
+Subject: [PATCH] Fix size_t overflow in Malloc() argument in ReadParams()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+There were still two issues after commit
+b0eabcaf4d4f371514891a52115c746815c2ff15 (Update fcgiapp.c, Fixing an
+integer overflow (CVE-2025-23016)):
+
+* Signed int overflow in "nameLen + valueLen + 2" expression.
+
+* Sizes of size_t and int types are in general unrelated.
+
+This fix resolves both of the issues.
+
+Related to CVE-2025-23016.
+Resolve #67.
+
+Signed-off-by: Petr Písař <ppisar@redhat.com>
+
+CVE: CVE-2025-23016
+Upstream-Status: Backport [https://github.com/FastCGI-Archives/fcgi2/commit/7c476394e799f39f749d7a7a50f62e5d3ec8db61]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libfcgi/fcgiapp.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/libfcgi/fcgiapp.c b/libfcgi/fcgiapp.c
+index 99c3630..0cd3dd1 100644
+--- a/libfcgi/fcgiapp.c
++++ b/libfcgi/fcgiapp.c
+@@ -18,6 +18,7 @@
+ #include <memory.h>     /* for memchr() */
+ #include <stdarg.h>
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <sys/types.h>
+@@ -1158,6 +1159,7 @@ char *FCGX_GetParam(const char *name, FCGX_ParamArray envp)
+ static int ReadParams(Params *paramsPtr, FCGX_Stream *stream)
+ {
+     int nameLen, valueLen;
++    size_t totalLen;
+     unsigned char lenBuff[3];
+     char *nameValue;
+ 
+@@ -1173,7 +1175,7 @@ static int ReadParams(Params *paramsPtr, FCGX_Stream *stream)
+ 	    }
+             nameLen = ((nameLen & 0x7f) << 24) + (lenBuff[0] << 16)
+                     + (lenBuff[1] << 8) + lenBuff[2];
+-	    if (nameLen >= INT_MAX) {
++	    if (nameLen >= INT_MAX || nameLen >= SIZE_MAX) {
+                 SetError(stream, FCGX_PARAMS_ERROR);
+                 return -1;
+ 	    }
+@@ -1189,16 +1191,21 @@ static int ReadParams(Params *paramsPtr, FCGX_Stream *stream)
+ 	    }
+             valueLen = ((valueLen & 0x7f) << 24) + (lenBuff[0] << 16)
+                     + (lenBuff[1] << 8) + lenBuff[2];
+-	    if (valueLen >= INT_MAX) {
++	    if (valueLen >= INT_MAX || valueLen >= SIZE_MAX) {
+                 SetError(stream, FCGX_PARAMS_ERROR);
+                 return -1;
+ 	    }
+         }
++        totalLen = (size_t)nameLen + (size_t)valueLen + 2u;
++        if (totalLen < (size_t)nameLen || totalLen < (size_t)valueLen) {
++            SetError(stream, FCGX_PARAMS_ERROR);
++            return -1;
++        }
+         /*
+          * nameLen and valueLen are now valid; read the name and value
+          * from stream and construct a standard environment entry.
+          */
+-        nameValue = (char *)Malloc(nameLen + valueLen + 2);
++        nameValue = (char *)Malloc(totalLen);
+         if(FCGX_GetStr(nameValue, nameLen, stream) != nameLen) {
+             SetError(stream, FCGX_PARAMS_ERROR);
+             free(nameValue);
diff --git a/meta-webserver/recipes-support/fcgi/fcgi_git.bb b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
index d327d435d5..b83f8a872d 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_git.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_git.bb
@@ -7,7 +7,8 @@ SRCREV = "382aa2b0d53a87c27f2f647dfaf670375ba0b85f"
 PV = "2.4.2"
 
 SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master \
-           file://CVE-2025-23016.patch \
+           file://CVE-2025-23016-01.patch \
+           file://CVE-2025-23016-02.patch \
           "
 
 S = "${WORKDIR}/git"

