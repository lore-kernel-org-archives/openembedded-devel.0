Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1605C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 07:01:32 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.2742.1657177284584338052
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 00:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QthJVxDZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657177282; i=@fujitsu.com;
	bh=zJDqmO/BfbAKQ+V5GByCWcXfIeNVFsHXxLy7FIB9/mY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QthJVxDZAWftSf7vffpEpuV7lHWixN3yNTXHg+iSDGn9yVf91MMvMxXXi/Hp2dXaB
	 /ti44Wpe4gAUPB8BsiBTrrO4xJlz5k/2PN/PAJAj8p/1X2oZt27zmrZEmHkmsQaCwa
	 zVZeJC875NbCAGLsN8V7cs2MC8yOmd/yPNWMCCA+o3yHs8dQHRebO37wi/0tLksvUC
	 9e/VUnz4GEPMWI5pe7NKuqD9LKhqmRCITmVnCEH5PKQN52QK5gfj5m9IzMEzYZk2HU
	 8+cb86+fWfMGP1GlQb9S7Q+9pHwTBKSyJbE5LzP5392KYNDxCEM6uR+WGmuS0jAwXH
	 fez/LIXgpmwdQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORqHuw5Vi
  SwZzvyhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aPFfeYCqZzVzxeeoGxgfE/ZxcjJ4eQwBNG
  iUX7Y7sYuYDs60wSr/c8YYNwdjNK/Hhwlxmkik1ATWL6rRusILaIgL7E0tl7wOLMAioSL373s
  IPYwgJ2EhsPf2cDsVmA4ueuLwWKc3DwCjhJXH3hDhKWEFCQmPLwPVgrp4CzxIJDVxkhjnCSmH
  twFQuIzSsgKHFy5hMWiPESEgdfvGCG6FWUmH25mQXCrpCYMWMbG4StJnH13CbmCYyCs5C0z0L
  SvoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhqa6xroWZXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYACnFDOH7WD80/tT7xCjJAeTkiivV/2xJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvPxNQDnBotT01Iq0zBxgNMGkJTh4lER4GZuB0rzFBYm5xZnpEKlTjLocM7+2HWAWYs
  nLz0uVEue9B1IkAFKUUZoHNwIW2ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfN2gkzhycw
  rgdv0CugIJqAjluUfATmiJBEhJdXA5Ji+VnyfZNn1x7zsM6zy0hr4TD+Wr7gpumbF9cXmtXmx
  qQ6lGb2f1u97cFK/Uaybo6Rnsdd0gRsfTgUlfVdKXpxollmQOlPP5PJbaZVmK+t7K7915z+bl
  bpM+sj2CVWdImzTtzIVB1+S+F5dpL9zlsfBEy9/3aie1jmHjSVVbN/lHa+iDK5fOM+02cPOL/
  9d6rvwI9biE9jmXzyzaPO5tgWyZ8N/lVnK2XlJT1rF/3SVUkLe7APO7JeOv/21tHyeJJPLa48
  oV41JnhxKenOuLtoht1EoNSoyzmyW9mHGuugTPar/u8xbig4/2Xt8wQW22MchFZt0Vt38W9by
  SPE8872kM4+du3Nfa+3evCWIU4mlOCPRUIu5qDgRAJH3Zg1nAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1657177281!65508!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16018 invoked from network); 7 Jul 2022 07:01:21 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jul 2022 07:01:21 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 08D5A100195
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AEEAD10019B
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  7 Jul 2022 08:01:20 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Jul 2022 08:01:19 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libzip: upgrade 1.9.0 -> 1.9.2
Date: Thu, 7 Jul 2022 15:00:45 +0800
Message-ID: <1657177246-28404-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657177246-28404-1-git-send-email-wangmy@fujitsu.com>
References: <1657177246-28404-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 07:01:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97744

License-Update: email of authors changed to <info@libzip.org>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libzip/{libzip_1.9.0.bb => libzip_1.9.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.9.0.bb => libzip_1.9.2.bb} (85%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.9.0.bb b/meta-oe/recipes-extended/libzip/libzip_1.9.2.bb
similarity index 85%
rename from meta-oe/recipes-extended/libzip/libzip_1.9.0.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.9.2.bb
index 6349b61bd..f4de8607a 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.9.0.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.9.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "libzip is a C library for reading, creating, and modifying zip ar
 HOMEPAGE = "https://libzip.org/"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=067e9870bba57e1ce20695c4d5672f30"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a9d2078f35e61cf1122ccd440687cf"
 
 DEPENDS = "zlib bzip2"
 
@@ -21,7 +21,7 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a17240ee88f0705a9067bb0087fde1cee73948b3cf6c3978a21a58fdb73b76a2"
+SRC_URI[sha256sum] = "c93e9852b7b2dc931197831438fee5295976ee0ba24f8524a8907be5c2ba5937"
 
 # Patch for CVE-2017-12858 is applied in version 1.2.0.
 CVE_CHECK_IGNORE += "CVE-2017-12858"
-- 
2.25.1


