Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB008C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:10:39 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.18001.1658916618418100572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pbH5T2pu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658916616; i=@fujitsu.com;
	bh=X+9Mkt9VNtXMgPm9KIl0w6O8ustCdAndokQLmbWLVkA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pbH5T2puS19Mdt29hFOJydL7B0buoEAvJbE4lq4WNKvEspj+oZTm65cjAYeonw+F9
	 MvgA+D4HYsezpK5if1UsjiqOqI1n+6kPm0o6Qd1MVBaIpJ6ezCDlXZ5sODMsFO/7C8
	 AtsOioGmHCXe8Uk1/MH1NhuGe/avDWrWQsMwIg7wfgawnxS9Gxf5qAoLkbTET6R7Yo
	 P1ycS5mZtNAu+kjX6LxLAjrkuRDyPS37RSh4YE7kZZtRgil22w5Nn5EAVrdnvnxd09
	 JaHKSKwqhTGp12n7PbojRXeVvoh6w0KBoIDA7/yryi/B5bZIgyeV7w8TMHxMQQDyvd
	 6v4Xj//5VOOMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqMvB/zD
  JYMM7CYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP9hw1MBa84KlZPDmtgbOboYuTiEBJ4wihx
  b+VGJgjnOpNEQ/cfZgjnJKNE46/brF2MnBxsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1zDD
  mILC7hLfDq5jQnEZgGKT135FayGV8BNYvK23WBxCQEFiSkP3wPFOTg4geq3bBQFCQsBlbQe2M
  IEUS4ocXLmExaI8RISB1+8YIZoVZI4seIj1JgKideHL0HF1SSuntvEPIFRcBaS9llI2hcwMq1
  itEgqykzPKMlNzMzRNTQw0DU0NNU11DXSS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDN+UYkamHYzL+n7qHWKU5GBSEuV1f/sgSYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  16Oh0lCgkWp6akVaZk5wFiCSUtw8CiJ8CbzAqV5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKi
  XOmw5SJABSlFGaBzcCFteXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzOoBM4cnMK4Hb9Ar
  oCCagI7YoPAA5oiQRISXVwLRh8RbmWdbRs3n+HvjCt/7QnZiJevf2XDg+feMFZb4z9YyNfMzS
  ZUUzBSZue2t9YrL52kPNzxRrXWL/P/25/kTi/q//fhz2SC29IW6c/c09aGfOki9v4k3WBMf0T
  VSp3v01QVn8c8rWay9/3puY7DNFS3hTQeyWmh0+K2Rj/yUwa5Ykun3xvvXpWrCE2dt+QwuL7K
  4PZ8WthO793JUeMMPo0U3Nt8lH7C2y9B4LGqxfnC2iem6Xu19QnMgv5wXWnb2n21PMLn+YqhT
  +vmm5lfabL2XNx4+UePbbi53t2lO2Jr//yOZfs/SbY/p/MfluuX1nwfM9ly+ZnZx7nefhvceS
  sqFWxz92WE5/qVu4YpufEktxRqKhFnNRcSIA+Du5NGYDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-585.messagelabs.com!1658916616!130360!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18593 invoked from network); 27 Jul 2022 10:10:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:10:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F3A39100197
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E75FB100190
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:15 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:10:14 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lz4: upgrade 4.0.1 -> 4.0.2
Date: Wed, 27 Jul 2022 18:10:02 +0800
Message-ID: <1658916605-9446-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658916605-9446-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1658916605-9446-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:10:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98004

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Fix a memory leak when frame decompression fails

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-lz4_4.0.1.bb => python3-lz4_4.0.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_4.0.1.bb => python3-lz4_4.0.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.0.1.bb b/meta-python/recipes-devtools/python/python3-lz4_4.0.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-lz4_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-lz4_4.0.2.bb
index 0dd353bfee..ad006e61b1 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.0.2.bb
@@ -11,7 +11,7 @@ DEPENDS += " \
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "efdfec2175715bf2d814ed72a7a185406f3456464eb3f343db1b87ed813e039c"
+SRC_URI[sha256sum] = "083b7172c2938412ae37c3a090250bfdd9e4a6e855442594f86c3608ed12729b"
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest
 
-- 
2.25.1


