Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.10738.1593562060394816331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s7Wd2huD;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id m22so381939pgv.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=E3S5GIGFJw7kxVNgnNjQhsPTFHft5mZCH8Iedf1aD0A=;
        b=s7Wd2huD7EFdp/UK0NRS0uVGbtaZ5qd7aKSj0RWqNmhc929YjjwQOWaU+IcDWBE3wJ
         +b8n4mDUMtQDmkGloUNAiUkTlbpWjq3NNFPd8PTEE+dRf6F5F2oZUGCi4cyEGhTE95i9
         pldq2CwezJz2J6kw4EbaIsftiHZ4NfzmZOghE44xF00urCWSw80O1FqwX43Oi9K1TxSs
         4o+w2TpAHnJSdgPdiwdvWYS3p1h72A0vVtLUTkPiX095ZSnpw5189PANOCRJU4IejLL9
         7sDAFNL25a0l1AL1QkPgzm1fILKuwJ0G84+U0ubfT7Ze5zZDEfLC6duUrdz5lXz4gvGy
         JH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=E3S5GIGFJw7kxVNgnNjQhsPTFHft5mZCH8Iedf1aD0A=;
        b=SKcm/QYGjPlHkPeKi+SjgywDNcmGSsDRbRTUDjgI6BdF4UYuMteIGkLIWvShJ+11Ku
         TG7PBgcz63KZ6CJIonLd4Rh+vdGiTpyU/KWdMIUgOL8h2+UoBzkPfprkRCn1iTKxmNa5
         g4oK3V3y2/+vg2dNqoRaEF5xgn0l/nbV+Nyp6VkJ9xOy4eQ/eSBAfMdeJJAuo2qJ0ymY
         RVtlyp00bDyj0w2dJNEAPEkilvoKyZRpBQLJBmwyCQ1dZtM+Z2z1CEC77W0HUiZO8g9L
         /rs2pRNb86wB7sG8EilHbi3pR9/KGJSYIAjDGxwE4e3EMPA7sKJxRVPJNH+RxltcI9XY
         oQ/g==
X-Gm-Message-State: AOAM533DYb3AHwkDC29N/4a8Wqnaz6SOuLEDQrXk5qKseuPSBf0srSSO
	BrtuPFSox7vlGLJG0s8zTwPtKQpLlq0=
X-Google-Smtp-Source: ABdhPJzqI6gh04CadeeS+x54v+sQC384qqZdr1SeOnSGms18PkDSyxx/jjMNQBpvMI7DjYUocz9grw==
X-Received: by 2002:a63:8c5c:: with SMTP id q28mr17037212pgn.111.1593562059782;
        Tue, 30 Jun 2020 17:07:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 16/32] mm-common: upgrade 1.0..0 -> 1.0.1
Date: Tue, 30 Jun 2020 17:07:01 -0700
Message-Id: <51da6c28118282bc2195d70b82cdf2d64bf5a8ed.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 15e57216d05e31935855b38fb41b5732aee257ef)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mm-common/{mm-common_1.0.0.bb => mm-common_1.0.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.0.bb => mm-common_1.0.1.bb} (66%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.1.bb
similarity index 66%
rename from meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.1.bb
index c7d1f2b73c..64b58db548 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.1.bb
@@ -6,8 +6,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase
 
-SRC_URI[archive.md5sum] = "9087b8612d75cbc1fad0c99e15c2a718"
-SRC_URI[archive.sha256sum] = "b97d9b041e5952486cab620b44ab09f6013a478f43b6699ae899b8a4da189cd4"
+SRC_URI[archive.md5sum] = "5b5a589f648bd83bfa6291081ebf5864"
+SRC_URI[archive.sha256sum] = "28a2d775afbf05c5c957b24b220ed6e9b2023179b98ecde471d89e9754ea5ac9"
 SRC_URI += "file://0001-meson.build-do-not-ask-for-python-installation-versi.patch"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

