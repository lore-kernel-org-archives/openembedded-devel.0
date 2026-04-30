Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9690CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17475.1777546266332523961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BzZpiWtE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546270; x=1809082270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dQgtXLAQNOdVis1U+xZ2+9ua0sbUwWk2SBeAL6cADFk=;
  b=BzZpiWtEnRiFsRvTpArCIhEcnzyxvhBzlA7cF4ZNsMOh7HBLffS7g/AU
   F8saVaNUzzIQ6hw1SbvyxmCSmAEQl3VOrnuRYd95A5KM0zzD4dKiez4sC
   XLywysMkB1MLLDTuIzP051zVuG5p7/PJmgKWv1aAklqu9lqI44BQnasXG
   XmJhjacAigXpHkXHCCa6tgfRC3Bt5s3Sk5GFDmEu+fhgV2qdAQ1J2Ou6d
   6L54OHPkDmWXvmKfIHuvW+LEvDbFzRgQePLPA2KtahJZWKGekhcnDQrm4
   h1341LNERcO5a7DO0CFWeNXqGsPTalAsGGJQtxkSGxh/s9+qjolPMcsH0
   A==;
X-CSE-ConnectionGUID: gQvVPBbIRxWFYs9O2Fk2fQ==
X-CSE-MsgGUID: qND2Kx8zRkeM1ipv2GJiRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552766"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552766"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:51:09 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5EA17C0182D
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:09 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 19F198D65E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B94951801137;
	Thu, 30 Apr 2026 10:51:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 63/64] xbitmaps: upgrade 1.1.3 -> 1.1.4
Date: Thu, 30 Apr 2026 18:49:22 +0800
Message-ID: <20260430104924.1106-63-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126733

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb | 7 -------
 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.4.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb
deleted file mode 100644
index 5f49152972..0000000000
--- a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-data-common.inc
-
-SUMMARY = "Common X11 Bitmaps"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=dbd075aaffa4a60a8d00696f2e4b9a8f"
-
-SRC_URI[sha256sum] = "ad6cad54887832a17d86c2ccfc5e52a1dfab090f8307b152c78b0e1529cd0f7a"
diff --git a/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.4.bb b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.4.bb
new file mode 100644
index 0000000000..3da81156a7
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.4.bb
@@ -0,0 +1,7 @@
+require xorg-data-common.inc
+
+SUMMARY = "Common X11 Bitmaps"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=91d7417ea327b03bd865e34bb3b6bc0e"
+
+SRC_URI[sha256sum] = "895722f136e21e728c52f2d99fd2dae95018b9ddad1bac1f29d61bcd6593721d"
-- 
2.43.0


