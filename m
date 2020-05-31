Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.18206.1590941816485005560
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=msaiuxOU;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id d10so2371068pgn.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jN257dZJpvNpU9yeLw326KyausX2QHzzFQ/OA0xfRi4=;
        b=msaiuxOU5K9JWXutIgsr+B/rt1o4UnGN/K1qzI+nCMHsvCNDqfpienS7XH6hs+Orw7
         MybyjyuWqHjv3q+WwCQKINfiREOLcPwOKc2PJKXvPPjcsG0HPpdXXPK25a3jkXUqd+OM
         NmwvD5hzLi9awduAo/h3u0jjg1JAG+p/0Kz1a0m0vWoCX+QQg2lMCuSML7JawITrGN3k
         Nm3CbAd39QveB0qpV4sAOVsfuOtashzXQK3PfL48TX/6ni8CAlzFHahWeGhyB2fwtT3p
         lJhSzmJPGxAbqIue1cBaHET0meIdR4crfmJyvoH56d8Ht2tSqrL6pZ0MxOccV7bTOdBX
         DaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jN257dZJpvNpU9yeLw326KyausX2QHzzFQ/OA0xfRi4=;
        b=lqpWMZ+gAAnA0/wR0dvonElgpN195G5r7Az7eXN5Qrob3I9Nb4XAi7w6g/Tbw0h1PV
         bURjamq54vId4gO8JLdw4NixuYjAg/55ykhly9wjy5ZcPfcCaRlY8SnbApYNmdbyboCC
         +vi9sbcZzkTv/g/IPIW7hW3fYvh2ls8NnRVnc6rbZFOJgnbr1iNWh+cDlUpaxFFuTIlq
         NGgPVaB8srfPNLAM2r7mOfQFpgXO9vZf8jsizXySBMimxJjrMAd7Yuh/MHHSs3AEvVyn
         I3v/iuGBUDtZ3QEaaSgkhBbZ0tQP/VxNjOW5W/tcRtm0IE+FeRHUFB4WWcEculcmPqgn
         sWRA==
X-Gm-Message-State: AOAM532m4pmEzcZfjhvl5NYUuqFrPfuyxHO8vq0nvxXAK26wu2Qw7/8P
	ycWgZJOu9YX35wPFDfXL0groNLZd
X-Google-Smtp-Source: ABdhPJxliRGxQf1zwk/NcD9+pYS7B1Hu3+qXpvytT212hhmdVOD6WS0aLtuZOl3qF74t+CSTMrmlxw==
X-Received: by 2002:a63:b606:: with SMTP id j6mr16321899pgf.334.1590941815719;
        Sun, 31 May 2020 09:16:55 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:55 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 26/35] python3-parallax: Upgrade 1.0.5 -> 1.0.6
Date: Sun, 31 May 2020 09:16:13 -0700
Message-Id: <68fb0d7e0b8f58be134ebfb1694d5d252464a9f3.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.0.5.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fafb72fb04f6a9cc9fba4b6c6a5fa55c81de3922)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-parallax_1.0.5.bb => python3-parallax_1.0.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parallax_1.0.5.bb => python3-parallax_1.0.6.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
index 60631d43a0..40876d352e 100644
--- a/meta-python/recipes-devtools/python/python3-parallax_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/krig/parallax/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=52c67ffa6102f288a0347f8c5802fd18"
 
-SRC_URI[md5sum] = "f8d04e9e246291536b705df7f60a55c9"
-SRC_URI[sha256sum] = "e9e4dc500f1306a638df0f19d4ef976a623b260fc614c55cb1fd0d8410b3c4ba"
+SRC_URI[md5sum] = "e312397b083426af84db7076dc2a28d7"
+SRC_URI[sha256sum] = "c16703202ff67aed4740c0727df304abe9f3e7851e653533b24de21b338d9081"
 
 inherit pypi setuptools3
 
-- 
2.17.1

