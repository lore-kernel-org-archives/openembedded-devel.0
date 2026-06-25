Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B96CDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:07 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7008.1782378118205958987
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UvCzdEs7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378118; x=1813914118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qcjieXleP90kKV624RhsqLXttWov5G6cy6HD8Pek0XA=;
  b=UvCzdEs7bbJJ5XEZIAIGcmz8hnQyc3Dm5teCSFP5iY85e5L3tT3GFidA
   2I1Wc/ygBz/X5ptBs/ikTHtE20VobPO1QdEWSOdvHK+4668/N2Btf/Beb
   pKZv/M4/Vpeqk3/1s9XlWKfHEYJz/+AbnG14OgmmWvs57WrhF6jQoEC30
   qV6NArnGos3ejEdrqwi3MJ/+sJNSBbJct1Tf6z3YOwD3jeHHVVz3EQ0jT
   xG+yv/29I3Vhyc5f0503OgpsYE2Fxr/+bJ4lfxDtc0vJ2tC1fI6E44J2N
   FXuLguWAeEaGzFuvgDCBJHiReYjwd/tn0es6XGlQQZiGE+eo+aoIdRqNa
   w==;
X-CSE-ConnectionGUID: v4Pmm4j0RxaodVelcU/1zA==
X-CSE-MsgGUID: i4pRYNujTjebw5BW/O/yVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="248685543"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="248685543"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:56 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9D56D820C2D
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:56 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 579911400123
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 58D4D1017328;
	Thu, 25 Jun 2026 09:01:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/47] python3-bitarray: upgrade 3.8.1 -> 3.8.2
Date: Thu, 25 Jun 2026 17:00:56 +0800
Message-ID: <20260625090127.1563-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127748

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.8.1.bb => python3-bitarray_3.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.8.1.bb => python3-bitarray_3.8.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.8.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.8.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.8.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.8.2.bb
index 6ef0f4202a..0c34eeff8d 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.8.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "f90bb3c680804ec9630bcf8c0965e54b4de84d33b17d7da57c87c30f0c64c6f5"
+SRC_URI[sha256sum] = "2675a0c17c0b2d12d0fbcf3b27eb833f96936a588da47ac445c0743c5aa69e6b"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


