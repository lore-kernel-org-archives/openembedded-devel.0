Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052F2EDE9A1
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.18592.1725959007143197041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J7iyQcDJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959007; x=1757495007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TaUi0C2vnDWO9D5++tQ9U/Z2SUoZUOm0kOja4B2F6UM=;
  b=J7iyQcDJAFO4k5qryMENGjZVda53txlNSMDNZbFZ2k+cbQucLx5B7q4t
   4ykdbcOqghUTN4HgZckXnmUYvi2F1lNqYQLQo4Gs7qSMejHE3SXj2YVaX
   4JuUojQ2CKaCeaxICM0yHXvterpt/jmpN03xmdvwxXX5C5BXFlbV5M8l/
   5ErndbKR2+zWMdMGGe2K3VoLhofLX2wk0nTfSHd7gWE3ye0KZFqpRtVnR
   gBCTEM4zjhAlwkcnS3BTAf91NmcIybJagMHE24c07c8dzpd1GrEhBSZCw
   bX99ni2ofWEoPqS213U92rrXTOOwEYH10uicAb1+/Iyr00j9jZg6A7axz
   w==;
X-CSE-ConnectionGUID: zuZ3Hh1iQX+71dnYF1u9Xg==
X-CSE-MsgGUID: ARr7T6yERl+fO9oV63Ij4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152689861"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152689861"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:24 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D50DED2A00
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 25B0DD5020
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A98636BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5C4961A000B;
	Tue, 10 Sep 2024 17:03:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 10/42] libcompress-raw-zlib-perl: upgrade 2.212 -> 2.213
Date: Tue, 10 Sep 2024 17:02:38 +0800
Message-Id: <1725958990-5719-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.427800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy+WtdtaO3wUEOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrZoRkHjwRJQDPWWBJOaXhft3eifzLa51ULOwTDpBClW7lr6hTDn7lnCKdg
	HGKoi8mpNR25ga3d5/0pHLfLVjETp07mnEUIE4ER0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112196

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...aw-zlib-perl_2.212.bb => libcompress-raw-zlib-perl_2.213.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-zlib-perl_2.212.bb => libcompress-raw-zlib-perl_2.213.bb} (89%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.212.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
similarity index 89%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.212.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
index d79a710a7..b8afcc207 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.212.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.213.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=1bb3479faca6bb2086c
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "6d9de0c11921fd520dfd99a3f6b0ca9f1fd9850274f8bec10bbaa4f6803cc049"
+SRC_URI[sha256sum] = "56b21c99cb3a3a7f7876a74dd05daa3f41fc9143ddd4dc98f8e46710a106af45"
 
 DEPENDS += "zlib"
 
-- 
2.34.1


