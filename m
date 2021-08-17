Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.40232.1629211165395798263
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Aug 2021 07:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rtSTCjAQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id q11so28981352wrr.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Aug 2021 07:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OWBnMJbVd8DBKXZRD28tZEzWoLkKujr1BLSnzHptRPI=;
        b=rtSTCjAQ75AZjz++LwYmoajkkb5SpBvmHjT/ovUOX1KtOtGNbTnRiel3ECqCE+yW6I
         xTmJnJdjq4naGM+zhLgQfDVhDfb9FSCUdRt61KLqkq4pnh5ywq9qBBWdgbfoP7frlw7N
         1OgAqfmcHr+dfqDuDFZc2o8ZmLi79jFKEO1h2BL/18tDj/UFWHhJMtWrB3JaxVz1gT8+
         GOIGKBANG0CBmG7pDsV3XzVNtp3rsCZDIX5syonEqzSlS/+Rr45IHryKL774Nr86QBww
         sw26v1PphK6rb29LR/iUdq5JE+8iITHdfmYiyrcu7JOVgI5brXOKucfWTzjbs1h2YkTu
         SJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OWBnMJbVd8DBKXZRD28tZEzWoLkKujr1BLSnzHptRPI=;
        b=EwjxPSx41kGyF+iRN7LQ1WleNOy94VOTxYYa7nsO5L4+tAZVRTnGPBL0i2J86n5Z82
         mA0F6HyGGtxQxOqdFTq+n7YqIF92Jj6zppwyU8Ehg582/sWZDWjMq5kgQvfbn1amp6v4
         i0a5Hy4bJHOH6w5d+P0bYBUebHl8ajRkTkK+vhUta6fUvE8U/Sdl4War+xvvkGnqw1Vr
         /7qTHFGCP7Q2M+jdD82/E7jtszaWkqNWR+IF0FAI//nDlDnaK9a0+m2pejxhIc9oSznb
         FS2N7LOYlLoswJgJJMEEIBM+ZQhJ2NYelerLRg7+Isjr47oDjCc+HWK6Id+HiIGQrY0S
         Cw7w==
X-Gm-Message-State: AOAM530WnX11IZ2todfZYFaexaHOB8U4cFbFr9IjaD6ZRKOJZB8xeT4f
	3Vx3UWpLt9wQ8BRBNg1AwOwz0prOO2A=
X-Google-Smtp-Source: ABdhPJxLR1IDotD3Bb4wXFHSX/+7xycXUVogPa9iS1Ln1JD67LTVNLmB7m9SpuwFm6X/+DMBsw20OA==
X-Received: by 2002:a5d:47a5:: with SMTP id 5mr4656621wrb.9.1629211163780;
        Tue, 17 Aug 2021 07:39:23 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f36922767bcc991e678b398.dip0.t-ipconnect.de. [2003:f0:7f36:9227:67bc:c991:e678:b398])
        by smtp.gmail.com with ESMTPSA id h16sm2510784wre.52.2021.08.17.07.39.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 07:39:23 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] catch2: upgrade 2.13.6 -> 2.13.7
Date: Tue, 17 Aug 2021 16:39:15 +0200
Message-Id: <20210817143915.2745445-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes
* Added missing <iterator> include in benchmarking. (#2231)
* Fixed noexcept build with benchmarking enabled (#2235)
* Fixed build for compilers with C++17 support but without C++17 library support (#2195)
* JUnit only uses 3 decimal places when reporting durations (#2221)
* !mayfail tagged tests are now marked as skipped in JUnit reporter output (#2116)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-test/catch2/{catch2_2.13.6.bb => catch2_2.13.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_2.13.6.bb => catch2_2.13.7.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_2.13.6.bb b/meta-oe/recipes-test/catch2/catch2_2.13.7.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_2.13.6.bb
rename to meta-oe/recipes-test/catch2/catch2_2.13.7.bb
index adfc03a16..3eda96c73 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.13.6.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.13.7.bb
@@ -6,7 +6,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=v2.x"
-SRCREV = "5c88067bd339465513af4aec606bd2292f1b594a"
+SRCREV = "c4e3767e265808590986d5db6ca1b5532a7f3d13"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

