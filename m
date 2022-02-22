Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4D4C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 23:45:24 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.1036.1645573522519393193
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 15:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lMFyZr0C;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645573520; i=@fujitsu.com;
	bh=02nLqFvHcfLIOCbI+e9GPUTmXhK+6YzPtQ/ifgovEvM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lMFyZr0CnANXs+ElUqtuVbrEaI+w6Zc3GooQ392Qv5e1p8pI4GzrE11UMoHetHVbB
	 ZJOzEkUVhr2yBK5rFCFzLEUAWJISQmIrnitgZ3jbbN7eLlH+puSIDep2oski7R/bsB
	 0j8ZNkzAoiOKlzkn+MM7Gbdz+NfiRqSwRKrgy785DTmK5vd1g77Oih9YIWj9a48Ds8
	 iLjoKCDOlwXSp7pgk7hB46rMbX2cDVCHJHBJVWaVFg0b3e6TnUe/6+uJIZh37+b5SA
	 K1dlxh7u3NTZgmy+kD7gZZe/p0SYB5/GQqZTJNIHsIJMVwUrOH8Nx//d01utUZLeol
	 YoILrDxG7ciEQ==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 D7/75-13301-09575126; Tue, 22 Feb 2022 23:45:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8MxSXdCqWi
  SwcZPrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8brbctYC85yVny694upgfEsRxcjF4eQwBNG
  iYtfP7NCOBeYJK69+MwM4ZxglHg4bRlTFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICjhJvH34Cq2ERUJU4ceMMC4jNK+AksfDHSzBbQkBBYsrD98wQcUGJkzOfsEDMkZA4+O
  IFM0SNosTsy81Q9RUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYx2iUVZaZnlOQmZuboGho
  Y6BoamuqamekamprqJVbpJuqlluomp+aVFCUCpfUSy4v1UouL9Yorc5NzUvTyUks2MQLDM6XY
  afYOxh19P/UOMUpyMCmJ8s71F00S4kvKT6nMSCzOiC8qzUktPsQow8GhJMGrUgiUEyxKTU+tS
  MvMAcYKTFqCg0dJhFelGCjNW1yQmFucmQ6ROsWoy/Hh0JW9zEIsefl5qVLivIYlQEUCIEUZpX
  lwI2Bxe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO98kCk8mXklcJteAR3BBHTElCwhkCN
  KEhFSUg1Mecukz5TfN8oqijn2Ssf23/ME53Wr39iFr/YUDtVL3VP55w+f8tZqf4NK5U+7Pv5X
  fLJS9Omhmm1twtK5m0R/7xAqbWsKEF4s9NDUxm26bnUsq94HJmnFLzKP5p4yFuQIWPgx1+fAo
  +V6bG5XEifVCrKy7BYsqvdUFJCqvmUS26KTvWB7tMJT35lHKzx2rNru5OjzzuR3n2OJaEL1oi
  8GD63W/nvR/GTV9tZ4zVnWB2yivF5K2Rv+qr4aeO7585UZsrLPD15NEbJoa/VbysKxO0tP77E
  P8wW730+cOAssK1Zbri0JufI15KHf8+p3q0JnuK/6J1Fy+brX+m+H0qd+jZyf3lRWfdpzUebt
  z9eVWIozEg21mIuKEwF4FtsqVgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-545.messagelabs.com!1645573519!34528!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12392 invoked from network); 22 Feb 2022 23:45:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Feb 2022 23:45:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9C72110044C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:19 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8F26310033A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:19 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 22 Feb 2022 23:44:58 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] nautilus: upgrade 41.1 -> 41.2
Date: Wed, 23 Feb 2022 07:44:45 +0800
Message-ID: <1645573488-27207-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 23:45:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95454

Major changes in 41.2
=====================
* Avoid cropping format popover in Compress dialog
* Fix "Move to"/"Copy to" from Starred
* Fix memory leak on tab switch
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_41.1.bb => nautilus_41.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_41.1.bb => nautilus_41.2.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_41.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_41.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb
index 330c361806..e9541a7150 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_41.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_41.2.bb
@@ -23,7 +23,7 @@ def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
 SRC_URI += "file://liportal-0.5-fix.patch"
-SRC_URI[archive.sha256sum] = "3e633098853711a3e96b12fe9228b3201816e554b2823f161e7d901a8880582f"
+SRC_URI[archive.sha256sum] = "872285b1c40a6ee418ce295ed115f5427da70907d822d95bcf51675d5498822b"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.25.1


