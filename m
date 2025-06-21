Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE22DC7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 10:19:42 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.4765.1750501173856257444
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 03:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aS9bsH/5;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b9eb2299so3218177e87.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750501171; x=1751105971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhPKVApuXVoN9mZtKVLNtb9Vs9nBq1rJjK/M0N3tJQ8=;
        b=aS9bsH/5Kjr/RS2eVUge4TCjYUJ/dSIg6Ym9lV3wWYKtErxueFb87uzO6DIrZlBXdR
         Z/7lkv6nEZsqmCWgj3fVawdEK3sdDBW/2YLwK9Fkakd2/Zq0A9JM2fMi76BrRnd/YsHT
         kHNSPNTN0Ou1jofHedjQDdb9N5Dzipwz87Iw8erdIgrmUVNEZdpum2+ZFmwA2HPBowd2
         3Btz+M6y88n63Y6gmeD3c69gjUbMVxv3pZpgK3wNVsmd+wlkQ4uqgLt7HQykWSMhw0h4
         0UvU3GYY4ZJpXXGyTgQcb2uUY7Df1Z1z9rlODMPpqCvXxziC/xnD+esD/SOfkhB5nuLY
         F41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501171; x=1751105971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhPKVApuXVoN9mZtKVLNtb9Vs9nBq1rJjK/M0N3tJQ8=;
        b=EeLzemT+4xlclpiphO7LKgTp/mwPCd71ycowQcWU59+/YfvV0SsKhmHndu/VbnsvLv
         AeAhC76UtDvOh2BSeN2XzN3GYljsFSz8s8Jy2Ru1/WGkAya6xRAolhuYfWfZrWYDpnJk
         pEI2Ci9VVrL4ADRIrW+E48KnpqP/yk0ViYysN79InNGrLpjnZbi8g2ddk/pv31uJwMn5
         RpexRllnZaMYsmz7jm3bECjv6k1+w0txd2hZx9l7HdKFvWb79U0cZGWvUBhAU1ct6N3y
         EM4yPCqhltRXEYmABAn/ocpQKNnLfRni4OvjDZhU/dYuydkxfeJkBQnPw8Yjb8gqyT+a
         DZVw==
X-Gm-Message-State: AOJu0YwOX7wk0tLlZ/VGptcuwbO+gMm8RMHaAzU3GRWbSB+luC7Sdp+j
	/+eARsu0UhpmDf1GpU5kAoHuXLwpHucwYOrahzNVcQYjZJAOddZ/fgK4wZOjBkb5
X-Gm-Gg: ASbGncurbVolZr1omz7ifJJsOv/yovVyKrkMqBqMUrOcHWqc0esyWwIPJgl3XriCD90
	/LRtYKl0GV8vhIAE7C9rvbWhixsibY8PvZ3R6ByfGQMeIIVeyAIFkHWykwFIhn1LtSkBmOuT2lG
	lVYZ1+14vZGWpE7I12tjVI4cPYNGQVd2cLGvyyaQT+t4mxwg/dZZv5XmDddJ9QwOlAWsEC6OINR
	RRswdQeCCMsJaTCkyn6mO2UqpeKKwCWW9RiGr3l1H2ekbzgx1rHZ3V1riHBWvjATpy0RzeXB7ui
	mdJO9Zk1tWESLDcehJWeg2sG/olU2mggKykDFfJm3hL7aq5aSeMXpcTHWltYwSSrPpv3dUyTLyt
	q7Oc=
X-Google-Smtp-Source: AGHT+IHpYbD00zSrR6l9tdAjls/m4aeqlzNmW4yRVE+z1XxXG9aeODnpqEGFAHbpPiXvgl5Sajyq8g==
X-Received: by 2002:ac2:568b:0:b0:553:d884:7933 with SMTP id 2adb3069b0e04-553e4fd71a4mr1778726e87.6.1750501171312;
        Sat, 21 Jun 2025 03:19:31 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980dadb0sm5740941fa.88.2025.06.21.03.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 03:19:30 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] ace: set S to be in UNPACKDIR in recipes that explicitly set S
Date: Sat, 21 Jun 2025 13:19:25 +0300
Message-ID: <20250621101925.1505578-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 10:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117995

It was related to latest UNPACKDIR changes -> https://git.openembedded.org/openembedded-core/commit/?id=46480a5e66747a673041fe4452a0ab14a1736d5e

ERROR: ace-8.0.2-r0 do_install: oe_runmake failed
ERROR: ace-8.0.2-r0 do_install: Execution of '/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/ace/8.0.2/temp/run.do_install.14265' failed with exit code 1

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-connectivity/ace/ace_8.0.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
index 0fe41a7b92..b730b0a86c 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
@@ -21,13 +21,13 @@ CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: this CVE is for vmware ace"
 COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${UNPACKDIR}/ACE_wrappers"
-B = "${WORKDIR}/ACE_wrappers/ace"
-export ACE_ROOT = "${WORKDIR}/ACE_wrappers"
+B = "${UNPACKDIR}/ACE_wrappers/ace"
+export ACE_ROOT = "${UNPACKDIR}/ACE_wrappers"
 
 inherit pkgconfig
 
 CXXFLAGS:append = " -fpermissive -Wnodeprecated-declarations"
-CXX:append = " -ffile-prefix-map=${WORKDIR}= "
+CXX:append = " -ffile-prefix-map=${UNPACKDIR}= "
 EXTRA_OEMAKE += "INSTALL_LIB=${baselib} install_rpath=0"
 
 do_install() {
-- 
2.43.0


