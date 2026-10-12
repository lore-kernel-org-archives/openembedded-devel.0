Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163D1CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:21:42 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3850.1791836499264707289
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 13:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Rd5DoRkH;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261012202135d81c8b451200020799-qv01wb@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261012202135d81c8b451200020799
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 12 Oct 2026 22:21:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=PJgPNLzruRnKvxZ8L0JKzJYz8KLst/ngPMx3+rrIrEE=;
 b=Rd5DoRkHmrqbo5GcvQPHGfP+zi1dlX9e8w901vYah52zbaYGATQPewci77AXDbxPzj6lzd
 +66LMMitGSl1kPj3HzNFcN7SiTiOCWMNf6zGY9WJmmFkFKQNVyJ+662wCkXFRPHjxO1/3+uY
 +w6WKicM6pAEeQY7aRgViGnTca3JwIW0aDFdHer/Hxv9y1r65C5Kk449PBj/VnjhO6ew+2l2
 Lkqsd78hgD+XG9ItJLoj57+cduU9dw34N7UmMxNxExdGv+KAgSicBgTLZXlevCeAo+aeF7tG
 1xznVbjntNaOe2O8kTj3xGRwfqrv1wrabU4fzGao2bcEJuDGbS3IhGKw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][blacksail][PATCH 1/2] libwebsockets: patch CVE-2026-19773
Date: Mon, 12 Oct 2026 22:21:25 +0200
Message-ID: <20261012202126.1721004-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 20:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130767

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-19773

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(From meta-oe rev: b8399ae07ae1958eced847a3d5e8a4227c2e3aa2)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libwebsockets/CVE-2026-19773.patch        | 31 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.5.8.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch
new file mode 100644
index 0000000000..74908c5437
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch
@@ -0,0 +1,31 @@
+From 998a9af40aa6c2ddcb91c662d6585ea80ab52f85 Mon Sep 17 00:00:00 2001
+From: Andy Green <andy@warmcat.com>
+Date: Fri, 3 Jul 2026 18:43:25 +0100
+Subject: [PATCH] zdi-can-31036: h2 bounds check on server
+
+This vulnerability was discovered by:
+Maher Azzouzi working with TrendAI Zero Day Initiative
+
+(cherry picked from commit 824151862f37bc72f46d9a3e01d5b9408d313a0b)
+
+CVE: CVE-2026-19773
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/824151862f37bc72f46d9a3e01d5b9408d313a0b]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/roles/h2/hpack.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/roles/h2/hpack.c b/lib/roles/h2/hpack.c
+index 1025faa6f..863eb88c9 100644
+--- a/lib/roles/h2/hpack.c
++++ b/lib/roles/h2/hpack.c
+@@ -274,6 +274,9 @@ static int lws_frag_append(struct lws *wsi, unsigned char c)
+ {
+ 	struct allocated_headers *ah = wsi->http.ah;
+ 
++	if ((unsigned int)ah->pos >= wsi->a.context->max_http_header_data)
++		return 1;
++
+ 	ah->data[ah->pos++] = (char)c;
+ 	ah->frags[ah->nfrag].len++;
+ 
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index 005729dcac..11da4b299c 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -10,6 +10,7 @@ SRCREV = "fbb0baf6af9c4324f0f1591734c78b0089b599d4"
 SRC_URI = " \
     git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV} \
     file://CVE-2026-10650.patch \
+    file://CVE-2026-19773.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

