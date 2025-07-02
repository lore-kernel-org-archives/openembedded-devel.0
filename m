Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACB9C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 06:19:22 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.17215.1751437159103812029
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 23:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzO5KhYN;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747e41d5469so4550563b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 23:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751437158; x=1752041958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/3L4Y9trOSzEfbZ9/WWx5lCEGliNWKronP5yx0Q5zQ=;
        b=hzO5KhYNw+8104Ct28K0VP7D/I8KwnxfYf/e+y3234IkVpzvhHUzjTTEgNtMU9cmn2
         h/KJDGsoqG9eR+IdQuACd2rkyeC8YIHc1gT7x7+fB82BogiVlXNHjtRvLVQpfR0wEYuI
         k45W3zRpQoDkqWZOzK1pL98oFrfEsvHvy8JqcKMRZsO6gKfZcjUhvRe6exejARcOpT6k
         WAsIlYPQ0bgavaSbNUc5drhOxVtCvyTx0NXKYNG5QNNVcCH00OL5fk/tcf2eg0bqGJJ4
         p3r/autCYT41BfJSvpkaKHXjj2lStmJTz4N5++mKGNc9pqC1Lnl4x7ORTszE8HB27QSb
         d4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751437158; x=1752041958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/3L4Y9trOSzEfbZ9/WWx5lCEGliNWKronP5yx0Q5zQ=;
        b=RgHDL4ZOJiIoThYb/nxMqrXgNYgRpyPYhCtRTWS4LCWMjxdtWzWQt3vr2prbdKhTid
         Hh2BurYi13Eusdh9iwzI+RlJY6Ww+c5ClUrKU6wyReS0p2eKmutEmeVmshGPRKPsBf98
         7/gDPE1HNsaIjy24FxouLXsXOb8QfK5WxYzUzj9DY4h4a6R/q8nviGqhPyxsIbUyORPB
         q2OSmQRNmzrf5HmL+9apXl/7YbUA5cYaDo0EOr6amIpWIGuS//eXwzAtDieZuvWjb0yC
         TEUgH2A6xFZZWYd2z7hhOCmcS2qS3GWOx8N9Lep0N8FwmECIycoANiDRTkklfzB9sVp5
         /2KQ==
X-Gm-Message-State: AOJu0YzS7n7H27EmfOdp18DKfDbd9jj7mdpPcd54l+LnRLZo9+NNJLoA
	bPfAoVaU1HjPZzcU6IJ7tqxB043rfilUGYCP+vgIQi8turLwzW9EPHe76GgFbUxM
X-Gm-Gg: ASbGncs8717n8uA5AKsmIPmUd3wdXJCi3MNtR+QJGNPDEEjfaDKE48+qPTKJaqvUMlN
	QY6wQg1dDhp37p409Auf7kCXfLiuUkR9UbzV2W8wJ0NbHkKn+rOReSLjpMMwZ1LiHMs+pO62GGp
	CGH8hxB8wWh/JpNE+YMtpgAoqoLfeKpvUeE+6iOUfntByFBYpRkQcKASZFtA+j0NU67rjzC8/zM
	VG9vXSovIW4QptPDgjFTtEskt6qNmDUJp8ySM0EMmObXJhC20K7/c2cjOF7pgCaOHdr0IDAeUKw
	lDoTaoSPb9AAk51MPWpVvLFeaQy0YFX6MAkSgcgxLjJlhFiShfTnhg==
X-Google-Smtp-Source: AGHT+IEB6Iexke30STO8g+0KY30uAnUKBIuOG7VZc8lzPIhdmMoCYyhJDbhaOT5cbmjerswCt1ObUQ==
X-Received: by 2002:a05:6a20:7344:b0:218:59b:b2f4 with SMTP id adf61e73a8af0-222d7f2c5c5mr2579419637.42.1751437158126;
        Tue, 01 Jul 2025 23:19:18 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e320fc73sm12275482a12.77.2025.07.01.23.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:19:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pychromecast: Allow max version to 0.46.1 for python3-wheel
Date: Tue,  1 Jul 2025 23:19:15 -0700
Message-ID: <20250702061915.92265-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 06:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118198

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-version-to-0.46.1-for-python3-wheel.patch | 23 +++++++++++++++++++
 .../python/python3-pychromecast_14.0.7.bb     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch
new file mode 100644
index 0000000000..57c14f2aeb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-bump-required-version-to-0.46.1-for-python3-wheel.patch
@@ -0,0 +1,23 @@
+From 5485eccd26529740e0f875e33afcbdfefd630597 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 1 Jul 2025 23:14:08 -0700
+Subject: [PATCH] bump required version to 0.46.1 for python3-wheel
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index d5a518c..a6a159d 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.0"]
++requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.2"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
index 260f6395b7..1b5ff94f8a 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
@@ -7,6 +7,7 @@ SRC_URI += "\
             file://0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch \
             file://0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch \
             file://0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch \
+			file://0001-bump-required-version-to-0.46.1-for-python3-wheel.patch \
 "
 
 SRC_URI[sha256sum] = "7abbae80a2c9e05b93b1a7b8b4d771bbc764d88fd5e56a566f46ac1bd3f93848"

