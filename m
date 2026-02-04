Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFECEA7944
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 19:55:35 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4058.1770234931008222156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 11:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A0LxsyX9;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b710d46ceso224675e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 11:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770234929; x=1770839729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ISX+OFf41nnd2y8I59SIqfKo5A9YyM1comwKXIzm8U=;
        b=A0LxsyX9tNALIketJPvGpFiqxm7J/JBf5gXoQF4TeTJRRvHcu/21ToGxEQ8emKYkQL
         TxspaKzAqP2r2Pl8eHGmy7CQl4j7o1I38ReAPDOY6F3Egp/5DmATc2/nP0LQAvyT2C9y
         7FAyEgbRV/kvBTqbmU/YNLT7kx/OddFNMCdRnmOZ86TQO0zm2DvzHFvg8juys3WSHwtS
         iCn54WMJU9LUdeljwVE7SmFooqOvacYN9+aQdAuZ1Zfmx7ewltr6/qd0wtptlyYVPkTN
         7GJ0ae862lVXITgpa+eTxnfr3C17uD9L1obBAquG8knCcajFCxoQupdinwd3d4Iv/C5r
         pHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770234929; x=1770839729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ISX+OFf41nnd2y8I59SIqfKo5A9YyM1comwKXIzm8U=;
        b=VWkzItdBWB2Z61ML4KtQBcmAoOuX6bc4UAFa/sLoMEcOzpR9oCeS8L2dveccAXijS0
         Gd/3SOSW2fQddzJWanOQRqNpA6T98VH1Bf8LWwPDM2INLlUlkA7SNTWOf6c3vjDnu9ga
         modoajOLyQqxy59JkD5lLFIfNkG9MywvUa0tABk1ucu5YUqJ83abcd7LItrm552ugGy7
         UFlOHB5FAG+kb4dbV3CiYg6saXFQmZr1bGyrLwLOwQX3jLLCoyFxPIRYZTa33YrTCRc4
         5hVJlN8fq2pun+kbNMLYNpSEIP9sshUVnNI7Ewzi092OESFjfOIgia3vt/+/xwjjE8aW
         MIhg==
X-Gm-Message-State: AOJu0YwNkOM/+aQDVMp16GXwRH7n0/b6sWI9VnnrWPU3fKZovRVSCSyJ
	Md4If+A2Sjn267VZstev0iNKOzsbJTJVVKha+JNZa8c8eKwvUzLOd0Ppw8aTJQ==
X-Gm-Gg: AZuq6aJABhDgDWEpbggoyF/dUc+4Dbwn5sz115NYubtepCAqT329YexU+6hoAI+VpOh
	n3pEme4XphNsCvWt9rYPiE84vtUm1+rCH/EZTrP4UNbAeKJXrlHcxkimj1z23vsUSGb7KyWHELR
	vjt4tO/EZUVjVDaqV5KkEkM7yLJY0jSkbZH2zvKnYKcv1i7DTtM+JnFbP/XxZ1qfNQY3LmhZ2S2
	RNI7LLzJal34B0ysW7J96b/RV+09HMheljmTXvo2fJu+2eG8/i/ZfjWJBsCNPANWzwor1wTc+eD
	i1fyubFArlGuSNLAfJuY0RTk41LftP1263S7aMO8LuXH3Y92paRUlZln22eCQt4AOYJRSbrhmiJ
	DG244lEweWaOo+NuFhooMg8ynSGkVWhnKJ8tfx51HRZ9HF08C3DFna7rrtIXpeqjbD9LSTX7RO5
	K5vQfFqS5jNbMGFMb2k7dpzoXnGeAUIw49cV2tLqMAvWek0PTGWnZUVxH9/0hXspk2RsQLnFygO
	hIXg484
X-Received: by 2002:a05:6512:1344:b0:59d:fd1d:ddf9 with SMTP id 2adb3069b0e04-59e38c0896cmr1589870e87.15.1770234928787;
        Wed, 04 Feb 2026 11:55:28 -0800 (PST)
Received: from dt.taila4487.ts.net (x5ab8e2e2.customers.hiper-net.dk. [90.184.226.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e388232efsm866746e87.78.2026.02.04.11.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 11:55:28 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v1] glaze: use default install for cmake files
Date: Wed,  4 Feb 2026 20:52:04 +0100
Message-ID: <20260204195202.1101258-3-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 19:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124146

CMake correctly installs glaze in a location that cmake can find via
find_package. Without this patch, an application using the following

    find_package(glaze)
    target_link_libraries(myprogram PUBLIC glaze::glaze)

Would fail with the following error (with tmpdir redacted)

    CMake Error in deps/vesl/src/Platform/CMakeLists.txt:
      Imported target "glaze::glaze" includes non-existent path

        "$TMPDIR/recipe-sysroot/usr/share/include"

      in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:

      * The path was deleted, renamed, or moved to another location.

      * An install or uninstall procedure did not complete successfully.

      * The installation package was faulty and references files it does not
      provide.

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
index e481290b9c..db87d636e6 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
@@ -11,13 +11,6 @@ inherit cmake
 
 EXTRA_OECMAKE = "-Dglaze_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -Dglaze_ENABLE_FUZZING=OFF -Dglaze_DEVELOPER_MODE=OFF"
 
-do_install:append() {
-    install -d ${D}${datadir}/cmake/${BPN}
-    mv -f ${D}${datadir}/${BPN}/*.cmake ${D}${datadir}/cmake/${BPN}
-    rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}
-}
-
-# Glaze is a header-only C++ library, so the main package will be empty.
 ALLOW_EMPTY:${PN} = "1"
 
 BBCLASSEXTEND = "native"
-- 


