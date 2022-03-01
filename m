Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3EFC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 19:22:10 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.1473.1646162529625171456
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 11:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm1 header.b=YC7Gf4TY;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.24, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 743863200911;
	Tue,  1 Mar 2022 14:22:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 01 Mar 2022 14:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; bh=jxT6/R+hIQ2aBkTYR0/xyqPDwDeZsj1PFvsNZCoIXYM=; b=YC7Gf
	4TYvrJZ//wTfrchjn+fP9MT94PxPvXsXOsAO8lxLP2f/uDVN7VP4gBDIZj/bq1We
	T60GIh5mXc545P1eZv+SSZ8C48RCETCBi9zaToom3924bAHjen3P0H/e9PS5yeBy
	ZoOcXwHfPyPPnsBU2OgOTaTe0cQLbAD5zzNHmKSH/h/+3T8N8WRLi0z6DUsBiHD2
	Mlm6RHLsL+S2HfpSMoZncmJPkXK+5MlGjpK64TvBvC4BX/ycjdhYdA43+oD47zFq
	XQHwIqYJDWuplQ0cB6sdVv0Fz1Jb5gLRV2RZw2lZT0Gi7m5RhfVztz9NgnfQ28aM
	gkO/P2pG6RSE2doeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=jxT6/R+hIQ2aBkTYR0/xyqPDwDeZs
	j1PFvsNZCoIXYM=; b=KdhHvv6mhHvNy2UnISKOMHYiDIjsmRNxdYpjhCOedC/AH
	G7P4q6wle3u7L9OEj7v1uw/0HWfmx38vkm/qCxpO7CWfRHFwG29Zp/XK/7aREom3
	d/TISGRAha8ZZNDHS0LAjus3VLz08vFkUkIeXWVeiFhXxAVvqmEFSXGUpsDzW2oM
	NH5x66VQa7r+IH+KbPpC4hmoqg38IodwY0dv1dMV1I3RkZPgcWSQZd9xwD9xe3VS
	rQ/wFhGXa0Vos9fI52wdZPd4P3oY4XF4EIIx6+6gBfbDDPZr3I0l6tBnh3TtI1a1
	0SlfZtglyc2gMTB81ETQ6BN22u25TJQc08UewIKfg==
X-ME-Sender: <xms:X3IeYvp2qm4JHpxpXN9nxkYDRLFJ_rbIdWStNq8ZjTopXdYbrBTzlg>
    <xme:X3IeYppg5wd2hF9f7tK_Sz4vsii096xSukWYcFu7K4jIup3f4LW2qb_D_GYjSrTXP
    6ONvekYOMqUXbAehFg>
X-ME-Received: 
 <xmr:X3IeYsPVps_xy2FbQK61nutzJXjuXiUFMTEZhct2ihQKwGCVCov_iZQNgPXHxdjSo4Ten2Tu_iU72_v7AL69b7yxpAqjH2g0768UhVNmFPbs4w>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnegovehorghsthgrlhdqhfeguddvqddtvdculdduhedt
    mdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheprfgrthhrih
    gtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggft
    rfgrthhtvghrnheptdeggeefteejjeeltdefvedttdfhieffvedvteefvdeljedvheeufe
    eggfetleffnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrd
    ighiii
X-ME-Proxy: <xmx:X3IeYi6ivbxgXfDnl6vk-p56pFVlOfSSfebvs77aqamYh1CjX_fD0A>
    <xmx:X3IeYu4lH1_m61hd3PbETkjgEi7R2ymXZDSGcpGIG2oBWjIk_lE4XA>
    <xmx:X3IeYqiWpVjneZfJH94_x4rXhs0by6y9EYkJCgma6xbMlhvG_Nfatw>
    <xmx:YHIeYkkp20lAPMU3j_Dda7hEYhe6y2ks6h9me03CulsBs2CU9yk0Jg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 14:22:07 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>,
	Patrick Williams <patrick@stwcx.xyz>
Subject: [meta-oe][dunfell][PATCH] googletest: Switch branch from master to
 main
Date: Tue,  1 Mar 2022 13:21:47 -0600
Message-Id: <20220301192147.3931475-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 19:22:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95646

From: Peter Kjellerstedt <pkj@axis.com>

The master branch has been renamed to main in the github repo.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-oe/recipes-test/googletest/googletest_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index 898f23faf..35fe1bed0 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -11,7 +11,7 @@ PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
 SRCREV = "703bd9caab50b139428cea1aaff9974ebee5742e"
-SRC_URI = "git://github.com/google/googletest.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
 
 inherit cmake
 
-- 
2.34.1


