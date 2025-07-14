Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0022AC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 17:04:03 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.83463.1752512639509589393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 10:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SnfhSm5x;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2353a2bc210so45730735ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752512638; x=1753117438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zr71q8Ag8X0pXWkbpLEJD0sGrYhpqxwbf7Rf5s/N8Gw=;
        b=SnfhSm5x86Sdl0hoG0Hw2n2HVOJf5yKVPXiiexApFFC3F9f+Moa/xXFwoOtgIQtrXb
         l1R47c2513rCdzPIBhOY2lDduFEV/JAhea4/hqmXSXq5yMOF1mtuIGne1jzVCaVCUrfv
         4VTSC1HIf/5MJ8V4tfXx9JvmdIbv+XZJWtxdDZx0ZEbpF/nkRpsjOyPmMQ8GleSGohiM
         LadlXiK5rBt4F9fzifH+9m2RdBiI9Iy+g/X1WXzmWu4yc2yQokq3l9Dl11ElnUpjNMrv
         zlhXf/6Oj2hZkzlRmXFBCYp2LjNMyB6S7BepNuCEmkEYaD5srBH8PM4XSsHNQ0plcwEW
         wUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752512638; x=1753117438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zr71q8Ag8X0pXWkbpLEJD0sGrYhpqxwbf7Rf5s/N8Gw=;
        b=GBeWlOq1S9YZeXqZigWeRRUgEoFHQmfks4Z5cS6wUHArN5GH5/5ZuP2yf8IERHStrN
         Wn09MmpIzpVSGQ9W/SKsz4/azHXHjGjqS5igLmk5RDAx2+x+zQF1WQPiOLZ+FcuWSFHx
         qglzNu6azLe9xypTBPYPDpwsme2pl4jcO2wCuB58BRa1xBR72Bjy3Dm/ioASO0Kvgq/u
         rn0s32RaBN0WZaZG2oTQPgHZ0PUrCbqs/XQETNIIF/lelfQdTIEX4L2bu/T7Io8O4XA4
         Xkhz80Cab5186vmE4jrxAnsHzuxsvnVFfBXOoLoe5k+PZlkte3tXtggVRbKZ5qt/6Qyh
         6sYA==
X-Gm-Message-State: AOJu0Yyv4/roLcTpVnQDunbNJpQnbQKIy4DpQ6mmn1BGZFlaVcSR7nAW
	sJU2I9bWcPsQhPYGPqjyrSECbJPG/I+SMCBFNwWqaPffVLl6/zqZqp73Zp4IAGwM
X-Gm-Gg: ASbGncsdVYBu2f5P07aBpAumyYm+XFIOT+3djCAOnNERZSqrlUax2xA1Y+EbEfRywU3
	JP/x2yKRTuAT5t74AaP7buacUSasKjcELixDBgLXeE2i7SYJZKSfHboYmyYzzj8r87nu0jX5MDf
	Gz1zksUkCfuhhnt3OGOCOdJJIhPfWDyXplJfQH18i39Eke9LoLs2OLQmjNLSkUjA3Ym0vIWYbNm
	CXvKU5+1bDtKvbQ2DBKB2wvIGF2mFtNTZ90wbQPuOFVn8biQ9h4fmGQr4N3+ooiuYuOT0Ms4lRF
	G/FTxxYmolfyPyR6cuUztprfM45iPgin6CTsVtiafMKPkl60Rr7M8YrP8RZswaaaFuIR5hBwuDH
	rI1U5XMnWiMVaEA==
X-Google-Smtp-Source: AGHT+IH1Q/pvKxlLtyNhasB5mysNjOL0nAc9PIHg1syoGymZ6IrAg61NRoLxyr5NuwJo/Xky6lcIpA==
X-Received: by 2002:a17:902:d2c5:b0:234:c5c1:9b7a with SMTP id d9443c01a7336-23dede305abmr165190985ad.8.1752512638202;
        Mon, 14 Jul 2025 10:03:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43411c8sm96419925ad.184.2025.07.14.10.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:03:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] e2tools: Do not hardcode 'git' as part of path in ptests
Date: Mon, 14 Jul 2025 10:03:55 -0700
Message-ID: <20250714170355.3434049-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 17:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118543

Before S was not inside UNPACKDIR and default path for recipes
using git fetcher would be in WORKDIR/git but it has changed
now recently after S moved inside UNPACKDIR the name of source folder
is no more 'git', use wildcard to find the files to delete

Fixes
ERROR: e2tools-0.1.2-r0 do_package_qa: QA Issue: /usr/lib/e2tools/ptest/e2tools-0.1.2/.git/hooks/update.sample contained in package e2tools-ptest requires /usr/bin/sh, but no providers found in RDEPENDS:e2tools-ptest? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
index a60fbec821..38fa8b439e 100644
--- a/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
+++ b/meta-filesystems/recipes-utils/e2tools/e2tools_0.1.2.bb
@@ -35,10 +35,11 @@ do_install_ptest() {
     cp -r ../build "${D}${PTEST_PATH}"
     cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
     cp -r "${S}" "${D}${PTEST_PATH}"
-    rm -rf ${D}${PTEST_PATH}/build/config.log ${D}${PTEST_PATH}/build/autom4te.cache \
-        ${D}${PTEST_PATH}/git/.git ${D}${PTEST_PATH}/git/autom4te.cache
+    rm -rf ${D}${PTEST_PATH}/build/config.log \
+        ${D}${PTEST_PATH}/build/autom4te.cache \
+        ${D}${PTEST_PATH}/*/.git ${D}${PTEST_PATH}/*/.github \
+        ${D}${PTEST_PATH}/*/autom4te.cache
     sed -i -e 's;${TMPDIR};;g' ${D}${PTEST_PATH}/build/config.status
-    sed -i -e 's;${STAGING_DIR_NATIVE};;g' ${D}${PTEST_PATH}/${BP}/autom4te.cache/*
 }
 
 RDEPENDS:${PN}-ptest += "bash coreutils e2fsprogs e2tools gawk make perl"

