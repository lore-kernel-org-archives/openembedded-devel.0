Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91047C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:05:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.8887.1678889115853621622
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bZYtkuc/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889113; i=@fujitsu.com;
	bh=buRxTEXFBhSgXDrP/pexIw5iaoumiSfeXREqX5LLL3c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bZYtkuc/jlWtYA1xcrujjeNV25boreMW/QMCprv9CszzYYfNZ1YJJwL2yk+J6rIsy
	 9Oz1imfr76Od4LwRQKy32zX0tx8G7Gvx0a9FCEFu6iabkT6b7bwpO184a/6/P/Na21
	 7JB96n61bOUciuMSzKCt7c3jWDgNwNktZAJehse5vLJTWlWz3MwQ1Gbb1IiAfkNz8T
	 gH7ro1kUadcpKOpqKbxslea5Fah+GHpIxG8qrS7itekhZ9DZHoPfSLsFh8V+AeIpWr
	 TtpXleIae6YViHiszYy12tz8IaoHfZAggP5XHufTwZFmxqRLOE0J+Nwag9vL2XNXae
	 kOkscf1ELAZmQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqDvzgmC
  KwdRNEhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0b3nl3sBV18FZ3/+lkaGNfwdDFycggJPGGU
  ONgm0MXIBWRfZ5JYfOk/M4Szh1Hi5Oz57CBVbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdA
  1YjLOAu0X1hDpjNIqAqMadrEVg9r4CTxNZFzUwgtoSAgsSUh+/BejkFnCU+v+1l7GLkAFrmJP
  FxozVEuaDEyZlPWCDGS0gcfPGCGaJVUWL25WYWCLtConH6IaiRahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhenFpWlFukaWuolFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGb0px2tcdjLP7/uodYpTkYFIS5f2zRiBFiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvvzOCKUKCRanpqRVpmTnASIJJS3DwKInwpp4HSvMWFyTmFmemQ6ROMSpKifO2gCQEQBIZpX
  lwbbDovcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHcZyHaezLwSuOmvgBYzAS3mnScAsrg
  kESEl1cA07fFf15e856wOf6816lF2NvwednrV1BVNDoHLHz9jML/BefzYjI1W85epSe32/+zQ
  LTD7SY1kTnlb7JrsXxYbsi28ehtbP3IK/Yjfof79YhSvbuBOxtDXE74s2S1Zma6xddNN90X8i
  /YvvFp0Z8HEnNchDz0q5Zcs/Fib+avHbbbhZ3bn9V16y3ltfdJuRBlu8FL2XfP5Otfb8KterC
  siv1hMdWtkKd2ZuFTntf5huwVvXPIjxN2LNiY5FXcfv1Uh9NeX++qiqUEHdPVbb69t8+7RVgi
  UY/t+eLHOc88ZIheXTGUJfye84nDvLOv4jreMpw4+nLMzvT5Wdt39+BDjrQx39htbiBpnbZpY
  2NmqxFKckWioxVxUnAgAZ7eA1lkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-728.messagelabs.com!1678889112!51041!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22691 invoked from network); 15 Mar 2023 14:05:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:05:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BF5F91001A7
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:12 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B35E8100043
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:12 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:05:11 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 44.0 -> 45.0
Date: Wed, 15 Mar 2023 22:04:42 +0800
Message-ID: <1678889082-20604-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889082-20604-1-git-send-email-wangmy@fujitsu.com>
References: <1678889082-20604-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101542

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    53ee89b Merge pull request #1299 from zhuyj/dmabuf
    95507d0 Merge pull request #1311 from EdwardSro/pr-pyverbs-tests
    087deb5 irdma: Add support for ibv_reg_dmabuf_mr
    6644617 Merge pull request #1309 from hz-cheng/master
    fe9e480 Merge pull request #1304 from EdwardSro/pr-tests-fixes
    5c9f444 Merge pull request #1303 from EdwardSro/pr-mlx5-dr-steering
    8f56a83 Merge pull request #1310 from joshuafried/mlx5_dr_bugfix
    638ace8 tests: Add test for devx DBR-less mode data path
    25a4bf0 tests: Skip CUDA tests if there is no CUDA device
    5dad658 tests: Add set and copy modify action of metadata

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_44.0.bb => rdma-core_45.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_44.0.bb => rdma-core_45.0.bb} (95%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_44.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_45.0.bb
similarity index 95%
rename from meta-networking/recipes-support/rdma-core/rdma-core_44.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_45.0.bb
index f5b80c712..ed1f7c94a 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_44.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_45.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
-SRCREV = "91392a91eb41affee3bd75dc7d03eb86b4854aea"
+SRCREV = "53ee89b4abb1463e7ae713103f552b2bef1307ce"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.34.1


