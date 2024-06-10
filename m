Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5E4C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 17:25:32 +0000 (UTC)
Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
 by mx.groups.io with SMTP id smtpd.web10.23786.1718035966346958505
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 09:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=lseqAzHR;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=SBMrzWyh;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.151, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id C0A091C00088;
	Mon, 10 Jun 2024 12:12:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 10 Jun 2024 12:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1718035965; x=1718122365; bh=xvY8NcdwiH1wH9e/Pak9o
	Ki6+mlxOCNS37LHZFhfHco=; b=lseqAzHRnDcCmlN8Jz2qrd/HFtLwxloll27fl
	CTPuzJurfVV9B06Wuwo43CGTayk/PDMn2qkNXx61U52bsX7EKi6gEI8BPHPilJrO
	LHymbjROUlOkpQdvcE3pIlykge+YPHLMTGATVa4pTX2ouz6bsfLEFS9aK6+lHwmH
	hfps0kUiH+vIRURThXSGB7L/Mo+Bw84Z+rJRSvDtUgQJKLsj83doRqKuLt3QmzJf
	NdrMUSrPjJAejLS+4FNOGA8NZOfpAGTBRij7FMyGbjmuCux7Tg03rFZvPoQ2tRAw
	lhdS2xTMTqzPpApE/KAqAJMqSgkuKiGgmbvlXV8ims0RDlrWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718035965; x=1718122365; bh=xvY8NcdwiH1wH9e/Pak9oKi6+mlx
	OCNS37LHZFhfHco=; b=SBMrzWyhqBYklOoI/9QrJ5L7OYOUt+S/DnjPXWATtLap
	CPn1vWTkSXomTeNSOr0Y4R7Lb0ggY2vJ0mG9tNAvtvKkwVJQ6ggdd9THjzRizsSh
	ceDGKP0jD1eCPfgel4Kt8mBUeF3z0HiMWtxJv+iTXXzzeBvG5s57rcqnvoIffFu5
	LR+rapwAXabj5hVoB/R+B9NOFmlPWccVL92cqzgNdtTRGJ5GoP4lrMeoc2BsECAr
	UIWy4T09NTcoUXnUzaSvt4sxYu8ofLxD7IgTFGOplpiRRmgyKNKkD1vAmA82HGY7
	TKes3sGI7GwHYTzh89D3K6VlsKstciFAWnH7PKLtyw==
X-ME-Sender: <xms:_SVnZnFjymVDPeiXjFoN4alKWdEkZ9BPdw4u5pBQk_pQFwTlJPFf3A>
    <xme:_SVnZkX5pR5l1LLmTTkb99R9Go2YFC6W0vq6UAA8V7fuF_HgecO6quavk2AOekeCU
    Qi64oyAJOJhaa1EIsQ>
X-ME-Received: <xmr:_SVnZpJ4m8Mtw5lyH81jzbGlT22J_CmEU7FOhMYMJ2-VRPGFmSrWThNg6NZjxBojlOzI-SWSvPN-3HcjqPmNgZB2jQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedutddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:_SVnZlHuAP_e_K2aw3jcWDLr-Vkuebv471uD78Cxzl2A-8ET5gyJ0g>
    <xmx:_SVnZtUCcpZa4aeasiiZT0OFJCybabKjhaOPN7MgjX1zA0TxUfIEyA>
    <xmx:_SVnZgMvWVB4NL4NquPm0U1CKRm3AiCNLlusVQSRdAiXpdAHziJEXw>
    <xmx:_SVnZs1Hl7lol9VJx1mz3SmE-r2bSrRC_imePQo4k9QEsF6ro4JOnw>
    <xmx:_SVnZqi1CKXS7r2jz9H-6jcjggT7DSihi67WJAbuR6dNipu-JY2ntoBl>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jun 2024 12:12:44 -0400 (EDT)
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: openembedded-devel@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [meta-oe][PATCH] fbida: Require opengl feature for pdf only
Date: Mon, 10 Jun 2024 18:11:50 +0200
Message-ID: <20240610161149.226983-2-pavel@zhukoff.net>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 17:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110798

Don't require it for entire distro if pdf package config disabled.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 meta-oe/recipes-graphics/fbida/fbida_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-graphics/fbida/fbida_git.bb
index 247a1fcbb..6c0674849 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -26,7 +26,7 @@ S = "${WORKDIR}/git"
 inherit meson pkgconfig features_check
 
 # Depends on libepoxy
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'pdf', 'opengl', '', d)}"
 
 PACKAGECONFIG ??= "gif png pdf"
 PACKAGECONFIG[gif] = "-Dgif=enabled,-Dgif=disabled,giflib"
-- 
2.44.1


