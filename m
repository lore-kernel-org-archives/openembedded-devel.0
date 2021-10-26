Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C279EC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:51:32 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web08.915.1635274291860160601
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=ItXK3szn;
 spf=pass (domain: cold-front.org, ip: 66.111.4.27,
 mailfrom: jsbronder@cold-front.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 144725C024D;
	Tue, 26 Oct 2021 14:51:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 26 Oct 2021 14:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=mesmtp; bh=duU2fLNhcLlDWXzXL9DP4xF
	oVyKdX7Tky84UGXFBjq4=; b=ItXK3sznt0nmM224ofFirn0axm97076VEzJ7P7G
	1pQrvUob6Ufwrn6zOzEkaQ9J9W1VpfkLkpmdbSwuMqYBdFf4ffFiLSlAKXRcQwDT
	knJSSz/n7LZv0it5T/ftjtIuebJl7czc2zFsUDd24CRJeUPocLU7+reoKtBTa6f0
	XtwM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=duU2fLNhcLlDWXzXL
	9DP4xFoVyKdX7Tky84UGXFBjq4=; b=YReWJjb+ABsroIWkpB/VMyCiZZ5DlIW44
	9ZtVv0pz47Vbk+WomyGeYzSLjFQVXS+Z9beb8n02S7jvG8Xb2KOFt/2N0iuk39RS
	pipjUxKXuj1Rqypx6l65zVFXO5F9QqeRXOKe4n2TTodEc9X6PIX4ZXWl/NhC77WD
	7vEbN5l/yIUpjKQ9GjHQwQGdGS2yfamLzw9lKKhwlN+vvnwzQaHmTmCKxG+pnUx8
	ZaihjLIBjhW6i+tV0gku3HyTeTg4RrnYKSHEXyxgTRVTngz3y+6XxLzPbLJwcO0g
	FEk1Y79LT8HEhY8nFvS6neiMM5xWwS8oL6wMSekYHWRZ62Lem59Rw==
X-ME-Sender: <xms:ME54YTJ4lo8HJtj43RvXyCdApi4A6UBDpU53HvkGs76Dd5Jviregug>
    <xme:ME54YXI1HMVKsFovHjC-IjBoOym3MCQpIU-1BUvOPmTNbBRsw0LJZvA5rxAoxAEi_
    HVF_jSVc46VnBC2bw>
X-ME-Received: 
 <xmr:ME54YbuFf11NF3x4r7rPO3e0kpBcKeqWrwc1nB8kfj8a_ujJeYeVpmIxLw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvtddrvdefkedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggvrhes
    tgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeettdeghffhtdeivd
    fhkeeiffekleehteetgfeiuefhueffffehveevuefhieegtdenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:ME54YcZeuRh097tyVUct6qRaVkyzfao6PNuMQqgILX8XWvQMkdM9Jg>
    <xmx:ME54YaYC32CmOLU-oqtXS5lw6DQkdyO8oB-uN7pg2xMv-pgf5f5vZQ>
    <xmx:ME54YQDhQ4Emt9Os3IagyeRGCoKpJianMl8radtYYEtxpKn27QZN6w>
    <xmx:MU54YTB_0-J_gxxxqoFVUjh7YaNbhLcSsqjW-imLcKEqIo8APeHGtQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Oct 2021 14:51:28 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [meta-python][PATCH] python3-pyflakes: fix LICENSE,
 HOMEPAGE and RDEPENDS
Date: Tue, 26 Oct 2021 14:51:13 -0400
Message-Id: <20211026185113.32573-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 18:51:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93610

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 .../recipes-devtools/python/python3-pyflakes_2.4.0.bb    | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb b/meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb
index 641bb2667..827ff0b29 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_2.4.0.bb
@@ -1,15 +1,10 @@
 SUMMARY = "passive checker of Python programs"
-HOMEPAGE = "https://github.com/dreamhost/cliff"
-LICENSE = "Apache-2.0"
+HOMEPAGE = "https://github.com/PyCQA/pyflakes"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
 SRC_URI[sha256sum] = "05a85c2872edf37a4ed30b0cce2f6093e1d0581f8c19d7393122da7e25b2b24c"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-prettytable \
-    ${PYTHON_PN}-cmd2 \
-    ${PYTHON_PN}-pyparsing"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.33.0


