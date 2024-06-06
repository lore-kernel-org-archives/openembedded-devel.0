Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F81CC3DA40
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.9749.1717664821197934145
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qhWwlNGv;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664820; x=1749200820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9b43y1tQZekfje+QuOTJpW9KKrm7vSL8ubFmrJBzVwM=;
  b=qhWwlNGvstl1Mr7M+HhDoA9EXqoW8y/EdW34HPfZUFEhqlis8pPD9ms+
   RZziy+shZV4/Qs9cjYkJnzE9z9M2xJPYK2n/wL/3Q69GqCICfpEmlNTdA
   VHkEZ5A+127I8pz9Wg8+7uI/FLFX5YXPng62qeNsYyX0OEjg2g1ekq6pI
   5q53x2aXSFHiLZ1LUTCOjAdLHT6KJJv4YQir95H34OGJDdjkCFsIcPF1e
   PEELrqbuaWoti64Xh0SVE28L6/CRtSwUbu7l/BwGHTXQEPQYRU5QzTGab
   8/qZWhWGnc3dQFpCuVJisbAXbDftvE9cFfwOlLzso8jS//e7RXMN2UegA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141040293"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141040293"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:58 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A59DADA61
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 543C2D50B1
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D6975401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 83DBF1A000A;
	Thu,  6 Jun 2024 17:06:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 17/36] libcompress-raw-lzma-perl: upgrade 2.206 -> 2.212
Date: Thu,  6 Jun 2024 17:06:16 +0800
Message-Id: <1717664795-13902-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--0.161100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8AtH/ey8zRp8SiwizsgluQdTe
	gpK7QnXFvQZuQp/ypDOuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5hVs
	bB9G/pYYe1FCGsuRkEaed3K3CxAqknAwvxf6dP4MKp7FypCKFZX0uUohdp5SkJLMmk54JLESqLN
	aG0YcyZc59VOLzlqpaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110725

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-lzma-perl_2.206.bb => libcompress-raw-lzma-perl_2.212.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-lzma-perl_2.206.bb => libcompress-raw-lzma-perl_2.212.bb} (80%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.206.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.212.bb
similarity index 80%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.206.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.212.bb
index cdabdb139..c4cba470b 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.206.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.212.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=b95311d4a7dbf3d0d3663edc094aced6"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2a0fd6d30eaf88289587b776f74c2886"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "e01a7040b84bdc67592d13eec0c788590e1f696d1d4f07c7097bd72a4f886eb4"
+SRC_URI[sha256sum] = "4ba7ab803bdba2d7be7d55d4a2668369d794eb8d8d6bb0db6b74fd9b4ce18cac"
 
 DEPENDS += "xz"
 
-- 
2.34.1


