Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F262C77B75
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:13 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.68997.1683477190844319692
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RsW3wgRO;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so21527450276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477189; x=1686069189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwQ9Xw4/TJb84IxsFj2nW9zPXw291qs36yVLFA8B7nI=;
        b=RsW3wgRO9/fJwvGeq0Cm73j4cSNuf5zqNo27gBfGQsaMg2bqxR3sxzsyRvplz/16yN
         /9TlxtnxwslOF7neQKPHOEoug5BlZPRG8S36aUZCEeYkNxVveQNnV3Wh6E1mfUi/cuSF
         H4PVslfuMYUb2mtBfRACjO4o79kj54YMBWbu8nrRTmhy6VsBhxWuUHn9v/Ms+XM+0w6r
         9XwxnzrQ3HVdO7xBpQ047elyWXqkpS+3s7+kFP6mtLrzpw/ybl91kNoQmnJvLkR/1ggj
         LUsH+pBzH/5GlFpqBFsQjjVRX73gnp/6u3/o/cKDVxG4E2JyY9jPL8Qx9v3ncYDPO3ld
         Q0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477189; x=1686069189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwQ9Xw4/TJb84IxsFj2nW9zPXw291qs36yVLFA8B7nI=;
        b=XITcU0JMeNuOv6svqNRBE4LXnEt5tmIAFztVNtuZ2fnTqoWz2VEho+iz9FBpC0L0Q3
         0qLa4t5O135j3rXw9Ql9W6PtB1qRsHTHoR9ofFe+Ls4SdNJcd5ndpnSu2+0TVcVH03t6
         to5a1O7uefDLgbNhkUTm5MFgYPX7CsHWjxLsdmDrGifkZFU82lVNt3xPA22XtQVl4fAa
         WfyvHku5v8OyvjYUdPKSiTsRz2fdcxnQFsEMe4vAgfABbIDqKfzhGbCpDV5iIJbgpmHe
         32dVS4FTdf+LfssCJe5tqa91CTKlkdmSCp3D5NP+7C4IBY30XLlYMXZ3Va8diLXjIEaf
         so9w==
X-Gm-Message-State: AC+VfDwmtRwXTVFuiX4W4cs3BRiDx1/hoCEzH9JdS1F4toqMGTxnpJ+/
	EsuuMtW2ulqBx5cq6Sf18cbH5j7AHB4=
X-Google-Smtp-Source: ACHHUZ5aq3W44hgaKLjMd178TC8KJ1GVngS5KSVsVYGs6k5rba3h2U0bOHFBPI140Zvb8rcUuZCsUQ==
X-Received: by 2002:a0d:e812:0:b0:559:deee:be50 with SMTP id r18-20020a0de812000000b00559deeebe50mr8340148ywe.21.1683477189574;
        Sun, 07 May 2023 09:33:09 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 03/29] hdf5: Fix install conflict when enable multilib.
Date: Sun,  7 May 2023 12:32:39 -0400
Message-Id: <20230507163305.3261044-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102333

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/include/H5pubconf.h conflicts between attempted installs of hdf5-dev-1.14.0-r0.core2_64 and lib32-hdf5-dev-1.14.0-r0.i686

The differences between lib32-hdf5-dev and hdf5-dev are as follows:
@@ -479,10 +479,10 @@
 #define H5_SIZEOF_INT8_T 1

 /* The size of `int_fast16_t', as computed by sizeof. */
-#define H5_SIZEOF_INT_FAST16_T 4
+#define H5_SIZEOF_INT_FAST16_T 8

 /* The size of `int_fast32_t', as computed by sizeof. */
-#define H5_SIZEOF_INT_FAST32_T 4
+#define H5_SIZEOF_INT_FAST32_T 8

 /* The size of `int_fast64_t', as computed by sizeof. */
 #define H5_SIZEOF_INT_FAST64_T 8
@@ -505,16 +505,16 @@
 #if !defined(__APPLE__)

 /* The size of `size_t', as computed by sizeof. */
-#define H5_SIZEOF_SIZE_T 4
+#define H5_SIZEOF_SIZE_T 8

 /* The size of `ssize_t', as computed by sizeof. */
-#define H5_SIZEOF_SSIZE_T 4
+#define H5_SIZEOF_SSIZE_T 8

 /* The size of `long', as computed by sizeof. */
-#define H5_SIZEOF_LONG 4
+#define H5_SIZEOF_LONG 8

 /* The size of `long double', as computed by sizeof. */
-#define H5_SIZEOF_LONG_DOUBLE 12
+#define H5_SIZEOF_LONG_DOUBLE 16

 #else

@@ -538,7 +538,7 @@
   # elif defined(__aarch64__)
   #define H5_SIZEOF_LONG_DOUBLE 8
   # else
-  #define H5_SIZEOF_LONG_DOUBLE 12
+  #define H5_SIZEOF_LONG_DOUBLE 16
   # endif

 #endif
@@ -557,13 +557,13 @@
 #define H5_SIZEOF_OFF_T 8

 /* The size of `ptrdiff_t', as computed by sizeof. */
-#define H5_SIZEOF_PTRDIFF_T 4
+#define H5_SIZEOF_PTRDIFF_T 8

 /* The size of `short', as computed by sizeof. */
 #define H5_SIZEOF_SHORT 2

 /* The size of `time_t', as computed by sizeof. */
-#define H5_SIZEOF_TIME_T 4
+#define H5_SIZEOF_TIME_T 8

 /* The size of `uint16_t', as computed by sizeof. */
 #define H5_SIZEOF_UINT16_T 2
@@ -578,10 +578,10 @@
 #define H5_SIZEOF_UINT8_T 1

 /* The size of `uint_fast16_t', as computed by sizeof. */
-#define H5_SIZEOF_UINT_FAST16_T 4
+#define H5_SIZEOF_UINT_FAST16_T 8

 /* The size of `uint_fast32_t', as computed by sizeof. */
-#define H5_SIZEOF_UINT_FAST32_T 4
+#define H5_SIZEOF_UINT_FAST32_T 8

 /* The size of `uint_fast64_t', as computed by sizeof. */
 #define H5_SIZEOF_UINT_FAST64_T 8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9d0f892a26aa5d3f754b5cd9af77d4c442ccef12)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
index 4feec61afd..d0ff2ef487 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "HDF5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac1039f6bf7c9ab2b3693836f46d0735"
 
-inherit cmake siteinfo qemu
+inherit cmake siteinfo qemu multilib_header
 
 DEPENDS += "qemu-native"
 
@@ -44,6 +44,7 @@ do_install:append() {
     # Used for generating config files on target
     install -m 755 ${B}/bin/H5detect ${D}${bindir}
     install -m 755 ${B}/bin/H5make_libsettings ${D}${bindir}
+    oe_multilib_header H5pubconf.h
 }
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


