Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C9FD0C848
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:34:31 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55989.1768300469221059232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:34:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=p6DgTvHu;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so4241564f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768300467; x=1768905267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8Z9qNRzVUP92Uysug4u9UydE78y/41f/2YwAovMd4Y=;
        b=p6DgTvHuQwZXaT7TuttelHikrbryhKlDxQYadKP8IcwiaucKe8N0JzSNNsHCIAwaw6
         kOnuA9rrQCJ2GCDt7mRX2HlE+UNVMRfqu3B4MecDttlzQyiM7JHQ59ar5xzprxHX7QTY
         TTb1Ysuw3z7zuxoDXFycno8oHZIyqKtuXjd7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300467; x=1768905267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8Z9qNRzVUP92Uysug4u9UydE78y/41f/2YwAovMd4Y=;
        b=FXGfSO09mGAyEFFtiMTSkQjqOkxNAFE+WcmC+MYuner0/ZN6v6eMiynykzIKRM4rtJ
         ZZybFMe33DoGsIi1r6K6i3XPaFgIwc63yhg0TYaUk3DVQfYGK3gax70QK4s3KQFKVwNN
         UnMJSgcVlV6WEg11NB7IIUDZxAScsTnU/NEoqKe4jRzRrAeuHliy19BF17xB4Crhri09
         thPBRGQQXgwxF99QX8tolK38S1oLANRuKTDz7rcBtWhzp6b7siejo6QmCKzyFzYaLSpu
         9jO2J5R/SgZVdIQveMeA8d0f7VCGjcwcYOME+8qUKcvCnsqYafB1J8OPGmHoSwcBrOKS
         fIgg==
X-Gm-Message-State: AOJu0Yxy7QCko3vawra+E55PSuQoAGCMxNz9YDcObW6jDVIn9LhZ8nX3
	tM8H2RNzhUZ2nuTg3FxQxK3+4JujUgrC+f3RPrt14M7JdNoXZs/Oxx2IuwPf4Q2Qoi1LJlyFi42
	WoTwk
X-Gm-Gg: AY/fxX7/2x/1w1L0FoWeLAvYdglspRDVsBxzRqGEV8uuLEpuhtENAfP+9gIjUjhaV6a
	U9laa8IysYPCWl9UlT7pw2PwDJe2ailY03daO8ZgGO9uwc/2HvAsqBGzK5Gvtkmm4BYG+3mpyGy
	1bOEAVYarto/TpiVL7vtlFvEEByYKWa4X41jJ5Y28zQ8r87AWUCt9caTk3+1t+z1W/jsmfi5Gl+
	X308G+UfJXVIanKgWMzXGS5893fNtqYs1orj+3f5WeBIrx+FrvL+/NKGheiwWKvzY2sXy0KiMCF
	8NyRthqH71B1pA3sLvgHxwaiyJs6P3ee6eaVdUEvgLkqh8NlnmhD0oGw2f7/xTTgbVDPRNOT9ZC
	BHqxU1IV8oGE7pEICXP7b9U/yckbDW5PXnwc9YM74aFxS1ipS9A8p6E/O8Jk3YfyLk+gtTgbspN
	bQgE59HVMjYSYAegt6qlDd3ix7
X-Google-Smtp-Source: AGHT+IHhqIL1yc/EeoU1srleSw/E+QDWPjfHUrf2K2LgAafqzwgEk+smolBUSLU1u8jv1gOHpbWFQg==
X-Received: by 2002:a05:6000:200d:b0:432:8504:8989 with SMTP id ffacd0b85a97d-432c37c32bemr25209965f8f.56.1768300467244;
        Tue, 13 Jan 2026 02:34:27 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa84sm43341971f8f.2.2026.01.13.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:34:26 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-libevdev: Upgrade 0.12 -> 0.13.1
Date: Tue, 13 Jan 2026 12:34:21 +0200
Message-ID: <20260113103421.3568307-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260113103421.3568307-1-leon.anavi@konsulko.com>
References: <20260113103421.3568307-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123434

Add ptest and upgrade to release 0.13.1:

- pyproject.toml: add pytest as dev dependency
- Import Self from type_checking if needed to be compat with 3.9
- CI: run pytest via uv
- CI: test against multiple python versions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-libevdev/run-ptest          |  3 +++
 ...vdev_0.12.bb => python3-libevdev_0.13.1.bb} | 18 ++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-libevdev/run-ptest
 rename meta-python/recipes-devtools/python/{python3-libevdev_0.12.bb => python3-libevdev_0.13.1.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-libevdev/run-ptest b/meta-python/recipes-devtools/python/python3-libevdev/run-ptest
new file mode 100644
index 0000000000..8d2017d39c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-libevdev/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-libevdev_0.12.bb b/meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-libevdev_0.12.bb
rename to meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
index cabcfd8df6..1c8a99eb33 100644
--- a/meta-python/recipes-devtools/python/python3-libevdev_0.12.bb
+++ b/meta-python/recipes-devtools/python/python3-libevdev_0.13.1.bb
@@ -5,13 +5,27 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d94c10c546b419eddc6296157ec40747"
 
-SRC_URI[sha256sum] = "02e952632ec6c249cbb9c66f6fa00012ea448b06606c77cd139133bc2fe46b08"
+SRC_URI[sha256sum] = "dc3369cd1401767b9ecb1117cd6b73faba9038e3bd9e1695a710a9e9d9415e8d"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling ptest
 
 PYPI_PACKAGE = "libevdev"
 
+SRC_URI += " \
+    file://run-ptest \
+"
+
 RDEPENDS:${PN} += " \
     libevdev \
     python3-ctypes \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    cp -rf ${S}/test/* ${D}${PTEST_PATH}/test/
+}
+
-- 
2.47.3


