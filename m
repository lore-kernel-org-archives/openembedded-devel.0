Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40C2C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:55:22 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.17476.1709744119768180664
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mAqIwORh;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso1287104a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709744118; x=1710348918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpYjPRRIVfl+zGmwLkyEheYRHhZrq9fWtFCg6e0BKTw=;
        b=mAqIwORhHMCVrsm+na2DatavcwFrRiEoEDa8DdIGcE9zReQYJ4fbv4rxPKUkCrIA3M
         Om/tcnNXpOITmloVPsnfRX1W4IsivcebxG3ibV36zozqobumxcGiXsyAd4qvprFbQ0Mj
         vbMoq6xBCF49OpLH8zRHoIz8VZO38m5yjP7FwSfX6IDuNxH0+dsqHWh2pI164mCnxjEO
         9GKnFszqTT/qIkcrmHyfjOVRX4DrrHOUMOdA6gswN43lJKzjnuNN8r8Nj/YkYRVAz0J+
         FDVupHqqX1tugNnxJoD6GWc5EOgYK87rmm45SxkanJAYUanBI+6HAD0bucP7LI4nVGXk
         y5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709744118; x=1710348918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpYjPRRIVfl+zGmwLkyEheYRHhZrq9fWtFCg6e0BKTw=;
        b=ixRJvJPqJ60Ibncf+cl2MJSUet+fQf3d9aNOtKNzdOoNJfQiGis3tleKEoB0DuqZnQ
         WV9PSINedVJq1c7z9gV7Hnc6M0ZH34F2fwaz0u1oLeclKpcTQGRcSlYOOAncK06UKwja
         YDfaxxGH8661kwMop4rMU5ggGQ+SFaOTanUPMwVmr4BJmI8bPHru4B54ZVmtwsdSIgQz
         LjnfpHj+lHPLLwWC+ZI3zvTQ062HIQYmxOQ92rON5bW7MBhnLevzxDe09QvyTkV0muO1
         xDlUz0prxOM8d1n47cC+Wu9s08naON21evg+WUNhqH880YbB4EWu9GnGhCfiOCku8qvP
         l9pA==
X-Gm-Message-State: AOJu0YzfCBCUBYa30ZwL9gCNmZj53URj/9oYrWXAsgG9W7l/nvNtx6mN
	4pAwE/vJUjF2LsRzfnqFoDumtFmbSpfp26t9+vw1x89n7qRKx9IjSZgMpBxwotU=
X-Google-Smtp-Source: AGHT+IG48XY/8mjn7GezIHw32HjUCG9sLsB15ssfkCSW6r8RUwdV0mRoQ1PXON/A6B30ZfXdGfB+FA==
X-Received: by 2002:a05:6402:2315:b0:566:b442:16cf with SMTP id l21-20020a056402231500b00566b44216cfmr11005939eda.13.1709744117310;
        Wed, 06 Mar 2024 08:55:17 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b005672a346a8fsm4337133edb.57.2024.03.06.08.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 08:55:16 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH] python3-invoke: add recipe
Date: Wed,  6 Mar 2024 19:54:41 +0300
Message-Id: <20240306165441.429620-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 16:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109172

Invoke is a Python library for managing shell-oriented subprocesses and organizing executable Python code into CLI-invokable tasks. It draws inspiration from various sources (make/rake, Fabric 1.x, etc) to arrive at a powerful & clean feature set.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-invoke_2.2.0.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb b/meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb
new file mode 100644
index 000000000..3f2e6232d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-invoke_2.2.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Pythonic task execution"
+HOMEPAGE = "https://www.pyinvoke.org/"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a8815068973f31b78c328dc067e297ab"
+
+SRC_URI[sha256sum] = "ee6cbb101af1a859c7fe84f2a264c059020b0cb7fe3535f9424300ab568f6bd5"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+        python3-fcntl \
+        python3-json \
+        python3-logging \
+        python3-pprint \
+        python3-terminal \
+        python3-unittest \
+        python3-unixadmin \
+"
-- 
2.25.1


