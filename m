Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.789.1612994436093412059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 14:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=fBkPFz1d;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id a17so4962571ljq.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 14:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLcR5ja16Mv75yi+Xbd9OI7JrbuHMsRXFDr8Dr8kpCk=;
        b=fBkPFz1dVCwrErLn9djBkxWkyeB0ZaBFRNh9xoIAJvV/mIWvbVJf1Ltszfvkf1629X
         iyElLh2ZeQYcKfejHZS8Nn36zsSGMb9bHwDKmIUJL9xA1ZMwG9AzZdCJu3oprmWcZ2vH
         T8ljbckr0FO0GCVRZJmv4yvjbRYPvqTY2QXMraKGoXWdCumYHMn9JQ2EncH+gytCNEnA
         4NNmnQ9pRfa5o5bmWvE9cN//nDDUHIeQPce2mkeESNaumIqB9gqqls7sg+kjkCCnHM7a
         P9lEcvrbBbvkCK78Edj0lTWyT6FT+FiKGfmJ63QQhe8j/aNsKrzv/4haWaoTb6v3Fnyz
         rh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLcR5ja16Mv75yi+Xbd9OI7JrbuHMsRXFDr8Dr8kpCk=;
        b=Uh0/G4Cy5GWw5bZ+KFuDG5wR8WsfmP2jiE9aZ67OlydPhx4k2wj9BfFiUV4f2sUaWr
         r9Jz2Xgy9OEYL9rI8K7WTIzabOOkAU9fH+8pP0B/re+AGn5ECMLlotoL0hbpCGrIrh8R
         XSoQSZmMTbm1KoAaft9h+1utvSCH3LFY0lW/6fEU2JKddqbrydZlxY0MrNZz5ZhNGllc
         G1r9w9MfzfL451RIogSApm18+iNu0DGG2loDf8UrFe08h+iA+Jbcf48CBI6bk8yKLxSe
         UqCBIz6S6RrzqVD/xbYTRnri2BhU9xMhuBz33wxeTPTB9YGODywMxxZ3ogadvVMiPEzC
         ENIw==
X-Gm-Message-State: AOAM531PNm+N76upu0vxA3I/d1Zj5dntPWCF/VB9sz08r/gXrs0kYLPL
	P8ObYGfwq22SKHndF5pmJ0WWmmSL9Iu2fm65
X-Google-Smtp-Source: ABdhPJzL1c7y+VYYx2s7aNh+pE+6o4LomGUfqWg72mxo6m0+v+ZNrajsjk0coFprSFkS2zSfmqT/Zw==
X-Received: by 2002:a2e:700f:: with SMTP id l15mr3237983ljc.14.1612994433825;
        Wed, 10 Feb 2021 14:00:33 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id z5sm670655ljn.7.2021.02.10.14.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 14:00:33 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] iqrencode: update to 4.1.1
Date: Wed, 10 Feb 2021 23:00:31 +0100
Message-Id: <20210210220031.1660908-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../qrencode/{qrencode_git.bb => qrencode_4.1.1.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/qrencode/{qrencode_git.bb => qrencode_4.1.1.bb} (83%)

diff --git a/meta-oe/recipes-graphics/qrencode/qrencode_git.bb b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
similarity index 83%
rename from meta-oe/recipes-graphics/qrencode/qrencode_git.bb
rename to meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
index 108c339bf..3eb23dc0f 100644
--- a/meta-oe/recipes-graphics/qrencode/qrencode_git.bb
+++ b/meta-oe/recipes-graphics/qrencode/qrencode_4.1.1.bb
@@ -4,9 +4,8 @@ HOMEPAGE = "http://fukuchi.org/works/qrencode/"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-PV = "4.0.1+git${SRCPV}"
 
-SRCREV = "7c83deb8f562ae6013fea4c3e65278df93f98fb7"
+SRCREV = "715e29fd4cd71b6e452ae0f4e36d917b43122ce8"
 SRC_URI = "git://github.com/fukuchi/libqrencode.git"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

