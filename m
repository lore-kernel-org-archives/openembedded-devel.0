Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D361E95A87
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 00:53:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.29913.1696726413205726416
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Oct 2023 17:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQRU/6j/;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c60f1a2652so25903635ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Oct 2023 17:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696726412; x=1697331212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxWvWaKh6ekPjQegAVuT6qzDfcztFl2LgxaeelSzAtI=;
        b=TQRU/6j/55iFZYIMIEqpJV4H5FzoJw+1jL6vqpWk6AgtJJYDe7+djs7uHJ6SbBV13U
         8zN5rdW09gNdKP53LR9gymFzSQ6By+jk6me17rALCKt/4tyfVgOF9cEesh2Bg8mX/Yuc
         c/XKBxyuBPaYIHjObIsry24BzeIAJbodw9ZkX0TT7uphT/E3tiFw//Qpr61khc9w8Hsn
         H1f4tU0Q44tb+js+pvxrpgrdircE4agcJSxF6skxGM2+RjS1S72JWTi7iik/DR/1OtA8
         ByLsYlTMEMJjvdyme04exV9JfSQOv0y9/LBx5K1tlbag9YqWea+x36di/CzblPGK6zMW
         zHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696726412; x=1697331212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxWvWaKh6ekPjQegAVuT6qzDfcztFl2LgxaeelSzAtI=;
        b=XIoxBuaOyFRxr9rafvQCzPKwJcIjky+cNtDcfkyizT3ticFoc9o7hGOh8v6urTE9BS
         4C685kMGAMF0TDCMz3sanUJqvIbz28q1TArhQhNXtAF319yIf6YlcwxksktLJ33D0+Hq
         EeC6iBmvc2VuUbsQOnShiyHZWZy3vrqGZSOZldlYTEzLN+RjwsjZzt8oXALMNVb+ZZ+Q
         vwTWcRtP9RAdaDIOG+2lrTVNJAfgpejypg4ukZ7UrY4zgKe2H8ohDuNmZ69lnTaNf7bW
         dogwlIlPKNaQfd8+kVROAoH27EJUC+2gO5e8bozrU2VjpC8LxjveomhrUBKuPK39EB5r
         wMFw==
X-Gm-Message-State: AOJu0YxA41FYFBIgEdSt2jbVG8O//dbYTGTBO4QJyQ5iWMU9d5EPKxi2
	kHGq7uh9YRHRYOXAt9O8IK7Gbin7Iv6Tjg==
X-Google-Smtp-Source: AGHT+IFv1r6pPi3QO/aJ2tQw1gL4Bbcg10LT1JezM+0htSffnat+RUF8F4w3hBIi2GJa/8qA6n863Q==
X-Received: by 2002:a17:902:d352:b0:1c6:de6:5eb4 with SMTP id l18-20020a170902d35200b001c60de65eb4mr10201006plk.13.1696726412287;
        Sat, 07 Oct 2023 17:53:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902704300b001c73d829fb0sm6493512plt.32.2023.10.07.17.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 17:53:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
Subject: [meta-oe][PATCH] libnvme: Fix test builds on musl
Date: Sat,  7 Oct 2023 17:53:29 -0700
Message-ID: <20231008005329.2526811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Oct 2023 00:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105383

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Christophe Vu-Brugier <christophe.vu-brugier@seagate.com>
---
 ...l-Check-for-ioctl-signature-for-musl.patch | 38 +++++++++++++++++++
 .../recipes-support/libnvme/libnvme_1.6.bb    |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libnvme/libnvme/0001-ioctl-Check-for-ioctl-signature-for-musl.patch

diff --git a/meta-oe/recipes-support/libnvme/libnvme/0001-ioctl-Check-for-ioctl-signature-for-musl.patch b/meta-oe/recipes-support/libnvme/libnvme/0001-ioctl-Check-for-ioctl-signature-for-musl.patch
new file mode 100644
index 0000000000..06f7b57121
--- /dev/null
+++ b/meta-oe/recipes-support/libnvme/libnvme/0001-ioctl-Check-for-ioctl-signature-for-musl.patch
@@ -0,0 +1,38 @@
+From ad1ac4215f051bd42b7ddf64dad63d8215cc3ac4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 Oct 2023 17:50:54 -0700
+Subject: [PATCH] ioctl: Check for ioctl signature for musl
+
+Fixes
+../git/test/ioctl/mock.c:117:5: error: conflicting types for 'ioctl'
+  117 | int ioctl(int fd, unsigned long request, ...)
+      |     ^
+/mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-musleabi/libnvme/1.6/recipe-sysroot/usr/include/sys/ioctl.h:115:5: note: previous declaration is here
+  115 | int ioctl (int, int, ...);
+      |     ^
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/ioctl/mock.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/test/ioctl/mock.c b/test/ioctl/mock.c
+index e917244..7d5c983 100644
+--- a/test/ioctl/mock.c
++++ b/test/ioctl/mock.c
+@@ -114,7 +114,11 @@ void end_mock_cmds(void)
+ 	} \
+ })
+ 
++#if defined(__linux__) && !defined(__GLIBC__)
++int ioctl(int fd, int request, ...)
++#else
+ int ioctl(int fd, unsigned long request, ...)
++#endif
+ {
+ 	struct mock_cmds *mock_cmds;
+ 	bool result64;
+-- 
+2.42.0
+
diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.6.bb b/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
index 37e5d63011..26ad36d7d0 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.6.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "json-c"
 SRCREV = "37a803cf77e224f66d86b1e1d9e74a15f55ea600"
 
-SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
+SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master \
+           file://0001-ioctl-Check-for-ioctl-signature-for-musl.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


