Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4444C433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 08:59:59 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13387.1636707598145635207
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 00:59:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:51144
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mlSPX-0002pO-0f; Fri, 12 Nov 2021 10:59:53 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [meta-python][PATCH] python3-yappi: Upgrade 1.3.2 -> 1.3.3
Date: Fri, 12 Nov 2021 10:59:47 +0200
Message-Id: <20211112085947.8401-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 08:59:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93916

Upgrade to release 1.3.3:

- Fix 3.10 support
- Fix wrong sorting key when tavg is selected

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-yappi/python310.patch      | 51 -------------------
 ...-yappi_1.3.2.bb => python3-yappi_1.3.3.bb} |  3 +-
 2 files changed, 1 insertion(+), 53 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-yappi/python310.patch
 rename meta-python/recipes-devtools/python/{python3-yappi_1.3.2.bb => python3-yappi_1.3.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi/python310.patch b/meta-python/recipes-devtools/python/python3-yappi/python310.patch
deleted file mode 100644
index 6dd58ae96..000000000
--- a/meta-python/recipes-devtools/python/python3-yappi/python310.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From d40bc0e8230dd35e05222f5761e3d7f7a75fd46e Mon Sep 17 00:00:00 2001
-From: Alexander Shadchin <shadchin@yandex-team.ru>
-Date: Tue, 1 Jun 2021 02:31:12 +0300
-Subject: [PATCH] Adapt to Python 3.10 beta 1
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- yappi/_yappi.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/yappi/_yappi.c b/yappi/_yappi.c
-index 1721280..343130d 100644
---- a/yappi/_yappi.c
-+++ b/yappi/_yappi.c
-@@ -1258,7 +1258,11 @@ _resume_greenlet_ctx(_ctx *ctx)
- static _ctx *
- _bootstrap_thread(PyThreadState *ts)
- {
-+#if PY_VERSION_HEX < 0x030a00b1
-     ts->use_tracing = 1;
-+#else
-+    ts->cframe->use_tracing = 1;
-+#endif
-     ts->c_profilefunc = _yapp_callback;
-     return NULL;
- }
-@@ -1289,7 +1293,11 @@ _profile_thread(PyThreadState *ts)
-         ctx = (_ctx *)it->val;
-     }
-     
-+#if PY_VERSION_HEX < 0x030a00b1
-     ts->use_tracing = 1;
-+#else
-+    ts->cframe->use_tracing = 1;
-+#endif
-     ts->c_profilefunc = _yapp_callback;
-     ctx->id = ctx_id;
-     ctx->tid = ts->thread_id;
-@@ -1306,7 +1314,11 @@ _profile_thread(PyThreadState *ts)
- static _ctx*
- _unprofile_thread(PyThreadState *ts)
- {
-+#if PY_VERSION_HEX < 0x030a00b1
-     ts->use_tracing = 0;
-+#else
-+    ts->cframe->use_tracing = 0;
-+#endif
-     ts->c_profilefunc = NULL;
- 
-     return NULL; //dummy return for enum_threads() func. prototype
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb b/meta-python/recipes-devtools/python/python3-yappi_1.3.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.3.3.bb
index 7cfc84e75..45a5f058a 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.3.3.bb
@@ -4,12 +4,11 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[sha256sum] = "a51d3e6e5563cc74b5bb82ed6e7bd44a9c1a7eae3d97e4d52e9465edb3a8da8d"
+SRC_URI[sha256sum] = "855890cd9a90d833dd2df632d648de8ccd0a4c3131f1edc8abd004db0625b5e8"
 
 SRC_URI += " \
     file://run-ptest \
     file://0001-Fix-imports-for-ptests.patch \
-    file://python310.patch \
 "
 
 inherit pypi setuptools3 ptest
-- 
2.20.1


