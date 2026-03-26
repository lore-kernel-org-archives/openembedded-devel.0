Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3323810A1E71
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:41 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45496.1774523018495838637
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VjF/Thlw;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8298fad2063so478303b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523018; x=1775127818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPAE/otPlMPYlfwqD3bNSf0vjZ2RDb/NSHyHXmf/3A0=;
        b=VjF/ThlwE5kXSUB0v2iVwu+ha1VZ7oSezrf7aRxV4qo9a2ZZJvER47l+rUYQ1ZeJBO
         p6R+FzyfgIW6nYcZeM0SyZ/XcPNjnAyK2L5xOZb4NqTqSgNw3kKd2erjT9VVOQMBT9QR
         ZLZAh4rK4C16FLQozYTJFReXlVVQa0rPVCBEo7UmPUUV0pzVUTjhaoMEbuZ9n9uiwD61
         3IPK49NY2BvPVi760BvNHSXirOfoHiD0LLYjPF6BwO+WyPee9Tp00IZ96wCZcA1Ypc/w
         BLIuhLHFASUdlG4R9ZHQFt9t0K67zPYE1bOw7f+xM2zll5kk89PHy0G+aLPG9bjMV9L3
         CPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523018; x=1775127818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XPAE/otPlMPYlfwqD3bNSf0vjZ2RDb/NSHyHXmf/3A0=;
        b=MkcBZFZYv0cwlyFMqeCdMPfSraTfPURUCKs3bpAo3q0+dOE9qOB8ryo2zhfDD1WSzh
         AkuSArLp3awBNM0s4TfDPLu7JDf7/0Ni2gEEEKtq3YrCsDsSdJdUma+wIfdQGvhO9U6G
         7QE6gHHwdCuWl8uNdNH31oC3T0ZOjkLmat8tiPVC1qlj21DLH0FDxuGQW+SHNrROaOTT
         T4lA31dnUgxZHvugaHRzUyx+7v6ZAGDm0P3JzS3sPe/DwWO3vjpIHjM6sWQGbsMRCDrn
         uEew53uFTVWL+Mgh2WgC0Cnm/3b/6Rva6htLnbqJD4QDjJ4T9Mg4OLIzBBoDSRJqMGE9
         8JPw==
X-Gm-Message-State: AOJu0Yz4vhvFJRhKjA+zyWKnPIN0KHzpIjvloeCY0J0+nJq7BLxl6nbT
	Jn9pNJMFvgS+B13pmpCF3ZtATk+E8SbTPnwjVy03D1snkhFcicseh2nfPdGKG7cG
X-Gm-Gg: ATEYQzwXbiVZjlKp0XSNORojpOiDBD8O1oGZQB1SahKepv0ir6N55q13Q7GZGBMa6CB
	43UfHRDXbJYL3EyDiZhlkQU2zl5D7gpYX4RuHu/pRQmEGsuv90b9m5HWoKPJN8EIk9MRsPZYH1+
	41D37jfn5c9ci/aLVkaxFRSkyaeIZgwSwolUaB/byERS3DN9wzM6yTVmYcQVGB0DycQHZiNfAlG
	T4tRT4PmvHnivlggsDqXIaYmc7a7VN/cF6E2zOgkp4oRxOym0e6rf2wA59F33lvkYAWBp01y6f7
	CT/dfWcuuoOp6E7V+5hzTBxLpWR363zhxa2dEtHLm7xoT/UlLvK5EZ/SVsDTLvwOmCJAwDW9E6d
	BW4NWD4aLBHdm2wQQE0nNTk+L/PsdKFBQgQv3SKksj6dK4lda16Jtz1lC684epvd7v+X9MlseP9
	3qQnrifhWYdktTQBbWvgKW6VvsEpjrhM1Sj5A=
X-Received: by 2002:a05:6a00:61c4:b0:82c:75df:10ab with SMTP id d2e1a72fcca58-82c75df13a1mr3535770b3a.58.1774523017646;
        Thu, 26 Mar 2026 04:03:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 6/13] f2fs-tools: include tag in SRC_URI
Date: Fri, 27 Mar 2026 00:03:03 +1300
Message-ID: <20260326110310.1809866-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125647

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
index 68727b008e..78a71359cf 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
 DEPENDS = "util-linux"
 
 SRCREV = "06c027abc6153c4a97cba5317844e8dcaaee3cf7"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;branch=master;tag=v${PV} \
            file://0001-f2fs-tools-use-stdbool.h-instead-of-bool.patch \
            file://0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch \
            "

