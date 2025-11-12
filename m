Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7885ECD4841
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6298.1762976152973103187
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jHxKPTk7;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47118259fd8so540755e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976151; x=1763580951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffyZGaPrCJ1Cn/rW8rpNQqfPS08uZuxrh1ksjPK02Cg=;
        b=jHxKPTk7jYgPZGpiwF8Huz9H1+Ky3m8aqY4b1nJqIoJ3sWZDEBJ3m+ouEEF8AJavby
         8nlWFmZek5K5Q+YDD9WxpIuqCQbraDfpw+DQ+KGITtxgX2vF+sTPnvOJ9GStHhKYfoMT
         22mhIyOa/DplCPtT9IsUjxT2ZMg3nTlbmoI+nLIEW0kW87qNaUH5j6mFt+WHeij8oTwJ
         r7BO1Ek6gubZL22CaXyeMhi4+/q3e0B5IrykB8se0XijrsmS0a5b+3zW2jkPJttFcvEs
         rr/x9XKS6zyspY9pEt2JM7Y7d0EQZ1ihtEhzQ2OfmYHqiCZgLi7NJsZ+MbODUGhU5qur
         0gwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976151; x=1763580951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ffyZGaPrCJ1Cn/rW8rpNQqfPS08uZuxrh1ksjPK02Cg=;
        b=PIWvfX+zHKQEfqYh2LkxWF8Q5dzjPbr9ZHVYdX42Q4kZKYbz31vfKypgdHY63UDakR
         e24CE171Hk0kfd/x2gQYkur8hgqEllt1aCKbgsULsKexul6xqHAAD95bPnyPimlM9MoM
         +EF+ZHcxAxLzQC0F+Qtb3HIvmqdr2f6YrtdZ15b86IUH78XXt1f5QGszaXHZPdGkmLAx
         HhAek8mGpWBIr+JiqTMo4FMSviahWngA22REuPYCSVhESYlbf0qPECM245lFfTksGfem
         Js/gj2gEwhmrVXPvnqyapkKeEWRvjicO774vxVad/GX4ggAz/T4FzkbBNC/VxKIr/UQx
         KRJA==
X-Gm-Message-State: AOJu0YzgexWPl+i3UE/Vabyr3Qc/GMJrBZXBM0eMymbgiQBHf6a7OGwf
	ZvMLC9vGn79XfpsLXfCTb0mE3DxqhWeATc0UkQmazurDLwKRV4Yw3BWHeOu2tyf3
X-Gm-Gg: ASbGncs9+SXs5XVswyX2sGR5E+B3Ao2D7pINDQWt4Wj6xV+jBlAlm3l2G70otaQYcK7
	Jw+TEcf7X4sdJNYahIntCOJ7Hfp9og60oQOiexEueLK0Vu0j7H2IFKWiR1xb1wnOPLGeyzeSYFJ
	iMxHY7NTglnU7nhocrpwpml16XjIo3axVh6t6YXpn/iGlECHnRkVCgsX2O/kkGVxMzOZl5viyCH
	JDYoFwQkGoyw1I2fs8BH+tHobisLfZAxKjUMbjwtH1NR2F6j/cXe4EQsb9q3RGrSUkQi2fW7+UM
	aRIwT5ilpeUemQKkxTRRyEhjamRJITqZBtEo+tJcYHsFlv6lmrPkTfqL92RF25/0ipewgtvyTi8
	RdRL+6V1/VctoDJDot97/BAtT9OUPMWC6YJIGXJxt2WTAC5vousTELZChYlANmPOka0GCfBmwGo
	J516ZcOpoK
X-Google-Smtp-Source: AGHT+IETQ9MAR43E995xtuD2iI9Kh53mHZLkNgSXSGKt8KASDjoOPfJQNtQWZMzXVYss1BJNmH2Leg==
X-Received: by 2002:a05:600c:1f8c:b0:477:7b30:a6fc with SMTP id 5b1f17b1804b1-477871c35c4mr40371895e9.30.1762976151229;
        Wed, 12 Nov 2025 11:35:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 11/21] unicode-ucd: Rename the license.txt in DL_DIR to avoid conflicts
Date: Wed, 12 Nov 2025 20:35:31 +0100
Message-ID: <20251112193542.1589821-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121572

From: Khem Raj <raj.khem@gmail.com>

Since this file is downloaded and upstream does not version it on changes
we have to ensure that we store the versions in DL_DIR and also ensure they
do not step on each other

Fixes
stdio: WARNING: unicode-ucd-14.0.0-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/valkyrie.yocto.io/current_sources/license.txt
stdio: WARNING: unicode-ucd-14.0.0-r0 do_fetch: Renaming /srv/autobuilder/valkyrie.yocto.io/current_sources/license.txt to /srv/autobuilder/valkyrie.yocto.io/current_sources/license.txt_bad-checksum_f7830d126f59d83842565d3dddedc79db4ca978ed52aee0ebcc040ea76a85519

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 830535e5b6699d769b07c838fc5fecf0b5afbf0e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index a4952cf97d..b5ebf2fc7e 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=ea17640caddb659394df50e5db6efd69"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/ucd-license-v3.txt;md5=ea17640caddb659394df50e5db6efd69"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
-    https://www.unicode.org/license.txt;name=ucd-license \
+    https://www.unicode.org/license.txt;downloadfilename=ucd-license-v3.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
 SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"

