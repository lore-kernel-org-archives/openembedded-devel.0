Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD517C88E6A
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:22 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12075.1789355592474534565
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZTaE0384;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so1705982b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355592; x=1789960392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLMm0+krB13BTEC558tXbJVHcCPYTmJaKSBVMWBR8rg=;
        b=ZTaE0384pAwemm/kheMy8+3zxDcLtxKnxlDw8PMLN1HPsAljzrAM46O4ay6JDLBCKA
         K7BubT3z6067NTqNgzHnl3eb3IkS32lovc/1CkFOpwiAvf5XRiNr/2Zv6p6ZdKlXDiOF
         gaR2yCPzeP+Z9mg2B/QGtGmwTg4fIQfnwr1oKRftTcBTe6KgJ2vihJlzaQV+YXuB3ps2
         kv9CKhfxxRRv/DaaEI2DbMbaESvbQuADy1K9DKrS0hMNJgd0XOrE26bEp8+/VJDgDyKM
         xOTsunU+9kA+uD4XgSt6ZxDWGJBBmWjuE+yjaqmIQqAU3GO0Og3f7kCQIBud4LrsdZRs
         y2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355592; x=1789960392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SLMm0+krB13BTEC558tXbJVHcCPYTmJaKSBVMWBR8rg=;
        b=LJQt8V6flMEeDx197HHPqf9JmRdM9YqMVdC8ClK14AQ6IpQzH5YMY7fsskBUEBWoEf
         w7sjoF8A/sgLTVXVGJEdZtt1egXSrOQ9wZIGrr7eK/DFKlSL1F+gke+E1bY3UEk+tE7h
         OsIBzLHP0qKzo5zLkERwtPdX/Z+y6VmeYvOMd36IUKs0pdTzlxCOFX2HXN2M2XambA4J
         9b3RKTZjPiWla2AuQylDhNFtxvXr01ebPxvdSXtrkT5E/KH4LjKCzYRfQywhROvHkspm
         iZ7tX4pcTiFXi+hYKxFK2VX87X1jvq0c1aCsmSUFi7/w9YoydL/ZKvr+PlQya6KPyTv9
         Wgpw==
X-Gm-Message-State: AFuF++khemHspmTxhFHq2SprPqA6SeIGX2u7nj1OTsMIVzDCRkR37w9w
	2+nXdmtV0WtRtjfaVmFxfndt8n60Px3s7NqS5umlSyEEfWFhOxT+t8E2RT5cEgi/
X-Gm-Gg: AYBFou04mia8BFTx8HPdYykIFx+BMIofnl5Xp+HeEvaGDme5gmC1mggoTTwlZAOmeXh
	1gCg+GM65qk9csMN4nZ6v7KKLh8Myz81nQjidPK1YHRHiaXi6+Vk6hd/OUhsdnWO5GjCB+2EzDy
	7zFF0qq2eaggjJChCRpg9NicrE1+2i9tS9Yior1g+GZjD6n+KYYz5K5jflJUjHt5XWwBUcg5uA9
	Z0gf24xv3Rn53apF/xE7jReXBdyiP5178nEuBgQsbyrSDhjQeq8r5/59yxnQqbQdlkcWdF0kiyI
	WhdFDjzArQR/D6RTSW616pEmEf5CQKmSrkGiOKSXamw835DSG27U4bc2o0ncCVmPze7yy9g6q0q
	j/KXW3gOCP4RN50qxSlhwsF5KBv8XAEyfxZxFLpt8DFy9bzXLF0KZOVga/Wzvz34UcJyKiUy7la
	qvUFt0P4vYgIUZ96Ba4G53tbUy6LGQXyU0lyU2zZCH0hLBmgN8oKNv+3qKgvHPps6WnwHdxhQPR
	/PTdRP0bbhLmkAgimFD
X-Received: by 2002:a05:6a00:ad3:b0:851:ba04:ca02 with SMTP id d2e1a72fcca58-86f854fc944mr1621900b3a.16.1789355591715;
        Sun, 13 Sep 2026 20:13:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 2/10] python3-django: upgrade 5.2.16 -> 5.2.17
Date: Mon, 14 Sep 2026 15:12:50 +1200
Message-ID: <20260914031300.3677365-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
References: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 03:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130010

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also revert bump in the minimum setuptools version.

Release Notes:
https://docs.djangoproject.com/en/dev/releases/5.2.17/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/python/python3-django_5.2.16.bb       | 5 -----
 .../recipes-devtools/python/python3-django_5.2.17.bb       | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.16.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.17.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.16.bb b/meta-python/recipes-devtools/python/python3-django_5.2.16.bb
deleted file mode 100644
index 2629ff3714..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_5.2.16.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python3-django.inc
-inherit python_setuptools_build_meta
-
-SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "59ea02020c3136fce14bef0bbece21a10a4febef5eed1c51c22ae468efa22200"
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb b/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
new file mode 100644
index 0000000000..3f49bfcaea
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
@@ -0,0 +1,7 @@
+require python3-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
+            file://0001-Revert-Bumped-minimum-setuptools-version-to-83.patch \
+"
+SRC_URI[sha256sum] = "9d4d93be539a18ab80d058eb515900e10951e04c537c5a6b394fc49528d3251f"

