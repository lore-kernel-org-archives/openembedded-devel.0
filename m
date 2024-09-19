Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A88CDD578
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.11275.1726716754528433199
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tFcWb4se;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716755; x=1758252755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fNOm6pcFLVkdiSNTL5gckUDvfdCOQVVEO6cixyhqElw=;
  b=tFcWb4seCVFx0FoY5jFXAQVzbC0gQWTL4g0AcBHB/8xuWyRB6PPEr5KU
   1sGI6GkgsHRQRNUTmGh5ifw9w1oP7Wydjnhncl/0CSCfnniDEjpR7uJ7T
   s6PagzsWNePYW4W1jHq3S2vJSvqhXShmNqB7sVkMSQnUUWfhMnRXcD3Km
   s2fxLz0+cmUS/ITqvdoleOiDdlIyce6wdIsCxhZmlclMaNwCji1e8NZAE
   JXvL2Ll7x7rSi7PNI9kjF5viBQSusCrY2r7SukUu4GYkio2QTg0LEzo7G
   41qM6OkUpyziUkFMpATsbjIuSdyfkFFfnK+kW3RxG88N2ZiTr9RCvwsx7
   A==;
X-CSE-ConnectionGUID: y0UnsaFdRmas4vlHSd3lkQ==
X-CSE-MsgGUID: QF/NxN+jRZ6l/4hrTN8Zeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174141207"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174141207"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:28 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A56AD8011
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 954A5BF3D8
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19ABD21FC6A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B4C8F1A01E9;
	Thu, 19 Sep 2024 11:32:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/28] ctags: upgrade 6.1.20240908.0 -> 6.1.20240915.0
Date: Thu, 19 Sep 2024 11:31:47 +0800
Message-Id: <1726716733-14548-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrXXY4GH/SPUojdiHNuw7lW63PyvoeQdRN8a9oAJqnH1nrDoy4vKgRceb6m
	rrKcye7kqF3ISr381qjQ+0p3Tn8YXMWnuG9KW3jh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112369

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240908.0.bb => ctags_6.1.20240915.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240908.0.bb => ctags_6.1.20240915.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240908.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240915.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240908.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240915.0.bb
index 01e7e5e3f..247e1a844 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240908.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240915.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "0a2ad188848b75f56bb2af33bcf556bd7cf422ed"
+SRCREV = "40b58618f9f0dc4123a205cbd50b73c6ab2e6f5c"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


