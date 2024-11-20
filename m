Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDE9D711A5
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 14:54:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.15391.1732114447421851243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 06:54:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QulNdoDX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9345F20004;
	Wed, 20 Nov 2024 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732114445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tnoiZVEorVSRNE+2a6gcx1TX+YBqcyFeI/UyhqCoZE0=;
	b=QulNdoDXLgIiWqfjU13An3fWQ5+Uv8zHkHCcsR8KjZy/Fyh8HABf5bs7lvohyAzhA6c/Qg
	OhJdYGQotYL83fEKfhh/u26HcJQwOHFXQHTLi2ep/7Q2QsiBYuHrd+TiVghFjC/HVo9BFb
	lv9Hkrgzm0033kpSNlVBmySCAObqBXNKhHJSZsC4NU0xF6j5rqv8OJjw5jOH6PVagLlIrZ
	ycjO5RYSm7kGY4g++XhPE9ma6TvVo83qLWZrz0tCBFGJfEhy1rTpVdPXRsLIQHDlLDfQeU
	DbTfcSFH5cy0efsa1EPtuHP9z+9TObGIxAf6PlvP9nnWu22cr3JgRnGZY21xeQ==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-python][PATCH] python3-nltk: add a recipe for version 3.9.1
Date: Wed, 20 Nov 2024 15:54:03 +0100
Message-ID: <20241120145403.152292-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113927

From: Thomas Perrot <thomas.perrot@bootlin.com>

The Natural Language Toolkit (NLTK) is a Python package for
natural language processing.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python3-nltk/python3-nltk_3.9.1.bb        | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 8ee1cdc10152..262ab1b3d130 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -249,6 +249,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-netaddr \
     python3-netifaces \
     python3-networkx \
+    python3-nltk \
     python3-nmap \
     python3-nocasedict \
     python3-nocaselist \
diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.1.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.1.bb
new file mode 100644
index 000000000000..464e578ba97d
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Natural Language Toolkit"
+DESCRIPTION = "NLTK is a leading platform for building Python programs to work \
+               with human language data. It provides easy-to-use interfaces to \
+               over 50 corpora and lexical resources such as WordNet"
+HOMEPAGE = "https://www.nltk.org"
+BUGTRACKER = "https://github.com/nltk/nltk/issues"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+RDEPENDS:${PN} = "\
+    python3-click \
+    python3-joblib \
+    python3-tqdm \
+    python3-regex \
+    python3-xmlschema \
+"
+
+RRECOMMENDS:${PN} = "\
+    python3-numpy \
+"
+
+inherit setuptools3 pypi
+
+SRC_URI[sha256sum] = "87d127bd3de4bd89a4f81265e5fa59cb1b199b27440175370f7417d2bc7ae868"
-- 
2.47.0


