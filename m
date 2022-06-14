Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7DEC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 04:35:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.2377.1655181337889705496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 21:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=icRinv2S;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655181336; i=@fujitsu.com;
	bh=SCakDewmKUOV23rLdq2rfI25uOCW26LnBuFe3lCv63E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=icRinv2S2goBL/F+ncg7zooPK7WC4xwnk1L41IVOZqXzU8JV+k7BTIH3Y/7D8vQlk
	 TbrqbnV8gFyrQe+an7Kzmc57GtM5awH3p2ntX1CzrbM3mhX40oTSE05Bjv255AMLfe
	 TIOjNfnkueGKOBcqK3cn4QN1CYD8CQOcRmrmvn42MgxaesRaCzi+URNcP5DsMiYahc
	 JfSnQ9Vfkj1ED8tUPehIpyouTDrkCmwqG+oMDYhnT1etInbdHIYNubCRe8equKVNVM
	 Ry+5Xt5BszK6E7X0P4Q2EKkKdpaWmCV+BqNCBookpf4aCroVy2hkulV4YtcSPituOJ
	 /KfLNwBs7RQQg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqCsusCL
  JoO+SosXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFlYgtrQTtvxY59M5kaGO9zdzFycggJPGGU
  ODgnqouRC8i+wCTx7dtudghnD6PEiuu/mECq2ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhZwl1j9+TQLiM0ioCrxctcpMJtXwEli6t/LbCC2hICCxJSH78F6OQWcJZZtOMkEcYWTRN
  ePW+wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiRkztkHNVJO4em4T8wRGwVlI2mchaV/
  AyLSK0SqpKDM9oyQ3MTNH19DAQNfQ0FTX2FLXwkgvsUo3US+1VLc8tbhEF8gtL9ZLLS7WK67M
  Tc5J0ctLLdnECAzilGL1oB2M31b81DvEKMnBpCTKe2n38iQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErwtnCuShASLUtNTK9Iyc4ARBZOW4OBREuFd/A+olbe4IDG3ODMdInWKUZdj5te2A8xCLH
  n5ealS4rzq/EAzBECKMkrz4EbAovsSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHe73xAU3g
  y80rgNr0COoIJ6IiNJ5eAHFGSiJCSamBa8fxO0MrXjy7kXZY+pnp8DYN0PrNW99llYmf6lcU+
  TT5fYzt5zR2+ib9+7Njy7DlnGaN3g/mWwqf8BRY/fmT4ut3Qsn2QzjBLqvw6k8BdgxBjwednz
  rbuKtdTL3nyQ3H9vaQjyaEXn2kuWzDn87rXFVbqm28/PLr6998/d5mnXvhrPD3qwNr8978PLk
  zdzXFQ1SRrjfqnuu6dgurmL6OeuCx51rhFJW1Gfq1jZ5TW47XFMqaNjkZPD/0S/+5ZXvVAuMA
  zeG0Gj/H/nCtbzNcKbpk8dafilLYZFbWlq/+9OfkvZubClP/sMgLRhjriT+3eiTa9fvdGvuME
  Z5RcR3fvk42Pd+xYsV178yOJXfcyi5RYijMSDbWYi4oTARpM8uppAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1655181335!25830!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25828 invoked from network); 14 Jun 2022 04:35:35 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Jun 2022 04:35:35 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E021C100184
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B321D100189
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 05:35:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 14 Jun 2022 05:35:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 40.0 -> 41.0
Date: Tue, 14 Jun 2022 12:35:06 +0800
Message-ID: <1655181307-30868-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655181307-30868-1-git-send-email-wangmy@fujitsu.com>
References: <1655181307-30868-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 04:35:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97501

Changelog:
=========
Merge pull request #1178 from yishaih/mlx5_misc
mlx5: Fix check for SQ overflow in bind_mw
mlx5: DR, Add support for modify IP ECN action for CX7
Merge pull request #1175 from zhijianli88/print-style
Merge pull request #1176 from EdwardSro/pr-extend-wqe-class
Merge pull request #1174 from EdwardSro/pr-pyverbs-read-write
Merge pull request #1170 from Hakon-Bugge/rdma_xserver_xclient
Merge pull request #1166 from EdwardSro/pr-tests-fixes
pyverbs/mr.pyx: Make MR and MW print style identical
pyverbs: Extend segments format of WQE class

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_40.0.bb => rdma-core_41.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_40.0.bb => rdma-core_41.0.bb} (95%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_40.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_41.0.bb
similarity index 95%
rename from meta-networking/recipes-support/rdma-core/rdma-core_40.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_41.0.bb
index c567e3314..e5ecc5cd6 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_40.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_41.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
-SRCREV = "a3e69268892bbd5ab30123748e89a26509a25ac5"
+SRCREV = "467363efbc0fea706752c1ba7a21c313823017e7"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.25.1


