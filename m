Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.526.1620330606818694289
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 May 2021 12:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AhPlpAMo;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id p17so3913894pjz.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 May 2021 12:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2OTpbGqKq2S+QcqM2wy+jYP35VCYFMk7xlsz+sxMdqY=;
        b=AhPlpAMo6l3ePGe23KEPkL5QV+s0HtFLRt7g0TSlRE2f0+7EXLsJGMoOWDH8AmxoVm
         XsfPh3EitWY1ei2HOcViRo6IABmA78q/WfqEq68F3BahZUv72fpI+N11OBNfHj8fdl3z
         Fr/qOw/FULDgj44IgvL+AmuC++Z4MQsq5iBGgePalh62rOylZPK9tWtBbQrM1adYzaTN
         2Vm9KnvK0q1KRsO6odzoPsAZiT5kIxnV4nV4AXVgPsF6M9J3LPa8FYHCIeLPHqxww7m7
         rVqmNarjc92u0SMdULbQMlj+lGlp0Rsrwc6S5kSt73sfL3JUDEzhCjfkLC2YWgA0mhtK
         enyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2OTpbGqKq2S+QcqM2wy+jYP35VCYFMk7xlsz+sxMdqY=;
        b=g7llV7FGAZS64SMp+MIymnhYfmQNX2jLeFy9U2HLxeW3inAjZ9kP63mFCNQ3n+Wey0
         b17Y8pfglsM11Ym/SYnJdc3xOdFa9RmIQhgKjCXxKa0/uGQUjoB4dxTj2Gg1jrkO9Qkq
         dTP8q/GEltJ8kIYm8SCWTTPiPNhH747Dup33fV9hrzYLVkQKpmaaHOz9SStz1h3VX68L
         6pZqxDSoT/dmDs0yvJXtuFuzRZ23XRTXD84uRrxWLD0q7Kf5c80MNZa5/UPTVt96a8CK
         EgkGGzEcinGW9UoDJcPBY4pLX3yo3LRlTa7d+WO9MoZuSntbdn4N1Q2TZdA0y2gPXd1h
         C6TQ==
X-Gm-Message-State: AOAM533PhNOuh+f6ALu9O1wmuknaOPDVhib2o7bLHhjjD6zUQqC8FR5/
	u2kVhfxXfhiLByw9rP7WssO1b4Qyz3QyRA==
X-Google-Smtp-Source: ABdhPJwzHSv2Cg41g+8dhgbkG33BHvR3qB08ruxdFJrH3HnSuoUhOT2BMWC47FoNoha6P+rFOM2+aQ==
X-Received: by 2002:a17:90b:4c4f:: with SMTP id np15mr6262415pjb.191.1620330606179;
        Thu, 06 May 2021 12:50:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id m19sm2703072pjq.41.2021.05.06.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 12:50:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] makedumpfile support for kernel 5.10, prior to 1.6.9 release
Date: Thu,  6 May 2021 12:50:04 -0700
Message-Id: <20210506195004.2560934-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
index 4754651247..50227ea0f2 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPLv2.0"
 
 SRCBRANCH ?= "master"
-SRCREV = "18e0cdba48feeccea2429b3b0b2691f4314d1062"
+SRCREV = "a8250642a4ff50a2559446f4e915a1f59ac7adf7"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS_${PN}-tools = "perl ${PN}"
-- 
2.31.1

