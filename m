Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34BECCD190
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 06:35:50 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.9544.1760510143491040002
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 23:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9o3VOSs;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b58445361e8so539906a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760510143; x=1761114943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLrcoQL7HAz19QYMCjJQMugDAec9KnB7uwYxeDsSwXU=;
        b=L9o3VOSs0nnP7htkeY4V4xS64EBskF+8AI+0JSSaxuMuXTuJO2tc1K9GAPZOCXO6LU
         BgVZym38T6apzkaffN3SMLhxZv4aOSkJJWavt37FreoWEELPgN3af0Xm2C73se8YwEtS
         RRc38ij9OPfHSz5lDrpQH2A7l1F9dxuVwsBi3vAZYoJV3/eRDmsFWA3o6gRJsveEl2Ht
         dxMKn497iFkra2BqEQgs+5I8XyNDiGh6TYruRdtrudoXGh5sTFHvrTL6Lx7RaUTi6afl
         C+dYa1WZ27g9hNmq10SOqJlV14sTVRs9wHAqV6f5XUB3CzxkyDa19HNhAN9ZM/rSa6mK
         DJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760510143; x=1761114943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLrcoQL7HAz19QYMCjJQMugDAec9KnB7uwYxeDsSwXU=;
        b=TAR+BGfUWA897qCzFkqoqvq0Gw9+rD2qs+q/4Ie5pUOj0HjPwTWQv4cAt+IcjFjoYD
         nNAIobtubuDnyaNLcmELKL2YXzVe4LcMgTgUuG1+LAXtrkgeWLay8M+C7vIv80cNUzS3
         6iZzsVbnj79QvlY6wHTOLOQfxQw8NdoQfpxsvzySWvBeGviFvD6f8rPYkGe30dCGz6Oq
         4KbPN8qjK3r31VEo6NhthexP84cb2NVdGer+OYP+UYsg5Mm37JMxkm+sYYJfXS68dXd9
         hckT41s1t12AV4T61Lug6aRdUcGHtZdtGXjnDodh+BmbfauwtBGIAJoCMdRC/OdyxWbh
         yqwA==
X-Gm-Message-State: AOJu0Yxb5oCiU9++V5z8eTIw/JOO+95yqndIN0Iu/vTzQPkReiQqI8dn
	gNzPbpv7Cjf5mu/C0dvs1xvvju8xBzvh0nJf6PRtAHaZxBI8RTtatXC1PUMMmg==
X-Gm-Gg: ASbGncvG2KBFoKK0/WW7lv/HbLUs4ESrCLnT8gMjDzkyFvZTbXAhB7p3X+8mP1TL5YZ
	upDC4BtRbKwedtJpew2hvLGivO6TI5xJ3RR4vnys7tXMyt7GggvkmP9YyjP24OR0iKi9qjwsX6G
	kBnHDlIm+V8YwTG6QcO8Zq77/VeQBXyUM19Eg3J0A7aPqCh4CHI4e9N4E8D8HX4HpO/aE/PJe3L
	STKb5tKmsP5yNHCe+50cQU0UJlt09tNUIEFjqE+VuHhkNWcUVLv8rab4OgECF6s4DzhkuY7Lkc+
	SgEZTVAWFsXecaluZxcL5qvudmlhAk630haI2X3YlXA8+Yzw5FzJV88xhzLWSaIiyiP5VjJsjSE
	Np8S5+b/M/2epxaELvyHdoPb9yTIPUXDRK+R2KSokcy7kr5lvhTV9ys+DLxlNcq6aWw==
X-Google-Smtp-Source: AGHT+IEBormnDgkpsIpP1JaxUUEedbaWWjYI2uoczc/kpmW/5gLpoc8u/Zf4NhHyZeJuC0J4JqHlog==
X-Received: by 2002:a17:902:ebc4:b0:27e:d66e:8729 with SMTP id d9443c01a7336-29027d7d0edmr321900045ad.0.1760510142609;
        Tue, 14 Oct 2025 23:35:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6fd3sm186191205ad.25.2025.10.14.23.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 23:35:42 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/4] mercurial: Update CVE status for CVE-2022-43410
Date: Wed, 15 Oct 2025 19:35:28 +1300
Message-ID: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120690

From: Ninette Adhikari <ninette@thehoodiefirm.com>

The recipe used in the `meta-openembedded` is a different mercurial package compared to the one which has the CVE issue.
Package used in `meta-embedded`: https://www.mercurial-scm.org/
Package with CVE issue is a Jenkins plugin: https://plugins.jenkins.io/mercurial/
(This is reflected in the CPE)

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bf84ac1c4c1a00c2aa92a09fbdfae128d055fe05)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
index 2451a36be2..53fe0a28ae 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.5.bb
@@ -34,3 +34,4 @@ PACKAGES =+ "${PN}-python"
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR} ${datadir}"
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 
+CVE_STATUS[CVE-2022-43410] = "cpe-incorrect: The recipe used in the `meta-openembedded` is a different mercurial package compared to the one which has the CVE issue."

