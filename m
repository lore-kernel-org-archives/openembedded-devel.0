Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7474BC3DA7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 06:31:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.117472.1723703460781443556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 23:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=l+wfHpQe;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-36868fcb919so287440f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723703459; x=1724308259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3i2eSzR/MSa+e+vtuWD23CpIyXpQ1//XE0kAQaQpjw=;
        b=l+wfHpQeeuGrPVnQxswUxsIxcieKQig3Kb50Z/VMeIv8oFovJZRpXOPMpsIRw4VR+y
         yNGGQ09o69I51qedOEZHceKWor8W95bXiazRF+RdfFNVNG8GkOL6oPdyNKCTvMsW/FZi
         mpzmeFyX4ki5WqY9/cvQSmRPvdre01c2rZ3WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723703459; x=1724308259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3i2eSzR/MSa+e+vtuWD23CpIyXpQ1//XE0kAQaQpjw=;
        b=IfS8zUa6pL5TBBz6/6kAN1Cl9QR3f11/XX5dN6COxIRLaCJaFAx32B35pR3iUh8ofo
         gfK1RbFVBDsg2hr9T96bbVromM5Q/zvaWcENHdY3Dc+b+sL9jEZrDliBFspDROWdRvLb
         lhPYHsd8JKbbeGcmHDsSIj+G9q1T4aTSh1McJz3BKt2ytVqnYz+U8VyPyqsCnqFFCjCE
         gM9zuYYrpTKMuFymopcWhNBCzK4xPnPtXmvFlchXJ+HcX+Hc6C2YxvqnNLbcMZHv/fXE
         WRDADJJ3oGS7N3RGQ6vTlmYJGS1yUA/qlrBy6l1GP/uhJ/IIP8B68L1fkBwfRmSw2uzu
         NtmQ==
X-Gm-Message-State: AOJu0YxnHRJbRMrR85hUuEbJ4DqXbUZruNP0iMTT/ZMkZZzxMTCuLP8d
	qE7lBazzgl3nJI1saTt3wvmwoRelS1YTYzxOCxuqb85axy1hQ8A1djyHsuSeCi+3aPmVJ5BPg56
	V
X-Google-Smtp-Source: AGHT+IH93x3GSmXJOc580sEuhS1WdMtv9AT2VD2waxZVqy6aqQ90MYUuM/ZQXvTvoAOMXkKXq+RXTQ==
X-Received: by 2002:a5d:5cd0:0:b0:367:f281:260e with SMTP id ffacd0b85a97d-371777567f9mr2987062f8f.3.1723703458651;
        Wed, 14 Aug 2024 23:30:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a286sm707174f8f.54.2024.08.14.23.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 23:30:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-path: Upgrade 16.14.0 -> 17.0.0
Date: Thu, 15 Aug 2024 09:30:54 +0300
Message-Id: <20240815063055.2088675-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240815063055.2088675-1-leon.anavi@konsulko.com>
References: <20240815063055.2088675-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 06:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111819

Upgrade to release 17.0.0:

- Removed deprecated behaviors.
- Removed crufty manifest.in.
- Removed crufty Dockerfile.
- Moved tests to tests directory.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-path_16.14.0.bb => python3-path_17.0.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-path_16.14.0.bb => python3-path_17.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.14.0.bb b/meta-python/recipes-devtools/python/python3-path_17.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-path_16.14.0.bb
rename to meta-python/recipes-devtools/python/python3-path_17.0.0.bb
index b4d290a23..e80995207 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-path_17.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "dbaaa7efd4602fd6ba8d82890dc7823d69e5de740a6e842d9919b0faaf2b6a8e"
+SRC_URI[sha256sum] = "e1540261d22df1416fb1b498b3b1ed5353a371a48fe197d66611bb01e7fab2d5"
 
 SRC_URI += "\
     file://run-ptest \
@@ -28,7 +28,7 @@ BBCLASSEXTEND = "nativesdk native"
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/test
-    cp -rf ${S}/test_* ${D}${PTEST_PATH}/test/
+    cp -rf ${S}/tests/test_* ${D}${PTEST_PATH}/test/
     install -d ${D}${PTEST_PATH}/path
     cp -rf ${S}/path/* ${D}${PTEST_PATH}/path/
 }
-- 
2.39.2


