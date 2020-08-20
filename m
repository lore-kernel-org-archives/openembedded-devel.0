Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.121461.1597962055418677432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 15:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uXW1hiwy;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id c10so56349pjn.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X6VNYlq+RRlCrQWg7Lp6F0XRiNWx44j9uarFL1gELQE=;
        b=uXW1hiwyQTy5s3kgwWvHDkZEf4eeSwtxYkVg18zr879PFhzU6ieT45ubMYfsavdA9q
         U3UXZC0uTq7K3nKbqFP1HHHCEzKpvPniq2R+DfpHlagLTsdIT3vKNZ1+ZtxH/dN9qLMP
         yvnSvqm1619NclBxkBLFVnvUcPwbb1FB5+3ZFDKz/ayFKjnO8WUKS9zqrrjNeow1JSdw
         bsLVvUkD+kMNcfPltwQewaovPDI94oO3BgaFtnCOqaRsnv6w81ICForgn803XQgXnwTN
         vTcEoG3M8T7Z9LrgdFfHJuYJ4GIiiMiDmldJxfRSFRVaWbaUlN/wEo+mLkK4X6jEirxQ
         ZwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X6VNYlq+RRlCrQWg7Lp6F0XRiNWx44j9uarFL1gELQE=;
        b=n8Amjfg9GdYIgVZCI4XxtlZyJ/qM7Dc99WoNWuvmV8g58FanT/aeV8Bu3QE+5Md0Vv
         zbzoCnOiV3VmMoebSZGEIlX1NA7soAx7WJbni/PkdBt2c7ua3JdTx+unQGosjeCIz+hO
         g4xONRwaMlqkfYQXFm7JVRt4U/52leT4njKtf87EL4py/KvM+tgmMjA0r1B210IoIFA9
         Ji9/LgUjJSRr5iXJgq/JCYIdR1ltzBn4EERCSyT5tm1A13wnd3Q/JqSXb71PmOjzoYl4
         wuHd1CeypuZ9paXdHZ0mUI6pUeeeRiRbgf9k1B7BHX2Pn9rm7EqMQnKXHaNKUwQt2y+M
         MOpQ==
X-Gm-Message-State: AOAM532tk2ljXcTwFzdnIVBbxyGpCyIVdAXegMK7hKUuW3gY+VHF9gmK
	+8vSkq2sTSeR8Be5sXkeJN19bEFhZVJd+Q==
X-Google-Smtp-Source: ABdhPJytoWiOfHjunyTDnHrW8AR+ahVKAsP2CirR/UUOQB8+nNFHWvemDGaXiVXD/N97Er1fWUjNpw==
X-Received: by 2002:a17:902:e78d:: with SMTP id cp13mr408737plb.105.1597962054599;
        Thu, 20 Aug 2020 15:20:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id q66sm61849pjq.17.2020.08.20.15.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 15:20:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] kernel-selftest: Tests in 5.8 depend on libhugetlbfs.h
Date: Thu, 20 Aug 2020 15:20:50 -0700
Message-Id: <20200820222050.1300359-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820222050.1300359-1-raj.khem@gmail.com>
References: <20200820222050.1300359-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
| hmm-tests.c:24:10: fatal error: hugetlbfs.h: No such file or directory
|    24 | #include <hugetlbfs.h>
|       |          ^~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 3687c267e1..2a41aec23c 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://../COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
-DEPENDS = "rsync-native llvm-native"
+DEPENDS = "rsync-native llvm-native libhugetlbfs"
 
 # for musl libc
 SRC_URI_append_libc-musl = "\
-- 
2.28.0

