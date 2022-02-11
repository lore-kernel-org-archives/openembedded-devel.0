Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7ED1C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 17:46:32 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.10341.1644601592273912593
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 09:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NRS3+wXe;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id y9so8760415pjf.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=esy5xeLab4tPj42Dab8HthmZQOjPtg0VGqoe557AaxY=;
        b=NRS3+wXe9pBW5tqGoCwP9r5wgJGJyPIw69gL5Z3ogZ1Mv9KfyCDOM/5lCB+EVgK4i9
         E6+H3jiMXcIXEVj1Tv1chqGHDZvHmoEJyRlap8mhJizvO34l/cxGYugwcd+7XSKU4FIL
         +pkvhUatbb377tgjhV0PrrkAK5PtIlOXvFWK+E3+QoR4chdlldfNrpgrgUu/WTOrg5i/
         FEwiIQCK9UZ3KkhrKMpANdS3syTqszG079OXaZgClI42BY59omKS7UMl2yF4jFZrCfho
         F1iXm2ocrVO2Ac15VEVvDBK9S9FLxmd/1Y/KIW3wvH+6kgkStlsmGURU26CwQ3pVZWWO
         eMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esy5xeLab4tPj42Dab8HthmZQOjPtg0VGqoe557AaxY=;
        b=tH4sCtqECqkF5xA8fojH9n09dM8b3kkCxbpK6+yaOGcrhdL5ydSyHkv2k13N1z3V7v
         xVG+cyNf8o+j7HLLWl3d3lMfqGlTcV3r3aSBB0BhBfvyW8carwPY7rkjClK3iMC01iCP
         Hah0Dsd3QQ59eq66oQ0juaUCTEWaLNIw2rpAZo96bYagI6YUaLZSPAX2+a9Pk0Bma4DH
         5BZmkSUBvo7cpKTuB/Fd48hlyBoUfmSWTE2jXyAvHJ+leTUfYKKjKtNZO3Z3h/V8xjkV
         gbJ0jb4KehaL2jKfcvpmHSPm7P+rQ1Ur4vLgYPJIFU0pNqtEpbppWT4x2bltqHZxZPRu
         UrTg==
X-Gm-Message-State: AOAM531B/LHg4k8UDUJRqdtL9t59aV1SgcIcP0G2RUifR5Y3NP6QILDB
	hftc7WE1Gf8x4ohTMIRv1u3BNZqNjm3a4g==
X-Google-Smtp-Source: 
 ABdhPJxF7d2+90gOfTLkbXYiogKh8ewbuZ6hU83Hz/7KxwJUzhFPSOyqlQG1cjnpoB06aHVqGT93gQ==
X-Received: by 2002:a17:90b:4d11:: with SMTP id
 mw17mr1521635pjb.9.1644601591596;
        Fri, 11 Feb 2022 09:46:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 f3sm28892557pfe.67.2022.02.11.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 09:46:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] smarty: Upgrade to 4.1.0
Date: Fri, 11 Feb 2022 09:46:28 -0800
Message-Id: <20220211174628.2525008-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220211174628.2525008-1-raj.khem@gmail.com>
References: <20220211174628.2525008-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Feb 2022 17:46:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95300

Changes are here [1]

[1] https://github.com/smarty-php/smarty/releases/tag/v4.1.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../smarty/{smarty_3.1.39.bb => smarty_4.1.0.bb}           | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/smarty/{smarty_3.1.39.bb => smarty_4.1.0.bb} (90%)

diff --git a/meta-oe/recipes-support/smarty/smarty_3.1.39.bb b/meta-oe/recipes-support/smarty/smarty_4.1.0.bb
similarity index 90%
rename from meta-oe/recipes-support/smarty/smarty_3.1.39.bb
rename to meta-oe/recipes-support/smarty/smarty_4.1.0.bb
index c5b09a0c50..85676e4902 100644
--- a/meta-oe/recipes-support/smarty/smarty_3.1.39.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.1.0.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://www.smarty.net/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
-DEPENDS = "php"
+DEPENDS += "php"
 
-SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;tag=v${PV};branch=master"
+SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
 
-FILES:${PN} = "${datadir}/php/smarty3/"
+SRCREV = "9e0536de18b53ba193364291ef0303b0ab9903e1"
 
 S = "${WORKDIR}/git"
 
@@ -23,3 +23,4 @@ do_install() {
         install -d ${D}${datadir}/php/smarty3/libs/sysplugins
         install -m 0644 ${S}/libs/sysplugins/*.php ${D}${datadir}/php/smarty3/libs/sysplugins/
 }
+FILES:${PN} = "${datadir}/php/smarty3/"
-- 
2.35.1


