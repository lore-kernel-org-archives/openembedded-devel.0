Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.6317.1622029981546350771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c0SFNem1;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id a7so489239plh.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EkwHp9yOleC05X1KG9pMHA/ejD7AlxUnAjXMmZhe06U=;
        b=c0SFNem1LaEcwa7CzE4/ke84haPaYBwPU89T4rqgj2wRyUBJOU4k9AOSgQjR0pQKl/
         xYBoGWeq5XNbSZv4f5dWwM+rwEyW3z5DxaZlBtIYQvuX+HaoTywTMx9vEO9UCXmnzSkY
         BrFpU6T8o3C2bz3m4jkBCMfObS3Lo/fXEu3W5kteq8L5mOxECrd0dVI1MmHhz829hF4t
         0e280mQDxJQVd1PrAOSk8D4REFFtJ5V9B9fA8wSswa5MGx85q6QHWx+TiKh37Eolkq49
         vCVmF7FV22hMLS4/9uVKwUDn8VkJCLotUFDEYeZ6W/AWRQCpdODhDozMWtM9LgLfLe6y
         usZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EkwHp9yOleC05X1KG9pMHA/ejD7AlxUnAjXMmZhe06U=;
        b=n2XwbymktRe9dacelCXJBcl0RFCmPE7wKkp1sggtWpKeZU1R95IzepQjvpER7f8lkj
         baCG+QYYaKtdxLoamlCmZBJr7RAXJMLz7RlPHxokpsnMVLEARWyQHM4Uxd6dEMamy7jj
         8tdNu8iyFZp9Z4jPijwAOMUXeDYS4Skh3N5EVGRsmdOtQeBefy+/WwVilIcrHrVS0HMP
         Ml3WBY8wu8FR14jfYuRFqCt+O4E0ou0Rlgfgt2dC10LQFu1BJBVr+77Lwj6GreUn0Cer
         VLYbOG2xmzSesJ/kmJOeo15fpX/wfjonK/F+oJ/8sH8kXZgn9/8Z9zKGTAxhWq8y/dBG
         ik/w==
X-Gm-Message-State: AOAM530wKUqmHh+tqEUphW0rCrv71IyfPnqwkQM6vKiUx//cCtLKHi57
	HwDAE9RKO3DSopePu45nF17vp0zn8C/yog==
X-Google-Smtp-Source: ABdhPJwWXkvdBr+d4tAkbrwx9Z5wZ68N3Z8UxdakjBdVfYhcE4of4lKnMxb857QTJlidd/ifGSdM6w==
X-Received: by 2002:a17:90a:f581:: with SMTP id ct1mr1193261pjb.116.1622029980865;
        Wed, 26 May 2021 04:53:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.53.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:53:00 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 14/23] exiv2: Fix CVE-2021-29473
Date: Wed, 26 May 2021 04:52:29 -0700
Message-Id: <93a33c961102742de0874e14ab920ec379eed13e.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29473

      The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file.
      An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2,
      if they can trick the victim into running Exiv2 on a crafted image file.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/pull/1587/commits/e6a0982f7cd9282052b6e3485a458d60629ffa0b]
      CVE: CVE-2021-29473

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a9aecd2c32fc8f238f62ef70813e032b6b52c2f2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-29473.patch          | 21 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
new file mode 100644
index 0000000000..4afedf8e59
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
@@ -0,0 +1,21 @@
+From e6a0982f7cd9282052b6e3485a458d60629ffa0b Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 23 Apr 2021 11:44:44 +0100
+Subject: [PATCH] Add bounds check in Jp2Image::doWriteMetadata().
+
+---
+ src/jp2image.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index 1694fed27..ca8c9ddbb 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -908,6 +908,7 @@ static void boxes_check(size_t b,size_t m)
+ 
+                 case kJp2BoxTypeUuid:
+                 {
++                    enforce(boxBuf.size_ >= 24, Exiv2::kerCorruptedMetadata);
+                     if(memcmp(boxBuf.pData_ + 8, kJp2UuidExif, 16) == 0)
+                     {
+ #ifdef EXIV2_DEBUG_MESSAGES
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 2419bab352..d5d9e62ff2 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.pat
             file://CVE-2021-29463.patch \
             file://CVE-2021-29464.patch \
             file://CVE-2021-29470.patch \
+            file://CVE-2021-29473.patch \
             file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
-- 
2.17.1

