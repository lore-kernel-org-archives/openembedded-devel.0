Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1F0CAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 02:12:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.1901.1758766347224984476
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 19:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pqiTvRcw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758766347; x=1790302347;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=11VgwDTZEy0/WIADgkBJynjJHYY39bETy1T4xebrJtU=;
  b=pqiTvRcw2ZKwJ0Xl31Uu499X1ixUCT8priVtmJT9CABUcx/wpy+7lQPx
   ZPh5RgfQB5x1m+n0W6ImSVBNEek80qg426nI71vWev7+LIqvhNnueVSLk
   7hPSLCZYxfuKnkX6ZomqtNHg5Mgj3LDUbgvgaOwN2exYw+5ywHfpDJWyG
   53CRAHdem+GJtk3kgmqlpdLwDcOnd+s4uFjmtZppbFvzjMksOGxT7bCte
   o/teHq/5JhZssuVgy8cusbnI61ZzUWwO869ww9gQiyXkfnkrearuM7IFB
   +DOpfqNi0od4q+k1BYZVijbhJk8qn2ABXaSv+pf/wXT+Bpsg4tcxc4xKv
   Q==;
X-CSE-ConnectionGUID: dy+XQeWsRryxrvzhWwWvNQ==
X-CSE-MsgGUID: o5JkMhABRkGsGEJqFUGrrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="201790202"
X-IronPort-AV: E=Sophos;i="6.18,291,1751209200"; 
   d="scan'208";a="201790202"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 11:12:25 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6B43DC00425
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 02:12:25 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1E4E418029C6
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 02:12:25 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 636D8101C8C6;
	Thu, 25 Sep 2025 02:12:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FEA41A0074;
	Thu, 25 Sep 2025 10:12:20 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH v2] libmime-types-perl: upgrade 2.28 -> 2.29
Date: Thu, 25 Sep 2025 10:12:17 +0800
Message-ID: <20250925021218.491-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 02:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119848

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: the license declaration has shifted from line 11 to line 13.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{libmime-types-perl_2.28.bb => libmime-types-perl_2.29.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.28.bb => libmime-types-perl_2.29.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
index 043e1549af..512c068d13 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
@@ -9,12 +9,12 @@ HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-2.27"
 SECTION = "libraries"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=13;endline=13;md5=963ce28228347875ace682de56eef8e8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "7099cb5133401acc92d8fb0fd398cac682140be0680e7dfcb4aaf40315a2dfca"
+SRC_URI[sha256sum] = "4a6d4ec9b3aa0df2f935d4d74f7dc809fd523d508cd0e9966b5b257c02c03414"
 
 S = "${UNPACKDIR}/MIME-Types-${PV}"
 
-- 
2.43.0


