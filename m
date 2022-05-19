Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9C7C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:01:26 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.4343.1652940079676667974
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dYmRHGFc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940077; i=@fujitsu.com;
	bh=8vgCo73p64LOuEVndSCeDvWECHEXyO1rCX1GZFQAuvo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dYmRHGFco8NPfA4IQxxEUqXw7LZMk8pzmwwRPuP+Ntyx9O9IzCsP8hwB4M4jjAhM4
	 4cal1u6HSafzIXRhcWYNgY8uqqU/uOCpcDtq0i4d7O6/3FMTtQlrQVBbfoKVjcS/Pq
	 xxaL6CDlSeTZ4ml8mbpjBkjiyXlmcSveQoU/TLmxgYsiYc7n4SPRWxDSlOcqq3UfYQ
	 sgVNEsQxiL55ng+wSM+zdeQLj/bepy0wWCyrLVFMGmh4p45/0w4TlZg1iAAW2YSlch
	 R61QFFZ6Q1cFp4S3olDKGtxTI8axqpqSOK5tT2dP2Wwe09Nil39tOEqDMu+HDRXoCx
	 a1/RdzapE8fzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8ORqKt7tzX
  J4O07HouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNp90KmgiauioUt01kaGOdwdjFycQgJPGGU
  uH3kAguEc4FJ4vuTk+wQzgFGiR9b7jF2MXJysAnoSrz4sZgFxBYR0JdYOnsPM4gtLOAj0flsK
  2sXIwcHi4CqxMk/xiBhXgEPia8X/oCVSwgoSEx5+J4ZIi4ocXLmE7A4s4CExMEXL5hBWiUEFC
  VmT5eHKK+QeH34EjOErSZx9dwm5gmMfLOQdM9C0r2AkWkVo11SUWZ6RkluYmaOrqGBga6hoam
  uOZAysNBLrNJN1Est1U1OzSspSgRK6yWWF+ulFhfrFVfmJuek6OWllmxiBIZgSrFbzg7Gj30/
  9Q4xSnIwKYnyuh9pTRLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwfv5BlBOsCg1PbUiLTMHGA8wa
  QkOHiUR3pZdQGne4oLE3OLMdIjUKUZFKXHehDtACQGQREZpHlwbLAYvMcpKCfMyMjAwCPEUpB
  blZpagyr9iFOdgVBLmTQWZwpOZVwI3/RXQYiagxbeUwRaXJCKkpBqY5m88NPG7hdwpZ+YZn4y
  f566pUdP5nbk1zyI8Mvpzo2XX7AcOpy+2dC77fzb/oNbkT2vW6Fb7HwrbZxLep2zWqmvGeW9h
  yqbAjUmnNyyKTy6Ze2Veb2Hbio5V5yb8Cro0+938wMiZN2fuihSN+XtB2bG1kL9R9aXFlpzP+
  +WzQg1SDp6etv39r+kyv3Z4eca+jpjxaePtPW4T1qWlv+LyXmIhF/7o5bdHj0s03uya/ce6er
  Oe0uI7KwqUWA+dj5XiZj/5IXbzK4cj8VsPr2af+PN68Oz/5ZpRSadnBGmfc0j4sWyV/C4Zr6h
  029XxgS3stvYrzI0Ofjj3LcFz71v3pHnslzoE455MtO15toQl7bISS3FGoqEWc1FxIgA+qgoK
  PAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-532.messagelabs.com!1652940076!118405!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27182 invoked from network); 19 May 2022 06:01:17 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:01:17 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B3509100193
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:01:16 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A704510018F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:01:16 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:01:13 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.5.0 -> 2.5.1
Date: Thu, 19 May 2022 14:01:03 +0800
Message-ID: <1652940063-24797-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:01:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97171

Changelog:
==========
 * optimize '.reverse()', see #177
 * allow negative (byte) indices in '.bytereverse()'

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-bitarray_2.5.0.bb => python3-bitarray_2.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.5.0.bb => python3-bitarray_2.5.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.5.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.5.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.5.1.bb
index bb80c4a04..bda2d96bd 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "5abed04adcd2031f6e714993d95223bf9ae85354c640c270b2ed6f46b83573ba"
+SRC_URI[sha256sum] = "8d38f60751008099a659d5acfb35ef4150183effd5b2bfa6c10199270ddf4c9c"
 
 inherit setuptools3 pypi
 
-- 
2.25.1


