Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A43DCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:09:58 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.110.1778645393520736113
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IdGOMves;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645393; x=1810181393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zJitucILgJhA1piO1Xo85A0SIJRMwKBUnys7eJstLxs=;
  b=IdGOMves8EH2MG1gQNp7VHTBonBaUxSzttgm0E9yfqmSng2W5ApAVe9o
   0dvkYOPxwKXRK8nd3uIaTq4xTsRzN/GyK99ts4Oo+Wafxw89eJWY1OaOP
   iDQ69i7CAzM263XiE3zvEgn0B8IGziT4H5Rsxnrlj9LoIXJipVmYno3g+
   cY1vG/RqCYfQx6NXQCsSjbP6Fg7XTMIv/Avnuz4kkcmaObIf5AoYNHIWC
   dKmRVI+2LDMjguhYDxl5KNuXmTOsoguTuYeU2Q+kuXrObqLjh22OciiHa
   Pr3enixsHDLK6JdT1BMBWUHmc8r8nu4aebWi7ufSydHost4hRMVMhENnF
   Q==;
X-CSE-ConnectionGUID: B+lp5vyPTYOqiv5WwyKy+A==
X-CSE-MsgGUID: gHFhPGozSQeo5d6Z6YYJoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240265372"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240265372"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:09:52 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EC83C82040C
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:21 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A7169861261
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4844B140024F;
	Wed, 13 May 2026 04:09:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 16/56] libnet-dns-sec-perl: upgrade 1.26 -> 1.27
Date: Wed, 13 May 2026 12:05:15 +0800
Message-ID: <20260513040555.377-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126903

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Provide deprecation status for RSA and DSA (per RFC9904)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{libnet-dns-sec-perl_1.26.bb => libnet-dns-sec-perl_1.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-sec-perl_1.26.bb => libnet-dns-sec-perl_1.27.bb} (93%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.26.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.27.bb
similarity index 93%
rename from meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.26.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.27.bb
index d0e46783d5..9c1aa2cbb9 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.26.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.27.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b7e4176275d57d0b036bdccbc01a0e7"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-SEC-${PV}.tar.gz"
-SRC_URI[sha256sum] = "88592c65487fb7b4d05134f2f9c48e649a9cd533a8493c50189b649b4ea711a6"
+SRC_URI[sha256sum] = "a64482584ef3ba8f84aced78d696048b87e25ca7fb3c91a50df391157212c4bd"
 
 DEPENDS += "openssl"
 
-- 
2.43.0


