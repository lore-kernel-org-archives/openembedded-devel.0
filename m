Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928CDC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:31:34 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.32366.1641825092942335856
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ykpR25qg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641825090; i=@fujitsu.com;
	bh=HGIBLT0uLwd9MwiU7aUFUD7i5w52wZUbQZZlUus4rcE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ykpR25qg7qmhd4pljKg4qqqP6VP2GGE2FYpf/XllVIfAmmgRJo5HEyVRCm4y2ikZG
	 MJno9hCuyfyoIM+JJRwGe4j8JEtD7C2Grc8b21XqkOd9oba38ika7IvvCW1oh9MAsw
	 b4l5icszWL42RHGqJuNQQH4D7SdK4trOOB3+noDu35J80q/c3V+b2xYXYsty2yi2/K
	 PmgY7vdQ2aWPS4EEdwUS8NPZ7P6CtVPyZwbTcLqdGnC/kShFAnyGxnbeZtURFwi5KQ
	 vJL3hHwi2WpbCu7ldZ3C5b6iWed1qIA6CK1JbqvcWn95MQFBUgqgYLZrWbma1MCU5i
	 W2g0HSbDNG2Fg==
Received: from [100.115.2.51] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 17/35-13695-2434CD16;
 Mon, 10 Jan 2022 14:31:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSdfJ+U6
  iwePfTBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a/3qesBZs4Ky5fWMrcwLiVo4uRi0NI4Amj
  xKqrSxghnAtMEo1HVrNCOCcYJdb+ncDcxcjJwSagJjH91g1WEFtEQF9i6ew9YHFmARWJF7972
  EFsYQFLiVeXroPFWQRUJdaemM8CYvMKOEm0XF7PCGJLCChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0SqpKDM9oyQ3MTNH19D
  AQNfQ0FQXSJqa6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBIZlSjHDrB2M
  s/p+6h1ilORgUhLl/e94J1GILyk/pTIjsTgjvqg0J7X4EKMMB4eSBC+DE1BOsCg1PbUiLTMHG
  CMwaQkOHiURXg1LoDRvcUFibnFmOkTqFKOilDjvI5CZAiCJjNI8uDZYXF5ilJUS5mVkYGAQ4i
  lILcrNLEGVf8UozsGoJMxbADKeJzOvBG76K6DFTECLkzlugywuSURISTUw2cS8iDBmvb9GWbm
  y6+L2zQ97mf7d2iRkwDON+5aaUmxMNssivcJZgjv8zxQFXnFWYvPn+sHUvH6CstjaO+pV16Za
  7vgXE5Is4SYckHdIydeAZfWZRfNXm6hdmxmrbK564rBeHOehFOXQT7VG7V/XGT3Smp0YUF6gJ
  3+9/9/OBQ++VYX5+7dU3A9Lnb47NNXmzma3Rs1mbffYgww17QvC3t79O2eB7CSpf5a6G1hNGI
  98DAoILJ49tybK/m/ntFdLFqztXTifwWridsUcMXbZvnuT3x41iWN+tfO8a8qX23XOc45bpj4
  STd4WtPxNCdOZfxf+36zav3fOE9tSv/UnPnrpbpSvW9l5pyDXbW2XEktxRqKhFnNRcSIAB+AS
  bkYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1641825089!235336!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11355 invoked from network); 10 Jan 2022 14:31:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Jan 2022 14:31:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 77A04100456
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:31:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 672C010044F
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 14:31:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 10 Jan 2022 14:31:12 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.20 -> 1.21
Date: Mon, 10 Jan 2022 22:30:30 +0800
Message-ID: <1641825030-62903-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 14:31:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94716

Changelog:
=========
Fix issue with handling disconnect events issued by AP.
Add experimental support for DPP feature.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_1.20.bb => iwd_1.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.20.bb => iwd_1.21.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.20.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.21.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.20.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.21.bb
index c8f5bb12b..834c1d897 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.20.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.21.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "7d51e2ccabe7c500e44061ac725dbd4f6b0fb518b5e3de1681063d0f15d3050f"
+SRC_URI[sha256sum] = "bac891df91c605271e91b73cf0015e1ba86ff784347e53fc67601366859b3851"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.25.1


