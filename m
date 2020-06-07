Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.1350.1591500305984126866
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DabigqmY;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id x22so6921406pfn.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eqQdRuEmjxvCBvqA4czJJWbFLtaN79EZHzm/GyOewYI=;
        b=DabigqmYWnv3lAoLjpQn/awlxai+MMXXrHTzhYU089FgRucs2zz81fxEbZnPNX7W6M
         MguFFoSVELNy1ToW4Mt1mwIP6d1dphW6XSaD5BVaLFKN118/LrQ1P4E27Do+TxR7Ww9H
         T3MRjb8ta6EM8k8ZwXV+1vhZDPkgzgromzwElQyioM2/L3i9SP3k1F8sJ6KrVbpREIqc
         llnUgPOpmU+zR6U1iQc4qNuwlK33z1GrtL+kiPA5yhXi2mIjt6TeCRpIPTt9UTch8Zjl
         vUyP3IgB+zbEPFXYBhevclNOocSmq1+EtEbQZGakWZ0c2TGu4jDfpayPV+RjLCd7/8RH
         cq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eqQdRuEmjxvCBvqA4czJJWbFLtaN79EZHzm/GyOewYI=;
        b=sae+eQ//N0Ah4RsDSAlsMTy8F3DLDO5CkMt99ktP/kuOgB/NK4DFTXV7lKA533OHWK
         g9UrUQ7HFy90/s1H+n9y8iVelXCgk1TPD5PAT6yxWWCVTWvtDRC0QNcUY+sSFYS0w5vp
         kGFnBnLjyouNkM4iAWlhmGu/MtuQlkiFT4oGlHVPqV4oNz1PiaDpGOfbgco5ehtccsUD
         Sbil33V8lp75tYXam1faxuj8jZjnFl/cQqDSjMuinSu52/RcqKmjzAXXOuD3H91+og2Z
         g0PbjCCnGda8Qp01ZgcK+O3yoSOkgB5pC3+HXAD8+Zuhdfws/fwuDi5GCPbLrPor0ROc
         8PDw==
X-Gm-Message-State: AOAM530v2PhC86wwEch56v6AccbGhKeQq/7Duz433x1TbxjWQ0mE0pHd
	t1WrAGTt4Q29PZ6ohQgGqcVJPuRq
X-Google-Smtp-Source: ABdhPJwDbAPW1Du4zTLaNsaKJKievH7xQLx6J2InkO9fEJbXxbGJb2KQGBPxv60UgmglkboLG9gxCg==
X-Received: by 2002:a05:6a00:1494:: with SMTP id v20mr16209471pfu.150.1591500305294;
        Sat, 06 Jun 2020 20:25:05 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.25.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:25:04 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 22/26] python3-twisted: remove double var modification
Date: Sat,  6 Jun 2020 20:24:32 -0700
Message-Id: <c7430c99daae9d6212f5ea4d90d7193063e8f72e.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

It is either append or +=, but not both.
Pick append to be the correct one

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 19867269bacd2676369b1f92c9103c8eb0b882db)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-twisted_19.10.0.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb b/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
index dfb9d4a4cc..c12d1cc04e 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_19.10.0.bb
@@ -1,7 +1,7 @@
 inherit pypi setuptools3
 require python-twisted.inc
 
-FILES_${PN}-core_append += " \
+FILES_${PN}-core_append = " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/__init__*.pyc \
@@ -29,7 +29,7 @@ FILES_${PN}-news_append = " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_news*.pyc \
 "
 
-FILES_${PN}-protocols_append += " \
+FILES_${PN}-protocols_append = " \
   ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/__pycache__/*pyc \
 "
 
-- 
2.17.1

