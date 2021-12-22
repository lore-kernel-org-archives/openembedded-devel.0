Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5A7C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 07:02:46 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.16465.1640156565354765864
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 23:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wTk9ezsV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640156563; i=@fujitsu.com;
	bh=4qomYYi26Ti9w+1o/a1Pd5VMmRHeTMWBlagP1Lv6DVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wTk9ezsVKshpiMdVvOYjCajWivgYgR5pxFNdTbv2Bjuk4TedBPeaELXN2d5CMwgYS
	 kZUNbiYouo65XPnQ3jYEdgiwJx+fm/fDm9foJSzJbZ6zp1o2NoraXLHarSYfnyw665
	 0GWAkbu0wGcI+zrpDk7JUMzu/MSFfpAiG4vAbCwf2jy+FpZwNIGADJ/WsEgCGyCMRz
	 7VOzedUsPMpO2QPHteKt1fm9A5veIXTzGHDcjSRd3nOk+uxyxs3CgFt0xszr14uoct
	 AGUiu1xN2zynsnkbzSDDtlqkW2h4BLQ8N2rLNUWN4wmyXVZmlCPA4RbBBO7OAUmE8b
	 5X83eVJ8HgNZQ==
Received: from [100.115.32.64] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id EA/63-23453-39DC2C16;
 Wed, 22 Dec 2021 07:02:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqDvh7KF
  Eg/nnLC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy7u5+wFCznrDj8s4e1gXE/RxcjF4eQwBNG
  iUmnXzBDOBeYJPacfssE4ZxklDgy+yFQhpODTUBd4vHN14wgtoiAvsTS2XvA4swCqhLdF9ewd
  zFycAgLeEgsusYOEmYBCjf3HGAFCfMKuEtcOVsGEpYQUJCY8vA9WCcnUPW0q0uYQGwhoJLupY
  vBbF4BQYmTM5+wQEyXkDj44gUzRK+SxIkVH5kg7AqJ14cvQcXVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0TirKTM8oyU3MzNE1NDDQNTQ01TU21TU0sdRLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuu
  zE3OSdHLSy3ZxAgM4pRi5ak7GE+v+ql3iFGSg0lJlJfr9cFEIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8NScPJQoJFqWmp1akZeYAIwomLcHBoyTCm3UaKM1bXJCYW5yZDpE6xagoJc47/wxQQg
  AkkVGaB9cGi+JLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5s0Cm8GTmlcBNfwW0mAlosVL
  4fpDFJYkIKakGpoMPhQxmeZVMvxX3VORTsKPawccHZskkJjhHlUr/lBQU3mbjWnrU3v/nJt6b
  Ln03uiesaJ+t7xO97+HDH/yHPDkt1x4U3cjapfqgdqWN9ZMVob8d77VOdQjz6wp6+ze/71jRO
  xZLhi3FD+6cnckgNJM93lPsacv7zKTC1ati2pbJvmg32MW+SPjfvKUzGF74r/S5rPXt/YmDxU
  YCn7JdGrpsmhhltRxutXD+1mA8rRtc1MUcn2WQODlhqeFJn9fva3+dkDCXfH74j+LCryoNO6f
  EbtsZs0lz5/wXx3pkNs/ImXaX5+9HyyyX2df7t56bJbGLf0N745pHk0N119VFztm9UnpBeIU8
  c+9FuX47aSWW4oxEQy3mouJEAAeMjCpdAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1640156560!97982!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12557 invoked from network); 22 Dec 2021 07:02:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Dec 2021 07:02:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 73BCF100193
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 07:02:40 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 66A5810018C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Dec 2021 07:02:40 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 22 Dec 2021 07:02:21 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-h5py: upgrade 3.5.0 -> 3.6.0
Date: Wed, 22 Dec 2021 15:01:18 +0800
Message-ID: <1640156479-18846-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640156479-18846-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1640156479-18846-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Dec 2021 07:02:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94481

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-h5py_3.5.0.bb => python3-h5py_3.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.5.0.bb => python3-h5py_3.6.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
index aad2f91777..5b0510f710 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "77c7be4001ac7d3ed80477de5b6942501d782de1bbe4886597bdfec2a7ab821f"
+SRC_URI[sha256sum] = "8752d2814a92aba4e2b2a5922d2782d0029102d99caaf3c201a566bc0b40db29"
 
 SRC_URI:append = " \
            file://0001-setup_build.py-avoid-absolute-path.patch \
-- 
2.25.1


