Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 400C5D711AE
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:04:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.15648.1732115038208884986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OfNQjDwe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10F8DE0007;
	Wed, 20 Nov 2024 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732115036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u8pIm6REzUMH9wwWxDZc4Q1OYsZQQwOOdtBAN8xUF6s=;
	b=OfNQjDwen6icu0CeN/P7/D48Oaa/Uu8hwsE4UJDaW/YeibC8edjD/K5OfJkNhb8FAGVByo
	TmTlbPd+7yQkI4mryDm0FqsJobmIp6wq2x5rES8RkNneZDKPm+L9fGMHp8gpyq3UPkBchv
	DpX0dyPpMrt8dbos3AtZ9HjE7atST+79xabIrpmJjxKmMvttgn29CDg8Lkyt6N/4WM6p4B
	qZx8/XpWSSEOvfPAaiEoP8pYdB6IxWw9fFNh7idIynhDXAOlXSwfAWDS5M5DL/WPFUiyrk
	kPGh35ge/x34jdyQ2ikqW5JmH6NU9LX6odadDJdYYBzWabQLNW+lCzHZO60uXA==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-python][PATCH] python3-rouge-score: add a recipe for version 0.1.2
Date: Wed, 20 Nov 2024 16:03:54 +0100
Message-ID: <20241120150354.161700-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 15:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113928

From: Thomas Perrot <thomas.perrot@bootlin.com>

This is a native python implementation of ROUGE, designed to
replicate results from the original perl package.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python3-rouge-score_0.1.2.bb              | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-rouge-score/python3-rouge-score_0.1.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 8ee1cdc10152..475e3453a689 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -380,6 +380,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-rlp \
     python3-robotframework \
     python3-robotframework-seriallibrary \
+    python3-rouge-score \
     python3-rsa \
     python3-ruamel-yaml \
     python3-scrypt \
diff --git a/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-score_0.1.2.bb b/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-score_0.1.2.bb
new file mode 100644
index 000000000000..722956a8e2f5
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-rouge-score/python3-rouge-score_0.1.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Pure python implementation of ROUGE-1.5.5."
+DESCRIPTION = "This is a native python implementation of ROUGE, designed to \
+               replicate results from the original perl package."
+HOMEPAGE = "https://github.com/google-research/google-research/tree/master/rouge"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=93;md5=e8937c2bcd7cf57f2d1bd5f1bf7efd23"
+
+RDEPENDS:${PN} = "\
+    python3-absl \
+    python3-nltk \
+    python3-numpy \
+    python3-six (>=1.14) \
+"
+
+inherit setuptools3 pypi
+
+PYPI_PACKAGE = "rouge_score"
+
+SRC_URI[sha256sum] = "c7d4da2683e68c9abf0135ef915d63a46643666f848e558a1b9f7ead17ff0f04"
-- 
2.47.0


