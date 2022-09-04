Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC45C6FA8C
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:44 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.11312.1662276875119398369
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j29SvoxA;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 o15-20020a17090a3d4f00b002004ed4d77eso400780pjf.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ERhddm2vVbRsjzT0VjQ2ai6pZjKRkE1THhkMB9cooXQ=;
        b=j29SvoxAUOYdUTfm3cXaMPHP/X67nCfTDVplIxIYq1AIppP1h6783FqN+P8FaxAshm
         e9sKJHmiN3t3UhZcI+DMXpDut8OwnJGs6gsBdofeZgsmNk+lbDgh0ruw1hi7CB1r4yZw
         oqYFhAPltIrXitx4/IVS03d4sAr4I6+aSp4zXAlQ4jKXBBAsJsj4GuFhW2GtlwgUzJed
         Bxwe1iKs1AjorYolJRmkP4sL1Vu1RePacY4AQIkKbYkhR6u6wZoRPa5Dznz4bNUNHCzp
         UGgUmTQ3JWOFbRZDNc/VprohkBaajqHJP69ikWr1+HRvfhwnYyBFst3MKQUzbnUQ+4oQ
         XenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ERhddm2vVbRsjzT0VjQ2ai6pZjKRkE1THhkMB9cooXQ=;
        b=K6jUtsI2qWHHPLm77X07clcGDxS3DYQ9gOnUgJooCx/a+w842fbzqKF6IPnDX2rUwu
         OJJ+JAT1uL6T1WW7G4NPlNN7WJyIZ45KBAid+JuLn6EfmLpcwKmFwYWmmi9PpjWb/cdq
         eVEfstnPlEl6IbCmPjoqI+iENlf1PwWaTZndf44fi0/TJ24aCOH+I4T4v1DiMjC9JM2K
         K588HmJC4WD5sQnASLM+Y8/YIQdejFWxIcwp0p2hZMVVgHwYnG9UgZMovJrVXsfVusf+
         xOMEG5IsdB8Txd82qkogLKvWJa1xFJ+FRP7+KJeyqBHl2HlhGO5DWI4S44cQIJwS3qVy
         k7PA==
X-Gm-Message-State: ACgBeo2mz3V890OmIyONSfyHjjVlDeZ/lYcQWwP5iqSPcZiHt+CbohDf
	P8yFbS5YWihz7ZyikrxkI5g0UFPZHDHUew==
X-Google-Smtp-Source: 
 AA6agR4KIrJwF7eCUIaIhO5u5fGyyFhEE9ObF1quwt5773ADriVHIMDnWl7pwwIluM045EwdnZaDZg==
X-Received: by 2002:a17:90b:4c4f:b0:200:2ce:ad39 with SMTP id
 np15-20020a17090b4c4f00b0020002cead39mr9298387pjb.98.1662276874199;
        Sun, 04 Sep 2022 00:34:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 13/63] android-tools: Add protoype declaration for
  b64_pton
Date: Sun,  4 Sep 2022 00:33:27 -0700
Message-Id: <20220904073417.3251865-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98607

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../core/b64_pton_function_decl.patch              | 14 ++++++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb       |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/b64_pton_function_decl.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/b64_pton_function_decl.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/b64_pton_function_decl.patch
new file mode 100644
index 0000000000..80410f1d2b
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/b64_pton_function_decl.patch
@@ -0,0 +1,14 @@
+Add protoype declaration for  b64_pton
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/adb/adb_auth_client.c
++++ b/adb/adb_auth_client.c
+@@ -29,6 +29,7 @@
+ 
+ #define TRACE_TAG TRACE_AUTH
+ 
++extern int b64_pton(const char* src, uint8_t* target, size_t targsize);
+ 
+ struct adb_public_key {
+     struct listnode node;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 26393605d4..37e72de2a6 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -39,6 +39,7 @@ SRC_URI = " \
     file://core/0011-Remove-bionic-specific-calls.patch;patchdir=system/core \
     file://core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch;patchdir=system/core \
     file://core/adb_libssl_11.diff;patchdir=system/core \
+    file://core/b64_pton_function_decl.patch;patchdir=system/core \
     file://core/0013-adb-Support-riscv64.patch;patchdir=system/core \
     file://core/0014-add-u3-ss-descriptor-support-for-adb.patch;patchdir=system/core \
     file://core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch;patchdir=system/core \
-- 
2.37.3


