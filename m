Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9212C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 05:46:14 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.4771.1638423973781205358
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 21:46:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B25kBQV013243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Dec 2021 21:46:11 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 1 Dec 2021 21:46:10 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 1 Dec 2021 21:46:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ostree: use Yocto mirror
Date: Thu, 2 Dec 2021 13:46:09 +0800
Message-ID: <20211202054609.1130422-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 05:46:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94175

Clean up PREMIRRORS setting, the Yocto mirror is updated

$ mkdir ./ostree && cd ./ostree
$ wget http://downloads.yoctoproject.org/mirror/sources/git2_github.com.ostreedev.ostree.tar.gz
$ tar -xvf git2_github.com.ostreedev.ostree.tar.gz
$ git show f1155c8d283c3c85d74d5e1050b0dcf8198f750a --oneline
f1155c8d (tag: v2021.6) Release 2021.6

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/ostree/ostree_2021.6.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
index a80207689..9e0f7bc7c 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
@@ -17,10 +17,6 @@ DEPENDS = " \
     bison-native \
 "
 
-# The Yocto mirror has an old export of ostree:
-# http://downloads.yoctoproject.org/mirror/sources/git2_github.com.ostreedev.ostree.tar.gz
-PREMIRRORS = ""
-
 SRC_URI = " \
     gitsm://github.com/ostreedev/ostree;branch=main;protocol=https \
     file://run-ptest \
-- 
2.27.0


