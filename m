Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B2BC3DA4A
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 00:26:28 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.27177.1722126383615971344
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Jul 2024 17:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bxnaPVMn;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3db145c8010so1424929b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Jul 2024 17:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722126383; x=1722731183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ARPbHUcqsvLhcD4cb7hGoXy10ROcCHIi3FXTsUWqUMQ=;
        b=bxnaPVMnfi++XjOJLy79b85RFvc1EIenUBQSJWsEBskhzkyAu1yP1D1IG2ekMHZeHZ
         Paw9fOQyJ98nWBvipcn0W3rLphYcPVJvF5wf3WI2Ho3h6carODNGrKkZqVAfDgwcmLFQ
         uK0HU/r36s0yUPeuPXgYB6SeDEUG+J3L++w27AEtoKvFhpSx/pO8vtk8RegRP810MWu/
         DlX/k/mevuFloH0YPny2FIj9CNbaDg8gXbSgP60QSZWG4fAUpMFganwM8aLaON237OP7
         Kn/muYaoKRdUu5Vhx7CvmZ7E1jr9v4O11m5gkWIM/AESgNdD5m2/+WnCDuV5lcu18/lX
         MQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722126383; x=1722731183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARPbHUcqsvLhcD4cb7hGoXy10ROcCHIi3FXTsUWqUMQ=;
        b=VxIEJGx8JRKqgLnK+7tBjnM1fRIGgKpUk80/bCq/lQhD7rRsSkR3c8XC+tCjO35G2H
         xJ4/nqbPHy5bXf8kx+l7hLGVPNMS+5HqZpVd3uxbFvMFHlmD9np3kusB5s/DVTB4q781
         lAnlJJAgsCuzRMBGJXgB3Hg+qOXNdoICLbdI6KrvKP6UQom1kPBjt8geUqTsx6E9Qdcp
         SeMK+gIta0NPIl6VEHod+kp7utB1y38BbYpwJEDzX8qkPM9fs3LLZTBhm8dlkK99tTNi
         pm1pCj0XDrTqd/8Nl/fgwxzMIAJLxyeIHVIuBW07LIlzH+466S+Jb04VRBWRFsejO9ds
         Njbg==
X-Gm-Message-State: AOJu0YxTmlv3XuqQr1H9MpqIrfLADijdmaJbZ/+hWxfBpmV5p6cpSTQm
	PP5TGqKLyeDv2zm+yLWjo2WJJeeusMy2ZFiMitJqnjPiuykUp2iM0Yia0mod
X-Google-Smtp-Source: AGHT+IH2Tb1sn0I4bRrsy8POTyBYEYcxrPQDR9+9y2pTkWkOKCjad15rSnhxH1ad48SBz7iIhlaBJg==
X-Received: by 2002:a05:6808:1449:b0:3da:ab89:a808 with SMTP id 5614622812f47-3db2389b4ddmr5727747b6e.20.1722126382648;
        Sat, 27 Jul 2024 17:26:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee4d16sm56411675ad.146.2024.07.27.17.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 17:26:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] log4cpp: Fix buildpaths QA error
Date: Sat, 27 Jul 2024 17:26:20 -0700
Message-ID: <20240728002620.330061-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jul 2024 00:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111447

Fixes
do_package_qa: QA Issue: File /usr/bin/log4cpp-config in package log4cpp contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
index 729857eb62..a8b9b9a019 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb
@@ -20,3 +20,7 @@ EXTRA_OECONF = "\
 "
 
 CXXFLAGS += "-std=c++14"
+
+do_install:append() {
+	sed -i -e 's|${DEBUG_PREFIX_MAP}||g; s|--sysroot=${STAGING_DIR_TARGET}||g' ${D}${bindir}/log4cpp-config
+}

