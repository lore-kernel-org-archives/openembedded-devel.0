Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD731E81E19
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 15:58:02 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web10.16682.1696607880872253795
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 08:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm2 header.b=UnmuLtB2;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=CT8oHAVj;
 spf=pass (domain: fastmail.fm, ip: 66.111.4.25, mailfrom: cvubrugier@fastmail.fm)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2BEEF5C0247;
	Fri,  6 Oct 2023 11:58:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 06 Oct 2023 11:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1696607880; x=1696694280; bh=hAYlTPE44e
	rY/ood1xcpGjkGhyufonqsb7RSzodg/jk=; b=UnmuLtB2o/Xby6YRjcBWNpqt77
	w2VEiN27gAHus74g7DfnE2sW7AURaisBbv7E9uPb2VLQteKYAuFqL1EaR38OLlUe
	k3xtIirx0zHOZ7Fz/vWrXM2bSZywcUmVa6b7ta54djP5eJPdWvgYh6y7FSnMkJOV
	50BXRhGUgDx8UV+gbh+eS5Gws3o+1OUt1jR4xgxMWU5mdbybgvlRGibXju3Q2ILI
	HD0xKb+f2b0sw2zhhgxGvA0kXGrbipF7APpWuI1ndI8ma6/tmRUbnxb65eIC85Ae
	D2yBNdAGuHilPfgxkeQ1GFBXwV6XfofN1lePC5lEnLn7RNbHdiBhbPMB6MLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696607880; x=1696694280; bh=hAYlTPE44erY/
	ood1xcpGjkGhyufonqsb7RSzodg/jk=; b=CT8oHAVjtSAd5fXBLZrozISpiROtg
	d0Oz8cvS4tzT3+/gRccj9BHNrYLr/MJ2OrDRBFsQh9G7HvFsi2jmC8H1Mei3Er11
	b/WewS9I7uOILU45y552lRTapM4SF6AEU9LO0HlvsnARckU8un5xs0/L69+OqjsU
	n2PZEU2toXo5dvwOrQIem9ydqab3yQEGXJwPpQFpNCAYJPdjY4K7CCLr8JveRxLD
	iq6vgEd+r00JDmuMaapeSuBXmkdjOUVEpSwBYi1sVWMEBOIuzPPjnJx4F/1/hpr2
	AxVmr0OWKLOlOQINuOwpugoUbBrw2bQPjCaoAV5leHfGygVFmC1qkStvQ==
X-ME-Sender: <xms:hy4gZTfCiaYHVRy9tnWWpXD0gfVZfSbquixdqxpMXrouNMdlTT8Fcw>
    <xme:hy4gZZM3z7G8NRHw8fsWWOZuwn2nAMTbobrL8GXICRPv6D4gem5HNCohBXwpU0DQM
    aqTRgtEuJH8ubMUrw>
X-ME-Received: <xmr:hy4gZcgTDY6nd_Ex2un2KZvXWuTNWyF8BT7TqKn3cIYx_ByR-CUte9uUpnGu4Ewnm0UpQwXE1b_SXRlkXCnpASYkFxaX8imWscBk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegtvhhusghruhhg
    ihgvrhesfhgrshhtmhgrihhlrdhfmhenucggtffrrghtthgvrhhnpeeiueeltdekgeekvd
    evleegfeehhfffieevieelvdejudfgiedvteejffeltdelheenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheptghvuhgsrhhughhivghrsehfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:hy4gZU-Imiyuzxy-Mjy_R__lawOpQEyb_vwOO5_j1U0Jy-oy8fQ7dQ>
    <xmx:hy4gZfvHWjsxLc68yDhnoCcDyqUxOIPhLem-3NZE1xYWSnBnygNb6Q>
    <xmx:hy4gZTFEnVtYR4pLcUs68NKs7nKj8RC5P7Iw7omdKgIuvc0cdI-BCA>
    <xmx:iC4gZd3hLavdYGzQkhgG81QHQRWYh4uDUNnKBbCUL1K0l_A8h4ubqQ>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 11:57:59 -0400 (EDT)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [PATCH 1/2] libnvme: upgrade 1.5 -> 1.6
Date: Fri,  6 Oct 2023 17:57:43 +0200
Message-Id: <20231006155744.36093-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 15:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105370

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 .../recipes-support/libnvme/{libnvme_1.5.bb => libnvme_1.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.5.bb => libnvme_1.6.bb} (94%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb b/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
similarity index 94%
rename from meta-oe/recipes-support/libnvme/libnvme_1.5.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.6.bb
index 4b6f1e30b..37e5d6301 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.5.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "4fea83db8328ea788ea8f1001e8ce1cb80ef5fae"
+SRCREV = "37a803cf77e224f66d86b1e1d9e74a15f55ea600"
 
 SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
-- 
2.30.2


