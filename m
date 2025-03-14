Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6A5C282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 20:40:44 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.4157.1741984839833781366
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 13:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xle2uVvm;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239c066347so53302305ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 13:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741984839; x=1742589639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shd9Kr3fUSY/5Jzh/MpKHI5BC4/gNG2KlgkwqhN95ik=;
        b=Xle2uVvmxDuwm9TUE5ODjpqhymi1I+pRT8V6/SkEgagmbp+O3Ov5MxCqKPUqcyfOCi
         vGtOk3ZGtt8tXuA9C+jcR0Lvr4i1ptH1jJ0bZs6JaKJND1VtysCvTce/cOvkF/PPdjEr
         yB7epw6FPtsnq7M32vXE3+yPMQqt+zqcM/LTgEkk9ZYxk9hEX9LalrbrsuIus5YixNNx
         PEOaZP+gwa8uuOd08AUoF8pUa89rjJCp4RPTJpchbKjmvPEXbp4T7rsnw1exM/w05Ybg
         W6qEamGeJBYanp4DUbEKscuHpf487ZIF3MKJ9oloT1BfRi4w34cbxoEwUO9IZeknMWgw
         KhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741984839; x=1742589639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shd9Kr3fUSY/5Jzh/MpKHI5BC4/gNG2KlgkwqhN95ik=;
        b=RVnTDuRFkZN1GlieCKTB9aOkNBLCwIauasfZXt9zdGfYNfVGR4DwOqIRnvLhY77FSb
         mSKcFI48E+9mRPgoQi9Y19BYLu2wcVN5+gGQ19YTWjI28bBGkK1PpsH2cdExDuZGTcC0
         G5s+nPcjS0GMjhnSjkg596juMHNgdtHdr4rodKYm66+tGBOXNbC9qX0Q9ojeQwRKJMWV
         rc8+K8rGHxg4DkK5U626f2674C5hOTYOei+Y13ZQj0Xc8iarz7ZlSIsEcck5vVnb2aRf
         Q4Nz0cQdpVdeG5B/dpSQ1YeZpuUOEgeFOzAr5XXTLqin4bv52WtkH3R57/TsnzEDI98K
         785w==
X-Gm-Message-State: AOJu0YzfGvEPoLMeBTRSDhIIZ7VKEW/MjptUAbpy24YHu0qppRMoqthg
	zYWAMSAr6ShFAJY9ZAPx+6x8Ype6nkdiMOcifC6zPOk2KSxV46mIaTGLkY22
X-Gm-Gg: ASbGncs9V0f+hiEEAFpO+VcZ5ZwxsDSaWac9DhaVfhwQa74M/lZZbSG3LeC+EHraarv
	MuCQy0EP4wGjyHyKjcTksU8mOBffEp7iipFF6HOrRIJCuOQCB87CwIFmNKfjiJrDZtZ7sFs4z+t
	md214x24xW2kuT4Rxzir5+Hn+vguH/o6qF1VDFz15JYijVEOOQKl3NGOahoDKAS0rPB6/3y6w3Y
	FZL5wYABKmdAvU6Oe5SFQpEazBVP7Ov7IXXNTJQUG1lU/LQzYbxPROTXG+ZnGQ97pVI2jH2EbJB
	zOh9meoHuxYq7TFwg/jIEEdqa48gppevJxFl
X-Google-Smtp-Source: AGHT+IHz07BlFkQ4eTyIITqPyFfxl4yEc3h0FtV9tHz7USIqtdx+3qLcrp5XY3/GzuPON90dlLuirA==
X-Received: by 2002:a17:903:98b:b0:21f:7880:8472 with SMTP id d9443c01a7336-225e0afb4d3mr68417205ad.35.1741984838971;
        Fri, 14 Mar 2025 13:40:38 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::df1f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d16sm32762475ad.139.2025.03.14.13.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 13:40:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] xdebug: Upgrade to 3.4.2 release
Date: Fri, 14 Mar 2025 13:40:36 -0700
Message-ID: <20250314204036.2857292-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 20:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115987

License-Update: Update license to match the PHP 3.01 license [1]

[1] https://github.com/xdebug/xdebug/commit/5fc2d818067d05503226ee8c6442985cb2fe069d
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.2.2.bb => xdebug_3.4.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.2.2.bb => xdebug_3.4.2.bb} (84%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.2.2.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.4.2.bb
similarity index 84%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.2.2.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.4.2.bb
index 8ad588d291..32a10f75ee 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.2.2.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.4.2.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Debugging and profiling extension for PHP"
 LICENSE = "Xdebug"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=92d94a330d34ee6edc2638450736f119"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=afd6ce4aa04fdc346e5b3c6e634bd75c"
 
 DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "f48777371f90cbb315ea4ea082a1ede6765bcfb35d7d6356ab8f71fd6dfcc157"
+SRC_URI[sha256sum] = "a043888c86e1526ac5ddb220d37ed3a1809e79a16bbb059b9c7e2d2f83b43cc1"
 
 UPSTREAM_CHECK_REGEX = "xdebug-(?P<pver>\d+(\.\d+)+)\.tgz"
 

