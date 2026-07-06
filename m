Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44764C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:02:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146096.1783328570135454213
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gay05v52;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783328570; x=1814864570;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=16c2kXReBSU6U239gxsLD4v+iMFWmruL20k1jGvm69M=;
  b=Gay05v52Njt7DPgKcqwYqUUoGZHyAcJNVtikg4F0PhBx3af3ZCZm+UV9
   WBwENqZlR36pU2tSqPFdlQ7xbgznWGE0tTfEzXw5lw4II3x6d3HyrbMM4
   ee5+JySVUawvcf9BNZYG5FQ7L3x6pxEbR+cqzgLZ77pWNDZOjOH6CKlEP
   6jS8GS2N0f0RB0ocDUj116tAdezw/l3IbNO/eJRl+nV5sPgT/8Lh9LBgF
   sT3/8yUJQVT5zj9hCRKnlXq4PEbxRzh2E055NezELp9fYGhMb3mY/rsfw
   0bHMdYDMAeh9uOQjd+XRf3w9i2LQrMCpiKHGcOZVRx90lUqxtfqcwiZq5
   w==;
X-CSE-ConnectionGUID: 0HuPZesATAeRrb3VvG1rGQ==
X-CSE-MsgGUID: o5K3ymx9QliMVgiCVqnjsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="224134123"
X-IronPort-AV: E=Sophos;i="6.25,149,1779116400"; 
   d="scan'208";a="224134123"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 18:02:48 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2A2F98200B6
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jul 2026 09:02:48 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D77BC82A4B7
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Jul 2026 09:02:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0A9C61800101;
	Mon,  6 Jul 2026 09:02:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fastfetch: drop drm-amdgpu and split vaapi into va-drm/va-x11
Date: Mon,  6 Jul 2026 17:02:42 +0800
Message-ID: <20260706090242.2035-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128035

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
index cf1410a96d..fb56556ff3 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
@@ -35,7 +35,6 @@ PACKAGECONFIG[chafa] = "-DENABLE_CHAFA=ON,-DENABLE_CHAFA=OFF,chafa"
 PACKAGECONFIG[dbus] = "-DENABLE_DBUS=ON,-DENABLE_DBUS=OFF,dbus"
 PACKAGECONFIG[dconf] = "-DENABLE_DCONF=ON,-DENABLE_DCONF=OFF,dconf"
 PACKAGECONFIG[ddcutil] = "-DENABLE_DDCUTIL=ON,-DENABLE_DDCUTIL=OFF,ddcutil"
-PACKAGECONFIG[drm-amdgpu] = "-DENABLE_DRM_AMDGPU=ON,-DENABLE_DRM_AMDGPU=OFF,"
 PACKAGECONFIG[drm] = "-DENABLE_DRM=ON,-DENABLE_DRM=OFF,libdrm"
 PACKAGECONFIG[egl] = "-DENABLE_EGL=ON,-DENABLE_EGL=OFF,virtual/egl"
 PACKAGECONFIG[elf] = "-DENABLE_ELF=ON,-DENABLE_ELF=OFF,elfutils"
@@ -49,7 +48,8 @@ PACKAGECONFIG[opencl] = "-DENABLE_OPENCL=ON,-DENABLE_OPENCL=OFF,opencl-headers v
 PACKAGECONFIG[pulseaudio] = "-DENABLE_PULSE=ON,-DENABLE_PULSE=OFF,pulseaudio"
 PACKAGECONFIG[rpm] = "-DENABLE_RPM=ON,-DENABLE_RPM=OFF,rpm"
 PACKAGECONFIG[sqlite3] = "-DENABLE_SQLITE3=ON,-DENABLE_SQLITE3=OFF,sqlite3"
-PACKAGECONFIG[vaapi] = "-DENABLE_VA=ON,-DENABLE_VA=OFF,libva"
+PACKAGECONFIG[va-drm] = "-DENABLE_VADRM=ON,-DENABLE_VADRM=OFF,libva"
+PACKAGECONFIG[va-x11] = "-DENABLE_VAX11=ON,-DENABLE_VAX11=OFF,libva"
 PACKAGECONFIG[vdpau] = "-DENABLE_VDPAU=ON,-DENABLE_VDPAU=OFF,libvdpau"
 PACKAGECONFIG[vulkan] = "-DENABLE_VULKAN=ON,-DENABLE_VULKAN=OFF,vulkan-loader"
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND=ON,-DENABLE_WAYLAND=OFF,wayland"
-- 
2.43.0


