Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FB0C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:22:16 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web09.1441.1646086935615148829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=X/nZFq45;
 spf=pass (domain: cold-front.org, ip: 66.111.4.28,
 mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E2BF05C028E;
	Mon, 28 Feb 2022 17:22:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 28 Feb 2022 17:22:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=bl+nnpDy0XCKzEfAJpxqW3YaaAh893uQtr+
	4mTL5ZrU=; b=X/nZFq45nrr/3FIe5cJIHZvgZWUSBic44aeOilgGZRBis1ysugN
	6KxUSEQBL+NcQ2CNqZrQSXFIzNPfbLYhf+3NdWvIAY+ZIplH2Oa3t8SS78hRtkry
	sHLcxfziRB/qUD+72pTe8yI8llL2PaX4O5mUDB8K/bev1QOI2v9nQPcw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=bl+nnpDy0XCKzEfAJpxqW3YaaAh89
	3uQtr+4mTL5ZrU=; b=HCaHMcMyy8WIycRQ21Ua39H9UK0S9g9XOVa3DGwYQLjgG
	OvOre3YcFf/hcT7l8MJpA/6NQ5J8yZE/5sHxsztfhzCjh8QvcKSRTkgrC4YDrLK/
	mS2zuzo6bwVB2Bi/6dTpZEEZEM8CTplehnyvZ5ibURBH74EiJSpZ0TwGywIAwIE7
	NNZQ5Lf/VM7tOkAfRGiDlCbgc8dedqB36evY/s0bcDrK1SnZfgu0ephFY+x1cQWo
	XsRK9kWvxPfi1llyle8miHt+D8xSJ1twWf6SN3GC9ALBzHrD+gb+hptkLnsWyXQM
	d2kSWlSD5RnEKE/cAl/b0VqXnQhsXCwozLrhsALfA==
X-ME-Sender: <xms:FksdYgUbARRxUroo2EuxVqfQhyF-jmuj0jOYviib5lNMJcrMRfY78Q>
    <xme:FksdYkkbUQnWnykbnjFcb8jtSUvkj6Q4ieXLqMJnf47AlO7XYVByIJgoYuruqTmSj
    css5e40riVev0NF4A>
X-ME-Received: 
 <xmr:FksdYkaMuEJ11msvkq5YZ3jA0Ak-pQpT5PtEfWKCF6JzjC5025HIzSLe9aqmGpZnecyewWR_PhN0CxtBEOkRZr9cwYDW6KTg6nk1xf2aQw44>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnheptedtgefhhfdtie
    dvhfekieffkeelheettefgieeuhfeuffffheevveeuhfeigedtnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:FksdYvUJBoDI607GITJMMPLhGWusY5eqMliQX7U56-IQ8e5d3RXt9A>
    <xmx:FksdYqkfpM9oRuw31YW1SoJmuvP9DeGdk1gs7VADXXgi9lP2voHHGA>
    <xmx:FksdYkftBRzG-LjObLesguu5lioMb1FoXWttcDEEjysS6er6dUVH6Q>
    <xmx:FksdYhusVCEFZFur16L_R9Y7mApx9qCGThlGLuULnJQLQMzGBKy7Ew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 17:22:14 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-configobj: drop recipe
Date: Mon, 28 Feb 2022 17:22:06 -0500
Message-Id: <20220228222206.25716-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:22:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95601

The last official release, 5.0.6 is from 2014 and does not build with
bdist_wheel.  The upstream repository does appear active but it's
unclear if anyone has the ability/motivation to tag a new release or
upload it to PyPI.  If you depend upon this recipe, please work with
upstream to tag a PEP-517 compliant release.

https://github.com/DiffSK/configobj/issues/160
https://github.com/DiffSK/configobj/issues/197
https://github.com/DiffSK/configobj/issues/204

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../packagegroups/packagegroup-meta-python.bb            | 1 -
 .../recipes-devtools/python/python3-configobj_5.0.6.bb   | 9 ---------
 2 files changed, 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index dbfa991ebe..6b10913657 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -81,7 +81,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-colorlog \
     python3-colorzero \
     python3-configargparse \
-    python3-configobj \
     python3-configparser \
     python3-configshell-fb \
     python3-constantly \
diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
deleted file mode 100644
index 1b85368105..0000000000
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "Config file reading, writing and validation."
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
-
-PYPI_PACKAGE = "configobj"
-SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
-
-inherit pypi setuptools3
-- 
2.35.1


