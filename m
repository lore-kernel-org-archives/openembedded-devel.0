Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D653CCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 11:14:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.22925.1759230852276275996
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 04:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FGyVpBOI;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7841da93a1aso328989b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 04:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759230851; x=1759835651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVtfOYlvOPic8gUmkr7e8vPy0XjFaAVsftBT//IKToI=;
        b=FGyVpBOIhwTeL7xGsLN/23Oju60LdL3cp9zK8Tm1B9Woz2ChAp22skKDaD1rslmGcs
         U8sF/KDmHaEYdq4k+NYdtLLwsDPUJzLp8B92AZXZfP4mxP1eUuQA+DqCqfBa6dsVOR7Y
         uAdoRk4hyQC5+N+KOsKr6+CuRkex2VoknyRGaZ0MbEwcG8Nyg53AXNLLs0RI6sdgEFac
         cW85Z5nESQKBAraQl6XiyaqaiFdO3fCZd5l2xkmRUmbE7RJwH+1p3jwb8vKvUjSWMLks
         m9C4i5gOH5uId0+2wg6+/c5dCte3Z1Uymi+e9K7yzQT2re9Er3h5Tmlz/LJ61kOOHDhI
         gx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759230851; x=1759835651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVtfOYlvOPic8gUmkr7e8vPy0XjFaAVsftBT//IKToI=;
        b=QmCBdu0g438JmxB4dRFQ3KwwKpuP5dFgAvCx/Hcld5WLOhz0uNeFOWbNCyQp6Ntv2g
         OKyQ0Rdxm/+mm3ZDH0hCtNG+E4FJYOnwvM06bo8Aw1Q6E2wqpddMroclBdoVBG/dJjsu
         8i4a5M3DZeJ846D7dNOLpWppa+q2hm9pk0+HjovxrrNTKb2n/zdvbkV+mNXVTbM8eiU0
         8ukYptpWz5RWjwVbnzo/B1rJvZjLT5sPvMqlkeQwB5Mcj9YhsLULZqhmv7VEzfpx1fnE
         4x3ERqe7QsIaapvxHKQlxuQIGCFO8hRKT6/jm38B0Nut1Zt05IhQ6ycTeH6q6+fc6onn
         UTsQ==
X-Gm-Message-State: AOJu0Ywj8gQF7nUFH9qCvhe7NxjS+FbwW732yJvJicm7rRXHxLigTKM4
	nAmWlBaUejf+83U/I6aQsapIaaDGS8ap+7gQMJbOa6lcrHAhIuA1NgHoU+yBW9NI
X-Gm-Gg: ASbGncvlH0WKeHinimBjMW7UcTT2jkJLBrLVEz8kT04JR9YjWcFQEImGtCzzDWa0zqf
	srsl8978znOyfIZJqSo7Ge2cqJ9LZ1JKhh8v6f/bkoUzL0dNYMuKZ9h21wxrlVioMs0CWyyXYDT
	bASkjKCYI57NMEK+nIknq6P4/QWCu9v2WUQrHKVBjp/roksktL2p3HVhT3Zrq9V0dN2Wn4wkAsN
	MA1nmCEoo/TtuEb/9YXYo4MOtvdgEVTqAXwU5IictXu4YvaTKcp4SHMLYPyNANUTuXR2UEWx/+n
	NRYNJraoLzFB/Q5aB/WfDWn0b9m49tP1jDX0NxIMECIVvHlGy5MN/lnNaDDalHsI/VuOvEl0EJh
	HLpUI5mwv2fM/Vz+RSNSQFsPv9SXXXFDLS1kErxdbTrWuYgPFHs6s1VNGMFybIZao
X-Google-Smtp-Source: AGHT+IEdFOThYxzwCYsxTeZyoVymC9mt9c6mbYibqmYe0z1L17DH8yTsWUp98InQTQUkQZ6XNjjMJg==
X-Received: by 2002:a05:6a00:2e98:b0:77e:f4a4:b0e4 with SMTP id d2e1a72fcca58-780fcee452amr10519878b3a.5.1759230851106;
        Tue, 30 Sep 2025 04:14:11 -0700 (PDT)
Received: from LL-3324L.kpit.com ([2401:4900:1c45:cf69:dd27:1bc:77b:a304])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781e0efab14sm7881438b3a.68.2025.09.30.04.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 04:14:10 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: nitin.wankhade@kpit.com,
	Shubham Pushpkar <spushpka@cisco.com>,
	Anuj Mittal <anuj.mittal@intel.com>
Subject: [meta-oe][Kirkstone][PATCH] cjson 1.7.18: Fix CVE-2025-57052
Date: Tue, 30 Sep 2025 16:46:02 +0530
Message-Id: <20250930111602.341449-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 11:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120080

From: Shubham Pushpkar <spushpka@cisco.com>

This commit fix incorrect array index in
decode_array_index_from_pointer function

Upstream Repository: https://github.com/DaveGamble/cJSON.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57052
Type: Security Fix
CVE: CVE-2025-57052
Score: 9.8
Reference: https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit d9e2cae64f4f7d7145c8389bc2406b5865d12893)
Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 .../cjson/cjson/CVE-2025-57052.patch          | 33 +++++++++++++++++++
 .../recipes-devtools/cjson/cjson_1.7.18.bb    |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch

diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
new file mode 100644
index 0000000000..ed3d4a7eba
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
@@ -0,0 +1,33 @@
+From e53a1413304382d562176bed91609e00b4fcf87e Mon Sep 17 00:00:00 2001
+From: Lee <peteralfredlee@gmail.com>
+Date: Fri, 5 Sep 2025 14:53:20 +0800
+Subject: [PATCH] fix the incorrect check in decode_array_index_from_pointer
+ (#957)
+
+this fixes CVE-2025-57052
+
+CVE: CVE-2025-57052
+Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa]
+
+(cherry picked from commit 74e1ff4994aa4139126967f6d289b675b4b36fef)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ cJSON_Utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cJSON_Utils.c b/cJSON_Utils.c
+index 63651df..8fa24f8 100644
+--- a/cJSON_Utils.c
++++ b/cJSON_Utils.c
+@@ -282,7 +282,7 @@ static cJSON_bool decode_array_index_from_pointer(const unsigned char * const po
+         return 0;
+     }
+ 
+-    for (position = 0; (pointer[position] >= '0') && (pointer[0] <= '9'); position++)
++    for (position = 0; (pointer[position] >= '0') && (pointer[position] <= '9'); position++)
+     {
+         parsed_index = (10 * parsed_index) + (size_t)(pointer[position] - '0');
+ 
+-- 
+2.44.1
+
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
index 797ab028cd..6c335a988a 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -5,7 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
-SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
+           file://CVE-2025-57052.patch \
+         "
 SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


