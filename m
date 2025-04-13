Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA76C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 16:17:46 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.31136.1744560104785875320
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 09:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YlGUwuFy;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7394945d37eso2962803b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 09:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744560103; x=1745164903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMqrAdtcIhePyJQuK+yse81VVDIDqX/d/dWR4+DIrAQ=;
        b=YlGUwuFyKdQT6b1SLb2czRlxmUAp5lVrtWNvI8sC+GqdePBXwgk+SMx4tCS1OxCXuA
         biGRJtxuNtBBTwX6drZLCTEWjJvJ+ZmIdU6+i6sZoTXJUUJBMYQE12UAuM0QVgiLnfny
         MHrN8l44qo0SbuytU2DI9js9p+gXYEXO29S1Wk8hQZe7zU3AkGhohXyG0zFjynLZLwq0
         OyPckrnQoZw0/bMyqC6QwESg1vo1avKyyqrF987L/X5a5UZS/HX4zqkPsT+upAQIyymB
         B6JnBAFk42ByzUQdDvT3mSz9yGg/muiHlkcQafVpfGIIeMJc2Vwo0KnisLUPbfnIoF0j
         +0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744560103; x=1745164903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMqrAdtcIhePyJQuK+yse81VVDIDqX/d/dWR4+DIrAQ=;
        b=WluPny+hnYx6cevOE22KQnIAetfHyxr9xlrFYsz0abDemQ0jQpmGjtrQzfw3WISxTq
         Nra6Sd2K4yHugP09T3s+ecMQWHvIB0vkcmIIp57GEyH+DvNbnyR0NENchAuqMcFpr/Ds
         WNnC4aDjneu5LJn0Vw3/1cKzLWHYRXlDcu77MzKuai0L9e7OSuh2rgZSJBLUR474sjiR
         YHBsQSkJyNk4XUTzdNi7Ks44qWbFstfmK+9Px3DZkazt/CWVG0DPj+eSBLIzKoAgJZEd
         CSNf/oWHsHM/2OR9xM2wlLsiknv2oJSnm/US3KwQnGyLPdkuO6HoupNqa4RQM80ZUSMf
         +7ZQ==
X-Gm-Message-State: AOJu0YxumE1IkJ1H6nIuUtJmdNdzy+ojzSuuC1LxRKuF34PMB31UlNE3
	mExIku5YvcaJGpJoI8OuL7N5bTZi1CvXlQ4szDhThUJpdYOXEd/0AdvOoKHYChqt+Q==
X-Gm-Gg: ASbGncs8lDWmPuKZEwniK8d4dQP/JTCDd9irEk1wPCUYDEGx0agzQ/sTf7O7nXTbt6s
	uuoOSI9V72gSTSv5/EmFHnSy5m7wwVCOL1NZ5Rt4y34lmbxfkl8+8XYe5xqqhS4NAqDhNtofiY/
	ae8IwkR0ohYt2/Z4nwgnd/xoNdW+wVm/U/NbF0uKu/dgkp/VbsQ88L9pHW2bB3CTWl+Auia7fqo
	ggcG6SsnVsm0mu7nDxnJJs2XXuuhPbqsNEqdoVJDDjetJRJWSS6XhlNn3UpJMTSBN5IKZhgDGun
	JN18oqhMBBMNSTOYIlYgvI4LyhoELJfJuhzYT3VMZdAKc1qUJqJFfkWUuMTy5Q+X9cPniCfmppJ
	6JUo=
X-Google-Smtp-Source: AGHT+IH/ksaok/a4kLTwgbeeCkONDPvUjAlU/LZdMhCrYUZzaDCE3YDx4+ilwGZGNlFsMeJ8eh8oxw==
X-Received: by 2002:a05:6a20:c995:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-2017978f0cdmr14737879637.7.1744560103100;
        Sun, 13 Apr 2025 09:01:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90d4:ea0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0817f2dsm7907699a12.11.2025.04.13.09.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:01:42 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] 1. libsimplelog: add recipe for lightweight high-performance logging library
Date: Sun, 13 Apr 2025 23:01:27 +0700
Message-ID: <20250413160127.57261-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 16:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116833

2. libsimplelog is a portable, minimal, and extremely fast logging library written in ANSI C.

3. It supports multi-threading, high throughput (up to millions log records/sec with PC 8 CPU - see report from README.md)

4. And works on embedded Linux platforms without external dependencies.

5. Follow KISS principle.

6. A Tribute to W. Richard Stevens (1951 - 1999).

7. This recipe adds libsimplelog to meta-openembedded under recipes-support.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_git.bb          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
new file mode 100644
index 000000000..7a27fd302
--- /dev/null
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -0,0 +1,26 @@
+# Recipe created by recipetool
+# This is the basis of a recipe and may need further editing in order to be fully functional.
+# (Feel free to remove these comments when editing.)
+
+# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
+# your responsibility to verify that the values are complete and correct.
+SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
+DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
+HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
+
+# Modify these as desired
+PV = "1.0+git"
+SRCREV = "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+
-- 
2.47.1


