Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146D5C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 08:05:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.8235.1672905898083975629
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 00:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Aph2JAVc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672905896; i=@fujitsu.com;
	bh=fDwuFdA5FXw/iboohsXrw7AcSk73FWzuStWSWxBi9YI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Aph2JAVceDiJXipqo8mD3W51AcygpydwhqBpqv3qrHdy+IuYEMKZCdAKSAsJG8EGu
	 lx7by7aWVW+xrHa4uigJav8SjNkvZE/OcPoP2p4AV0u0/ID0vYx53BDHvanswXRHYD
	 sGoW+u+h82sCmpUwLLH23/W5DSxnc8XZ0wmksKdnNMvPOdPkd3NouG4WYGKLZbF6uc
	 3iAG4Q3rWFJZwpd2c7210LNWoWX7/3bV2kxr67z4ywt1cJzZp6EBwNOGH1xJiIravp
	 3XZ7v+MCeD0E48meikMclcBOwwntEA4pELA748pqmrKUKlxWNkCt4o0RwU1dCZWtGm
	 6a9iKVx7EALhg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8OxWXd5y7Z
  kg6c9shYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bE1TfZCqawV7x/6NXAeJqti5GLQ0jgIaPE
  6dunGbsYOYGcK0wS3StZIBK7GSX+n3zBDJJgE5CSuHH/PxuILSKgL7F09h6wOLOAisSL3z3sI
  LawQJzEvV2/weIsAqoSr16cZwKxeQUcJXo614PZEgIKElMevmeGiAtKnJz5hAVijoTEwRcQuy
  QEFCVmX25mgbArJGbNaoPqVZO4em4T8wRG/llI2mchaV/AyLSK0aw4tagstUjXQi+pKDM9oyQ
  3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAUU4pT3HcwHl/2R+8Q
  oyQHk5Ior4/L1mQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryuTduShQSLUtNTK9Iyc4BxAZOW4
  OBREuE9nQ+U5i0uSMwtzkyHSJ1iNOa4u3DvXmaOq1eu7GUWYsnLz0uVEuctAJkkAFKaUZoHNw
  gWr5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO+AJnCk5lXArfvFdApTECnhCzcCnJKSSJ
  CSqqByfl1ygLe4xoLzt0rluUtcJqavGnrJsviEh6JLfdtazbYfBE9/kDquafF9uX8a9eKL9L6
  uVvRVGbd+aQvy/3dLPtjTK79/ShQ/2yxZjonY2j0Q23fydKzW1bfvtq7eO7977dUFO4t2bmU+
  f/jOHHtI7UiwUdecfybunl9z3UPv//2BsKXG7w1H3G08RhMeeDsU3D2rHSIefLn/n2qy15cjp
  /NuULxFZND7fnNgvunqE6OfS3KYvlcaFJ4u0eTlG79mf0P4kPdbq3m6zDLXf9ogclCnvNfdP7
  25dz8e+Kvkca824d+8zqf2/a70C9U7aRIVvtxkYxp5+tdWwNCOW/sulekyh20R5dXSjnx5G1/
  XyWW4oxEQy3mouJEAFlGojhSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1672905895!65709!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4276 invoked from network); 5 Jan 2023 08:04:55 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Jan 2023 08:04:55 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E9AB7153
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Jan 2023 08:04:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DD1F1151
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Jan 2023 08:04:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 5 Jan 2023 08:04:53 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] dnf-plugins/rpm.py: Fix grammar when RPM_PREFER_ELF_ARCH doesn't exit.
Date: Sat, 31 Dec 2022 17:21:24 +0800
Message-ID: <1672478484-3244-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 08:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100409

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index 9f961882a..ca2b20108 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "b0d80b7129f1d84cc563a4098d869e7420bcf4bc"
+SRCREV = "8d21f52577aa03958732a5a346a678c699e98cb6"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
-- 
2.25.1


