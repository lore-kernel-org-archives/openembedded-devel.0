Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC36FF886D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:36:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9025.1777368982890421206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 02:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dckeToZq;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777368982; x=1808904982;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SqQdFa0y2LlPWuM4+11bEYLGh4rX5X5V09Ikkcfv1ug=;
  b=dckeToZqG+fU49x0CN3mYZhHV8hBiX8KMqMJcEG8KjjvRfbbU9SFjCo0
   /9/hhQpiENsTUZ+tI/pfnuknIXzAx1Pn6ryILBhTutoOqM7mGUUDdRyKc
   piUMW/gAuPAXuQfhwxJOiOYqgALoxh3xH81D4Wi6xDOgE3oqst43RTkAk
   jG+l7CHluuQFsLRtAdpXbPATTtRMYis4lHfYY8w55HC16+mM3JSCkMPpG
   elghs1dzlKxkQ8gzYL2G75g12edGWOQCCSWhrAzvSYIyuOX/VjSAC3avX
   XuZXvGszFbIp6beFRXtF8hlwbxm55UhFbZkHKr0pP6j9l+MlxVSqMlVSE
   Q==;
X-CSE-ConnectionGUID: S++mrhaGS3ylUCSNMtBcfg==
X-CSE-MsgGUID: DWs2gXmgS4Kq9gFOwA/gcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="227130438"
X-IronPort-AV: E=Sophos;i="6.23,203,1770562800"; 
   d="scan'208";a="227130438"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 18:36:20 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2F16B8204C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:21 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D5EE7C00234
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:20 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8F88318002FF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:18 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] exiftool: upgrade 13.52 -> 13.57
Date: Tue, 28 Apr 2026 17:36:12 +0800
Message-ID: <20260428093614.672-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428093614.672-1-liuyd.fnst@fujitsu.com>
References: <20260428093614.672-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126654

1. ChangeLog
  https://github.com/exiftool/exiftool/blob/master/Changes

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../perl/{exiftool_13.52.bb => exiftool_13.57.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.52.bb => exiftool_13.57.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.52.bb b/meta-oe/recipes-devtools/perl/exiftool_13.57.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.52.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.57.bb
index f40116144e..fc4ee18494 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.52.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.57.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "02c78a2e051894b57ad8a11024f8cfa05957e725"
+SRCREV = "dae9b7a86cb47c4d2bee8606455c7c27af8a3d56"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
-- 
2.43.0


