Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.27911.1605485327146638416
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 16:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SuKq2IOv;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id g7so11922255pfc.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 16:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvYCdmhN7lhc+IU3PGvkVS2H6cmsMndXxet3WjxpkAg=;
        b=SuKq2IOv31bt3fYmzz0bhl+LJNAyhXX8nD0TY0OwHDWtAp3C0lpSVhQsVcGkxJnbG3
         NDHyUziL26eeddZgK69XhJoeoT6xeCLlaPLCxtftdFSmm0E4zEn8ml5xAWgalb2r1cca
         6M0i4u27ZdwlTJv0l8UaQmWui7ZEAwrI5IvKSBj8DrZ1Roy1Tc1W/rL/xrWqwOGWGrqj
         IPuWfLaorUNl4UxPo3aFmmQK/rFof/PGHiZqWsndF4qiFd4XhV9Qp4G7XNsEDTmlCS49
         tAqFMqVqO95P+K8zTxt6MyB7iMXSh5/IB5zg6d4xmNo8QMdNHKZPb6BzqBmQfrO3lJTc
         2lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NvYCdmhN7lhc+IU3PGvkVS2H6cmsMndXxet3WjxpkAg=;
        b=XGpKYXwYTdRoAZnCDM55qXLgTVokMS26jmH+LJCL/C7qK70yfmRrNa3j8BQ4NvDrKC
         tN8dctJWvbRXZFAqnU8o+5apDaMklTKKUYwB1VLbS2sm4t+SRCWvsZ3s/OJqrNKbuTRl
         Ui+5K/ZeQ6gufWybkN2TbYh8IQNqS+tXc3DlyXteEjTEdwbsiJOcoBzEq8q2jXHrq5NQ
         0mW4sBPOO0cb4BiLY4FvySmI/BVn8MwIMVJzzmy6hmx6PQPLc0InGRIc0lSUQ0TQ2GKr
         YdILi+nY6Y4di3mi/El6ScWcnHTUwWXGBPfXYU5omZsRJSw2KpnQ6f1HrTDHMtr4JZdd
         KsSg==
X-Gm-Message-State: AOAM53392wHiPfpHard9Y+e2m43BOTzBH7s5cwcqTWIn+I9k77tAi1I7
	9W4vDNzyMu7B9+iQiCm/oahV3mA9u4XgEg==
X-Google-Smtp-Source: ABdhPJxJzgdlULiAn4nccBCB5y+XXcv9AmUPe5UCiHm1vVJUWvDBOst9Tsfi7gaSKD5ciUKI94JO5Q==
X-Received: by 2002:a17:90a:4a0f:: with SMTP id e15mr12680898pjh.151.1605485326230;
        Sun, 15 Nov 2020 16:08:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id t9sm16325307pjo.4.2020.11.15.16.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 16:08:44 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] qpdf: Link with libatomic on rv32
Date: Sun, 15 Nov 2020 16:08:42 -0800
Message-Id: <20201116000842.3020184-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
libqpdf/build/.libs/libqpdf.so: undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index 600508097b..5965b8d09d 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -21,6 +21,7 @@ EXTRA_OECONF = "--without-random \
 EXTRA_OEMAKE_class-target = "LIBTOOL=${HOST_SYS}-libtool"
 
 LDFLAGS_append_mipsarch = " -latomic"
+LDFLAGS_append_riscv32 = " -latomic"
 
 S="${WORKDIR}/${BPN}-${PV}"
 
-- 
2.29.2

