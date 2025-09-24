Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9C5CCA468
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:56 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8318.1758704442458090056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XCTTK8UD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704444; x=1790240444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tLkClGIJxmPHV+O9K8nknYf6bNK3OlgJtAuvA6Rj3SE=;
  b=XCTTK8UDUHNMID7QavhE1jhZEmt7/3C0inXhEzJdR2m6y9cyABdhZpPC
   eD2Yv5oagDsFmLXiaMlBGK4m+N8WbUYukhkoB75kw9hapmxMBjoOShBBD
   uaSr0WZY8pPoUb3rM7jQlVo4yUYLlWtHZKRwdbGy4B35IBafples9cGjb
   d/VfKzfQ9TVt1awHzJfFbXui1TemMcPM3YwaKX5VWaNSUdkE1G79/I95V
   lKX76M+f5oq1g95IFG0PGRASVgl8jm6ztPmaGUF1HyTDl1AHDkxY589E7
   HmD86nvQvLfD5zui6vFFm0kIJZEaTIZNDhf3i3f9PZFlXLNMWzehJz9F5
   A==;
X-CSE-ConnectionGUID: Z+ziS7mMTYiKr+GLfircGA==
X-CSE-MsgGUID: HWAF3B1MR32BV4SxTso4Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="217279664"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="217279664"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:41 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 061301000340
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C1E3510003BD
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:40 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 25FAE1802273;
	Wed, 24 Sep 2025 09:00:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 877EE1A008F;
	Wed, 24 Sep 2025 17:00:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 10/29] libmime-types-perl: upgrade 2.28 -> 2.29
Date: Wed, 24 Sep 2025 17:00:10 +0800
Message-ID: <20250924090029.1786-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119775

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: add following flags to section build_requires
  Test::More: '1'
  Test::Pod: '1'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{libmime-types-perl_2.28.bb => libmime-types-perl_2.29.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.28.bb => libmime-types-perl_2.29.bb} (91%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
similarity index 91%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
index 043e1549af..afb596a05e 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.28.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.29.bb
@@ -9,12 +9,12 @@ HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-2.27"
 SECTION = "libraries"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=d3b01c1228de75a9de9ee0bfb6e0dcf3"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "7099cb5133401acc92d8fb0fd398cac682140be0680e7dfcb4aaf40315a2dfca"
+SRC_URI[sha256sum] = "4a6d4ec9b3aa0df2f935d4d74f7dc809fd523d508cd0e9966b5b257c02c03414"
 
 S = "${UNPACKDIR}/MIME-Types-${PV}"
 
-- 
2.43.0


