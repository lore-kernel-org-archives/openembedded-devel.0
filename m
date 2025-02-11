Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0AEC0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 14:46:53 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.683.1739285211939376811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 06:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=fiqy/UPb;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43690d4605dso38911825e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 06:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739285210; x=1739890010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hw9xpiZOcGSXkGHnVv3kO6/Lza99pKfwLMZUekIDy1k=;
        b=fiqy/UPb6j389b/UECwef5h1fB1ZpOcBElLQ3DerjzF8bEJRqKxgsClGpprjZW2XkM
         3bkD/A9GpFjKACbwvFgsScW80DsZ2eUORQImfh+EAE86uRzpPDK7rqndFhI2LfuvoXfG
         SQ2UGCu0I75UuIHhwyvmykh5FCMWhGhf3uKrkrrhS7zFWjGctqsDtuuJtDHeao8cdsIH
         PsTQoMjZNSKCm4vFVcHPdUuqKjK71bV11zekp1yj9j+1d2Q3D1XMyv8IvPMME5S1Q7sy
         N1HAV5vxTgjMEbR4h//NWas7zZFFhToFVorBVDETIKd+yV2hflmTeFWIYqEAyWOFEq7R
         mFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739285210; x=1739890010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hw9xpiZOcGSXkGHnVv3kO6/Lza99pKfwLMZUekIDy1k=;
        b=xQd7daUzMcJFMvXyf1qEqqGYDLYVWBCKWL1Z0L3aVcOz7qFonRlY9MRq9Slm5/VKPK
         fQnJ6QJgPpN/a7tV3yFT5H7U9QnbDISCrqxptpD1eS4q1CnAgyr3jTR/42KG4MJtHGv3
         gzsbegRytNRz3HcC8a7Xm5b2ke3hYZvc98kY1RiNNdt1UuhzzOkLLDVEtar44H8Xmvqj
         mtssL6oi4Ue5N06aKcXzMetknOHPL6I8viTsRnw2Bw7kclFuuoIu+gqzC5U+G+3gb20F
         BD1CH3CTF0ubldDFV0qkUTC3sj+4GrhlnVhHgQik+k+XXzmwnJqLmVrGnDUTUqRQ+Cpm
         l7ag==
X-Forwarded-Encrypted: i=1; AJvYcCXHzfhti7ABmBQocsFghhxA6ftQo4M2tgvdutr7zscY2w+Nu6eBvY999STil4KJ9CEHFIMeofPmwcaINjmrD0m3YBA=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/Z78EMiD23j20ADvAGm9fExR0gT3N8JSAekT2leBacA21Orzs
	mn48k2Y2OqVndYKFHA7/DMhcfEO/SU6w5kNjI7ycLOVVCX0GoPE3oxj25gSXqe4=
X-Gm-Gg: ASbGnctXfIn4iKUyIiogYh8DKmZb2htEwtvVPPPlpnpVbSOIijM1x2E5UzOKrueEF9d
	TyTOSw79JiA6z3HBqJ+NdKxLgXj34KuKO2LXBekwLnhi3+r4xRwZ0ON2ZTIM72jH1sv3VtOFm55
	TqcW4jlViVRHXPJGiit6J1VLBun9hIHuAHf5JdugSj5xQIvH3xeUgRs/KWROLc2o526jutExIfW
	S7udigEU0R8Yr9o+wSDvkPoOUWLzYhFjJP3KU62oLHlc1w+q3hTJoZ2uhFIrwZfkkZ+3K59mGxS
	evS7rnrSFQUQ1A==
X-Google-Smtp-Source: AGHT+IGbOpTc8dRqrUN/XSvMNXRYpbixh186Bn+X0rDFy6HPx/cgsnn3kWTPjhp6SYGJoaqIWoF1TQ==
X-Received: by 2002:a05:600c:cc8:b0:434:f5c0:328d with SMTP id 5b1f17b1804b1-43930663d82mr112203385e9.23.1739285210146;
        Tue, 11 Feb 2025 06:46:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da964e2sm181405105e9.4.2025.02.11.06.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:46:49 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-gpiod: update to v2.2.4
Date: Tue, 11 Feb 2025 15:46:47 +0100
Message-ID: <20250211144647.140369-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 14:46:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115429

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bugfix release containing a fix for tests failing with recent kernels.
This allows us to remove the patch we're carrying.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...tests-disable-device-before-releasin.patch | 49 -------------------
 ...-gpiod_2.2.3.bb => python3-gpiod_2.2.4.bb} |  7 +--
 2 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-gpiod/0001-bindings-python-tests-disable-device-before-releasin.patch
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.2.3.bb => python3-gpiod_2.2.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod/0001-bindings-python-tests-disable-device-before-releasin.patch b/meta-python/recipes-devtools/python/python3-gpiod/0001-bindings-python-tests-disable-device-before-releasin.patch
deleted file mode 100644
index 9025e0d72d..0000000000
--- a/meta-python/recipes-devtools/python/python3-gpiod/0001-bindings-python-tests-disable-device-before-releasin.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ad91b034e7575074998b3e480b592e3ae6d00def Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-Date: Tue, 4 Feb 2025 09:36:13 +0100
-Subject: [PATCH] bindings: python: tests: disable device before releasing the
- bank
-
-Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
-instantiated device depends on") uncovered an issue in Python bindings
-tests where the GPIO simulator device is not disabled before removing its
-configfs entries. Reorder the operations in chip_finalize() in order to
-disable the device first (if needed) before releasing any other
-resources.
-
-Upstream-Status: Submitted [https://lore.kernel.org/all/20250203-fix-gpiosim-in-bindings-v1-2-d2c9e0f3a29d@linaro.org/]
-
-Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
----
- tests/gpiosim/ext.c | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/tests/gpiosim/ext.c b/tests/gpiosim/ext.c
-index 272e6f7..cb5611a 100644
---- a/tests/gpiosim/ext.c
-+++ b/tests/gpiosim/ext.c
-@@ -96,15 +96,16 @@ static int chip_init(chip_object *self,
- 
- static void chip_finalize(chip_object *self)
- {
--	if (self->bank)
--		gpiosim_bank_unref(self->bank);
--
- 	if (self->dev) {
- 		if (gpiosim_dev_is_live(self->dev))
- 			gpiosim_dev_disable(self->dev);
--
--		gpiosim_dev_unref(self->dev);
- 	}
-+
-+	if (self->bank)
-+		gpiosim_bank_unref(self->bank);
-+
-+	if (self->dev)
-+		gpiosim_dev_unref(self->dev);
- }
- 
- static void chip_dealloc(PyObject *self)
--- 
-2.45.2
-
diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.2.4.bb
index bdc7e52ca5..7efbc5b80a 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.4.bb
@@ -5,12 +5,9 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
 # package is spun out.
 LIC_FILES_CHKSUM = "file://setup.py;beginline=241;endline=241;md5=f5ddb56912b7f20bf94aa4d1bdcd3533"
 
-SRC_URI += " \
-    file://run-ptest \
-    file://0001-bindings-python-tests-disable-device-before-releasin.patch \
-"
+SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "b916c3741dfc4dbcf6224b39e50765f672b137896287715709d49e9f063304c5"
+SRC_URI[sha256sum] = "4923c27262c70815054fe7a1962b98dd1d6822a541c103d0acd7f42fc9aabae9"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 
-- 
2.45.2


