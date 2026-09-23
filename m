Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E1AC9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 12:53:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6326.1790167985594644104
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 05:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Risz7x4z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED7301A0FE4;
	Wed, 23 Sep 2026 12:53:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBDFD60580;
	Wed, 23 Sep 2026 12:53:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 885891032885A;
	Wed, 23 Sep 2026 14:53:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790167983; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vhS3Se8W6WiTywl747Be2zJZgWn7qzQ5Y9euFqdjNlc=;
	b=Risz7x4zJYA7Sgt09R7jAFVdHyDKwLswbV4F8/l5WXH5H+n3x0GQnxvS1AJCEMYaUOZX+0
	kmSNgNr9JfopLTGPF3+CWxJwh+DFoUSpZ8nr5ZbK9HWns5+zWpDyu3m1WRgdMW/kQDPxjZ
	xRqUnkI6bMWhrT1IwrFtwcjIZcc8h8TqXVHImgJFCvKwVqpO2Tn1WGPdWqGYydUDfykWwz
	GLCcCN6f+2jnxPRyRrcuNFNESKlq2LDdun5eRrMYh7cqegDUBUixb804kHZlmy3wjHYifK
	Xwb5Y/lAQoBXiK6bdSOxo54HjZ2MSeOIBUFNASxLEPNvvxMVOdA/mNPYT/dzZg==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 23 Sep 2026 14:52:41 +0200
Subject: [PATCH 2/2] libwebsockets: fix CVE-2026-19773
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-update-libwebsockets-fix-cve-2026-19773-v1-2-33878fcb7190@bootlin.com>
References: <20260923-update-libwebsockets-fix-cve-2026-19773-v1-0-33878fcb7190@bootlin.com>
In-Reply-To: <20260923-update-libwebsockets-fix-cve-2026-19773-v1-0-33878fcb7190@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 12:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130233

Backport the fix from v5 branch.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../libwebsockets/CVE-2026-19773.patch             | 32 ++++++++++++++++++++++
 .../libwebsockets/libwebsockets_4.3.10.bb          |  1 +
 2 files changed, 33 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch
new file mode 100644
index 000000000000..fe814201ea81
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch
@@ -0,0 +1,32 @@
+From 7a57bcaa5a6ef336d92759676b46d04e5a79e63d Mon Sep 17 00:00:00 2001
+From: Andy Green <andy@warmcat.com>
+Date: Fri, 3 Jul 2026 18:43:25 +0100
+Subject: [PATCH] zdi-can-31036: h2 bounds check on server
+
+This vulnerability was discovered by:
+Maher Azzouzi working with TrendAI Zero Day Initiative
+
+CVE: CVE-2026-19773
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/824151862f37bc72f46d9a3e01d5b9408d313a0b]
+
+Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
+---
+ lib/roles/h2/hpack.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/roles/h2/hpack.c b/lib/roles/h2/hpack.c
+index f6aefd34ded3..e6d8d06c1d8f 100644
+--- a/lib/roles/h2/hpack.c
++++ b/lib/roles/h2/hpack.c
+@@ -274,6 +274,9 @@ static int lws_frag_append(struct lws *wsi, unsigned char c)
+ {
+	struct allocated_headers *ah = wsi->http.ah;
+
++	if ((unsigned int)ah->pos >= wsi->a.context->max_http_header_data)
++		return 1;
++
+	ah->data[ah->pos++] = (char)c;
+	ah->frags[ah->nfrag].len++;
+
+--
+2.55.0
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb
index 559253c9613b..57db93bc1d9f 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.10.bb
@@ -10,6 +10,7 @@ S = "${WORKDIR}/git"
 SRCREV = "2288cf200bc1c28680765bd4f07e437356106c2d"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.3-stable \
           file://CVE-2026-10650.patch \
+          file://CVE-2026-19773.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

-- 
2.55.0


