Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B2ED4401E
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:27 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.36713.1731922211155078530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b5SAj8+T;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922221; x=1763458221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=d01rzaQi3qOXFdybA71hTdzz5e6MdJwMFwMib+kwIio=;
  b=b5SAj8+TCPYmsTiicGxQlvxdKUSD/+nY/wOeUQAKjIeblRobDscJKahg
   vpFfVw7fk19u0bGbkC0oxJdGCX5cz4HrkcS7bS3kEq7/qpkx3FXs0XzM/
   f+W7A3Ckx6qX2kzBjT1hSQMuslex8SxjPyq1UA8noEARFWqTmUGRDRUjm
   hfVBWup/TT3F6GvewfbEPPle0DPr3szWeuMuz9KXQ32VJrBH1QnltH+z3
   tH7MW8agXpnSQS3h8qkuvVC7cLeUufJx08RUd5RE/GpqnEp5FqhmlWDBM
   AYW8TLH4E9nylMd9hWW2aghQ76gw6nQglvBbxIPL9jUN9yq37YYRzlfJ5
   A==;
X-CSE-ConnectionGUID: t4px+QGXQRim0Asi+8cPPQ==
X-CSE-MsgGUID: tBaiEI5BTn2ZBl3hnwJiNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="168782726"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="168782726"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EBC4196743
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FFD2D5470
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1798A20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BBDCC1A01E9;
	Mon, 18 Nov 2024 17:30:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 31/32] tesseract: upgrade 5.4.1 -> 5.5.0
Date: Mon, 18 Nov 2024 17:29:54 +0800
Message-Id: <1731922195-5266-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--6.449700-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrkKAa/khZ3iS+f7ap9DJaDefD
	otHL7YhsZ6bcNKJmVkUlDMGMjfTLx24OVXPBEISQEhGH3CRdKUUXaMhZSeVFDO55sqsU0mRFvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgPioIsi7Sa0g3ymqV5Ai0QWU1x
	ZnvXfsKIGQRIwjTl3iozYBLXN4P/DaqMoBhXwtRp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gK
	q42LRYkCTJJu8Xccp3jRzJltBBXMjnANiUgT2RmUpwoUBGVnud+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113895

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Set hOCR capabilities ocrp_dir and ocrp_lang unconditionally.
* Calculate row bounding box in single-word mode per (issue #4304).
* Reduce clock syscalls (#4303).
* Several small performance and other code fixes.
* Modernized code.
* Print time for tessedit_timing_debug in milliseconds.
* Print time for ErrorCounter::ComputeErrorRate in milliseconds.
* cmake: Correctly set the soversion based on SemVer properties.
* Do not export PDBs for static libraries (issue #4279).
* Several other small fixes and improvements for builds and CI.
* Modernize code for renderers and remove filename conversion for Windows (#4330).
* Add build rule for Windows installer.
* Support symbolic values for --oem and --psm options.
* Remove Tensorflow support.
* Add RISC-V V support (#4346).
* Remove broken GitHub action msys2-4.1.1.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/{tesseract_5.4.1.bb => tesseract_5.5.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_5.4.1.bb => tesseract_5.5.0.bb} (91%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.4.1.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.0.bb
similarity index 91%
rename from meta-oe/recipes-graphics/tesseract/tesseract_5.4.1.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.5.0.bb
index 1177e34cd..33d928fa2 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.4.1.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.0.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "b5f279ec7582dc57f6464557ed938558791f200d"
+SRCREV = "64eab6c457b2337dd690746a5fde5c222b40d5f8"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


