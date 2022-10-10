Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60174C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:37:03 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.4000.1665391010271825477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GPcv/aED;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391008; i=@fujitsu.com;
	bh=X3QRmjPMnXMy5AuhTxnATKO72Yfbsa6vvPSct2Zw7lk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GPcv/aED4CDAltqTotaz85mTrJzP5ZHt40cPqnLWR507ANyR/vtjccSMKWbust8dz
	 b3r2fUOlQVxUxfawdmZRG7KvgnGZuHttwysgBia2NpIMHPCCV+7Cot3aYwEB445OMP
	 BGHW0IWjGyKw5SSVdsInDgOK6Xg4HNb8KVIV4S492Y4V+sOKuyBgmb11w1W5eql3xD
	 zZzEx9hgytsTLmujKQjJd6XKtUKGoif8ACvUP5OOvxs36hx9XUdOjN7PNxVCuwdNBl
	 OQCo14xMQainFxLwyEqm68vT4U4f/WaiyK04iHViBZaPzIRa9Q9D4hS87i+FWHmo3r
	 O/sCzFFqoMsuA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqDv/pnO
  yQeNXVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePLuv/MBQs5Kz5PWs/WwLiLo4uRi0NI4Amj
  RNurbawQznUmiRd75rBAOHsYJd6tW8vexcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgLBEktOd4LFWQRUJSYcegdWzyvgKLHy1nawuISAgsSUh++ZIeKCEidnPmGBmCMhcfDFC6
  gaRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9g5J+FpH0WkvYFjEyrGG2SijLTM0pyEzNzdA0NDHQ
  NDU11LS2BlKVeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYGimFCeX72Dc
  vu+X3iFGSQ4mJVFeg0POyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeFdfBcoJFqWmp1akZeYA4
  wQmLcHBoyTC++AiUJq3uCAxtzgzHSJ1itGYY23Dgb3MHDO/th1gFmLJy89LlRLnXXADqFQApD
  SjNA9uECx+LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5r10BWgKT2ZeCdy+V0CnMAGdcvK
  qE8gpJYkIKakGJseTT1NnHdPSj/fbusr2R2ciy7bqJN8Zqw8ekD/DLir/dnXKxHapu+ta/p3m
  Uq1e9qSY9Tvju83rMs8G/5RbVH7g4GSVOP0f2aptXFeXP/p3WNJH6vr/tmXhD0/Ga226W6Ibs
  3Dn6m29VZWSrQsOua9blrK+7PMBniVntP5+rgs9tMn7/8PmbbzxjJPFrtodfXH0gMnvqiM/f+
  kVbf5Xp6XervbzZrz+868VX2TPv5x5vtbmraiR8t5Ye6ZNV2zYtB9wHpQ6Nauxs6XV0OtHm72
  m0OFdz+ViNFl2HZvsLvtKg+HAFC9jzpo3f7Jv6J/mn3N2lnMDQ0PKws+nzLjOMF9YWpY6szxa
  +sm6y1XrxR8osRRnJBpqMRcVJwIA80Nc5VoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1665391007!2257!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13020 invoked from network); 10 Oct 2022 08:36:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:36:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 47740100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:36:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3BC55100043
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:36:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:36:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfstests: upgrade 2022.09.04 ->
 2022.09.25
Date: Mon, 10 Oct 2022 16:36:28 +0800
Message-ID: <1665390991-7978-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 08:37:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99118

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfstests/{xfstests_2022.09.04.bb => xfstests_2022.09.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2022.09.04.bb => xfstests_2022.09.25.bb} (97%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.04.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.25.bb
similarity index 97%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.04.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.25.bb
index 90f49f76d4..45a1578be7 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.04.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2022.09.25.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            "
 
-SRCREV_xfstests = "890c50823b6430bf0929d9a57e76b9b4d6bbc25f"
+SRCREV_xfstests = "e5555e75ba199d153f4dfb81496a891263ec9bdd"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


