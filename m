Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.4355.1626533000836359773
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jul 2021 07:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KvJV3a7R;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id w15so13143981pgk.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jul 2021 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WnSIBL6QlRmF2eh0UiaaeD94guTYcR+aeeqLhZTpwcA=;
        b=KvJV3a7RuPtYn6PEZt2eNqSQYfmQZpn1Jo8/2Kwq188TH33aFSdiHOVHF6tldsajqZ
         TJ8SQfsWU+1dG6QK1eDFQpsysC1SV3ngXIgS4cCU8doONqSEGaJ5MamLIAFz251fyhql
         tHRYovp0QtWEbe10qDSPd3lv7H2dP1SsHRWjoi4EccF1mEvk5mzgRC/K71qXrefXmjJ9
         niOT8qixsz2pWF/fWuc44pnm0vBgcdtwpiI72b5V279nlGE8D8hJLj6QHIQOzZZS7Ofd
         Pzu6UNsF55aPrmWLyCP/tEugM2qmgJDFcuY9G1+GEVU3ZJ//ynitIP3NkiHGCKAKKIPT
         3TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WnSIBL6QlRmF2eh0UiaaeD94guTYcR+aeeqLhZTpwcA=;
        b=G1RvqTeuhvSPWffiBU2ADqO1scDRba+hyOOer/zuk+hm2WyOrhB3gDg5mTb+FnGHQK
         erpbQ6vZVE187g2TBtMjoDh0I42dd3MOJaNbFPEdxwBWhbVZmSGXfZHR9nxIlHqypIFM
         DMzG84Z+oDqdQEwtXJLBXHe14cMlKCA7HSqkEOrDnk1WgZuwlpsPAJIuvj1sGXIjkLsE
         Zg41zGrVozJze9lqdZ1cNFcDwUC6/I01kCsSVvornnz7Yu/pBz+eQT1ZjZ1fDSzTa1MR
         0GX/jXZDseMEHBlggQBxqJYkysf0wen5EKTeX3E1dYEfxBvNw+gG3yhRdMcdrt9lQM7O
         J5Ow==
X-Gm-Message-State: AOAM532HQ5oMwA+2+omnGzMMXece/nEVk3bW9qHvgvEVuF7NBQHMKl4F
	CR4EikN4bFOflvLVZwyyGGj9vgLMj0w=
X-Google-Smtp-Source: ABdhPJwMATQp2NPcg5bVafuZ/S22WmflliFEDwSZRTD58didmPe2DKko9ReLKva/z4m0NOZAx/nPdQ==
X-Received: by 2002:a63:1a12:: with SMTP id a18mr15298059pga.269.1626533000212;
        Sat, 17 Jul 2021 07:43:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:e013:b135:6d1b:134])
        by smtp.gmail.com with ESMTPSA id a35sm363687pgm.66.2021.07.17.07.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:43:19 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH] postgresql: update to 12.7
Date: Sat, 17 Jul 2021 07:43:18 -0700
Message-Id: <20210717144318.76575-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin kuster <akuster@mvista.com>

Source: MontaVista Software, LLC
MR: 111582, 111965, 111974, 110084
Type: Security Fix
Disposition: Backport from postgres.org
ChangeID: f1e8c58bedd5dd60404e3a0eb120888ad83fdc42
Description:

Bug fix only update.
https://www.postgresql.org/docs/12/release-12-7.html

LIC_FILES_CHKSUM changed do to yr update

Includes these CVEs:
CVE-2021-32027
CVE-2021-32028
CVE-2021-32029

12.6:
CVE-2021-3393

Signed-off-by: Armin kuster <akuster@mvista.com>
---
 .../postgresql/{postgresql_12.5.bb => postgresql_12.7.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.5.bb => postgresql_12.7.bb} (51%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.7.bb
similarity index 51%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.5.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.7.bb
index 047509510f..18ba2178f4 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.7.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fc4ce21960f0c561460d750bc270d11f"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=255f15687738db8068fbe9b938c90217"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -8,4 +8,4 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[sha256sum] = "bd0d25341d9578b5473c9506300022de26370879581f5fddd243a886ce79ff95"
+SRC_URI[sha256sum] = "8490741f47c88edc8b6624af009ce19fda4dc9b31c4469ce2551d84075d5d995"
-- 
2.25.1

