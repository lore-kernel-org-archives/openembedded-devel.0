Return-Path: <cvubrugier@fastmail.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94855C4829D
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 21:14:21 +0000 (UTC)
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
 by mx.groups.io with SMTP id smtpd.web11.18534.1707772451408706145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 13:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fastmail.fm header.s=fm1 header.b=TdEtI5Kc;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Lbj4zryf;
 spf=pass (domain: fastmail.fm, ip: 64.147.123.149, mailfrom: cvubrugier@fastmail.fm)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 4C96C1C00070;
	Mon, 12 Feb 2024 16:14:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Mon, 12 Feb 2024 16:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1707772449; x=1707858849; bh=1QXE+TwHU7Q4L7JTB9NsT
	zDAEuO3vJnZgQDfPXCRzME=; b=TdEtI5Kctlol/hPKeEiuwoy+Sdj91zNpCAOiL
	mH/OBa+BGElERyvHW/d1s66DkrW0e6HMoRKCaLh++XjRLx1yViZ8Rv0Vs6xm6oQH
	WItTXLZ4taOlN+52G0fKUi1A5Ehe4xx/UssVT1Qw4HHYw4mpXMyQR62YmubPyJ0+
	LRGee5kiIvFZpeC8aqTSiTFwqDdPDTOloxtNzJoBK0aTGswHokoEMV9LFnU0kI8Y
	/aov9Er/zq7TLDDvxipIus0qm5mYdONoFVBiIxkZtEFrQzwqmMFvfXgYK4a0ofEM
	uZIfSFYg3bEOG5ayHndz+6re+lLbLiqfcVCciKR9blKBq3KkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707772449; x=1707858849; bh=1QXE+TwHU7Q4L7JTB9NsTzDAEuO3
	vJnZgQDfPXCRzME=; b=Lbj4zryfvQWRoi8ty8gWzqADbz/Et2ZuJ9ZKPSFzuQI+
	I8XIRQlOCZ/n/eOqmRBCntnrcw7pfxMDNAhz+1TR9T5VH/iNnOEBDzooe/kp0lDB
	1vW0n0/hofKwqBZL7sIRlQNgUYL60ayfxN410H0qTa6fZVvm4GRlepd6dwoMLBwN
	KKpBAy+ggTHBnCFe23irMGOIh0jsq6WyiIEiVTYBQiXrEzGLzv5akRei+wwtuHmp
	g8Mtc0LrbbjsZTda3/P1PwfgRrxIRUebqF6dk2r6WOTe+c0NVM+RCEvCyxCBS/UI
	zvYjNumHtl/RbdSQYBJMscLLDvh/zNwsP1Qffc4syQ==
X-ME-Sender: <xms:IYrKZf2SfGSSWGIWrjobqkNhL1lBDgWQPKlvF9h1XpPi7NrsCJkqPw>
    <xme:IYrKZeH_S-SjLK94XptZX4jZdXpb_3dgWM2Jvpe57T70vOUOXRmmCh1cDtcHHJ9dD
    gQWIIiTpAhHcU39_g>
X-ME-Received: <xmr:IYrKZf5wDHV2KuNpYoPwxEVkJ9X5AgWmavNLMeVkuFgOXK70dthO2ZEdy7uQcCIz7CvdauwxCrR3Yy-VWBLzXVl3SYU_VCrjFogbMrrmKAFgY9M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefgddugeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptghvuhgsrhhu
    ghhivghrsehfrghsthhmrghilhdrfhhmnecuggftrfgrthhtvghrnhepieeuledtkeegke
    dvveelgeefhefhffeiveeiledvjedugfeivdetjeffledtleehnecuffhomhgrihhnpehg
    ihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegtvhhusghruhhgihgvrhesfhgrshhtmhgrihhlrdhfmh
X-ME-Proxy: <xmx:IYrKZU2827bIdPDfJeycRTI3De7PbHvN8BMwZmrRwJc38iP29JX5Gg>
    <xmx:IYrKZSEf_N_XAFHlFyIB1MhkGMOneFYLOtA2T9Ud6ibVXqBAaZ9ETw>
    <xmx:IYrKZV-Do7N2L4E3steCVKYxN45fkVMB5zad4TnhyYpQQA2cJgwYTw>
    <xmx:IYrKZXSPZTIzjUExC7j2iIQBKsaIOu9ZrcxGKPbKR_0ExDo2C2EqaYTe75w>
Feedback-ID: i09e840f8:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Feb 2024 16:14:09 -0500 (EST)
From: cvubrugier@fastmail.fm
To: openembedded-devel@lists.openembedded.org
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH] switchtec-user: upgrade 4.1 -> 4.2
Date: Mon, 12 Feb 2024 22:13:50 +0100
Message-ID: <20240212211350.150358-1-cvubrugier@fastmail.fm>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 21:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108717

From: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>

Signed-off-by: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 ...0001-cli-Fix-format-security-warning.patch | 27 -------------------
 ...htec-user_4.1.bb => switchtec-user_4.2.bb} |  9 +++----
 2 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-support/switchtec-user/switchtec-user/0001-cli-Fix-format-security-warning.patch
 rename meta-oe/recipes-support/switchtec-user/{switchtec-user_4.1.bb => switchtec-user_4.2.bb} (63%)

diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user/0001-cli-Fix-format-security-warning.patch b/meta-oe/recipes-support/switchtec-user/switchtec-user/0001-cli-Fix-format-security-warning.patch
deleted file mode 100644
index ff2743eb6..000000000
--- a/meta-oe/recipes-support/switchtec-user/switchtec-user/0001-cli-Fix-format-security-warning.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 2d61587f85d1bf57287d12b470afb94c0bf9249d Mon Sep 17 00:00:00 2001
-From: Davide Cavalca <dcavalca@fedoraproject.org>
-Date: Mon, 27 Jun 2022 16:54:35 -0700
-Subject: [PATCH] cli: Fix format security warning
-
-Upstream-Status: Submitted [https://github.com/Microsemi/switchtec-user/pull/316]
-
----
- cli/graph.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cli/graph.c b/cli/graph.c
-index 5748914..95609de 100644
---- a/cli/graph.c
-+++ b/cli/graph.c
-@@ -134,7 +134,7 @@ static void draw_status(WINDOW *win, int x_off, int x_cnt, const char *status)
- 	mvwprintw(win, 0, 0, "     ");
- 	for (i = 0; i < x_cnt * 2 + x_off; i++)
- 		mvwaddch(win, 1, i, ' ');
--	mvwprintw(win, 1, x_off, status);
-+	mvwprintw(win, 1, x_off, "%s", status);
- 	wrefresh(win);
- }
- 
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
similarity index 63%
rename from meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb
rename to meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
index 443e5bc49..17f54dcf4 100644
--- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.1.bb
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.2.bb
@@ -6,12 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6b07c89629cff2990d2e8e1f4c2382"
 
 DEPENDS = "ncurses openssl"
 
-SRCREV = "762ba441d2c02685f98e5f56e984db033bab279a"
-SRC_URI = " \
-    git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master \
-    file://0001-cli-Fix-format-security-warning.patch \
-"
-SRC_URI[sha256sum] = "f98c1fe23e1d7a11fb23e8bcf9b563929fc805ea669191a7fd525ad16519f655"
+SRCREV = "e7c351c6c722336b3c79b79cd002c7c2986eefb0"
+SRC_URI = "git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master"
+SRC_URI[sha256sum] = "a715e46d8498418dbb8a2519318ba0714ee148151d7e4a7fa5e27770a2f6888f"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


