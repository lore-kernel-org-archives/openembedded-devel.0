Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A39C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 22:47:47 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.2595.1644878866011289598
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=Ubgbmarx;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26,
 mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 39F985C02C3;
	Mon, 14 Feb 2022 17:47:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 14 Feb 2022 17:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=SpUgZZjxvNl/DvkIEyFjXf1prEXU5Ib51RB
	vzY9wB4g=; b=UbgbmarxyqDe6/J0Wr1MA/ykTmnoIzByUcx7ocdqoLu9wuZCA/Y
	I1GwjYIhz/8uXIuQvVQnXOQ3jq/YyugHgjjnoFC7iqJ1ibb2yd1NcrrCvpde/X5F
	U4zoO1n+vEKCkDc8Qce3bjx37IXCcj20K4VrnMKwKlVGqlbzgG+b+aM4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=SpUgZZjxvNl/DvkIEyFjXf1prEXU5
	Ib51RBvzY9wB4g=; b=VasjcpfrnNd4YoZ7SaKhLS8940oM0FZW0jnykAKeb/1ai
	/UcKDc5zqTXK7jxRlL95w3n4XRJ2sgeDh7ecM20lCXJHAXrxjfXWgixt8bGJtEbw
	5Xg8RWGp3MQcIiiZkGXoBB2llo/NV/laGhTiJpD0XWcxC2xPcpyzMhayLL0amO+e
	o6s5TuUuy6eeHAngv9xgJUM3g0TkfCmiYYlmSkHeuw7AiieCipLijrlx1IGwzbKd
	hAsKJ9epco479TL7xIURcVmFudp7J/fDqbXWyST9vKpcKRfWMsCRkjj/jN3B1KmI
	nqNAY21OUi3UlD/eGyPPQH8e4BbZDsJ20857Dw05Q==
X-ME-Sender: <xms:ENwKYjMfSdZ1ddKd3nKzHgLhYcle8KiTv46r1_02KgFJkfcBg3cVmQ>
    <xme:ENwKYt82JDT2oCuKvfOtDH6r9nt-wtiDlkMho594-O4Ct2Ay3dxnPzDCaRWb-6ePl
    LCPqpAz345uAyLNMA>
X-ME-Received: 
 <xmr:ENwKYiQPrKs5fGkF7630gkikpMOBKGb4uO9hxkNefYAMVvmjzUp9RTZSz8DB2BmEpc1mn-boH2EY24BIRAhGYZolL_RXx7SJB6AIKsEEVsoo>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghrsegt
    ohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnheptedtgefhhfdtiedvhf
    ekieffkeelheettefgieeuhfeuffffheevveeuhfeigedtnecuffhomhgrihhnpehgihht
    hhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:EdwKYns28B9dL6Oy_kaJVBp7dkA_MBjYXpd2zUxvAq8yrKlU9qPxJQ>
    <xmx:EdwKYrd44YkHOUbZFNP5-u55EfEn6L1zNB652yQb7pMu0vlPklOw9g>
    <xmx:EdwKYj1sD8Mi86q_7zMiHhCdZMpRHYSjsOd1HNrj0YnGU2tLXdbfkA>
    <xmx:EdwKYrlsFrMOSE2agnDvTgadEmv47EgMYiQJEeLOa0-SZewT9lgPmg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 17:47:44 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-oe][PATCH] googlebenchmark: add 1.6.1
Date: Mon, 14 Feb 2022 17:47:20 -0500
Message-Id: <20220214224720.16203-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Feb 2022 22:47:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95310

As meta-oe already has googletest, it seems appropriate to me to also
add googlebenchmark which is structured quite similarly.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../googlebenchmark/googlebenchmark_1.6.1.bb  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
new file mode 100644
index 0000000000..b44d3bee27
--- /dev/null
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A microbenchmark support library"
+HOMEPAGE = "https://github.com/google/benchmark"
+SECTION = "libs"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
+SRCREV = "0d98dba29d66e93259db7daa53a9327df767a415"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = " \
+    -DBUILD_SHARED_LIBS=yes \
+    -DBENCHMARK_ENABLE_TESTING=no \
+    -DCMAKE_BUILD_TYPE=Release \
+"
+
+inherit cmake
+
+FILES:${PN}-dev += "${libdir}/cmake"
-- 
2.35.1


