Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EABFEC01C8
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 10:38:01 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14073.1774262272380400034
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 03:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GMi7LkET;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b061b6cf36so20325315ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 03:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774262271; x=1774867071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhrQhGe84Z4XoQyP68RVTCYbKPKiMFkU6ZVRzVcyIro=;
        b=GMi7LkETRkqdtA/FwlKY2XAkVOGFBGKbsU2RKEd3xVpTAYWMLDjoyQmcfAGKSNZYS1
         5Ay63NgFW6sYFpkQdoJbQZWyn9WAWWabp6twiRY8Kd+BHGdlgg+8oP4RxUtLg80FDid6
         ZXOSCNkxpBUBaNSxt/C5uLV7j6ikWXmNhPGoNYOthjkfqjVVLGxXj2+wbOqA2iX4VYUH
         oOfyd5dN65bnRS1XTDhT/tpekg/33aUl2IjxZSOTlRlh9xBi92Wylvy0LUHxIr4GglD1
         DdPWBM4PHsbbdltBCr9k6Dwbr4i/9ENgD6OcknGiOcCET2O7bCf6n7xX8VuVeVWzdlF0
         9zzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262271; x=1774867071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XhrQhGe84Z4XoQyP68RVTCYbKPKiMFkU6ZVRzVcyIro=;
        b=gmDTr9ynUpw4QUMd274DeRWi1tsh4fXYy7RmGQTDMkxKGHR87lnfsQ8mmXryy/ndw3
         WqLk69CKa9U2DbWexLMk6slzdeLTYisEiDRqKp2XvGxsNQb8OKdb1ZjAdlyod000avgQ
         0ex2AJpULRdkOX5SBfCrLQcoOsJa7+iWhdpr8IEXYgzZbnIrj52i1TsMeUN0la2EctSX
         5Q0olPbpabgCaY8LDxyiaHXSFkhlu56rnaVarABOpCCZ0NhcNNrOFCgJKk6/oo+bjaHk
         wFlNvDFdGfrDLEU4QVj5CIWCS+OTwRiWTPWS0+5n4hQWSoAoH9v1KI5FImf9kczJT8Lv
         /S2w==
X-Gm-Message-State: AOJu0YzIeQReZPaB2XTWR79IW3UbvLzaVnG2fwPONPxABYx3EMBZ8Y8L
	gw6ZSP6m0Rey+f7pmghKwnrDE64RvVsgXPzJlvgUctFQKuhJ37YisEHW1MbuNA==
X-Gm-Gg: ATEYQzz2ysOVZWUUmfYaLxXnrUBMkQCyvuWfhg04cUgBgRZdrgBGGqCoFASf3i2j0gB
	lwZ1b6g56oXKHu47ejDjexLii4QC5EL4peeAOGU4Q7I7R8wEjig5mIO41MFIBKTlAI7FGy7YUpc
	2yFN9IrQ63dbLwaBZ6nmRTr/KC6vFuJr4s2jKQxsSKeM1w45j3XLQiiP3joN5EIyJGWmOjyY0p/
	R5qwOm0C3bc3c9RiVInXx3x0sIojk/n9gpymPBUu8bumyec6sID38d4QPbl/J2DqviwyZAe+KB6
	Xk/HJfF/axK0bF3j29VzyDw+voC4NAT7qlgV7suBHfrKluBrHHL9CHseizCi5/vJKfekN+q/XMt
	qj2bRSl33CoySSz2Vl2ULw7fBIW/RGgAsGYgrhJnI63U4BYnTAiIQHMRKago3wFrD5uBDldsP5f
	Xw18b6Dmp1RLZgIAZzpEBj0M+INOTu0SEoxOc=
X-Received: by 2002:a17:903:244f:b0:2b0:5e10:9dbd with SMTP id d9443c01a7336-2b0826c84cdmr115626405ad.3.1774262271536;
        Mon, 23 Mar 2026 03:37:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835551c3sm102792665ad.35.2026.03.23.03.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:37:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 3/3] python3-black: upgrade 26.3.0 -> 26.3.1
Date: Mon, 23 Mar 2026 23:37:24 +1300
Message-ID: <20260323103724.2341742-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323103724.2341742-1-ankur.tyagi85@gmail.com>
References: <20260323103724.2341742-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 10:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125501

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Includes fix for CVE-2026-32274.

Changelog:
https://github.com/psf/black/releases/tag/26.3.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-black_26.3.0.bb => python3-black_26.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-black_26.3.0.bb => python3-black_26.3.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-black_26.3.0.bb b/meta-python/recipes-devtools/python/python3-black_26.3.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-black_26.3.0.bb
rename to meta-python/recipes-devtools/python/python3-black_26.3.1.bb
index eaffe06563..9589530d73 100644
--- a/meta-python/recipes-devtools/python/python3-black_26.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-black_26.3.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
                     file://docs/license.md;md5=d826b3c5269f21a8a0272af3f00d15c0 \
                     file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
 
-SRC_URI[sha256sum] = "4d438dfdba1c807c6c7c63c4f15794dda0820d2222e7c4105042ac9ddfc5dd0b"
+SRC_URI[sha256sum] = "2c50f5063a9641c7eed7795014ba37b0f5fa227f3d408b968936e24bc0566b07"
 
 inherit pypi python_hatchling
 

