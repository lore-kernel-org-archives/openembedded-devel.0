Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A82FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18178.1777549642563571445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kbbxg/jr;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35fb0bb27e7so486133a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549642; x=1778154442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/c0aEXx4ITvfCty1Q5yemW22TS7gvadZP39P5o69IH8=;
        b=Kbbxg/jrl9pCeEbiJPnfNCIU+G7kWRVAA2NR6SRzzU6RSRvnyS5z/iHLdUaYLKqBUK
         G4dqWujOkOtrBEnQmNuVeyhVeEi/Kk8I+vlpzypTelIUdtoFizRUAyKRg3bBKjXCk2bN
         DmPOmjkIaiw/a9hQh6jmQK/abY5o9WPcs26zY9oaJfSia+5lz5ScMMhAfCwrf1KZz+GK
         ATpxraB16iYtSNN/FwdgbArHLrcNLM/z4BoJ4hRTpO4b07ssm8nyzu9GnvLCvpgKkwvu
         yXWsONQvos4xsZWmnJBXyiyohNP8nMQ558+R8PGqcCKiAsIgfZ3ry62LU39S55zbRew9
         /9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549642; x=1778154442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/c0aEXx4ITvfCty1Q5yemW22TS7gvadZP39P5o69IH8=;
        b=gDXG5LNCEn/K6c/9Rj4SAWXC/LJXX/YUMIO8fZBtt+4JEVfGBo5/m1HWAT7kRPDLEz
         Aw0sd0qmHbyDdblFoR0ZQaNmcJMCHSgjOcpUPFMwCRURNfO4YdI5NpDE4X8nOfPXNj2C
         srnaODkStfBZ2Wg1hmANOCkCcgg7fHTf7eH1Laug2bG0hxuXPzVyEY6kIVMbdINOLwMj
         9krwoR5El5C3jjeUAKIUXXctYU2CSQCYeANHonQ1inHeKWt+6mhRA0njDlr7KoiNlhQH
         Jv+lrAkc1o3paa0f+7piahEuQlJpYW/JJq5NAaWj2aI3iXb9IzhqHe2JGJkbj2u3m/C3
         Q+qg==
X-Gm-Message-State: AOJu0Yy1uWj/FomZ6lV2UA6UDrjN9zKsGxLAY7jheicCaJf6nKzICgxd
	iHP/nUUkjMLtDSHkz1U3EujkecdHzcEXSKZarRJzDHzESNsVES6hP4qSSvvH2ZLN
X-Gm-Gg: AeBDievn3Nx7KX/2iJkgbnfVkllY7xjO7TkaiLZOTVXaaiDwfX9X8kxc/9xDpBsBb1E
	xQUve/MukUGJ7Dmg8A9A4oZkzkOSdIqf4XVRo12p1QeEF4u0YiqSC0YWgZ5E0hS2mFpjgiXOCtV
	Y+s1v4VvGyDwmpGSfP/X+Gs5CAEEo1ajoaC+xLEa7OVsdq4NKHV/vgt0n5ZlC2opL2aAelRfzTJ
	tO+FEoDJ7v+HOiPCbkJ7l2Vr9RjGBjNaMWYeLR96oUfl1nxILDFtNQzmrGdL8qSa5ASslPiKJ3e
	z1GesUrny1s9jFQCyAuug48qD61gKea/HOjJMeJRmxsAw+KFlPk7bpWEMR0pEgfwkAmsIFs0n5j
	mzhOafrT5zmCI0GR4n0j3K8fxPKegO1aeoIfrYzPQkV3pb21m5z3tuV+azygxPgL4xJklP63LiM
	jhuPjYGJ4LW2m7CBt73JTTJNp69ZglbXjdDep8vLWxbTsJT2U=
X-Received: by 2002:a17:90b:4b0b:b0:362:f860:f9ba with SMTP id 98e67ed59e1d1-364c2f2300fmr2405440a91.1.1777549641700;
        Thu, 30 Apr 2026 04:47:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 8/24] python3-ecdsa: Upgrade 0.19.1 -> 0.19.2
Date: Thu, 30 Apr 2026 23:46:31 +1200
Message-ID: <20260430114649.4184890-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126742

From: Mingli Yu <mingli.yu@windriver.com>

Changlog:
  https://github.com/tlsfuzzer/python-ecdsa/releases/tag/python-ecdsa-0.19.2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 27d096d984b1a5b567ba1b217c3fee8581284575)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-ecdsa_0.19.1.bb => python3-ecdsa_0.19.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.19.1.bb => python3-ecdsa_0.19.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
index 4e884b2d74..93673fb51d 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.19.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 
 PYPI_PACKAGE = "ecdsa"
-SRC_URI[sha256sum] = "478cba7b62555866fcb3bb3fe985e06decbdb68ef55713c4e5ab98c57d508e61"
+SRC_URI[sha256sum] = "62635b0ac1ca2e027f82122b5b81cb706edc38cd91c63dda28e4f3455a2bf930"
 
 inherit pypi setuptools3 python3native ptest-python-pytest
 

