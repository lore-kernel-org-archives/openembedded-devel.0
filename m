Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BE5C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:46 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9043.1788343539317068438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HXNF4aW7;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8f265cbe6so7865875ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343539; x=1788948339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IqHz5ECACU28SgbqRpvrTIzHNxy9JVX5gaBURBZZkL8=;
        b=HXNF4aW7tA84iNKSHmat/dBTyUnzEOH4abEwpcgmh8TkQ11JZoMV0gGniLIe69U2hH
         W98YPgMmekqxhOSuQzM6yKBw9tspIMAZTPfiBLDfDr8h6XjqV/FqwMRvxGzEifNLFs4C
         FOOeX9PH2PAtlITLs1BpLnJRG82REBUFgLek07h8TAnxxQTHHlgJbRnLKR4/nC9jSCIv
         F9/dQDUcOmjaKd3GQH+O+Ej3cHmZtu2r6PJOB+k0l27n6RlgeRcVLHcmm3v6F1FPfdML
         GmJ8bkelcaDFspPnLvRl5SJmm6RpZqDo30IaFjjODz79CNadidNQ8GURY6G4u+QX9a+9
         HRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343539; x=1788948339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IqHz5ECACU28SgbqRpvrTIzHNxy9JVX5gaBURBZZkL8=;
        b=GeCwz3y+BBHoqiE1fx/XN6xx2eYwjF/lT9C/dUnuXEH2Kn72jaSc2CCltMaBfGXoMy
         hwttL6WwIwFUGklmLMdee+WExC01EoOm3BttXrXxzSTm6W0J8S6LzhNYCv+X2SHwPzFS
         yiqu6wABTLZlH4OuojMm8Gu9+1q+yMWh0PfGpNZbEb0FAoG0rsxe7vTM+ZLphrsqAHwc
         /+5gFL0JSd3RaB+nYpp04A2fLuiqQb0TdXMAHJA7nvhsL4Y8F2iqldlwtrBgSkdHKXUj
         GpzqC21gX8JER+ULI3P3jfDeRRS9eb9aPKlcsef+nP88LMdv9aych3K0QADG9uBbirjE
         X+qA==
X-Gm-Message-State: AFuF++mhCDWQc89o6DIEMuTOALyqGCXmuM96Xk8XyGbRbzosjvY74H8b
	68/lN/vN3loS/8SY5uixAsPeWvKZcqbm0eSnBgBa4WMwQasuDbPRdCNH6IfiKnr8
X-Gm-Gg: AYBFou0j5f5qEO0fcbdpJ37Tc0sKtXBI/wG6jet9S521J2TDJJk1RYJfp7tPXj7y5pi
	5Mkei1obVutafjYFWbhLtLqkgLin9l/47xx+udcYEP03tSC7wvNAbblUvX3dPdiPkOFnu5KpgsB
	EepQxtq08mYEdsrCoI1S24QephB16rbdPH1suJphuBLPwsbt9vh54PFjUt5umdyd/lvcQXsClPU
	6EwvjwjaXsLGTCIGYZAhUA74m99WHhVt7plS8yy/EQ8bS5wxynkip+A/R9VnIIEjB1StsTH0F49
	aq+yLbb2lKFNf2TigEhmwXY2r8mW3uURXGTv8sPm8rHXoAjOWiFbZuoBzFfltb+rUa7lOJYJgog
	i0UmETeNilYRaWRtMxUvpBVt/MYc8nNSD4f8izj54PeMbtpI0ZTjCPngOP3/z4Bj++TgDNlS5x2
	G1XaBDj/p8U/H7LtMJ9b+iIg8Rm1e1UHJtIhCwgarWyJafgEjZAuNFarcXsJprUNIxmVBLhDlQ
X-Received: by 2002:a17:90a:e7cc:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39aedf1b1ecmr4843149a91.8.1788343538625;
        Wed, 02 Sep 2026 03:05:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 8/28] cockpit: mark CVE-2024-2947 patched
Date: Wed,  2 Sep 2026 22:04:50 +1200
Message-ID: <20260902100511.2105916-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129639

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

commit[1] fixing the CVE is part of the upstream version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-2947

Fixes:
WARNING: cockpit-352-r0 do_sbom_cve_check_recipe: cockpit-352: Found unpatched CVEs: CVE-2024-2947

[1] https://github.com/cockpit-project/cockpit/commit/9c4cc9b6df632082538b53bdc8ee9ec1c5cad4da

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb
index 6b1fdcaeb1..77156c0f85 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_352.bb
@@ -199,3 +199,4 @@ do_install:append() {
 }
 
 CVE_PRODUCT = "cockpit-project:cockpit"
+CVE_STATUS[CVE-2024-2947] = "fixed-version: fixed in 352"

