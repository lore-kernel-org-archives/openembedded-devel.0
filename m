Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702C7CCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:42 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.27239.1761696933932832890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TLv1hrZv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696934; x=1793232934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=26C8D+AT7cPNLvrQcIHxX3dBziKcqsyZ7qftbol3vmo=;
  b=TLv1hrZvKXwUnbVAdezLJT3KVmvjGLdL5YYYahC2Tk0K32vMhOAPUk1x
   qCewUnE2XpeE8rBxPv5U/d2SdItkts4GY6aufGKiKqE0NaXTWSZP2W8j9
   Pz0NZGZaJaTp4ONFpo/CztyYGj+UjrGQwHxSab1OZ0TLTZyiIez9rPkYP
   a0TL8MLIlWzu3lqJQICff0YXgGCR2LpUOMWFajq5/v/QOdPtiyot6OKl5
   HRGF4xR/1WXI/pqxKx8KRTmQlv1M6BtyaLaKM9N07XGBJfG3tQx9LH+5u
   vowC4SwogXq4oMJNTArs2pE3WIWag0P6R5jeO/xZLE9UALUdGXLsDz/iD
   Q==;
X-CSE-ConnectionGUID: VqO65PnASm2V/0pB0Uv54g==
X-CSE-MsgGUID: 2j0iVmA+Tjqo4fT3tjEB8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217443282"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217443282"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:32 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 43D4E455
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:32 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F2A3FC00213
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5E668826FD8;
	Wed, 29 Oct 2025 00:15:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 09/32] libio-compress-lzma-perl: upgrade 2.213 -> 2.214
Date: Wed, 29 Oct 2025 08:14:42 +0800
Message-ID: <20251029001505.528-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121115

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...s-lzma-perl_2.213.bb => libio-compress-lzma-perl_2.214.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-lzma-perl_2.213.bb => libio-compress-lzma-perl_2.214.bb} (76%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.214.bb
similarity index 76%
rename from meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
rename to meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.214.bb
index b2da8a903f..93ff89c18a 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.214.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2a0fd6d30eaf88289587b776f74c2886"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=db84d74e3df088dfbcfd6b30da2749c8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "daa63c3fa1f7708aa55b97a4d189820f5e849f8e4583dc24b5cceebd06a493eb"
+SRC_URI[sha256sum] = "f4ee89f3af99e59ad0742fd7b6358f9159ef513f1f6943d7140fb1bfa550dd38"
 
 S = "${UNPACKDIR}/IO-Compress-Lzma-${PV}"
 
-- 
2.43.0


