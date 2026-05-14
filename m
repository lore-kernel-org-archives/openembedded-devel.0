Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB73ACD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 18:54:56 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18910.1778784886868621491
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 11:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BQ7Auw8M;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1329507c387so5296619c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 11:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778784886; x=1779389686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/mKnTjMVW2WUwMSD3f6oknfTC4W2TRPD/MDoxHdpfc=;
        b=BQ7Auw8Mh40MTXlTcEr9gzpYvKTck7JV2zWcYilCV2vGMsCK2+QR5fbIRbh94uV/si
         lHYd5HMMMr0sBkWV4dMlCtBTJnK6Z4URypxzm34xqTJmxDkQpDX+ERQPbC3EbNXe1/RM
         ILrWBW4NCD5JtPgHbxTx8SwjLs5LFuBlPgz86PrZHG8+mB+nh5CuvxBhbTSY7um2pQVb
         WGpvoCsbh5KeBxoDSmD33/fWEFFmUVtOm+iKPduRi+Clx2uu0sKHY+tkYqIcdJAplaCQ
         0MlMfw1MK6xzCAIzw292QyZb1f78QqkW0KDiu7kc9oLHz5URuQswlZ3r75Mz6QMn6FUP
         wgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784886; x=1779389686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3/mKnTjMVW2WUwMSD3f6oknfTC4W2TRPD/MDoxHdpfc=;
        b=kYT258B4Tdlt7UFuMk3n06tfS7JWNrKYo/CyLWG2kdMkVV7Zm1Z8VaffA6qJC3HTGc
         v1sgIEcMwIXY0pmyw9hG2BGnzo73MCo0yvMPSCnIYlCVea23E+H7sjbAemOaYBcug+sC
         svPLR0zO8tOHZ5mPS3z7o3/2WPlEGnUrSkD91A8XChkCGrzqoXSzBJEW79gVytli1YS5
         ldc0bdWKUEtXgxArW0tYi3YXZVDGAcvB5ypmEyAFJRkTNK6eZcJkOYg+atZk8YEl/eBE
         Wv3PVcYNViS5q86C0rtlj5L5h7sy7tmkaK6H4ccCtkN8NSVWdbFd7J5gqGhRryFYjkIN
         QsNg==
X-Gm-Message-State: AOJu0Yy+U8+RF4/kbjKL27yrheFnhLeFeqDe5MvKrUGlYqIOSOqHO1yu
	POV96Apmy/lOcL8F6TlqwkCOmQSbfhitA1uo6gNcZHQIrO67RUcaeuB5o7A1Ev25ubs=
X-Gm-Gg: Acq92OGvqcwWYTG1eWJgwzQkrKmt4/AKngUBWFCraBE3SYsqMVLLdewqpdxzbElxjbh
	q0cGnKvunYYt3DAWO9mtgamfZCWwVIgDigeqGBHzCNyNyvEI+rSWLS8RjY/ebylRI41xlF7m0H7
	n/T9l5NgvBwOe/D0Of3QbYqNhZsGVmVmvUtQWCDM2KfwWthEme1ZlY6AaBLQfC4FHMxLI6aR1bD
	wHmUANfCCNAjvcc6Vrw0wBBetrdV+ca8jwmfcmVPg/1k/gHbiEBCaEAO97CQT9Uv/AwRnEgT7TB
	+u2M9Tq4UvEEcj21bIEIfqI7h/r8RBJkW30IV5Sc63CM+hWo+We707BjnZ2YH+Lt0kYXKRm3J+D
	iMrZBR9Wr20rFguKLgwalh+NuFc4XcHic5cIAvU9GsbbMUjnCK0lJst/kbU+2MtfifLsihaulIw
	gu6cuefLTJghbTT4IOUMGCkOU2uZlQxYSnhymDCoDh7SSAz7XdgGsGGSeUNYO4cM9y1IknpHii9
	c6Wccup1GrREzckUa/IdCBLTX5/ft6lMUYFTZrX1x4HE1d1GoM25h4SUQ3NdZ0ABBj1JcIV1+TX
	wBqU/HTkqjydJZh+D8oSeaFltHLFOzyzkpx4V6Yq
X-Received: by 2002:a05:7022:619f:b0:134:cf34:b908 with SMTP id a92af1059eb24-13504313d24mr209039c88.7.1778784886127;
        Thu, 14 May 2026 11:54:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm5422930c88.2.2026.05.14.11.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:54:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 3/3] python3-pychromecast: Fix build with wheel 0.47
Date: Thu, 14 May 2026 11:54:41 -0700
Message-ID: <20260514185441.1330509-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514185441.1330509-1-khem.raj@oss.qualcomm.com>
References: <20260514185441.1330509-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 May 2026 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126993

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Allow-building-with-wheel-0.47.patch | 23 +++++++++++++++++++
 .../python/python3-pychromecast_14.0.10.bb    |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-building-with-wheel-0.47.patch

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-building-with-wheel-0.47.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-building-with-wheel-0.47.patch
new file mode 100644
index 0000000000..cfb201dfe0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-building-with-wheel-0.47.patch
@@ -0,0 +1,23 @@
+From a82451e8f2db33e22fef6714ddbd35a3e03debff Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 14 May 2026 11:49:05 -0700
+Subject: [PATCH] Allow building with wheel 0.47+
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 20524ca..fc62798 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=65.6,<83.0", "wheel>=0.37.1,<0.47.0"]
++requires = ["setuptools>=65.6,<83.0", "wheel>=0.37.1,<0.48.0"]
+ build-backend = "setuptools.build_meta"
+
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
index cdd85a550f..5b1d780b86 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.10.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"

+SRC_URI += "file://0001-Allow-building-with-wheel-0.47.patch"
 SRC_URI[sha256sum] = "f05a1c8d727d4f104c8c731688053033e05157f2ab81bc8eef50ec0c62f9373c"

 inherit pypi python_setuptools_build_meta

