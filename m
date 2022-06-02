Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B00EC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:38:27 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.1718.1654133898034660678
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RD9eNWV4;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654133896; i=@fujitsu.com;
	bh=yVObAGETmeRvRxb1EAi5SEYiPuZWfsA77agZMpfaSQE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RD9eNWV4UQ6tzpw0zAWfAWKSjWOh+/Yshspp6f2wiS2OQq9CaTt88tvWkWjctI/JV
	 Qh4ZV0a6b2JL9v+WnCZkxm9xBYS6O7dmEi9MlRzwX6GroSifclYQp5C1/H97wzD0FQ
	 f7XUFePZDeF48EaqY3XJK+luH4OYexM8OE/1DfwNOXRtL78c7hHSpbnzdftFV1VMGj
	 9JS5Ike64BVVWkaAoHWJKu4cvpZgPELe8H2sDCfW0knifkSFlxhkQhgviUUDpy0BDW
	 UhV4OY7I/LR2ZkO2ypYey6gWjPvKsfwvMSkoXW0K8Ugx7L3nHc36Tj0sq/U0I5jizD
	 d16F/r1VGkCPA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxSbddZEa
  SwdM3ChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPgy9YC/5yVux81cPWwDiBs4uRi0NI4Amj
  RO/6XtYuRg4g5wKTxOMAiPh+Rom2hWuA4pwcbAK6Ei9+LGYBsUUE9CWWzt7DDGILC/hJzFh9l
  hHEZhFQkdj8dAo7iM0r4CHR2tYAViMhoCAx5eF7Zoi4oMTJmU/A5jALSEgcfPGCGWSvhICixO
  zp8hDlFRKvD1+CalWTuHpuE/MERr5ZSLpnIelewMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU19h
  Y19xEL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMjMPBSihW9djC+WvFT7xCj
  JAeTkijvTsfpSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeD2EZyQJCRalpqdWpGXmAKMAJi3Bw
  aMkwpvHCJTmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqpQ47yWQGQIgRRmleXAjYBF5iVFWSp
  iXkYGBQYinILUoN7MEVf4VozgHo5IwbzjIFJ7MvBK4Ta+AjmACOuLatykgR5QkIqSkGpi8u27
  dYvu/Z5rZ5eC5QicE53V/bbGfcpn1rsET5zCvzJmTJl89csrog5h5Uk9IZULFqzsyC/hObOxe
  pmGuVsis++DgUnP+nk9sHccvZBVsFrM1F/xz7lrcgUu7y1/dPGNbL788L+uvXbVR3KS6sEkip
  0Kr+hsSytSq+s6/mnMrMODiN0E93RvXKkIerWSeJWXiH3dU6LbclisXEt68KdKwTLom7ffw6t
  x+lz31toI7dC+tOMTGwMiZITXr40RLj6W7HwhNuu2ll3xur+ec6IA89XeHnJbvPZPPo154eP6
  cMwoqNpser/JcyKOuoHnIm2c5R++k33uTGDR2f3gz+SWH3qYFa+c8uvvnzde4xi9nlFiKMxIN
  tZiLihMBfULn/kMDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1654133895!92572!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3990 invoked from network); 2 Jun 2022 01:38:15 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 01:38:15 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 35B83100353
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:38:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 28F8710032A
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:38:15 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 02:37:58 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cachetools: upgrade 5.1.0 -> 5.2.0
Date: Thu, 2 Jun 2022 09:37:46 +0800
Message-ID: <1654133866-29409-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:38:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97374

Changelog:
=========
  Add cachetools.keys.methodkey().
  Add cache_clear() function to decorators.
  Add src directory to sys.path for Sphinx autodoc.
  Modernize func wrappers.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-cachetools_5.1.0.bb => python3-cachetools_5.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.1.0.bb => python3-cachetools_5.2.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.1.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.2.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.2.0.bb
index 98a7f3d8f..35b338ca8 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.2.0.bb
@@ -27,6 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "8b3b8fa53f564762e5b221e9896798951e7f915513abf2ba072ce0f07f3f5a98"
+SRC_URI[sha256sum] = "6a94c6402995a99c3970cc7e4884bb60b4a8639938157eeed436098bf9831757"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


