Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44175C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:03:08 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.103483.1683540180157226764
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HOOvjj4M;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540178; i=@fujitsu.com;
	bh=5HwhJrKjessjLvJ747oRyoRyqgqK5P57m8T2LieWpxE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=HOOvjj4MRQZG3s+xMA0vlmIVy1pcCEVV7azBNpu032XxSvAW3X3wpRK01QlaThLPn
	 VUTMOPl+oA1Poh1r4yNsjer+SVzkohyihELbaQh/SBX9Kp63YBTHh7bcOqsU8zw6iN
	 mMB2fTiDO7cGBhrA3OM4UDH1TZDOzw2n3h2daiXh8TXi09/UG643z29pv7J8Ihe3xa
	 k5NR3Qvofyv3JgFSUmrKwyjBxA4k629d3fChRhzVzcu/nii/fheSY5DrLlLqGVue0P
	 orGNG0hrnzCinXkRRd/jIb6Q9azF+2naB+IbYRv4KInsb50RI+zog+IDVrj9Wy95UP
	 MUl03TQQYhrFw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpHvpRES
  Kwa4OdouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNr50u2gibOirYZU5kbGJdxdDFycQgJbGSU
  +NvcywLhTGOS2LK6nbGLkZODTUBCYvrek+wgtoiArsTHD3PB4swCKhIzJh9hArGFBdwlHi9fC
  1bDIqAqseHEX2YQm1fASeLU8oVgtoSAgsSUh+/BbE4BZ4mzNx6AzRECqnn0+wwbRI2axNVzm5
  gnMPIsYGRYxWhWnFpUllqka2ipl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFd
  cmZuck6KXl1qyiREYFCnFzDd2MH7e+VfvEKMkB5OSKK/pwbAUIb6k/JTKjMTijPii0pzU4kOM
  MhwcShK8bdsiUoQEi1LTUyvSMnOAAQqTluDgURLhlT0ClOYtLkjMLc5Mh0idYlSUEuctPQ6UE
  ABJZJTmwbXBouISo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeapDxPJl5JXDTXwEtZgJa7H
  85HGRxSSJCSqqBafHaH01mrz5vldxbyiI6xzni4M0Xe0ts8oLVii/bu0u9+2kfLSl+T/KiJjd
  T34oJHwNFq2ZO9TvCdKb+hdkm2YWKLdxuv7fssz7m6efDlpZSPGV1C8flI7UtSuLLf9X2/dp4
  /LtS6t87GW2RSe8u8sVv6Xj2uWfvQ+mWZ20nHfJOKu0+YFY0UaBKWf/sN+6Jnfbzo4tWBh29J
  yw/7fVdp3mWjTle3AfCHv+ezqDy5t8HL6bbE3M5nHyXHJAtWsoVOD+VxWJjXX5d64OJln+sDO
  RypzitYTh/ZmK75KbE1tkSy2Y73JmbHnTyGNNSFqY/U703zzrdy+DZ7FvcIQLU4jl74hazFZJ
  dXFtyVTcosRRnJBpqMRcVJwIA7pETQAUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1683540177!504314!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16835 invoked from network); 8 May 2023 10:02:58 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:02:58 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B9BB61D2;
	Mon,  8 May 2023 11:02:57 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E04B41C2;
	Mon,  8 May 2023 11:02:56 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] googlebenchmark: upgrade 1.7.1 -> 1.8.0
Date: Mon,  8 May 2023 18:02:41 +0800
Message-Id: <1683540162-25172-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540162-25172-1-git-send-email-wangmy@fujitsu.com>
References: <1683540162-25172-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102388

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{googlebenchmark_1.7.1.bb => googlebenchmark_1.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.7.1.bb => googlebenchmark_1.8.0.bb} (90%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.1.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.0.bb
similarity index 90%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.1.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.0.bb
index 1a565636d5..209f51ea3d 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.1.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.0.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
-SRCREV = "d572f4777349d43653b21d6c2fc63020ab326db2"
+SRCREV = "2dd015dfef425c866d9a43f2c67d8b52d709acb6"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


