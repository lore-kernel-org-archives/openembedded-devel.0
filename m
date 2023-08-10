Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2782DC04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 15:40:07 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web10.20611.1691682005995385862
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Aug 2023 08:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=nQotkpeO;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=2QNY+Vbc;
 spf=pass (domain: cold-front.org, ip: 64.147.123.21, mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 5ED7A3200942;
	Thu, 10 Aug 2023 11:40:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 10 Aug 2023 11:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to; s=mesmtp; t=1691682004; x=1691768404;
	 bh=gvmKRYxox+dgVtn082YOHGXHvFQBaMNC6jbIORy7GrI=; b=nQotkpeOaZyQ
	OrcDvXg9eBaOiK8Oi/UAkNsXtRwTiLxd/ZqtBf7YltfDT96sv3c83+n5/NGvVx50
	R5aFeXRsaJKe4xZfhioGNs0mzeJxGzhzEAAC+wyFD2luFXsgxSLH6TPjeeVjnoeR
	vUl2ca78rzOZQfo6nk0/a2wGCh39zr4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691682004; x=1691768404; bh=gvmKRYxox+dgV
	tn082YOHGXHvFQBaMNC6jbIORy7GrI=; b=2QNY+Vbc/9VJT8pM2HlbnTDfFsNSR
	SKDd2OFY60ukeKI/Q8cHZ04yMe7bIbn1KPmGLmAIxZm4WO3q3+5f5DT4BS8n9Uko
	XeDDJjvbXXQYGy50LLPegYIqh4A9gBK2CffzlBWBkH1s13noT/K5OeVqWyVl805B
	g5AJ62fBP7Xm4WekdAiesKnXkjhvXWtb96P/Ye22FOtLGRbUyRjTBZrOYbT1mr4v
	kNRriJL3WilLFv0hG0ckfhesSZ8r9spNn68wOonPsmIOsGwiNjllA9oaHaPNx297
	I5S0R5hAJ0tcx7RTSB5SAVWOZNjhP3GOHuKDPSN062huxoGP2N+IyjLnA==
X-ME-Sender: <xms:1ATVZMwwloGvuW_BvvXgCqxRgQIAuN7i5DP-2Dj_fb2PaZaF7WaA1A>
    <xme:1ATVZAQr0EggXlSYISrQmqEHjdia_ZBaRgSFjHB24IUqdkJV5FCLvvWqK6gYPRXXR
    zv-BTy1nFUiz7mIdg>
X-ME-Received: <xmr:1ATVZOVAWB41bDRi_F4wjS2UefLR5QnsJCZq9talq_TtQ4s8Zzifb_AFrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeigdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpedugffhvdekueehud
    duudfhueeiieekgeeflefhgfefjeegleehjefhfedtleehgeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlug
    dqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:1ATVZKjL4OMPmVIzI4_JSt1h5Qgclv9KrHHWEgzm_9zBcFE2WlQlnQ>
    <xmx:1ATVZOBq06iP5lst6P4k2w2iaeK69BG-hoME1EUDz6S0r1tRgV4Hyg>
    <xmx:1ATVZLJdcBtTDCJ4B7FotnUr34bmqZJF6Vg3GJzLI1BB872I626aLg>
    <xmx:1ATVZJq1FH7jTtRBoj1R3WEFWgtdTB8Ux8h_ID4yfYkWJ7ikvpgWHQ>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Aug 2023 11:40:04 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH 1/5] python3-mypy-extensions: upgrade 0.4.3 -> 1.0.0
Date: Thu, 10 Aug 2023 11:39:48 -0400
Message-ID: <20230810153953.17293-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Aug 2023 15:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104325

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 ...ypy-extensions_0.4.3.bb => python3-mypy-extensions_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mypy-extensions_0.4.3.bb => python3-mypy-extensions_1.0.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
rename to meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb
index 83ac5362d..4c431431c 100644
--- a/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb
@@ -7,6 +7,6 @@ PYPI_PACKAGE = "mypy_extensions"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8"
+SRC_URI[sha256sum] = "75dbf8955dc00442a438fc4d0666508a9a97b6bd41aa2f0ffe9d2f2725af0782"
 
 BBCLASSEXTEND = "native"
-- 
2.41.0


