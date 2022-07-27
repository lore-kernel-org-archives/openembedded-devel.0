Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB65BC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:10:29 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.17870.1658916622076110818
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LmkSYYie;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658916620; i=@fujitsu.com;
	bh=aNZHZ9k5UV+y8ncFnfMZZ3cDCZz+jnJqIZNStc2BAqE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LmkSYYiemYZ00595NjzBwE8bkNaL1kLzoeK1doiBpYnyq6UqX9eedch0W29aQzRPG
	 BUnNXzZWywOjWmY8X0nYoX1rV7V+mp1J/wNQqp5k5CtWlYIaE+Ge+jT4B3b7t76mfv
	 pvxAUFrvmvQeoAIGHtll0BNNjUV2wBhtBUK21GxyFJ/l6wqJQLa1I6xw5NWZA4NFyN
	 N7erBfzly2FbX2R7YOdg3TtpZLxdFu7suY7VEklEqIS7CCsY7bPFhB/auc3EwuVG8I
	 yLjpZtiRnbisJ6TyVILdZ7jG7eoaUNXYC6aRTLl3ttSLlU4KVHnKizL0tagxUl780Q
	 85LHtJ1VuSVGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSZeH/2G
  SweVeZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP1kx7mgiecFb2PFzE1MHZxdjFycQgJPGGU
  OH5jHxOEc51JYs+Z3VDOSUaJN4dmsHQxcnKwCahLPL75mhHEFhHQl1g6ew8ziM0soCrRfXENe
  xcjB4ewgJ/Evz28IGEWoPD6D0+YQGxeATeJW1NegJVLCChITHn4nhmknFPAXWLLRlGQsBBQSe
  uBLVDlghInZz5hgZguIXHwBUyrksSJFR+ZIOwKideHL0HF1SSuntvEPIFRcBaS9llI2hcwMq1
  itEoqykzPKMlNzMzRNTQw0DU0NNU1AbIM9RKrdBP1Ukt1y1OLS3SB3PJivdTiYr3iytzknBS9
  vNSSTYzAEE4pZkndwdjX91PvEKMkB5OSKK/72wdJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR49
  3I8TBISLEpNT61Iy8wBxhNMWoKDR0mEN5kXKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKX
  HeuyBFAiBFGaV5cCNgsX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvA8gUnsy8ErhNr4C
  OYAI6YovCA5AjShIRUlINTOLhNv+/Pb55q3XSqdYLa/xtPBjudD97/u6V2YZPgZd/n25Y4cb3
  13u98xkmBqtXwXwMunteBJTzbL185l3z4n3Hd15wYDzmM+edZrEbk1cx058vWb+Ypx5TuiRiF
  Sx9+PhnmYZXPI/XdKavzH3bPLU2k2uHb4ZYbJpz9G7La+71QlYr/1teT8xiZmpI/rf25cPCnG
  udCndT3h4xy++7mfnl3gER21v9dx7ZSM2WSl93NH+bwxTvNwG789tEnhvwhD6P8OuraE+Y2O+
  gGW8h53nK7voybVFb5t9LJKfp2561Es/a8FJwcejpY5Neb19hc2i2rYTOjg8/I95v+X37TpGA
  y7eaL1mCfjKN833bcpRYijMSDbWYi4oTAf6h26NoAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1658916619!33007!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5019 invoked from network); 27 Jul 2022 10:10:20 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:10:20 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 836201000C0
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 76CBA100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:19 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:10:17 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.2 -> 4.21.3
Date: Wed, 27 Jul 2022 18:10:04 +0800
Message-ID: <1658916605-9446-4-git-send-email-xuhuan.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:10:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98006

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-protobuf_4.21.2.bb => python3-protobuf_4.21.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.2.bb => python3-protobuf_4.21.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.3.bb
index b8287a88e5..528f99ef20 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "863f65e137d9de4a76cac39ae731a19bea1c30997f512ecf0dc9348112313401"
+SRC_URI[sha256sum] = "9130759e719bee1e6d05ca6a3037f7eff66d7a7ff6ba25871917dc40e8f3fbb6"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


