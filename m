Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2955.1794165989910422277
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49465892f7bso169787f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165988; x=1794770788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6zPy6BSAomOymPMT/8FpKQACzwKD7B+QdUFqhpviakE=;
        b=pnQvmPODcVCQSGvR2oiAtC9zcoW1detoQ1MI9cl12NixAOpw26v7EVCqiWBulAwS4+
         LHWoEGtavp1w5CYC4RZ39M8VlAKWqXibbupRmq/GsClcC1qKGSLCki/vhFf4eoj7npvq
         3WG1Ve7Or5k5zwfilIv494tTorC6o1w2aNB99qWdhwIdNCRQnrB2zVPy383lM3ZPsXPo
         U63ZOGUJUcMMM422l+URKif2ABlmFASjCAuYP/IxOxhMmvePlZvpdUVh970GnMyLo/el
         jf0qVNXl7S6WUKbamoeAFdFqRxM2Kn473RML9xaNhaeR/0RX3d8LJb5f4BrTIsATliCK
         PReQ==
X-Gm-Message-State: APuU4Z95d6TyRDO/NS+cElTzluSOG1mIruEu18sKMfNnr2yUazfF7k9H
	2Rlcjm3bHyDwQWemioARuQom2X1sdR+nycrhMffRHakGchtuWObzcDoLFXl77w==
X-Gm-Gg: AYBFou0QbVtaKHuqLW/dDm3Z/WYOxm37QVO4FhYnovkMsLdXSo3GdB159XTKUmleXXI
	hubUToey0B+IYKd0wqsBJqAaABi0/X8uZky/NI1CwVLR1xkeooozVn81wyOAuSohVOwSPBtTN1C
	qXZ3YXCJFILkHuURfmnnW53MXjqSR4+U7MgXH2WPmrk9G2l7y5RwTkT6ocRQGAl+inqkdxIfhSf
	CbPtpryGh7oB9vsQxmrf5N6OeL0cqulF9EYEcN4evooLxK5rcmiOsSTqYC8G8bOQTqPYQIPU7pM
	Xk43PEnf5M4gfYVvxg/kUVsJ0QEpzgpNXWhmhJIzB2+cneas/fYYRIJF01L4TPhb8xX+0wDtAum
	+ZRrk/9kFvvLIVNcDFkEPt4fM6qnXMQXp6WCWVwrs3WZKclTM7y+ySscYK0m4zCSsJxj09nHtPS
	GACU5g/FczSjjVfved6/OFzwNdcAbxTN1m60eER2EJusCBTWExEyGbaYB0Uf7YOzACOzBsT3UFd
	x5hS/V+BiyKlYOzVVal0boJTM8jyqkFIRYQRoU25RsFKL+0sPsGKrOhPO4n/82+a7TRzPSseJBe
	EDeB8ZfI+erfIC+KQ+8UkyPS+3IHt38NBCZm742CLNy8B2TmlB116KitX3W4cmuuca18bYvPexG
	QLDM1kGDsw/sFS+c0PzsMgLUWRzDoWJxaACRTaVOiJR+SsVoXyCeM7klbeQ==
X-Received: by 2002:a05:6000:4808:b0:492:9630:6a7f with SMTP id ffacd0b85a97d-4958ca5aa43mr3798107f8f.55.1794165988097;
        Sun, 08 Nov 2026 11:26:28 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:27 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 02/13] python3-pychromecast: upgrade 14.0.10 -> 14.1.1
Date: Sun,  8 Nov 2026 20:26:07 +0100
Message-ID: <20261108192623.1082770-3-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132024
Content-Type: text/plain; charset="utf-8"

Home Assistant 2026.11 pins pychromecast 14.1.1 for its cast integration.

Drop 0001-pyproject.toml-relax-build-requirements.patch. It removed the
upper bounds setuptools < 83 and wheel < 0.47 from the build
requirements. 14.1.1 allows setuptools < 85 and wheel < 0.49, and
OE-Core provides setuptools 84.0.0 and wheel 0.48.0, which are within
the new bounds.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 ...roject.toml-relax-build-requirements.patch | 29 -------------------
 ...0.10.bb => python3-pychromecast_14.1.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.10.bb => python3-pychromecast_14.1.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
deleted file mode 100644
index c793465005..0000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a82451e8f2db33e22fef6714ddbd35a3e03debff Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Thu, 14 May 2026 11:49:05 -0700
-Subject: [PATCH] pyproject.toml: Relax build requirements
-
-Drop the upstream setuptools and wheel upper caps. OE provides both via
-DEPENDS and builds with --no-isolation, so the caps are spurious and
-break the build whenever oe-core ships a newer version (currently
-setuptools 83.0.0 and wheel 0.48.0, the latter excluded by the previous
-"wheel<0.48.0" bound).
-
-Upstream-Status: Inappropriate [oe-core specific dependency versions]
-
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 20524ca..fc62798 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,5 +1,5 @@
- [build-system]
--requires = ["setuptools>=65.6,<83.0", "wheel>=0.37.1,<0.47.0"]
-+requires = ["setuptools>=65.6", "wheel>=0.37.1"]
- build-backend = "setuptools.build_meta"
-
- [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.1.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.1.1.bb
index 8bd4a4046e..8780d2bc3d 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.1.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI += "file://0001-pyproject.toml-relax-build-requirements.patch"
-SRC_URI[sha256sum] = "f05a1c8d727d4f104c8c731688053033e05157f2ab81bc8eef50ec0c62f9373c"
+SRC_URI[sha256sum] = "9b75553770c8007bc146ca7b5ad30dd165c71bb1335a0ea6659a514087a63c67"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.56.0

