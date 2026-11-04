Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20026.1793826714431127249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 13:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=chF5obXR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202611042111529f7b1e3bb80002074e-w74le0@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202611042111529f7b1e3bb80002074e
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 04 Nov 2026 22:11:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/mqpo1wgBe7tdD6jMCuWMeCfbBNrxS8++Fe4tLeN0q4=;
 b=chF5obXR+Zbz4A+5sG+sTJcC4SJYTXxzKOCeIDgvbmpcIF2sJdDIzzBDbCZrMp/F9l271x
 QH8wzrIOyCzdVkZ34AM8WjSzuNOlDVKJ3ARZpP4QISdEDdMNYnzRcUoAJRIc/uYgPl/BVsfY
 D+/yLpC20TXP+UHZJ2GZ82dq5PdcMWYXcdOq08DdmRSb2fvpnu3iYxnR5Z3/qjkGEix+7HzH
 A/3NPwoT/pHa9JBxeix3Gkg2SIv8mp1g2qT31EXPrUZawytIK6TabFUzu8gEyvM8rxaddIWV
 p7i0vr9qb1qLjFZkaxeukec8UYfljYz7SixYK8C3JenlmNFlXNPHosdA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH] libwebsockets: patch CVE-2026-114550
Date: Wed,  4 Nov 2026 22:11:35 +0100
Message-ID: <20261104211135.2290706-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 21:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131849
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libwebsockets/CVE-2026-114550.patch       | 31 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.5.8.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch
new file mode 100644
index 0000000000..e398239bda
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch
@@ -0,0 +1,31 @@
+From c9e8e1834d7f13038c82963086b90e2ee9c5b44c Mon Sep 17 00:00:00 2001
+From: Andy Green <andy@warmcat.com>
+Date: Fri, 17 Jul 2026 05:02:06 +0100
+Subject: [PATCH] ZDI-CAN-31039: enter wrong state
+
+When handling LMQCPP_PUBACK_PROPERTIES_LEN_VBI/COMPLETED
+
+This vulnerability was discovered by:
+Anonymous working with TrendAI Zero Day Initiative
+
+CVE: CVE-2026-114550
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/c9e8e1834d7f13038c82963086b90e2ee9c5b44c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/roles/mqtt/mqtt.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/roles/mqtt/mqtt.c b/lib/roles/mqtt/mqtt.c
+index 85e984015..e743c3812 100644
+--- a/lib/roles/mqtt/mqtt.c
++++ b/lib/roles/mqtt/mqtt.c
+@@ -1238,8 +1238,7 @@ _lws_mqtt_rx_parser(struct lws *wsi, lws_mqtt_parser_t *par,
+ 				 * Otherwise consume the properties before
+ 				 * completing the command
+ 				 */
+-				lws_mqtt_vbi_init(&par->vbit);
+-				par->state = LMQCPP_PUBACK_VH_PKT_ID;
++				par->state = LMQCPP_EAT_PROPERTIES_AND_COMPLETE;
+ 				break;
+ 			default:
+ 				lwsl_notice("%s: puback pr bad vbi\n", __func__);
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index f0cc181ab7..8ce4ca2839 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://CVE-2026-10650.patch \
     file://CVE-2026-19773.patch \
     file://CVE-2026-78161.patch \
+    file://CVE-2026-114550.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
