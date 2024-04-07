Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B51CD1299
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 23:15:08 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.94329.1712531704506932191
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 16:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KcTNmeJq;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a51c35a1b7eso130978966b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 16:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712531702; x=1713136502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/rm9Ufwc/lqPQCW0nyQ3pFhtnry36gcncRpqCCO3TE=;
        b=KcTNmeJqoHy5ZBsp1jUGNRqHHL1uAa3iqWel50Xh7vsLtt2Wmd+nFeZ2MoVHlgZgdf
         Gi/yL8AOyK8tVxipr8D/POhngB7kLb2ysycjX8IYvpQwTYMx3+dMy+SxT6XgS8uId5OJ
         Ccg1aGdZjALp4Pdx8ZAQA7cHBPxe5TeVTtmMYppthCLCwMF6Tp3uiL8SXpjC0N2+2pP8
         1svdX4b+BHpA0dTxTQ+j0CCJ/otdWAr8DmBzPM+NLZ7r7194T/UBQEgR31oM0/Kzu2p9
         fr3pO0TZSRCPFvJZO/alAsYZ1K0x1DvTYinpuGBM+bzRjAmc+qzjIXxIeCbnVVsr7WmA
         7/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712531702; x=1713136502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/rm9Ufwc/lqPQCW0nyQ3pFhtnry36gcncRpqCCO3TE=;
        b=Dsnn8PFMqVpsUoAPuzSyLj5mZGLDHn/SzY4ORhFPiPFUJctj0GBKslyVpSQrIjpgHv
         dOgGSx+htzq/XbgblXMJHIoBlCZ64KkDqCtQpFzrLdeaJluzhQ7RBUQfEKQDWh/CTa2u
         KmkIYRXc6d5CQia9Z6Cv8B/uWxrxt1OAr88r5GnLioXKMRDDpiZ5WWKIpdARiXZ1iget
         Aw9XS3AnQYCP5ExW17uDIQ25cL/oswVRU6TAqY83euCBTEMVnKbpEhYuAD7AsBqv52k6
         IORXTfcsBbPD1si0rUEO8FW5t4Byix4TU4qjCByJiTQ7KYH26jgLlbD+gey/HVN6w4ZS
         3A4w==
X-Gm-Message-State: AOJu0Yym93eeOd5phz2s4lLuGKVnCdZKXaF7lYrH6O36QMPNZut+X2cO
	vqvRXDQSAmbOMn/rFz/O+7cchmEtIVJ6v0NY1HKd7/xro4zilP2y+f0H9I2CCa4=
X-Google-Smtp-Source: AGHT+IHOkYV4ip1XTBV2q1xrUe4HlUwaaL5bb9ousy2XKaE5ZC09TUytIO63papOOzhClJQifjEFLw==
X-Received: by 2002:a17:907:6e87:b0:a51:c1db:659f with SMTP id sh7-20020a1709076e8700b00a51c1db659fmr3310613ejc.9.1712531702120;
        Sun, 07 Apr 2024 16:15:02 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id hg13-20020a1709072ccd00b00a4660b63502sm3736566ejc.12.2024.04.07.16.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 16:15:01 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH v2 2/4] python3-chromecast: upgrade 13.1.0 -> 14.0.0
Date: Sun,  7 Apr 2024 23:13:41 +0000
Message-Id: <20240407231343.999886-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407231343.999886-1-t.f.g.geelen@gmail.com>
References: <20240407231343.999886-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 23:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109857

The python package has enabled to option to build it via python_setuptools_build_meta. Therefore the recipe is updated accordingly.
Also cleaned up the list of runtime dependencies which according to the package should no longer be needed.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...ewer-version-of-wheel-and-setuptools.patch | 21 +++++++++++++++++++
 .../python/python3-pychromecast_13.1.0.bb     | 20 ------------------
 .../python/python3-pychromecast_14.0.0.bb     | 17 +++++++++++++++
 3 files changed, 38 insertions(+), 20 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
new file mode 100644
index 000000000..9b2e22d97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
@@ -0,0 +1,21 @@
+From e82caffe51b37c211f7f0cd60002fbc6b4e48d03 Mon Sep 17 00:00:00 2001
+From: Tom Geelen <t.f.g.geelen@gmail.com>
+Date: Sun, 7 Apr 2024 22:39:35 +0000
+Subject: [PATCH] Allow newer version of wheel and setuptools
+
+Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 0f19c71..d0ecf11 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools~=65.6", "wheel~=0.37.1"]
++requires = ["setuptools>=65.6", "wheel>=0.37.1"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
deleted file mode 100644
index 30add4d2f..000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Library for Python 3.6+ to communicate with the Google Chromecast."
-HOMEPAGE = "https://github.com/balloob/pychromecast"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
-
-SRC_URI[sha256sum] = "08e61a8b54bd2119d3c9ab1ec0136d3d8563aa97e0a3b57841588b9be60c2676"
-
-PYPI_PACKAGE = "PyChromecast"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-logging \
-    python3-zeroconf \
-    python3-json \
-    python3-requests \
-    python3-protobuf \
-    python3-compression \
-    python3-casttube \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb
new file mode 100644
index 000000000..be5a3a97e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Library for Python 3.6+ to communicate with the Google Chromecast."
+HOMEPAGE = "https://github.com/balloob/pychromecast"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
+
+SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
+SRC_URI[sha256sum] = "dc4f8b052e760a978da9b2568b79020cb79af608a026465f07544cffe43973cf"
+
+PYPI_PACKAGE = "PyChromecast"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "\
+    python3-zeroconf (>=0.131.0) \
+    python3-protobuf (>=4.25.2) \
+    python3-casttube (>=0.2.1) \
+"
-- 
2.34.1


