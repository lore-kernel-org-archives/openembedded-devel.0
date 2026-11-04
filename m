Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20039.1793826730676183170
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 13:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=qNQ9fNSU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261104211208fa75e439dd000207db-rnurtk@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261104211208fa75e439dd000207db
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 04 Nov 2026 22:12:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=t2Kd5lieODweGCSvZ2DUVCYBnDKXEQRLJCJuyNQk50s=;
 b=qNQ9fNSUJyegg87/0KCbcZ+QetCZSMXRrXKNA7QDlro/af7eFIPd+vZSFIRf0UTPS7T52d
 MkT/8FjfWdnBiMRYo84YK3dhbc5D00dIEcNfXFDe4QTJQPTbO/zqD9e1HjohTH4sd5l/zgoE
 hFO+VSzrfFWD8ppsQ4d4XdEELUIfxGrI+ud2TwasROfEFyk7lkDHwUEmdj5dzlH6IFrm4h4w
 dur8nU1a9kxm5x6TK34ZKGBFPfpeebAwaZpHX9lF8F6v3mHX5XgxVFWz2eKF9nfhSSFCe/QJ
 DGBRTehLXfHczoFPfshpq9F5Ygjkp97P0Y6AWpnamAPOtSH3dDYyrLzw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] libwebsockets: patch CVE-2026-114550
Date: Wed,  4 Nov 2026 22:11:50 +0100
Message-ID: <20261104211150.2291802-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 21:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131850
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libwebsockets/CVE-2026-114550.patch       | 31 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.3.10.bb     |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.patch
new file mode 100644
index 0000000000..950f46ba76
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
+@@ -1228,8 +1228,7 @@ _lws_mqtt_rx_parser(struct lws *wsi, lws_mqtt_parser_t *par,
+ 				 * Otherwise consume the properties before
+ 				 * completing the command
+ 				 */
+-				lws_mqtt_vbi_init(&par->vbit);
+-				par->state = LMQCPP_PUBACK_VH_PKT_ID;
++				par->state = LMQCPP_EAT_PROPERTIES_AND_COMPLETE;
+ 				break;
+ 			default:
+ 				lwsl_notice("%s: puback pr bad vbi\n", __func__);
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb
index 1aa1d1a369..78e96531ae 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3
           file://CVE-2026-10650.patch \
           file://CVE-2026-19773.patch \
           file://CVE-2026-78161.patch \
+          file://CVE-2026-114550.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
