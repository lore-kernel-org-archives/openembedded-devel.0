Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF0FC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 11:57:10 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.13965.1716551827691538517
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 04:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QlKjFpg1;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso49995611fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716551826; x=1717156626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sHoVG9AVBKqAz/a43PsebbAd+aCI3b6smUSsRL6InNU=;
        b=QlKjFpg1dyaEAdbD4L0bswLeAMLb7pXDHyXDNF1BMYNs79UJz0bSHgYMoSCrZqSJAx
         vy4gBQb0CmZeVu3Jc3lMmbZtc9j09kl26pEgi5hHX0eZCca/T4rfBcJDg7IqUt8QUgyh
         OIq0GMO459wO6XYdO9pXT/6O+SV0b3buGSDpkpYG/1RYOSqWW/PNuKBRqVp/v1pCZJFK
         ro4GmsClV+rKd3dr/DOkBJJGSCWsZ3daexAAfj2n1f23YVGIbnRiRPKcHOuwaap7eimo
         cmX5AK0JUX4Z0RqZPj9AqiXmSDODoJ/hIDaCvbKjQXaGuZDJOd5TvBau+OxHpKiFVtSm
         YYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716551826; x=1717156626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHoVG9AVBKqAz/a43PsebbAd+aCI3b6smUSsRL6InNU=;
        b=AA0/wBQVRD6vpNkbj2AjFXcAVHPYs7i7Ej6n8iTjzhWeXi70cPgmZbBFQjoMFLW99E
         cwY6j/x2oNduUwvK8O/YEux0A2o8AR7O9e4+8MSKgBF/D2NlqHbjN/sSBBJMktsuzqeg
         Ua8FY8s/uTQaHmwLorKxh0ZUISD5QdtICAWgOnkxFnULuSbAdKodBXvVbpCQ8iukix4w
         G/hl/mLUj75aFoGOIzG79uBdzfmUy/txGisDRdH7eGlpguS8QrYEU8JalDPCpuynmYIn
         gULCOPJL9seBYW8B0NcfPYU5GgAYu9SLxnmieAyKAYLLNoPuKRK3O+8Ru8RqTDx3rHmL
         Abew==
X-Gm-Message-State: AOJu0YwoUVLywEfI8l7Sj5U5rOQruGGQe+VE+XdzlJd5xw/BmY7jaYOT
	7SJJsaF3dBEEIxinm8xbEmV4OJ9reazK0X48rJSmsFM4ApQ5ltG9iSiqpXcaOqtCcqyEnS0IV0b
	l
X-Google-Smtp-Source: AGHT+IFkc7rXH7jCq/WQiGsRl9pgeHIO0/053b+Jo7JErhbNjRDhkNzdZr2qQKI4BsZLz3NlV3aQGg==
X-Received: by 2002:a2e:a781:0:b0:2e1:a726:3dfa with SMTP id 38308e7fff4ca-2e95b28aebdmr12908661fa.38.1716551825367;
        Fri, 24 May 2024 04:57:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95be05301sm1712921fa.114.2024.05.24.04.57.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 04:57:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] android-tools: fix building with GCC 14
Date: Fri, 24 May 2024 14:57:03 +0300
Message-Id: <20240524115704.2501696-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 11:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110510

libstdc++ in GCC 14 has dropped several nested includes. Include the
<algorithms> header to fix build error:

system/core/fs_mgr/liblp/utility.cpp: In function 'bool android::fs_mgr::UpdateMetadataForInPlaceSnapshot(LpMetadata*, uint32_t, uint32_t)':
system/core/fs_mgr/liblp/utility.cpp:264:28: error: no matching function for call to 'find(std::vector<LpMetadataPartitionGroup*>::iterator, std::vector<LpMetadataPartitionGroup*>::iterator, __gnu_cxx::__alloc_traits<std::allocator<LpMetadataPartitionGroup>, LpMetadataPartitionGroup>::value_type*)'
  264 |         auto it = std::find(new_group_ptrs.begin(), new_group_ptrs.end(),
      |                   ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  265 |                             &metadata->groups[partition.group_index]);
      |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../0001-liblp-fix-building-with-GCC-14.patch | 26 +++++++++++++++++++
 .../android-tools/android-tools_29.0.6.r14.bb |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
new file mode 100644
index 000000000000..ccd289c81ba9
--- /dev/null
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch
@@ -0,0 +1,26 @@
+From 9f4d839847666019cadf57aa34fd366801c11a44 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Fri, 24 May 2024 14:13:35 +0300
+Subject: [PATCH] liblp: fix building with GCC 14
+
+Upstream-Status: Pending
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+---
+ system/core/fs_mgr/liblp/utility.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/system/core/fs_mgr/liblp/utility.cpp b/system/core/fs_mgr/liblp/utility.cpp
+index 48c5c8318d99..0aa8023aa87d 100644
+--- a/system/core/fs_mgr/liblp/utility.cpp
++++ b/system/core/fs_mgr/liblp/utility.cpp
+@@ -24,6 +24,7 @@
+ #include <sys/ioctl.h>
+ #endif
+ 
++#include <algorithm>
+ #include <map>
+ #include <string>
+ #include <vector>
+-- 
+2.39.2
+
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
index f63b5c04b364..176107f2a7e2 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools_29.0.6.r14.bb
@@ -52,6 +52,7 @@ SRC_URI += " \
     file://0003-Update-usage-of-usbdevfs_urb-to-match-new-kernel-UAP.patch \
     file://0004-adb-Fix-build-on-big-endian-systems.patch \
     file://0005-adb-Allow-adbd-to-be-run-as-root.patch \
+    file://0001-liblp-fix-building-with-GCC-14.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.39.2


