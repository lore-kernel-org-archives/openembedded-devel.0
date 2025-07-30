Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6821C87FDB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.31495.1753869308893374895
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kSHdH9nR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869309; x=1785405309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4stYEfjsNiGuFtcJ8LY7+8zivOI1nR/QJX9ZGbMYTEU=;
  b=kSHdH9nRVs9npJh4Fk5hDsxtXYRbqSu59ks+cbJZn2ivsoDP+IGm4W84
   WoBfQfcNWWmTydyaZxWH0QyL+vM8aQnwqEhQNY9JwYSnnU4U66LZvSuHb
   U3Q5KnOBgcSkAVk3px1lgLdT2spVR5tVnARSNzP5+eP/u8tvNX5lXWL12
   9yIYhFKa+JjsjET6olxU2aeujeDwPn7jN/cT0txU+A445igMJo7t8295G
   /DsCKPHwNZiaQ1UUztCk32PMr6NOyvRX8CPUxT70KaiG0y/certT+8u90
   MhpxSgrYSws6fb0oh/7qfofobjC6GGedzJRTXU1bh5D3kYZ52S8utNCuo
   g==;
X-CSE-ConnectionGUID: fy/w0uSWR8mkHU4sPXIuxw==
X-CSE-MsgGUID: riTg4uQSSgmObTy5SocPpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207188800"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207188800"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:08 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 48C1742A30D
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B11342000194
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A4A131A009B;
	Wed, 30 Jul 2025 17:55:02 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/40] libcec: upgrade 7.0.0 -> 7.1.1
Date: Wed, 30 Jul 2025 17:54:27 +0800
Message-ID: <20250730095456.695-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118780

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- [libcec] fix incorrect preprocessor command
- [cmake] Fix win x64 and arm64 detection in cmake
- add Teufel vendor id
- RPiCECAdapterDetection: Include check that we can set passive mode
- correct typo
- Fix PRId64 define
- Fix another NULL return
- Don't use Bash for setting build variables
- update ceccloader.h & make cmake obey INSTALL_BINDIR & INSTALL_LIBDIR
- add system audio mode request & system audio mode status

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcec/{libcec_7.0.0.bb => libcec_7.1.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libcec/{libcec_7.0.0.bb => libcec_7.1.1.bb} (94%)

diff --git a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb b/meta-oe/recipes-extended/libcec/libcec_7.1.1.bb
similarity index 94%
rename from meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
rename to meta-oe/recipes-extended/libcec/libcec_7.1.1.bb
index 2def38d73f..9d0015534b 100644
--- a/meta-oe/recipes-extended/libcec/libcec_7.0.0.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_7.1.1.bb
@@ -9,8 +9,8 @@ DEPENDS = "p8platform udev ncurses swig-native python3"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11 libxrandr', '', d)}"
 DEPENDS:append:rpi = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', ' userland', d)}"
 
-SRCREV = "ceeec8bfd2242792b6de59ce8fb854437208dc11"
-SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release;protocol=https \
+SRCREV = "3519af0715e654c43382423d843ad658f2e01cb4"
+SRC_URI = "git://github.com/Pulse-Eight/libcec.git;branch=release;protocol=https;tag=${BPN}-${PV} \
            file://0001-Enhance-reproducibility.patch \
           "
 
-- 
2.43.0


