Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.2321.1600884672743631386
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 11:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mt8MF/T5;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id y2so883135lfy.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2020 11:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SgQr4Ygdo47EKICfy4Bcz2lSepuSVeSvoj1rp/1a2a0=;
        b=mt8MF/T5wf5+KHg65wvCIVS1vGTmxV8W+z6C/oPfPJG70C3Sp1MLS8j3N2ECQX4iPr
         lwzIyxCvXFTo+Th4KE5kgOBaRgjjZibPxG0dtqJv2uYe6v+hEbGwb0XnqpqwcY+CLlK6
         g8WLumr3sYuJ7EJIfIOnwJQF6qVNAOfEZtH4r4qnF0GKdrrnckGLFpj/1FfHmfGlU59N
         tdmZGsMWp3ekJ4re+1KA4+IwnsUnsUe9/Si1o4NmEY+i1Oule9Z3aeNMmbnvr+SsBDqE
         rXpO6F4xo3nWRYbpEAiQyZMsqEvKFdjdVmpnGA3YPtUekAa3vn6LIsaF+j4Q5Mlb2ljM
         ASTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SgQr4Ygdo47EKICfy4Bcz2lSepuSVeSvoj1rp/1a2a0=;
        b=eqE5UpcjtYdF0TXQFGcXCKtBHU8NR8GqZb1q5kwCM8FGCEXzQvBpLRI4fPAmLv/Oed
         bC2W8+x6zGWH42atpAzc3w/PNMx6wpZqOBCsHIcm4YTfi3EvdworJEMnIRbtOdb1Q04z
         k/ZFESwWe/+bLOKaySRTcnBzdowD0BNrCDUt4ugdOQzXcYO2cNAG2e7d9mV03bxvWU3Y
         gVrhpi5SncA9Q4A4rvGZ+Lp882svjpJzW0J6r/Wz9oWHscdV5jZmsYc4IDQZDgFZkVcV
         s6+eAlJNv+JvuZh1plSevrcNh1aLCXYljYBuOJa0RryRz743LuWKK3ohOSKwsR5sKn7Z
         svfw==
X-Gm-Message-State: AOAM530ZO6SnslEt+sIvuCMV6CT8nlMMsK1+wD3+ruPQpmhq9tD/F6b0
	dwXCDos1ADL5aeTl3kA5LYn/FZfgwQ205w==
X-Google-Smtp-Source: ABdhPJwApGUDPsMESHRJQvBz9TACIU7Fr+S5mtzle19Zwm6tzh6WWjSbBEJaT/lNMLslICpMYab/AQ==
X-Received: by 2002:a19:4b84:: with SMTP id y126mr307230lfa.360.1600884670251;
        Wed, 23 Sep 2020 11:11:10 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.lan (c-3ffb72d5.022-417-73746f13.bbcust.telenor.se. [213.114.251.63])
        by smtp.gmail.com with ESMTPSA id q7sm276943lfr.16.2020.09.23.11.11.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2020 11:11:09 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-browser] [PATCH] chromium: change to python3
Date: Wed, 23 Sep 2020 20:11:24 +0200
Message-Id: <20200923181124.1029-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

python support has been dropped from OE since dunfell, let's change to
python3.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 recipes-browser/chromium/chromium.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index b351114..0d1a761 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -18,7 +18,7 @@ TOOLCHAIN = "clang"
 # to build the native recipes (e.g. GN) with clang too.
 TOOLCHAIN_class-native = "clang"
 
-inherit pythonnative setuptools
+inherit python3native setuptools3
 
 # Chromium itself is licensed under the 3-clause BSD license. However, it
 # depends upon several other projects whose copyright files are listed in
-- 
2.28.0

