Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533B7C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 23:45:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.1049.1645573522559434938
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 15:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y/sDzJdN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645573520; i=@fujitsu.com;
	bh=v0Mr19vPLaxjd9S/CYYhPg5GP41yYvHTEH+ASPohhGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Y/sDzJdNDxoPAoDhsDcj1q19s22FvSv9JdApOJ34J0l82DoiekRI2DmtVuliZ1P3d
	 OFgDJpNj+qtEXAxHEV1pC5+bAVAV8mgPj3weTnirwvoo8EdaxHOhy1N21BBUO8WYmZ
	 90uzO1a2Paeb0iYdwLOjLdP/5lBJ+PjuFXaab/MnYmEtrSD1uPA9+vYKAN4nhBglkm
	 g1NkXS6rR+L9VU3z4Uyi6WtNNT8oJcP3jxzEQvlgEVJSpYsSnbZ91jK67ljMTPzFtL
	 Pb+TAZXrp2BO/mm3d0EECHaunZwRI78Y9m0H6tNLQR4KdHdMmn6sHTeIx2IqGkaPcz
	 lO7Lhex/YkBUA==
Received: from [100.115.35.240] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id B8/A6-12680-09575126;
 Tue, 22 Feb 2022 23:45:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSXdCqWi
  SwbVNLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8atzkUsBed5K67MXMvawDiTp4uRi0NI4Amj
  xLYXq9ggnAtMEita17JAOCcYJe42/ANyODnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCX6Ft9H6yeRUBV4t++vWD1vAJOEv83HgerlxBQkJjy8D2YzSngLHHlzzQwWwioZmbjHR
  aIekGJkzOfsEDMl5A4+OIFVK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJGplW
  M1klFmekZJbmJmTm6hgYGuoaGprrGFkDKUC+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzCQU4rV8ncw/l35U+8QoyQHk5Io71x/0SQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rwqhUA5waLU9NSKtMwcYFTBpCU4eJREeFWKgdK8xQWJucWZ6RCpU4y6HFevXNnLLMSSl5+XKi
  XOa1gCVCQAUpRRmgc3AhbhlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ884HmcKTmVcCt+k
  V0BFMQEdMyRICOaIkESEl1cA09ciXyBOJzpyx59dzBrKyt128/nXJUd//p3dM2fPba4bo5y/1
  bdcl9oelfrQp/60RWnWTRelX2fcfyby/H88LrGKY3fgn1IExYLNrRp/a2m0zBSedmrswZlvdl
  e0b5y1luanOEG4coDOVvUGB52jNQda6TQESi24svXhoedWUrVzL60StJgsy1ZhYHrZID19+If
  EBx+NttqcuTPy23rnz40lGjc17LUu2zPPRCk95z/J1fQfjs7b4Dr4envllp5VcpppumyiaUyN
  8M8vvfLnH17Kshr7Vny/IXWnbe/ukdLlSmrKI2dUDZWn5csG56e7hX5f8/K88XVzk9bQ72/bq
  V+nXiv/sEZjzUnH3k+NtSizFGYmGWsxFxYkAr1dqWWsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1645573519!44216!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22843 invoked from network); 22 Feb 2022 23:45:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Feb 2022 23:45:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B3E81100456
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:19 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9A4C5100446
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:19 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 22 Feb 2022 23:45:03 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 38.0 -> 39.0
Date: Wed, 23 Feb 2022 07:44:47 +0800
Message-ID: <1645573488-27207-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645573488-27207-1-git-send-email-wangmy@fujitsu.com>
References: <1645573488-27207-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/95453

Changelog:
=========
b2fedc4 rsocket: Make sure that the allocated memory is aligned
ebbdb85 Merge pull request #1107 from Sindhu-Devale/libirdma-12-9-fixes
a83619b providers: Move input validation for memory window bind to core
a274c9c providers/rxe: Replace '%' with '&' in check_qp_queue_full()
812ab81 Merge pull request #1128 from Wenpeng-Liang/clear_rq_sge
1a9b2db docs: Fix typo in pyverbs example
d498180 libhns: Clear remaining unused sges when post recv
d99f61c Merge pull request #1127 from Wenpeng-Liang/misc_bugfix
7307264 verbs: Fix description of manual for ibv wc read byte len function
c298130 verbs: Fix a typo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_38.0.bb => rdma-core_39.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_38.0.bb => rdma-core_39.0.bb} (95%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_38.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb
similarity index 95%
rename from meta-networking/recipes-support/rdma-core/rdma-core_38.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb
index da1e013bd3..48434aa584 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_38.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
-SRCREV = "02361e3b865995ce251923390df0d5a5c821195a"
+SRCREV = "b2fedc4b1b891afd2c26ebfd21f9e440e83c28ff"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.25.1


