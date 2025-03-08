Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CB3C282EC
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 09:04:41 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.6120.1741424677862506324
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 01:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0bSKfyk;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22359001f1aso66737525ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 01:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741424676; x=1742029476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSRcsfbrSCHe8WSG9i2h/onULxznlBciFDJMDp3EnBk=;
        b=g0bSKfykjpQ2IIw8+aiSfLsWRpbjBer95dIwFVMiDfUOR/8mHso0sbL3avpWdBWMgZ
         fppTZDI5/bea4X7L6NDMRmWY0f2w3qhB+BSGlJL70MWJwgq/fEcmC+ljglQv4+tdP/t1
         zZgc+I32+xEsLFxqFgxqfcPi2PyAY7A/ta6CLtNHuuXz1zNiyjEQG0ZYTS9hOag+efve
         mHTRngPav5/DEub+iMrRyrQjf+ZlVZFpHmHmvWY0Hbj3iSNJsZWS/bqEcbMDEC4ad+/g
         e/Beg8zG6pAaefeqyLu6RUtDmW4TPEoCDk1DdgzNCIxQQroo0XLmImVBFI7vcAnlwfMC
         QG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741424676; x=1742029476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSRcsfbrSCHe8WSG9i2h/onULxznlBciFDJMDp3EnBk=;
        b=tLVp7Jh13VX4MvPxfX4cCYhMNbGvsdg0p051QHQbmJtjWkPHBXHLpD2ZWEAprGAOb9
         BD1DAmeeSnTUjdwy49kHg1Kyi5O5JizMscc+e8LoPDGc6x0jVvCwhOz2qbtMFwSEEmYe
         9R5sdYg9kK52NYIhXb+YB9+ZeJZwIIanaEGn0IYQFgwX86Ba8U0EVZBk8Fo2AI816xqI
         qrhnKXdG+/zJEkFPR0ZPtCKJauvIIpBHaZQLCjHgg/KH4JEwH3/8JF6MmJLuhBmJXAcH
         WRTINlSoMMlTwgBUiLBrCHrcl4Gch9Bpos/Hk9ezGUFVCyvdD6hgI6wj6zaRfBFAMzQl
         T+oQ==
X-Gm-Message-State: AOJu0YzQIta1eO7XDsnJeH/BKOTmWpIGGO1J5ObUXG2T1rItvQJ0deJD
	8DcJkx2KPpgmCn5qnYXwRB+BsvI8/5uFEOBuVqX7Bvgr7sSm7n1cM1AOzA==
X-Gm-Gg: ASbGnctH1NHJRbr0mPNjZzdHv2VURgUKvzxGwJeGn6cjaJNI7ncOGymy4GAhh/sCnBK
	C5jbBkMzd9v3Kd/aFOO/Z+dEOrUvIKLk8kMMeutwLMLQVvEU6MbSnbqGNwr5aReLcGIUFhK5K40
	9CqI3FvB9R/LJKMkVpTfSjoR7jRV1egb6jhlczPGEr56P8ELQVymzQda2HkaRP+tuyH4omCqp5a
	0Fx7vzDRFa32ltXprwDmLzJ2KFrHxlSL+yt3qsuqOI7/Vbrd/vaMYwE+MFXa3wgVv0efN4NcUrC
	uE97wf2sn5g15nF2dJQv7TdYECr65C/hNj5Q1YXj47eCQv2qeuLgnA==
X-Google-Smtp-Source: AGHT+IGyMyoVmq9wfjsywGGYXMZfWplArXzhzwYPf9Erq8BgZOJhAdraOQRYxEP14v0ZN6SpAOwoEA==
X-Received: by 2002:a05:6a20:2451:b0:1f3:44de:619a with SMTP id adf61e73a8af0-1f544f661f3mr12149771637.38.1741424676510;
        Sat, 08 Mar 2025 01:04:36 -0800 (PST)
Received: from L-18010.kpit.com ([49.36.57.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af50bc9b28fsm2124984a12.60.2025.03.08.01.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 01:04:36 -0800 (PST)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/3] lcov: sort RDEPENDS alphabetical
Date: Sat,  8 Mar 2025 14:34:04 +0530
Message-Id: <20250308090405.345593-2-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250308090405.345593-1-akash.hadke27@gmail.com>
References: <20250308090405.345593-1-akash.hadke27@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 09:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115805

From: Claus Stovgaard <claus.stovgaard@gmail.com>

It is easier to get an overview of the perl modules needed for running
lcov if they are sorted alphabetically

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7ec1c9afdf45a3ee47bfff0470d90cf215ba4da5)
Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 4f35eff90f..53e1921054 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -10,12 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 RDEPENDS:${PN} += " \
     perl \
-    perl-module-filehandle \
-    perl-module-getopt-std \
-    perl-module-digest-md5 \
-    perl-module-digest-sha \
     perl-module-constant \
     perl-module-cwd \
+    perl-module-digest-md5 \
+    perl-module-digest-sha \
     perl-module-errno \
     perl-module-file-basename \
     perl-module-file-copy \
@@ -25,12 +23,14 @@ RDEPENDS:${PN} += " \
     perl-module-file-spec-functions \
     perl-module-file-spec-unix \
     perl-module-file-temp \
+    perl-module-filehandle \
     perl-module-getopt-long \
+    perl-module-getopt-std \
     perl-module-list-util \
     perl-module-mro \
     perl-module-overload \
-    perl-module-overloading \
     perl-module-overload-numbers \
+    perl-module-overloading \
     perl-module-parent \
     perl-module-pod-usage \
     perl-module-posix \
-- 
2.25.1


