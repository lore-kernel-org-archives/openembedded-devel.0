Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFDFD2A01C
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:24 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9348.1768395679476381511
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UQaVQfX9;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so1601823b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395679; x=1769000479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Cj/5ItRAF0+iPmS0aHIRx9XOxKJJ5ZbXk2WFbri2TE=;
        b=UQaVQfX9+iTj0W3j/Y1jf/VnZuQ4TOlPIoiZc3mbcnrZfH/c19ZSvhiqzSVF/8XyE1
         OO7nEEMhIfM6jbdTW0MmHNeMWm8reiahvASVKeVR82WieH8zguLW5ksjb9ZvtyUJYTZi
         UwUGoBHy5dRuH2u04oH+1VAqyz101WsbYk7z7P6zL0p46EcAaT5ZrJU5C6ys6fC5Y51T
         psKZb13mMQsRAZPnfP99mU0LJMGWeDeHsK7SIdUKn3CqKULORSYn2yg68yfObSaJFtvL
         8+AxurtH9XZif5wyG55zDhgjpdTolxNhLTwKU4vYjn5pavcDs5BCPo3cKj5P7DN9wwpI
         vizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395679; x=1769000479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Cj/5ItRAF0+iPmS0aHIRx9XOxKJJ5ZbXk2WFbri2TE=;
        b=AmK7OXGMU9PmVjMaIy2Jee5dV7aXJFdJpwZc7VLtwXkqd/fY6HeBa6UzHV/F6N7Ypr
         9R2JvxLtRoYRiZQ7UWZPKcDDiAPFDGmYkR+UtkM74H8+9cuvN60/ea2y93N2MZh6bO7R
         Ea6hOYNvQAmQIe5vBQ7X/7UD804oFpFlPJm1xWJRt2jDuOAWk7P9ru/BDSIAMBVwFVlt
         YbJ1iN0inZBHbaatEgmRgo/b1GpySprTrXQAuCjCLaErfZXSesnJpQ/CRtuDUArf25VE
         LXPFfk3qfTnHoUQ1VxPD67wGsnpuR2aKQo4TQqMvGqOVW6Z43PiqCyh2us918n2Z8H1n
         K+Ew==
X-Gm-Message-State: AOJu0YwDYfrvhlHupaoXNf8Bj757gthx+z6VlRSo6f6spBk2KvJM/295
	sRJrO0+uPphwG8WteOeZUjymCbedCd6mlrsKhywU3NLw23OTTTgvUrIXeDL+yw==
X-Gm-Gg: AY/fxX4M5b2iXwkGD1CKtOUPmArrBEhtxybMvA16gYhxh1LInR7xH37d1QO4r6kXMXm
	1hkdS7Bqygs3s9Oeonlz4s3mNij+2WMr1OdfbXjLbBrCLFwyREfVl/kAbjkuZajVcex5kWAEdHf
	O2FVgch7a9A/e30YhhmjGsie8a9D5zo0qhJVGZJPSLCQBtylX7bAoH/CuulAe2gkLHIU5xJSK1k
	H6R9ZL6OBld3cCcZiqWOtqN5RlXzI5wrk/rxDuSG3ExLlvsoxqM4xUQ2Rzm/RPLQEmTDi/UIg0Y
	KGgj2SU31ngF7eBsm+pdmuY0bCban8O3oPO4BCw2JgIktjWs9NLfmUjIMGFNFmq2+dG4eoLIziF
	irGQrJNVN+ejo2ZbY4IwyvqN/y6zTylQaEBy9A4RxIJurz9zcfP0FxfI6vtLQmwE+dOjoqMvLR1
	1uFoB5H1y/InaJ9zNb/WFReb8=
X-Received: by 2002:a05:6a00:3496:b0:81f:2b84:6f01 with SMTP id d2e1a72fcca58-81f8200e1a2mr2006003b3a.66.1768395678354;
        Wed, 14 Jan 2026 05:01:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 06/20] python3-configobj: patch CVE-2023-26112
Date: Thu, 15 Jan 2026 02:00:43 +1300
Message-ID: <20260114130100.1016416-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123459

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-26112

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-configobj/CVE-2023-26112.patch    | 25 +++++++++++++++++++
 .../python/python3-configobj_5.0.8.bb         |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch

diff --git a/meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch b/meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch
new file mode 100644
index 0000000000..f9bdcd31b0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch
@@ -0,0 +1,25 @@
+From dd9cf3579d90d1f8c6d06f293cd0958be5ca5518 Mon Sep 17 00:00:00 2001
+From: cdcadman <mythirty@gmail.com>
+Date: Wed, 17 May 2023 03:57:08 -0700
+Subject: [PATCH] Address CVE-2023-26112 ReDoS
+
+CVE: CVE-2023-26112
+Upstream-Status: Backport [https://github.com/DiffSK/configobj/commit/a82ea8fb0338f2bd46cf627c4b763094448e6bd7]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/configobj/validate.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/configobj/validate.py b/src/configobj/validate.py
+index 9267a3f..98d879f 100644
+--- a/src/configobj/validate.py
++++ b/src/configobj/validate.py
+@@ -541,7 +541,7 @@ class Validator(object):
+     """
+ 
+     # this regex does the initial parsing of the checks
+-    _func_re = re.compile(r'(.+?)\((.*)\)', re.DOTALL)
++    _func_re = re.compile(r'([^\(\)]+?)\((.*)\)', re.DOTALL)
+ 
+     # this regex takes apart keyword arguments
+     _key_arg = re.compile(r'^([a-zA-Z_][a-zA-Z0-9_]*)\s*=\s*(.*)$',  re.DOTALL)
diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
index 8dc706fdfd..2f0d1e7203 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.8.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3d6f99b84d9a94610c62e48fa2e59e72"
 PYPI_PACKAGE = "configobj"
 SRC_URI[sha256sum] = "6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97"
 
+SRC_URI += "file://CVE-2023-26112.patch"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \

