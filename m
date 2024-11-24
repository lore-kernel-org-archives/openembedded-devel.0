Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5C0E66893
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 02:35:17 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.60474.1732415716189925199
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 18:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ONxxxYew;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ea1bc2a9c5so3365845a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 18:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732415715; x=1733020515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gA5ASrW0NCgibWzUPQaHel0VFfMxte4a0DiEUL5xTZg=;
        b=ONxxxYew853bsg77eYb22NllN5ZzAC7YlmJjrKR3knDkemw9IdzXJZMGAR9/oqTRvA
         RcCmlzj9QpydmCSA025BLNSCzmdyDi/T9r7iqeC24kA//Tf9mjjqATIuoTuO4i/S21HF
         j+tfBI+n9c29ZkOFnfqHPP+wdffJsIXZoeKVLXl209mo2cM2OI1pTZjPJXsJxiH+RHEi
         m1YSJKaz6MiwhobIoH0LsCmY27GWMXeEK/qylUzcrACE37YZ1aQI08TnntNyWZVVaTBI
         pXMhk2wjk70VS8792xAsMlwiDv/EYhqCSyTIUNmcrwSTedWVI7z0gUfL92/WdypOcRzn
         TCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732415715; x=1733020515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gA5ASrW0NCgibWzUPQaHel0VFfMxte4a0DiEUL5xTZg=;
        b=MxX33ckIMBIakVBG1aw+K0tXWt7/EvfP0WwMnHjHd2rHHj6BGngVs8vmHol5++bPLz
         e4XSuR6TXKq1QG8p6JQibw7z2SHQBkYiF6fXSnByX3MT4vNMyK2nC+64K9hrOUwvR/IV
         1LyiW9jaGMe+DuM3O04lRtR3loe4y8byVB/11Brdvfl5jSR+nhNvoHDUhri/ZiX/whTC
         EkaskYYHCZqALW1txnwhe09If3fjxHrQ/KQTkDbgw8zT30Qq90giqA00s4g8LQWhYALv
         Ei4w9FDoejoOrSxjxeHmfq4dxpNOzeQi+5lT6LoYmlAPBaaeDw1GK6iBp3Rch47P2DCe
         lK0A==
X-Gm-Message-State: AOJu0YxT5GJsORWLax/EVtyPKomgSM4AyD6CqjVtpXIahohYW4KGkqNH
	in1IqXNrwBaWmFkS1tENbMhfNNoCMdcCB4kfzR6HUzcLZwXR9Np2Vr9f/w==
X-Gm-Gg: ASbGnctdM7LWtT9e2r3zuS2OAt5SN0GRdt21u+CYEieSFJ2bJ888vmpf+AeW48veee4
	V8ejsJaMnJhKVQ7CV84kyxc8jpFgL5hvaCRWejwHx9zpzFV8RJReELY9CsowDXtKWRHN/yGTz2F
	L2BzJJpFRvUr4QbXsVhvUN/rTxgLZvmJ47kcUPjKHcS1bGF/fSxW9QS34RdHN0kNe/W4Vl3yRHm
	cmYumI5pT6B4AeN0PHv7pU61XgnmPRvSrHG4cVliJcSuIhBOk4=
X-Google-Smtp-Source: AGHT+IGrUR61SOvlCUx/Gb9k5U8S7iUaOcnQbwg8j8WE7vNdBYHWuwjuOim3T+H7TEW6ylPOeVr1Yg==
X-Received: by 2002:a17:90b:1945:b0:2ea:45d3:a73a with SMTP id 98e67ed59e1d1-2eaebf2799fmr18628406a91.16.1732415715187;
        Sat, 23 Nov 2024 18:35:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de4786a1sm3895514b3a.51.2024.11.23.18.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 18:35:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-zopeinterface: Fix build with setuptools > 74
Date: Sat, 23 Nov 2024 18:35:12 -0800
Message-ID: <20241124023512.1984577-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Nov 2024 02:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114027

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Allow-using-setuptools-74.patch      | 24 +++++++++++++++++++
 .../python/python3-zopeinterface_7.1.1.bb     |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-zopeinterface/0001-Allow-using-setuptools-74.patch

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface/0001-Allow-using-setuptools-74.patch b/meta-python/recipes-devtools/python/python3-zopeinterface/0001-Allow-using-setuptools-74.patch
new file mode 100644
index 0000000000..a01247fe5a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface/0001-Allow-using-setuptools-74.patch
@@ -0,0 +1,24 @@
+From 5060ecfe6cff5110cbfbc781fc7342ad08fc6f90 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Nov 2024 18:30:40 -0800
+Subject: [PATCH] Allow using setuptools > 74
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 17da486..7906a37 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -3,7 +3,7 @@
+ # https://github.com/zopefoundation/meta/tree/master/config/c-code
+ 
+ [build-system]
+-requires = ["setuptools<74"]
++requires = ["setuptools"]
+ build-backend = "setuptools.build_meta"
+ 
+ [tool.coverage.run]
diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
index 76b0641817..dcf660d419 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi python_setuptools_build_meta
+SRC_URI += "file://0001-Allow-using-setuptools-74.patch"
 SRC_URI[sha256sum] = "4284d664ef0ff7b709836d4de7b13d80873dc5faeffc073abdb280058bfac5e3"
 PACKAGES =. "${PN}-test "
 

