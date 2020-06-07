Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.1294.1591500292439134634
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oh2A/1a+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id m2so4522417pjv.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eN2I6gxSFs8kMmfPT3iOuyfwrvaiZ5BDB4BVn8tDdzI=;
        b=oh2A/1a+Ca6XcLIwR0FEsO3MNY9JX30YLi9jhOXj9LIe8BL8S8M2pApmtn0UiWhZ/n
         mddY80o9Xwi9s3bb0UHpYdBNoNZBHw+PjkYPxKU3zQhqc22UoO6+p5yIcK0NUPuCY7y4
         NX/BsW3dMSGQG+pcAKMPFzqxpcXQB38JU2b+SnEncZObYG6nVBGp+VNjVEuzN0nrsaml
         dmU3A/pBkECMmlVO0EaL0LtgrP24XmfOlrONpF6LvkrNm/0TmbXDqkc7BtS3YXwnkx7g
         SaRJagbTH5iY1PnTtAPKyVXn3gW/dcS3mKZufy07huI0NFr6O2y9A2BPXSphWbnKT+8+
         J0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eN2I6gxSFs8kMmfPT3iOuyfwrvaiZ5BDB4BVn8tDdzI=;
        b=ucGMyMEeIWv8PPXaFK0j8qcBIJxp3Zk3R56LNZ3hL4pu70sfbvbtIiMP5cTEF24yFo
         7eVmDGkH7Z0QOXPuc5HVqKm29MEU5EUlonwIwr7Vs8TDSOSZhN3ACoE0TlWe/grUr/Qz
         BpeVSPTTM/LijUAyw9EPEVhircdZk95eKYgaD12tCeudiHwvEPcuvU4/5KQZuTZ5Oqt3
         Ve9M9p1Zi2gnmf8L0mrNhNyMNnSYNdKZUeI3pflYkHetoAxX8nlgAcJKhI/ac8m9Gpe0
         NM5GcZTSYoWUzevIPvhe1z9wRA1Ye07T55o/EgUvVkesFlwjBYcBMXH/5mh+Q+hobZ1W
         Tm9Q==
X-Gm-Message-State: AOAM532YvSPuSqJMhMP4nOtYUN5OXd4/AIQ/EZ0qTCNO8zPNmPyMEKnT
	R+8DVEbJ/dNTugWINpoGP4GaK1eI
X-Google-Smtp-Source: ABdhPJzdcH5D0KwYGpir0uuPAGunXgtIxMm0DRkDkfVJ6zav2sHL1ex1f+58bweCbMbAowPhQYUkSQ==
X-Received: by 2002:a17:90a:6886:: with SMTP id a6mr11474285pjd.170.1591500291698;
        Sat, 06 Jun 2020 20:24:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:50 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/26] dfu-util-native: Remove DEPLOY_DIR_TOOLS from sstate-outputdirs
Date: Sat,  6 Jun 2020 20:24:20 -0700
Message-Id: <a775351ec82df1437be5968ad3e0674383767a90.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

In commit 1ef92d2423d6d6546e4f0585478540212b26f3a0 deploying the native
tool was changed to use DEPLOYDIR, so setting DEPLOY_DIR_TOOLS for sstate-outputdir
dependency should have been changed as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Robert P. J. Day <rpjday@crashcourse.ca>
Cc: Jacob Kroon <jacob.kroon@gmail.com>
(cherry picked from commit af3fc04cfb64d9f229be26f47b4dec892ff919dc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
index feb16fa730..4305e3b408 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.9.bb
@@ -16,7 +16,6 @@ do_deploy() {
 
 addtask deploy before do_package after do_install
 
-do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
 # cleandirs should possibly be in deploy.bbclass but we need it
 do_deploy[cleandirs] = "${DEPLOYDIR}"
 # clear stamp-extra-info since MACHINE_ARCH is normally put there by
-- 
2.17.1

