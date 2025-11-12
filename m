Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BE0CD4843
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6299.1762976153688634379
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nIYddGc/;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b379cd896so25969f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976152; x=1763580952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWlVBXOSjRf0/IIqX7l9ygLYZPPZSeN0S3qnp2ypd30=;
        b=nIYddGc/8mNtXs5CsSxFSHfX/1KrMPlAMW6GeVpFNOebyUSm6/kiTj29eGoaXdOXr9
         p25O7fEpuZID4R+PTMeW+YS80RNXBDZzVFueWrd7AXRf34hhngkkAaX66xNrPYyASUWV
         Yg9i4TF9KKvOkpPFCP8U8bFzj8KlPaljJrmQMHgPOb62/CHl3yg10QJRj6lOYIsXVPpT
         EFKChUACIkcC+qhsE2bYbpRq54VPRFWPqW/wRzaIuCYNBSFT5fBakk7xrqe809IUMjNe
         14kbiVFYYPPvT5SiZiewAGBu9BnaIFsjIhD1sf8hFXycQq6YncOIyQeNTFHXIICxSf2L
         T2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976152; x=1763580952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eWlVBXOSjRf0/IIqX7l9ygLYZPPZSeN0S3qnp2ypd30=;
        b=RiAOj5om2RulBFNXlOFOsWe9dAbOrDjy3c302ktV352vKH9sHQxylXxxdRoWl2k7DT
         mt0SNxI8QkAoa7rRTvvcmBSZywGyhnZ4RYS499zeOqAV3MnJftJPLkHKsoCoejm6xEk/
         i2ZDJ+u9ldbdw9R+u4JlIdA5E4862pFzkTzaK2QLZRY9kM6+AMwIeIUzzsPbQdqGYWZf
         Ahx43aPv5x5GV5DY1RzcCmMCeKQU3hqiGTq1rvrA1xt+RSZNOF3Ur8k5CkWeNVW5e30H
         V4aPZRXD2Rv2A4ol5+0GIfks7JCK4cwDvMCeq/gHxNmnP2o2A1B8GFiyjfD0J7pQwch7
         djmg==
X-Gm-Message-State: AOJu0YzBimmoYQ1tIcvIrlFAsAubeqNvq1sVUCAVJVLDj/3DAxvGq9IW
	7tspU2klt/gxr+qb70cejt3++0TlTlHc159lg1VRWtxD5V5WbsguGDxf5Je8dEch
X-Gm-Gg: ASbGncuBnblVRs+ARKOAEWlaEGK95GOPMgqOQQf3F+sOEfgDYR3U/BKF37Qo3GN2t01
	FilSiAm/SJM5H8z1963EijTcbjRF3EaTHjIxnFNP562xlh2ppfx69nmF7oIAFzZYwaannEAXKn6
	Hd+jUDE9LWFRibnu4LNDzD8fN9uJjEu/OhCsndpt8kBVQdLmMIVggqwRjWS2P3GEDyT9fL1xLxT
	lXq51xIh9LkgEOCaJ8YYiCHEGS39eh2dYei6xJCSJdpECaa8PGNIbU20R1V7xS6c6XkTD0wodK5
	KGg1yXmv83VhfvMvD105+WMNpyGCAVDzS73TbzeJYwUmXAjuEAxCaE1B+Wqn5Lth3X2YSndbg1h
	AMGnPYwaTsEgZsLY6YL3KEIottJYTQlufHPxXFux4En6kvWCthHJz22RRLUKAHmzZiJY0QHuhTg
	==
X-Google-Smtp-Source: AGHT+IGi7ReIL1BLEaMLgUmK3tGxxO3NjrKead+A3Aa32tz2hRT7ouls3BoUPgRr6RhwJJMPIa8ytg==
X-Received: by 2002:a05:6000:4310:b0:429:d391:642d with SMTP id ffacd0b85a97d-42b4bb8f01fmr4070229f8f.5.1762976151908;
        Wed, 12 Nov 2025 11:35:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 12/21] breakpad: update SRC_URI branch
Date: Wed, 12 Nov 2025 20:35:32 +0100
Message-ID: <20251112193542.1589821-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121573

Master branch was renamed to main

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index c752a10083..31120650b5 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -30,7 +30,7 @@ SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
            git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=main;protocol=https \
-           git://github.com/protocolbuffers/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
+           git://github.com/protocolbuffers/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=main;protocol=https \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=git/src/third_party/lss;name=lss \
            git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp;branch=master \
            file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \

