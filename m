Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62C4CD6E68
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:09:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21234.1780394942211242392
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gwqnB3kD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394946; x=1811930946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FxIbe0eaFrtI4WO+FB2wFYTKMzrox3/k7dLNVkJpUqs=;
  b=gwqnB3kDg4MWbues/hhqIVBJQSkDK7sSfTI4nqkeb0lePhS3mlE8kqZl
   v1WPkiRJIV3tSDjhpAnCIPcf16Oqlgz1mWt4m9M1OHTCCPCoTCJF4nZ3e
   29AsZd99zT6pdDCLFCbTnBcl/iZHmy2toSnBNw9xDi1X+raneD2NEiRmq
   /VzySlG/GQ/zI2q2w53/BD5a4jC1IeU+/Ygw2REuTzufcNoXSPjRa5gpE
   ee56gXy1UGx9ZA+lI6tp0E6N0HGLwDC97+/gh9fB1K7MjchY9nM4LR5nC
   ty/V2xZ1quHCsRvgCtGpVOtYYHv3KKF9dzupRf8Lq0zY/PQKasw670LLt
   A==;
X-CSE-ConnectionGUID: 2OoBbJaLQRefElmNuQlftQ==
X-CSE-MsgGUID: APKShyqbT7C5ZhGGp3N/nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242743097"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242743097"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:09:05 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 62FAE1C1C701
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:09:04 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 1507214771D4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:09:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id A13C31800583;
	Tue,  2 Jun 2026 10:09:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 36/38] sshfs-fuse: upgrade 3.7.5 -> 3.7.6
Date: Tue,  2 Jun 2026 18:07:52 +0800
Message-ID: <20260602100755.2117-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127358

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sshfs-fuse/{sshfs-fuse_3.7.5.bb => sshfs-fuse_3.7.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/sshfs-fuse/{sshfs-fuse_3.7.5.bb => sshfs-fuse_3.7.6.bb} (93%)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.5.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.6.bb
similarity index 93%
rename from meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.5.bb
rename to meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.6.bb
index ba27bc6312..6514599261 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.5.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.6.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 fuse3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/libfuse/sshfs;branch=master;protocol=https;tag=sshfs-${PV}"
-SRCREV = "9e35c39ba83f54a49a9df4bf0a629f26c60cc38c"
+SRCREV = "7a2d988775446ebe7af9b01c99b3b8e86bddb05a"
 
 inherit meson pkgconfig ptest
 
-- 
2.43.0


