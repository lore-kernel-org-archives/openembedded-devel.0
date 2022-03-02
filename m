Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C04C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 17:03:30 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web08.163.1646240608736327079
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 09:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=gfZapSRn;
 spf=pass (domain: cold-front.org, ip: 66.111.4.29,
 mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C8B525C01BD
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 12:03:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 02 Mar 2022 12:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=mesmtp; bh=JZb3poVCeGuKldhsBqXTXu6/AN5gZP/MKRjvR+TbgPk=; b=gf
	ZapSRni+7oqU4bA5cjiXxS4O5fu09hIDK9qbXEg18gia9TWBs7xWz/JfHChLFJXF
	+U+TscI6p0WmSJVXfCXoSnIaIQ86+cJ/aObV3LmCqKBcMjycjYyQZCfm77qeYu1a
	m44fEpqOhQYVbSY+qJrhvwQ7Gb+X7a/Y4LGeiwpYM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=JZb3poVCeGuKldhsBqXTXu6/AN5gZ
	P/MKRjvR+TbgPk=; b=a8JqLVsDTwl8euJWjNPPYeAazG+LM/z2/XpdZPP8fcynn
	I2LmgrrlJDU7xzWoPu8dAfnHvbyJE6K7SFoKxHqs2z+hfuZysdrLTNjQWeeOaPgk
	ZjB9HzqmIrd1N+40++33/0VrlM6SMTeTEmBHYEUQkXX+o1CJPKFakwKDJkO4lmq8
	hwjgZhPqOb3Iz5ZfFJngfzlazGbBwfw3F+kOx/pRLyD/7aPyUXrFN6Lg2QxrYqzB
	9JCuBoCUZcHA26t1FeEKGhJIwgwI/8j5XG5hTPs1tOJiOonKhsq8dl2a49OsVb/P
	oIRgKQb1Nw1gCIcNEDX0gsIbcl0NeoG2Cse1U9ddw==
X-ME-Sender: <xms:WaMfYmT-0t3IMSHIc2L9QA9g37OWV06cvsFZZJZZ3N5iQu2L3HJNmw>
    <xme:WaMfYrxEiocJdGn-LBbAM7zXDHyAcdN8-ZMsuKuP2g7cyHmJE5rW7ylCU2O5AdnQY
    DV9pEoPlN6QRkxsOw>
X-ME-Received: 
 <xmr:WaMfYj2EUExLNVZh2tnR75oUMxJ-upONdp0X2hQyqAyUZ-I0OQZ4PblmgLYpz523VgFAj2g6CB74J9Jbta851VkigK5OzsFDmidPfZm2hF7a>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpedvhfdthfffieffve
    etveeifeeuvddthfeludeitedukeeggfevfffgffffffffhfenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlug
    dqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:WaMfYiCINujAUiTOtALOLUxYfRDhgBDiloo1hBoeJQU5PK6u18ekxw>
    <xmx:WaMfYvh5SFdCvEW6m0kVbb7NPKAXBVFw-bMCcQ_VclelzbtnN0K4Dw>
    <xmx:WaMfYupa90joKSgiVONTzQcdcfvEaPyjGpg-3QnEwNeh1WJlCGsgWw>
    <xmx:X6MfYhfTc3wSXEFAKodAvT5ZPomdxjPEgywZIARznKYTNN0LS3HCGQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Wed,
 2 Mar 2022 12:03:21 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-configshell-fb: set PIP_INSTALL_PACKAGE
Date: Wed,  2 Mar 2022 12:03:17 -0500
Message-Id: <20220302170317.24076-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 17:03:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95694

Recipe does not inherit pypi nor would PN resolve to the name of the
wheel so we must set PIP_INSTALL_PACKAGE appropriately.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../recipes-devtools/python/python3-configshell-fb_1.1.29.bb     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
index 359c9d002c..2bb196c209 100644
--- a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
+++ b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
@@ -12,5 +12,6 @@ SRCREV = "d74a33b69f688ed9b8b28033835303604639d4eb"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "configshell_fb"
 
 RDEPENDS:${PN} += "python3-modules python3-fcntl python3-six"
-- 
2.35.1


