Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web08.2695.1630532908166071637
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 14:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=fR0QuH/y;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.19, mailfrom: patrick@stwcx.xyz)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 931563200986;
	Wed,  1 Sep 2021 17:48:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 01 Sep 2021 17:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=oDzYqN3d+ekQkdMuCIR74O0jwA
	apusTmOIu2R4CjBG4=; b=fR0QuH/y7onLMXJ8JneRV8XlTvmRQ4uDjfEiUboXGb
	YplOqoY/lBWxKNQEw+Uxdmg7sOxAJqOTgFTDQvKLK2rzJqoNbsUudL7/A5N317Xb
	S+QoBYDHPSBTbWCoBmQFRdTLhVSOKHBn+ylkoN0kZQ0YdFd6U24QOCCb7K6OlFfx
	oKMYAm6Qbs/EinHtgTCRZ+r6KLXWJT5Y39BoI8M8aaMbiRS4nq+1zmT+S+SWlGdw
	mrobBaKBZMZR1XIAIh/sMCl/cRDeN+q3txrTjmuzN+VCsi2KAq5/w18Yfuv+F+Z8
	r8qwxkhM3PxlSPiclJS6vqY5EXjqKDyiDv3vvN62eW8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oDzYqN3d+ekQkdMuC
	IR74O0jwAapusTmOIu2R4CjBG4=; b=br1fY0oaPnZzUgbG3/w8bdXLbXXrpnjg0
	ZLd0sd7x9qevaFR1HW/Ue/XyjhD5RIUqFXgWtWgdN6SC7nSHSj4gjJvWDnt1Fqg4
	e0PJxiXM4UJOdoPr8c1ighbZk6rc+SOkyz2wkyiUw9z+OQ6kBAQ7yI8NS14cVEBb
	iVLa4QlczIsZQpx5NWXIkIXyS5FIn0AqZIXy6QFgHouULwQNFK1jbmJmXmrKRc7p
	3yW4EPFrZ2IRSej6AcU8Rk7bs/ULP47Jo4OylVHqfKgmF5k93w/HjHfRmaj/Q7fA
	N94GYSgmEGIkM8ohRxNDK/NDH8Do9KUjkjalfBcOIG4+NSnEQugRQ==
X-ME-Sender: <xms:KfUvYdTydbmm55ybH-BZGaW28kp2pnjX7i01KP78Ro-BvCn1i9RNcQ>
    <xme:KfUvYWz4yOqwwN217Y6kL4df_jZjVkyZA18HdHhEo7luEuTksvCNayWuoCIQg8mpR
    7iDRseoAbClDxkpETs>
X-ME-Received: <xmr:KfUvYS0msykuN3mALmttjCxdqC2mlVb9AoDTVLJvkVjWIaYBkNQj7t0ApqEhuSv-bzYJ4RTNpdRaUQ1K2p3RTY3xuJWq-NJTLJ_C3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
    fufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
    mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptd
    eludegheejteelheduudegkeehleetfeekiedtfefgleeifeelhefgveejhfffnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkh
    esshhtfigtgidrgiihii
X-ME-Proxy: <xmx:KfUvYVAb8zGa188ns5CDLfrDolxTa6Lk4cW6oLdmY_yc4yK-eJ22TA>
    <xmx:KfUvYWhFEHmE3VZsWxOREAgXcd1ytrVMdG0RM1EIHBMpGlo4FBV0fA>
    <xmx:KfUvYZqZD9ejJP0MhqDRCBjDd2_3uV_NCkRzKEJOYC74bRqsIlzkGA>
    <xmx:KvUvYeL7m0R2BayB-iqaYgRccRZw6eYc302QhseuOiGTMeXyIKm05A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 17:48:25 -0400 (EDT)
From: "Patrick Williams" <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-gnome][PATCH] gjs: fix typo in RDEPENDS variable name
Date: Wed,  1 Sep 2021 16:48:22 -0500
Message-Id: <20210901214822.3331260-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 recipes-gnome/gjs/gjs_1.58.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-gnome/gjs/gjs_1.58.8.bb b/recipes-gnome/gjs/gjs_1.58.8.bb
index 75138125f..a16455bfd 100644
--- a/recipes-gnome/gjs/gjs_1.58.8.bb
+++ b/recipes-gnome/gjs/gjs_1.58.8.bb
@@ -35,4 +35,4 @@ FILES:${PN} += "${datadir}/gjs-1.0/lsan"
 
 PACKAGES =+ "${PN}-valgrind"
 FILES:${PN}-valgrind = "${datadir}/gjs-1.0/valgrind"
-RSEPENDS_${PN}-valgrind += "valgrind"
+RDEPENDS:${PN}-valgrind += "valgrind"
-- 
2.31.1

