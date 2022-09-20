Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CF9C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:12:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.7297.1663639930882523005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gLVZ71s7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663639928; i=@fujitsu.com;
	bh=MzfbjWAluWEkLSbLA7BDj23i4aPL4W9lD1ADgyOHikE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gLVZ71s7IHwe1LvKiQFee+1kUUaEnjVLuAExj7yEJrD2YJc+i5O693pG3E9KRA9nb
	 k1+4I3ljTlg0jpKXV+7khL08DjolZFxXIz/hO2zlOfEE9WRRPHlVpMJkWyU/0VaD+I
	 ALBCzxt+p/fr9YvlcfQKuLSJG7ecCVLKHGBxbHW3Ufiy2wh3RW3Q8hq6bzfmG3W4io
	 1udPnxuvHsk3KA3qEuLCPmx1lQbLMeSH+i/5cgO3qEgSEeZLI078fkFMAEgQoIBald
	 5fbAgxJXsAL7uQ3uc+hIuHp80ZIDf8FuBtvx/ur7GT1EeS1cPVDws/yPg3dANhE1hS
	 +tPDu8lCkyQsw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqFuuqJl
  s0DRR0+Li4aXMDowe5zauYAxgjGLNzEvKr0hgzXh89xNbwUKBij0PDjA3MM7g62Lk4hASeMIo
  MW31LDYI5zqTxLP7K1ghnD2MEuc/fWHpYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAUaJvSyNYDYuAqsTiyQ/BbF4BJ4mL8w+B2RICChJTHr5nhogLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyQapx9igrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TCrKTM8oyU3MzNE1NDD
  QNTQ01TXUNbXUS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMqUYkbrHYwd
  fT/1DjFKcjApifJy1WkkC/El5adUZiQWZ8QXleakFh9ilOHgUJLgtRfUTBYSLEpNT61Iy8wBR
  ghMWoKDR0mEl00KKM1bXJCYW5yZDpE6xWjJcfXKlb3MHDO/th1g5ujc33WAWYglLz8vVUqcN0
  UBqEEApCGjNA9uHCyKLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5g2XA5rCk5lXArf1FdB
  BTEAH3VBRBzmoJBEhJdXAlMl0s1h62UHLQ8YyFcUro5I3ZNjMDPLQW5j24OXJE2J9Dc8lg7gy
  OZ6d/fzzPtf3df63XMx2u3zT07h7uWfih7OHK8y91uez7mqe8+0a20ReLb4mR+YvggbJq2Sbd
  Kwjk0NZt8rOivgWUXJANfVnJpPM39+mxdH5B0wcC4sYT1QfeHbcsEX2VsZu33iPtVYSfBYqe9
  ZUFb7f4x1sI//Ed6d9pLRsm+DuzvcLVrL1CLeVtzu7zNi4aeabtT+8ZSbE7/D/tvnduQnz0vV
  UZasXv09QKY7iT6oQyd971fnqopUBj+8pPr091bbTYI755r/JE7YW3ZseN2Vqq9xcSc30I7tO
  9kwxT1XlWnQudPdVJZbijERDLeai4kQAOId4Q10DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1663639927!328977!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1022 invoked from network); 20 Sep 2022 02:12:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:12:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4D9A010019A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:12:07 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 41B09100199
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:12:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:12:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libblockdev: upgrade 2.27 -> 2.28
Date: Tue, 20 Sep 2022 10:11:48 +0800
Message-ID: <1663639908-26950-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98871

Changelog:
==========
  Fix typos
  lvm: Fix bd_lvm_get_supported_pe_sizes in Python on 32bit
  tests: Create bigger devices for XFS tests
  tests: Use ext instead of xfs in MountTestCase.test_mount_ro_device
  mpath: Memory leak fix
  spec: Require the same version utils from plugins
  mdraid: Try harder to get container UUID in bd_md_detail
  Add a test case for DDF arrays/containers
  mdraid: Do not ignore errors from bd_md_canonicalize_uuid in bd_md_examine
  mdraid: Try harder to get container UUID in bd_md_examine
  mdraid: Fix copy-paste error when checking return value
  tests: Wait for raid and mirrored LVs to be synced before removing
  tests: Make smaller images for test_lvcreate_type
  dm: Fix comparing DM RAID member devices UUID
  mdraid: Fix use after free
  ci: Add .lgtm.yaml config for LGTM
  ci: Add GitHub actions for running rpmbuilds and csmock
  mpath: Fix potential NULL pointer dereference
  Fix mismatched functions return value type

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libblockdev/{libblockdev_2.27.bb => libblockdev_2.28.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.27.bb => libblockdev_2.28.bb} (97%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.27.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
similarity index 97%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.27.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
index eff775c930..44b4e7daf9 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.27.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
@@ -12,7 +12,7 @@ inherit autotools gobject-introspection pkgconfig
 
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch;protocol=https \
 "
-SRCREV = "2a651c1366bc3a56982d97ebeec03744b5f9dcd0"
+SRCREV = "1412dc51c8f76bf8d9a6008228737db4a9a26d69"
 S = "${WORKDIR}/git"
 
 FILES:${PN} += "${libdir}/python2.7/dist-packages ${libdir}/python3.*/site-packages"
-- 
2.25.1


