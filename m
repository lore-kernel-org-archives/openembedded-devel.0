Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 797CAC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 19:59:45 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.1827.1635278384544530291
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 12:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=FDuqivqk;
 spf=pass (domain: cold-front.org, ip: 66.111.4.27,
 mailfrom: jsbronder@cold-front.org)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id C01A55C020E;
	Tue, 26 Oct 2021 15:59:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 26 Oct 2021 15:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=mesmtp; bh=QVi0hLgGfzEluSPSSW577S6
	PcHP1sSG2Dr74ZXNGkEo=; b=FDuqivqk6ENv8Q02bRwWgRuMRPriIuxWSqa/qF4
	NRiyeJjUpwhQY0MyVxHGwrsEpXfw9Ad4GO/TVGupHUdlqGyDCasUAlvGqW9+5bCg
	ncQj73uq8iX22x6W/dEo3K+3qywTX7DHUO+wcyjcFM0Tm6ji3u6xIP5MpEhl5MYK
	seic=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QVi0hLgGfzEluSPSS
	W577S6PcHP1sSG2Dr74ZXNGkEo=; b=avPJO0fGPKYbTMqPC0HjfBQ62XTJE6DSb
	6eYh5Tibg/gKjx1O6Pq2A5zMo86xgN5QqVLJHHRIREORlT+3RRtdLn3bVQUVjtAx
	GhnmP75VwuyKDjmWQ86mJi02gpMu83CuSenJBMqzBLOrnBXC4r1JumohKQmf+vV3
	n1QY6qd9MB35xMg7nlO3IwXmdZvflqEtlNuiF4BFNWWIlJYC2RT9w8gkQrZ8qfi7
	B1WEyqxTpfTbKQo/dOICIl0kbb0jXKWJWwnmgXtDD2QAob6hkAGiaj4ixYYQwq/y
	/F0kc8QWRxtzOq/JPXcz0APm5svm+Xf9Fm49vxPoMCkQchLLepP3w==
X-ME-Sender: <xms:LV54YYZ2puzjZqnES42KQMKSI-HwNxVybAUjoUwVds0JhHyxuQVwjA>
    <xme:LV54YTb32hCSCofawjufq7LpFwOklxArE5ndhNW-SJzDN1I-Fb2Gzx41UkkhwHa7s
    KO8tACd2rBXYroQqQ>
X-ME-Received: 
 <xmr:LV54YS8efpiaRDwt-B2Ln8Zgj6KYcME5Je8ITAvPuhZdaWyHNtXWxO_U4g>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvtddrvdefkedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeettdeghffhtdeivd
    fhkeeiffekleehteetgfeiuefhueffffehveevuefhieegtdenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:LV54YSqACBcWmo6OEoES0Nrj1gcPD__bhkGa3Ksi4ly1idSnbCWczQ>
    <xmx:LV54YToSwEAkEGkSbRZlfLEogEfiQvQBEOZty67dvpfOCCwgPpdFKA>
    <xmx:LV54YQR7hrw-HxqlZBfUUlkwv6Hf4vHIn4Dmm7vZxRZ5L0mZMX3Nlg>
    <xmx:LV54YSQyGbNvlu0tpONVFVP31AjJhyI58oBeAr91xWVymw_eTqDkEg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Oct 2021 15:59:41 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-mccabe: fix LICENSE and RDEPENDS
Date: Tue, 26 Oct 2021 15:59:34 -0400
Message-Id: <20211026195934.8628-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 19:59:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93613

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../recipes-devtools/python/python3-mccabe_0.6.1.bb        | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
index f1190c36f..513a5a9f2 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.6.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "McCabe checker, plugin for flake8"
 HOMEPAGE = "https://github.com/PyCQA/mccabe"
 SECTION = "devel/python"
-LICENSE = "Apache-2.0"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a489dc62bacbdad3335c0f160a974f0f"
 
 SRC_URI[md5sum] = "723df2f7b1737b8887475bac4c763e1e"
@@ -10,8 +10,3 @@ SRC_URI[sha256sum] = "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271
 inherit pypi setuptools3
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-
-RDEPENDS:${PN} += "${PYTHON_PN}-prettytable \
-            ${PYTHON_PN}-cmd2 \
-            ${PYTHON_PN}-pyparsing \
-           "
-- 
2.33.0


