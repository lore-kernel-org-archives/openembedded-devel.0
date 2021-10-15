Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0085C433FE
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:12 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.4278.1634338628254555633
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=P41J7E+D;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id x192so12710441lff.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WJNbcOmEFvIE++c/XdscaQFuYE3jbPJ10VX/RPTREyY=;
        b=P41J7E+DHMfsTmhsdvycR19MYV4krIc8FajJdSiuLi/VPRFIGnGFcHvaVFuIJ2/bmg
         BawsbUsmjVK93H1aXyZX0/7+1+VuMoTPjSzh8cY0QR3N17Xz3Mm2uXeT0ON7NKmKK/Rx
         adiPQsadvpH6a7ph+ZLlZRmSyQ3Oukg/U6Jk3XVt94iW8qWnSDXFtLISl8Zav25/UGvI
         AHzvlP1iIszU5d85eH3csuwc5Ww/sw6tJaUhIdD+ghDSzUuEZSJRBQnQaVNLhFkBbeX3
         XsvTsP8tr85OPpmnwbvE4FSmFstyvuhhinYFL9UoiRsno6drY2ruYcl3v7LWAmqRstsv
         sPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WJNbcOmEFvIE++c/XdscaQFuYE3jbPJ10VX/RPTREyY=;
        b=US7rgtohxmGuc9NzqlhSNAfo5QegoAtorVyci4VJfUmtfWV6Db2Jo3AsMOeEpGOkgP
         DYHLSsGYv+Hpmdk2Uc9VmBDzV+EvZm531RscmfxhOSRJsBXDHsHD03IO8r6KL8NgeL1e
         ZfXnuTVXpOyrvweFbr8+ixVPoVEOn6Kh1hRBPKDIUboYm7/BhibFBcs3wdTubRuAxJ7E
         IN2rN2KKqAs9mZKX7enm/9AmTw5NsytoVGfrDoYCZ1QgtVqAthlnsNr05XkwqsfBEbMg
         gONP0OybDlWbuTyE9I2K8WFXA0/1mbtC5qyskSTW25PWxmK08iYnUFDoI6es/K9n1aF1
         KhfQ==
X-Gm-Message-State: AOAM533MFGoPbScT/Bq1MJi/Pxc+fXnTmM9hmY7o4Z86Nh7G4quexaaQ
	s2MlGxLRx1tA2dMGYIBJFWdwqAPRURmdkA==
X-Google-Smtp-Source: 
 ABdhPJylHxFTgfWvwGvgAbnbXvsXVeKOAeWyDvFZZ1tK6gCLJFladX52HPqpHDfdu0iH6YDAk/jTFA==
X-Received: by 2002:a05:6512:2143:: with SMTP id
 s3mr13715298lfr.451.1634338626311;
        Fri, 15 Oct 2021 15:57:06 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 d20sm704108ljg.20.2021.10.15.15.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-iso3166: update to 2.0.2
Date: Sat, 16 Oct 2021 00:57:04 +0200
Message-Id: <20211015225704.4163504-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93365

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-iso3166_1.0.1.bb => python3-iso3166_2.0.2.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-iso3166_1.0.1.bb => python3-iso3166_2.0.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
index 8ff305952..bc05f066a 100644
--- a/meta-python/recipes-devtools/python/python3-iso3166_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-iso3166_2.0.2.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://pypi.org/project/iso3166/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5e2f4edc7e7408a82e4a1d05f229b695"
 
-SRC_URI[md5sum] = "53c313c7ae8721e40ddd5e7a01bbcb7e"
-SRC_URI[sha256sum] = "b1e58dbcf50fbb2c9c418ec7a6057f0cdb30b8f822ac852f72e71ba769dae8c5"
+SRC_URI[sha256sum] = "04d02cfcfc18a6f8a9a4edb4d0a55e2e4fc575626c29d702f750de415e88d372"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


