Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B81CC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 17:31:57 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.60.1645810316580899101
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 09:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d9rJFCfv;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id gb21so5354367pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 09:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vm5edCveWiq01O5EmCKeX5rCDhxrOf+ERXzEROwD+Cw=;
        b=d9rJFCfvvozW//E2VhEQv0n9Bb0LN4FIVBIbfmp7E6kTS8UnfYQWgYrM9a6mEfEsMI
         zxWmMCBJ2uIEKn40JtBvo37lgcS/p3nxrHLcnYfdxv4cwzhwTvaHPtqERmsKPaqb1Rri
         0vtkfcRGtYojco20ATLemAj1Wc9gJW2yxCM1uOK04xvHMx0kE5h10MqBrrC5O/B9Xbjo
         K7pmlWCuSnsRuMtupw5JysOtn3E+agueZ9vUM3ukAO4f/sats3u4pOqHcv+N+uJ3TMe3
         W6tlTWERTPqEceb1dDv+jQQ9XtEpeQCz7pcoRQ4f68qVtQi4sx1UEkIim1JYha2NEwYc
         Pfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vm5edCveWiq01O5EmCKeX5rCDhxrOf+ERXzEROwD+Cw=;
        b=YmrsqEyvVOk5sVgZMdtETC1DuYcY2MzHlOG0lF1zepxU0RCq856gpEkGubsqC16zEP
         CfJKxKkioedNAFgITiao+a8uk4vS5u1QeCe3zdSZIiTn1a1s81zYr5sRe3XDdafbmvyZ
         4lJ4h6fuHV+qsMDqJJ0yedzaW8RVCIbsdyxnxAF2rrQC1nlXQNW5Q7IvE2SJ3mzPQnxK
         Ig6YuLY4OlnCK+RlG9PH807cHSM4Luz/PszirOxcBSqK729RiwS2xGDwItJ98RVSjDpW
         D5Xh2nzfRc9krsx9fST+zDoNPIdR0A0+taqNqxj24bXCwR7AX57v0PSLNo94BxOmYmy0
         DZBQ==
X-Gm-Message-State: AOAM531Pe6kBdFCP0UsiDrPbynLzzzO0Gq35OCUKaC612UmDBUhKyifS
	fAB1+bmqt9BSCIMqwqMNNFKTOL6Z+aZ6ag==
X-Google-Smtp-Source: 
 ABdhPJyYgFZzVHcTJiSw1aWv9B8jx+t4/EiYLJFLtlV+oBrR5lfgAkG91NRkFP8lr+pbWAvj4Q2LOA==
X-Received: by 2002:a17:903:22c9:b0:151:3e16:48f6 with SMTP id
 y9-20020a17090322c900b001513e1648f6mr1899223plg.114.1645810315014;
        Fri, 25 Feb 2022 09:31:55 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 s4-20020a056a0008c400b004e1ac002ccbsm3959925pfu.193.2022.02.25.09.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:31:54 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-setuptools-rust-native: fix wheel build
Date: Fri, 25 Feb 2022 09:31:51 -0800
Message-Id: <20220225173151.1336239-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 17:31:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95523

Add comment that setuptools_build_meta is currently broken and stick
with setuptools3 for now.

For some reason, the wheel is built in ${S}/dist and not ${B}/dist.
Set PIP_INSTALL_DIST_PATH accordingly as a workaround.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-setuptools-rust-native_1.1.2.bb         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb b/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
index 34ff91241f..1afb3f0e0f 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.bb
@@ -12,8 +12,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 SRC_URI = "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz"
 SRC_URI[sha256sum] = "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea7f747e153a3e65d1"
 
+# While this has a pyproject.toml and declares that setuptools_build_meta should work
+# it results in a wheel named UNKNOWN-0.0.0-py3-none-any.whl so stay with setuptools3
+# until that can be resolved
 inherit cargo pypi setuptools3 native
 
+# For some reason the wheel is built in ${S} not ${B}
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
+
 DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
 
 RDEPENDS:${PN}:class-native += " \
-- 
2.30.2


