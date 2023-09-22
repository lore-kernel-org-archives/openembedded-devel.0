Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53378CD4F57
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:19:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.18544.1695377960065652485
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=U5fMFXA4;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695377962; x=1726913962;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PlLTunGcGceN0tGR+eFkFfTlgh3l2o8lUOqvJOSCWKU=;
  b=U5fMFXA4zb/U/ZMC3kWShwnkcBh5ZszbJZU9ZPVLPLQJnNAhNx6rQC2C
   OnqZzETx+cvTc/4B669rHVnMfIBL31MYh1NswFt2dg2Q4F5iZ0mlvm85q
   xiSxLtkcPcL4/jXcsjlMY1GYN8UbX8yH05Lk2fSN9ZF5v4+zfy3ssAIZh
   7fVxjyhfXm0bu9iIPTVBTkgbpECFpwwGvXvvBOEOehv8FyLUzHT2iQCQA
   QkXay7xKRFqS36ZPjXLQtkUirueFRESmqrsQ3wCQlQea5Oqm/CTNBylhL
   rt82fmp6DVLUN88MY0dap3Y5ItHs13YnTkgz1lKMKAStX4dAARcp8sjG2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383542999"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383542999"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817729066"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="817729066"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2023 03:19:21 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/5] x11vnc: Fix CVE-2020-29074
Date: Fri, 22 Sep 2023 17:59:40 +0800
Message-Id: <20230922095941.3958983-4-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230922095941.3958983-1-chee.yang.lee@intel.com>
References: <20230922095941.3958983-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 10:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105053

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../x11vnc/files/CVE-2020-29074.patch         | 27 +++++++++++++++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch b/meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
new file mode 100644
index 0000000000..fbdb9123cc
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
@@ -0,0 +1,27 @@
+CVE: CVE-2020-29074
+Upstream-Status: Backport [https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 69eeb9f7baa14ca03b16c9de821f9876def7a36a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
+Date: Wed, 18 Nov 2020 08:40:45 +0100
+Subject: [PATCH] scan: limit access to shared memory segments to current user
+
+---
+ src/scan.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/scan.c b/src/scan.c
+index 43e00d20..12994d52 100644
+--- a/src/scan.c
++++ b/src/scan.c
+@@ -320,7 +320,7 @@ static int shm_create(XShmSegmentInfo *shm, XImage **ximg_ptr, int w, int h,
+ 
+ #if HAVE_XSHM
+ 	shm->shmid = shmget(IPC_PRIVATE,
+-	    xim->bytes_per_line * xim->height, IPC_CREAT | 0777);
++	    xim->bytes_per_line * xim->height, IPC_CREAT | 0600);
+ 
+ 	if (shm->shmid == -1) {
+ 		rfbErr("shmget(%s) failed.\n", name);
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index 92b3ac5f67..3633bbc26b 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -11,6 +11,7 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/LibVNC/x11vnc;branch=master;protocol=https \
            file://starting-fix.patch \
+           file://CVE-2020-29074.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.37.3


