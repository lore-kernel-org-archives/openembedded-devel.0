Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.6250.1622029971659442093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GpG4J9EF;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y202so732283pfc.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6YoJU6Rlep5HdDOZsB4wACIQplC3Ip9XsN5ZPP/jA9k=;
        b=GpG4J9EFej6TY2nNEscUVTXbJZtuKf1g6uwaVSuiB60GgoBX5sCm4mJBTBI86Ax54I
         jHf/T4OjCNk0Q3DLMomEnwe9tk7eYq6wN+nbPpApNZoR9+JBY/P4OVw5aD6lrBtxIEQg
         IWWeXXcIeyj8pCwJaO/iMUkJ7CG00BAI2C6brslY3J3b8QP42P3wsWKamkqcNtAG2/YA
         Oq/kJerVLSdLyrqLC4UW5K0MveUJy21k5jUuTxVgLnpH70SyCtETUIRqZx9fMtBboW8U
         uAXkkIlNDdqeRszRNc9X5zWv/eXFOG2NARUYRlBOSFR+9MRY453sS2jMhvQ0z3Colk1O
         tAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6YoJU6Rlep5HdDOZsB4wACIQplC3Ip9XsN5ZPP/jA9k=;
        b=bjyfIXCal3pmJpJ+XqP3nKTYMdHmZyNEkHv8mvpyBe6t/FPcuPWmIeu+AGVDfP6NQ9
         T6FEM25GNTgmRrd0VSdLh7RSJ+vI2CvQhGz2xYusqfFCR4LfJvZYJmElKSRJ1G9cr8sL
         R8wyl1i7iz/sqnV3KTHaaX7IdaxtzX3qlXC6n+YObRxHS8Ao3Bp4mZYPZBHQ3WKBLUEU
         lKAOZ1p6xTpMS/AU3R55fI2E0fZxWFfTr/52CvPeaCo9v/V6IrFjnVFmGl0oIb+9mTos
         lONLW0wh0PTc6GgLMCgeEpSh8ymcxpiGpUXUklBESJXYNqlAYCdO1GX7Wkew5SND8KEE
         iKXw==
X-Gm-Message-State: AOAM532CJyGHt0/qsFXakkPY94ab+if8rQwAaSSlVPtzZMN3ezBtbCLg
	QEytW8zwepEyEFE4sNRKxtUcr3lUcsWTcA==
X-Google-Smtp-Source: ABdhPJzxNBPABvP4JQBWIqotez5nl6WG/zOIrAhXwfFF4guOXd0kQdxn7ZZ0TFHaM0fBF1z0W+h6qg==
X-Received: by 2002:a62:860b:0:b029:28e:d45b:4d2e with SMTP id x11-20020a62860b0000b029028ed45b4d2emr35532300pfd.70.1622029971110;
        Wed, 26 May 2021 04:52:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 01/23] python3-cerberus: Upgrade 1.3.3 -> 1.3.4
Date: Wed, 26 May 2021 04:52:16 -0700
Message-Id: <3863aba2aca6c627bbd0843c3620192f73858b0a.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.3.4:

- Reverts the unsatisfying fix for KeyError during import when
  running with python optimisation level of 2
- instead a RuntimeError is thrown when Python is running with
  optimization level 2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 87e6a453744180a0ddf31f47de96b47d8c47d677)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-cerberus_1.3.3.bb => python3-cerberus_1.3.4.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.3.bb => python3-cerberus_1.3.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-cerberus_1.3.4.bb
index fa0bbb0aad..95934c6e42 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.4.bb
@@ -4,8 +4,10 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
 
+RDEPENDS_${PN} += "python3-setuptools"
+
 # The PyPI package uses a capital letter so we have to specify this explicitly
 PYPI_PACKAGE = "Cerberus"
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "eec10585c33044fb7c69650bc5b68018dac0443753337e2b07684ee0f3c83329"
+SRC_URI[sha256sum] = "d1b21b3954b2498d9a79edf16b3170a3ac1021df88d197dc2ce5928ba519237c"
-- 
2.17.1

