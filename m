Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2A5C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 14:04:27 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.9391.1745417059462918053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 07:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mXetSK9W;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70565ccf3bcso61043057b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745417058; x=1746021858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh4EN6QXBD1TmsWPVjdOk1YUPWkWGhD1/OyWoe2zthc=;
        b=mXetSK9W+aILe41FriuMKgSpYRGLWtwM0LJB2ruYwJn+ktrJLeYkAWmXcXB1wl+2tN
         ywMK6r/xKGVhF6iHw5Gu9Z9FiWHGkh9QbPDVT+E8E/aqrVuGQk6WQzmYfgzXNyW9XlhM
         GJwu5JmTr067rr/bhXoMbgkvM3/zrXBAQy5qaPBxY55u8H8qnLeoVYr5h776vvaT8PJu
         Gp0q2fksUWdB1hCDAtkytO1z414z4LM3ktNNeZFGqbZlJCGlxFqCsgRXrPRHN4H51am2
         4t+pKDKQc8k+M5hqTVhkgz9BbqPARvLGbICbf2FzjDoTx4BF1ip56emROfzq0hDv9lj3
         /4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745417058; x=1746021858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qh4EN6QXBD1TmsWPVjdOk1YUPWkWGhD1/OyWoe2zthc=;
        b=QjL/6AL4PKkX9PXdxOjkTRee8VOcv8MLfW/joIAMKI5/Pc9sAHbJB7WFi7V1pIV9Kn
         4CuVeQY9VqXUZ+spBoZuNr5qtSj7euF1yzO/ge9XtERc+LsAEnr1FHkAvuvgCcmmO4Sn
         DR/yY39YVsh/xqasFfL2ji3wnLFzZLnARZLH8OMEpJFIEyanglWLfREsNb88xo/b6M0c
         qvcep0LXdXCf1eHoVy87CXS5dIHgijIANfQeTQ6//ixx1hB3U6pmbSrZOdGe9H6yvArF
         tnZQABZGOs2iuZKwiQcVTUEYqvmmrz7xk1vjPsZBUkQhCuLVggPb+5hL1wWZuJwKLNtm
         ilNw==
X-Gm-Message-State: AOJu0Ywen63mgXuc4sveP4TY01V6ODsysCFyQs8OdBxVGYQsBfXaNmaY
	KruH2SV1tbwrLwbdL1MWboZMNGnAfOznjWFebhbWrGlTP+eYGP5ZOx43QJXT
X-Gm-Gg: ASbGncs8n6YNtfEg6P5UaaFezv3zG2dqxMBQySa9NJAY8+aoRnCrp9FWpBZL7VWvYWl
	s8s+X79JGcRUKWtI0KUfyCSVzluNt4xfrnIS0z/xLmqB5R1BzeTnW5ifmA5kddUpbDJygMpjqQR
	rDk6Xy7kOPk42/xFoFlaV7ksw1i0ce1L4mQPM5Mpwh4sb2nTHPLkk0l7UL/YpBqHrkgwNo07qcy
	P8BnVmlj23sSd0nOG3vK/sePpcuSebqOXnpmufP8t3ejZk7VdB79o+8KIy5l9v2tWEfltj2rRPa
	e31qztii8H5nH/Kozd4TslB8/QSWj+irSzBgKwEuaABIkn98T0I66off
X-Google-Smtp-Source: AGHT+IGfxoLQ/VHJ4b1w2I0e33ODCMw3XQBUiAIRGh1G+klas4KbOF3v/RiMNkjxyRC5NvXM68UUtw==
X-Received: by 2002:a05:690c:f03:b0:708:1bf1:cc4b with SMTP id 00721157ae682-7081bf1cce0mr71365047b3.7.1745417057978;
        Wed, 23 Apr 2025 07:04:17 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fe08sm29494917b3.13.2025.04.23.07.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:04:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.14.0 -> 22.15.0
Date: Wed, 23 Apr 2025 10:04:00 -0400
Message-ID: <20250423140401.368400-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 14:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117078

    License-Update: Whitespace changes.  Update copyright years.  Add zstd under BSD license.
      https://github.com/nodejs/node/pull/57840/files#diff-c693279643b8cd5d248172d9c22cb7cf4ed163a3c98c8a3f69c2717edd3eacb7

    Changelog: https://github.com/nodejs/node/releases/tag/v22.15.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_22.14.bb => nodejs-oe-cache-native_22.15.bb} | 0
 .../nodejs/{nodejs_22.14.0.bb => nodejs_22.15.0.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.14 => nodejs-oe-cache-22.15}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.14.bb => nodejs-oe-cache-native_22.15.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.14.0.bb => nodejs_22.15.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.14/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.15/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.14/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.15/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.15.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.14.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.15.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.15.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.15.0.bb
index dee4c9df4f..07ea8c083d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.14.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.15.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=da350b022352bee62fe22feb6ad681c8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b4f41dcacabc8f07b9ca7dee2f188a00"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -37,7 +37,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "c609946bf793b55c7954c26582760808d54c16185d79cb2fb88065e52de21914"
+SRC_URI[sha256sum] = "e7c4226d1d92f33ad854d6da4f7e519e77690b8e73f93496881f8c539174d9df"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.43.0


