Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8719C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 21:25:03 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web11.623.1646083502831504951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 13:25:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=f+XTZhMX;
 spf=pass (domain: cold-front.org, ip: 66.111.4.29,
 mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 233B15C01D7;
	Mon, 28 Feb 2022 16:25:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 28 Feb 2022 16:25:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=TrSjAbAS3zn7E5+rtFhASxvSGoXegfVoU4U
	D0prA5eY=; b=f+XTZhMXoMBcGZA08epHLIe3CHPrJ6/Cao2cXFTreJS05xUZsIe
	uv9snoET78s3p9Ekeu92I1KhvjUe3sbqyRXB4az8x2LUMD7FIMHdZ4udoZ7zaX/s
	VvaWadsDWMxRzThjjVOSiyMSecPE919EUd5V3D3dOcYjW+fM+7ehUvm8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=TrSjAbAS3zn7E5+rtFhASxvSGoXeg
	fVoU4UD0prA5eY=; b=X0Em6epxrCH8beWT2wPI44KgeO9Gi9GywSywsj0kKRZMz
	Axp/zmGbb3Ar6k2/JZ+CrxncdItBgUeaKAag+8JVxzFX9ZyJSStouQ4c5YfftKwU
	8NG/ryNUEKtOxb3Rp2sSKONH8Vhi3W+CBKxO3A2qaYgh0j1WPeYlInhKUeJC9afI
	emefd+TwyDtFsKIbzxwOvI7EXQFS0SfQ9l9xNdBaykoqhqY7a/M48yKRtYzOmtc3
	aY9L0Ry6ncxVb7jfFYjzfBWYMugv7S/8R5yYTARAAu6YAUd4jC/1b8jTb3rl4gZJ
	WIe6alAIP1hcwQZFxD4snp7j2nv1bmWnLQmRXb21g==
X-ME-Sender: <xms:rT0dYjmVPNOyab_jOO5bk1zmVVL0cz8dXSWY7YbfYYtguoutyn_CTw>
    <xme:rT0dYm3bXqW30kFe7ao5ae4BNHneZsvbWJkkFpSL5CuSht3EEKhs1zp8tKovD2yZ5
    sfuZy338bLyNrgj7g>
X-ME-Received: 
 <xmr:rT0dYpqzY2iRx6zsQ4A5kf20LSEM6JY0Qx9ASGybk1NTdBN9Pw17bXHo8l-6JyNKWo78_uPrskqrHnnYPsyVSiQU4WiyuBixRPI9z68vezAI>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddttddgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghr
    segtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvghrnheptedtgefhhfdtie
    dvhfekieffkeelheettefgieeuhfeuffffheevveeuhfeigedtnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:rT0dYrlAq2iZP761Akc0nhOsb-S_b5PMqpI8uiPdr1pio0h0bc99tg>
    <xmx:rT0dYh2J4MFoMSz-KvEATK7qz_OvD6Uo1FuYsrMhqHQjx3ML_x_oug>
    <xmx:rT0dYqsLbVWEiPOc6H9r9VyvUv5TY0vjBFiMlzWxtI7x4WfURBfaXQ>
    <xmx:rj0dYu_p9SSAIDBdLHrEBU34GBA-q4N7Lz1yAbGBQU4gF-HhcABGaQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 16:25:01 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-kivy: fix wheel build
Date: Mon, 28 Feb 2022 16:24:58 -0500
Message-Id: <20220228212458.15786-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 21:25:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95596

Recipe does not inherity pypi and the package name is capitalized
regardless.  Set PIP_INSTALL_PACKAGE appropriately.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
index 3daf13473a..38f5216f56 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
@@ -5,6 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0c851d60495c7e27225a819e179208a"
 
 inherit setuptools3 pkgconfig features_check
+PIP_INSTALL_PACKAGE = "Kivy"
 
 SRC_URI = "\
     git://github.com/kivy/kivy.git;protocol=https;branch=master \
-- 
2.35.1


