Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45A2C41535
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 16:34:23 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.33416.1699202058570935996
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 08:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E4e9BTfW;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc68c1fac2so33711215ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 08:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699202058; x=1699806858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xmZaE1YdPMllGwXpa2CDakCP6YMDKVVdynPA/iTTb2Q=;
        b=E4e9BTfWsAEWkHrIP5s6BP68y15Dx6D9q/NUtUwHohs+cG36ORxgT9dXDTQSRGavF7
         6QOsBJ8BIPdhJrHkqNe4+sxrBIVGohidusTLQT7Vo3da0uuDw+xGeLGgSGt8ULNODH2U
         jAttEXkGRLI6VWMuYqZ0NhDEvLoZPASnSdKyA7mn3dfdi0EzaM/QcpyyreXlh2vTIxjV
         rla4v8neYXrEnxnIj7SxIkUVJ33ubBZPZvXFoiS/wG6ACn1hFti3SEjwpYAQn5ey4x4f
         PyOOzADxKtdEC53Oyktu0b4+RqhCS+4RHiQ1+bVnjFLjWh3ddQfWTnXs8GLUuz6fSA52
         ejzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699202058; x=1699806858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmZaE1YdPMllGwXpa2CDakCP6YMDKVVdynPA/iTTb2Q=;
        b=KZpXGwZeRWKHDnsY6LWpt8BhufHBQbss26YhNlygadJ4nBZcJJapDomDu7r/big6XL
         pcovahoW/HUzg2OLnzzj7tJ99Yb076Wf0s+sxobgpGVgJ2ctBjCwyuQ/g0HYUcOZOz5L
         Q6ZmMz5YipLBsqVzuWIYkchpY1kFmL8M3FVXBF4ywxw1/K5KiQuNw9670mz+V4P/iFDo
         b4sXtRaUqltBLOfpOWHWCoiytmXZ49DVQaR15/YYzZDLSmLfsyUFZN3SJoslABEMq8P1
         I73GLPyhdyg8Yas+mXM6l4N01O4XooUgzQNgPQMU9FzShAdIZNmELkj5ls8k/aP4G+3K
         EdaA==
X-Gm-Message-State: AOJu0YxnZKZBNq013AtYabEUhPpvDHZF5pHS4tu7Z/FxTq+IQn/D1F9J
	QRgAXEcgs+b7cx9LgriM6c0/aSVK4KIRGA==
X-Google-Smtp-Source: AGHT+IEedAV8sF3rdpny+g3IIbdioAS3JX2tIgjjbDcY2g4QijnJDQR88brSmBkH3gq18ek7Z0cfZA==
X-Received: by 2002:a17:902:d2cf:b0:1cc:45f1:adf5 with SMTP id n15-20020a170902d2cf00b001cc45f1adf5mr23920188plc.40.1699202057391;
        Sun, 05 Nov 2023 08:34:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::38be])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b001cc3b988fd6sm4332669plx.265.2023.11.05.08.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 08:34:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] xfstests: Fix build on musl
Date: Sun,  5 Nov 2023 08:34:14 -0800
Message-ID: <20231105163414.3705198-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 16:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106384

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...W_-macros-when-not-available-in-libc.patch | 41 +++++++++++++++++++
 .../xfstests/xfstests_2023.10.29.bb           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-add-missing-FTW_-macros-when-not-available-in-libc.patch

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-add-missing-FTW_-macros-when-not-available-in-libc.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-add-missing-FTW_-macros-when-not-available-in-libc.patch
new file mode 100644
index 0000000000..5e230e2cfb
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-add-missing-FTW_-macros-when-not-available-in-libc.patch
@@ -0,0 +1,41 @@
+From 5facddc332c5ff8330f93c0a7e1b7f6d7bbd24a3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 5 Nov 2023 08:31:21 -0800
+Subject: [PATCH] add missing FTW_ macros when not available in libc
+
+Fixes build with musl
+
+| xfsfind.c:176:13: error: use of undeclared identifier 'FTW_STOP'
+|   176 |                         retval = FTW_STOP;
+|       |                                  ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/global.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/global.h b/src/global.h
+index 49570ef1..1c247488 100644
+--- a/src/global.h
++++ b/src/global.h
+@@ -190,4 +190,16 @@ roundup_64(unsigned long long x, unsigned int y)
+ 	return rounddown_64(x + y - 1, y);
+ }
+ 
++#ifndef FTW_ACTIONRETVAL
++#define FTW_ACTIONRETVAL 16
++#endif
++
++#ifndef FTW_CONTINUE
++#define FTW_CONTINUE 0
++#endif
++
++#ifndef FTW_STOP
++#define FTW_STOP 1
++#endif
++
+ #endif /* GLOBAL_H */
+-- 
+2.42.1
+
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
index b8880e016c..4e8e318409 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.10.29.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=for-next;
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
            file://0001-ltp-fsx.h-Explicitly-use-int-for-return-type-for-aio.patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
+           file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch \
            "
 
 SRCREV_xfstests = "f7765774a1b5cb98c2f21a892e82b3421f40e791"
-- 
2.42.1


