Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14856.1793092880757050361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=f+JrL2nD;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so25894515e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092879; x=1793697679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X4QeLivQiFBmSRXsuKayhdX1JoRiKmCHgnZdiv8P0RY=;
        b=f+JrL2nDi/ICfstGo6eFWBQgB8YLTBh25n1Orj5IkMiVa7AraSGQeZLRDbuHOI3ays
         vDHrTsZFrDw8IkE4wL4hUt8bDkBgwjmThwbMfjpkc1Qc5iwt36JYbT4ZuLzG2Nl9BctE
         1A/hw/M0aKTjco3NSMON1Q76FmZniu8XuZ91k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092879; x=1793697679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X4QeLivQiFBmSRXsuKayhdX1JoRiKmCHgnZdiv8P0RY=;
        b=K9NDuyCw7vAfaSav8/iJ+E3/hCIiIR5Odnnap9mD6sdr6XyJQTHCtwAqDvVdiHAfPp
         2A9qp3Catoalqa7fgMHZTCTpYyJMhFm3ek6qBDhC/waZ6bvefBLH0/GWsTDO85ZogbGZ
         DWaYJySZtl5p4yGEwrSVqkvV4R8/AEOQBBf64/i3q8S+LusEScczii/YanBMTKSZcRoO
         TfdlwmZpM1CnIEsKZxPapLD+QLpoOsd7Vya3lmyemCm3gF4T9psoscpxnapbuHcuFnMO
         DAzdSH0uHOo2I7CvlaPOTSoO5ZUF7PjnNBmWDxAvUC7oBaqWIQC3MebHf4koFLzp/kb+
         JjyA==
X-Gm-Message-State: AFq9FYKbfpvmRh8On+SA4BIb34+dGQcUnKuDdT05BNk5i1VmxgpK/exp
	w4OBpUhO0MpVf7W3cxTf5MLXdGBrL1ZH8q2aIolZDNgIzPHxo8jDXNOMR2b1hVC938Vf6KieKp4
	2ktik
X-Gm-Gg: AYBFou1mh6ZMflNn2OkyavrbBiQSZ+niCtb0aqG5XqnL+5OUSObl8Eb50LICGnM+uyJ
	BaIxLy9WW65ldQK1qi2vBD6jDltrIvv6QjHL+SmqxA1RdndYzBrjANXFHykbzyAfJgibIK5OZjc
	WYlVNdV0tRppk9yx381LUMXv22g0GwjYcGL848wldMUrCH0vAD7vsgqLHxDs2YDLfvpHQlK3xwu
	/0eMgTi8SO0izFM4GVSVWO/bcOVfVEDgniDCxdxqcLzzB76KJNaBuRSEONNqJ9Wv7Radpeutaj/
	o4HAOX6PkU9nkomqNw2xXtXjQxsiUSPUbcXZdaAiQvqJRLHy5DQpIYrfsdtv/EdWy+dDPgjsXzg
	JEKzKNl7IP2jOsTXHdZRL6pEt20RHe82oZ5tp58xo3oFkCuN8hY0Ghe3OLhFvP7Gdu6P5zacSFY
	spBjgngkxebxQ4XZYyR1hVuiINeyHXcDte99MI1mKV5r0oZx3b8FongFqBfkIV93HgUAwHgDaG8
	B8elKT2iFlWEmaZTmh7qz+p16qnCBd4tVbGbySVQJFov9dL4Fn0xoSuM/76DAJB0ho0OXWwaLuG
	7WUao8580Pi3l9PyaGvSIzwM3vyn7OSnnEl2AyUOg8UqTFEnZz33PSGB/PlyosPAEdHu3beBzQA
	MIrKbMT7t2MCs+3NHmKyGvDNg6w==
X-Received: by 2002:a05:600c:4ece:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4a35ac9d100mr166262465e9.7.1793092879008;
        Tue, 27 Oct 2026 02:21:19 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:17 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 40/61] python3-smbus: Upgrade 4.3 -> 4.4
Date: Tue, 27 Oct 2026 11:20:07 +0200
Message-ID: <20261027092028.782979-40-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131504
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.4:

- Install in the defined prefix
- Use setuptools instead of distutils

License-Update: Check from line 1 to 13. License remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...etuptools-as-distutils-is-deprecated.patch | 25 -------------------
 ...hon3-smbus_4.3.bb => python3-smbus_4.4.bb} |  8 +++---
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-smbus/0001-Use-setuptools-as-distutils-is-deprecated.patch
 rename meta-python/recipes-devtools/python/{python3-smbus_4.3.bb => python3-smbus_4.4.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus/0001-Use-setuptools-as-distutils-is-deprecated.patch b/meta-python/recipes-devtools/python/python3-smbus/0001-Use-setuptools-as-distutils-is-deprecated.patch
deleted file mode 100644
index 6aafd6a952..0000000000
--- a/meta-python/recipes-devtools/python/python3-smbus/0001-Use-setuptools-as-distutils-is-deprecated.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Submitted [https://lore.kernel.org/linux-i2c/20220114134910.3994688-1-ross.burton@arm.com/T/#u]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From fa522a9a390b1857a58ec1f55da1465c542fd106 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 14 Jan 2022 13:38:34 +0000
-Subject: [PATCH] Use setuptools as distutils is deprecated
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- py-smbus/setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/py-smbus/setup.py b/py-smbus/setup.py
-index 28a4500..26db33a 100644
---- a/py-smbus/setup.py
-+++ b/py-smbus/setup.py
-@@ -1,6 +1,6 @@
- #!/usr/bin/env python
- 
--from distutils.core import setup, Extension
-+from setuptools import setup, Extension
- 
- setup(	name="smbus",
- 	version="1.1",
diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb b/meta-python/recipes-devtools/python/python3-smbus_4.4.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-smbus_4.3.bb
rename to meta-python/recipes-devtools/python/python3-smbus_4.4.bb
index 4eb2037c5b..f47a9e9c27 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.4.bb
@@ -1,11 +1,9 @@
 SUMMARY = "Set of i2c tools for linux - Python module"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://py-smbus/smbusmodule.c;beginline=1;endline=18;md5=46e424fb045901ab25e0f92c28c80055"
+LIC_FILES_CHKSUM = "file://py-smbus/smbusmodule.c;beginline=1;endline=13;md5=66de33a36142d8c0e706898f7d05b3fd"
 
-SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz \
-           file://0001-Use-setuptools-as-distutils-is-deprecated.patch \
-           "
-SRC_URI[sha256sum] = "eec464e42301d93586cbeca3845ed61bff40f560670e5b35baec57301d438148"
+SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz"
+SRC_URI[sha256sum] = "04d1e3b0cd88df8fb96e7709f374dd0b3561191b4c0363eaf873a074b8b7cb22"
 
 DEPENDS += "i2c-tools"
 
-- 
2.47.3

