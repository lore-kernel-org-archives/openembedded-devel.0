Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D11CC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 20:44:50 +0000 (UTC)
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.web10.838.1713905089542043918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Apr 2024 13:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=6OFbkQzV;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=UcXcjsfX;
 spf=pass (domain: cold-front.org, ip: 103.168.172.150, mailfrom: jsbronder@cold-front.org)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.nyi.internal (Postfix) with ESMTP id CF34D13800BC;
	Tue, 23 Apr 2024 16:44:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 23 Apr 2024 16:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1713905088; x=1713991488; bh=o6YJMbXeTb
	C0uswrqJJ+jr3ZuvlYM8JmCHRagEbrx8Q=; b=6OFbkQzVPlXuxPfESA3ZmODqAW
	bFgQOJAM6MhyrMzggQvughChXkL1cllAwAgk/TuWlYGDtZCwKLcAY2EWdlcbFvGS
	T8PcR9fUEuTyLmxj1SmzAnLSyXuvh3q1A0bSgTCs/VTPlq/eyguF8pow6b62OO2m
	WHEJtlUFKuZfDRz9oBwGb9LhuRjD2zOyF2uT/Fiz/IQFROiBmfqxgGEc47PjIa4f
	sTOQGWvSYrw7JC0cNrwUBPYq9AgBQ0UUqDlzprSy4Mq0acYbmdM1OIwsDLU2Ie+R
	p7qKAStWNMp318kJcpepcE24QRCHU3h4k/IFTjb8Tu//TKjIWvzXyZkNOpYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713905088; x=1713991488; bh=o6YJMbXeTbC0uswrqJJ+jr3ZuvlY
	M8JmCHRagEbrx8Q=; b=UcXcjsfXJqOfmSlqa+3r+fhBDKWaH3Pj3j+tYy2KVdoU
	0VqKDuEYBQuQrePJRQI9YdV0k2/ANkeiU38w/0xJz7brnR9txqha63FcH/7B14NN
	hMfvgGNghAI/NXoTHlnINwxPVe/8vL8sXIgi6+h+S/K28mzS3gU0Hg2fRlruCBcI
	jsRQS9SptjcMZ1uwYuYxDJqZY7y8gMivKhSfu/rf2iG8ZkSpbM3rMnqwahu4J2vP
	jnlXA4zdBTxFzJAuJN5PGSuyYSQESGViOVFVT1k0LhyQgUV5SvPdUtWD0q4nFOH+
	JZ+CtJ9SpRzqblWGHKCJXqnD4VmL7fKgkow7g8UzPg==
X-ME-Sender: <xms:wB0oZt3hzm-equO1bmJtEgU-vLWQcHO9LEDpWiPJJ2DKox3dDTz-6A>
    <xme:wB0oZkHVtJ_ZKt_JJTpw4hsK2arvDhcyp7CFIJM1sZJA5NqmIEh60izW5Tda1fkZx
    60Xgn3xhhve2IqXVw>
X-ME-Received: <xmr:wB0oZt6K42TOMqIurxogdTYpevBIbqrUxVsiFPrL2x_4QNg3HpH_24isF-o1JMVWmb5kU6X1_eNqoipXXjc9cR7JRGlPvPcoqoUXpYkpVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeluddgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpedugffhvdekue
    ehudduudfhueeiieekgeeflefhgfefjeegleehjefhfedtleehgeenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtoh
    hlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:wB0oZq0AMTHA8JRq6eztBXGATWsPJ4QVeIvOpewrYW2nhdV1CMATxA>
    <xmx:wB0oZgF8ONqS87KCrjQCbh6tv9miRMe-xz5XIOBG0ka9d9PDHfReUw>
    <xmx:wB0oZr9OSFk1pNkMshvVXdmHM9ag5HnNnKMqxXkhs1Yjnvm0h9ExOg>
    <xmx:wB0oZtmyOqd1r78TEC0DQA5W0mqPH-N8E35LlWIF2dPWIpTXqVhH7w>
    <xmx:wB0oZlSoPH7pHwP0MOrarBwU8gv6n4WnvJKRoqCJgcMqVekzau-4Hb1W>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Apr 2024 16:44:48 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH 1/2] python3-colorlog: BBCLASEXTEND native nativesdk
Date: Tue, 23 Apr 2024 16:44:40 -0400
Message-ID: <20240423204441.22005-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 20:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110119

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb
index c26f4bb70..df5fdedfc 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.8.2.bb
@@ -10,3 +10,5 @@ PYPI_PACKAGE = "colorlog"
 SRC_URI[sha256sum] = "3e3e079a41feb5a1b64f978b5ea4f46040a94f11f0e8bbb8261e3dbbeca64d44"
 
 RDEPENDS:${PN} += "python3-logging"
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.44.0


