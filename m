Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.405.1615917804822002349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 11:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XQf0hDc7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id a8so10814593plp.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Mar 2021 11:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9CgzLYiAuj3qkgT9e7ByuW6tbVpJ/+SkuS596ykGFc=;
        b=XQf0hDc7LNx8mLAqfTDNfW1uMcJes9KAIY9kd6g+Kp86V99lf6q+8TpDbdyagJwUfZ
         CmIMkpjpPTlybhU6ZUz57nkYIWLHqjPP5vikGHWndGR1pvxMK4GSwn9LVysmc9jqRpuZ
         UqXFh59KfQDKZXZ7QLFLDk0PYxRG6FT7XcRor0BgtxVC5E5oHF9UbEftsKA82IoibDrs
         VqsiQjK9Qj3KNXiqvON/Ghfg4EfBnypzV5Qcq7O3ufDsucJPJLoWuk/Y3pYJhtfpj0NU
         o9xuBlsXksD/SzL7bUSert/yEzH2psEhkzQTv7wsUbT8vw7NaBNX3pW/q+34U4DrCAMx
         lniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9CgzLYiAuj3qkgT9e7ByuW6tbVpJ/+SkuS596ykGFc=;
        b=r9/opD3Zg1e8qH86nCqIfN2PYB9Vmfcahik/UnomMsH55tpg64WUrQ2Nows1xrOFZc
         TeBKkkdzfZe+Eh05iCTs/JAtzAHhCznMABX3uLpQHCgg2CPPom1J5rdfIY+yn8JFI8V7
         WBGoHWJa/TbEcJp5FfH8LPZdnOrlj7HDVMu1AwWzsnm53Yis+YQpdzDtQ46KMQI4+Qci
         0Gelwf36EpLoEShBWS/0H+509pt+ymmjS/ehEC2iMSRMHU8ZJef1geryD/wC7HgGpTfH
         hiX8SjtvwdekkTknad3Z1vyvStFHJs6xFUOZnBrxQw2hZ7ur1kyWSjs9rIU4eFXEsiXR
         MX3g==
X-Gm-Message-State: AOAM530oodhv8wTh4JJ0HMMpGrpttxNPkpWfVuFMokmraMIYYVvGiRk0
	r8eQXufZKNfwuGGesTqn7HaZ7OdR9WFnhQ==
X-Google-Smtp-Source: ABdhPJytLZLr5vuxiJm96DYnYeF9wmJIg/1jXc97x4ozLXTpAkuacMpRr9BqMmqsi3+0f2xf/au5GA==
X-Received: by 2002:a17:902:aa0a:b029:e4:c090:ad76 with SMTP id be10-20020a170902aa0ab02900e4c090ad76mr633681plb.2.1615917803852;
        Tue, 16 Mar 2021 11:03:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id o11sm89620pjg.41.2021.03.16.11.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 11:03:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] packagegroup-meta-python: Add new package python3-pythonping
Date: Tue, 16 Mar 2021 11:03:19 -0700
Message-Id: <20210316180319.3010150-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2748c50591..53270a2633 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -334,6 +334,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pytest-runner \
     python3-pytest-tempdir \
     python3-pytest-timeout \
+    python3-pythonping \
     python3-python-vlc \
     python3-pytoml \
     python3-pytun \
-- 
2.31.0

