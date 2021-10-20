Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C44C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:22:19 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.417.1634750538018826803
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EpXFLa0A;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso2957317pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Y91gext6AnIe4F2U8/BQd4MoDPiRavP6ytQkrmM3ic=;
        b=EpXFLa0AMSY2UZSBXnBQjcv6y3WJ3PirAceZg8E2QL7psjJ1xQU8VqRsO2p7PBr5Sp
         XFMSJSmb7VBy3Ec1CgItB4NRO9lJDRR3RRyxt8U4exHSo+9n30VZ3SeYBBARzqM0Fm2C
         jfCVC+W9tCtmykLpOJXdmVIFNRxBWM40yoskoHSzo3TSAXi3ixVaU6hP5OvdR35MT7+h
         qq7klbaBOqnpYmL2jDcpJ4RzDASh0QBeOKyvCjVN8I39RbB3+nYAHyYUFEexLEgiangq
         xZAcKFcihUYkCdG0jQhdbQfcsEOal0gGi2NNktbku7lw8Uh79qv5pH/BR2/Uiwb9E5AF
         KeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Y91gext6AnIe4F2U8/BQd4MoDPiRavP6ytQkrmM3ic=;
        b=GBbpx+N94B/C4i32o5p9O1FabQdtKSm7sI4ZMfoULL1nET7pB9rhz7lnLLTSUknhXt
         h9KFnHnBM+9wlDQ6uomzuHEkizf+684DvwbDvLOj3MiaKNtPgEm7z/f+M+ZCfkXhEJk/
         7txTZCdF/t0v7SFjfOnXnkmkOpeUFQ8P0LQ+efC+LwxZUZfb2Ao8Zc8FWpenfO+eHAxx
         lYIeDPAjIGExnarl4peNumH64hUTEhX/rH3EzOs36YK3a6pNkPL4fufSuP5Fzv9GUEBb
         NB1UZDwVmZsbfxUs6r9gj2C/GWTsNpFJUefRHfL5UeZ29H8z7tyFPI1X+hjl6xqMmIbS
         a50Q==
X-Gm-Message-State: AOAM531dO6PmrJ01BOCeUfXMBIPQhlAC/rE8uuMhbydqjg0ZSlRnrpnS
	1B3BNrUu1HK7v8/wp8C5Npr2LMomswN2HQ==
X-Google-Smtp-Source: 
 ABdhPJy82S97F/TDaCZoyqSFAstCmuPAtEofup1FismvaU8AqtDj1KXkF6xg6kTmvpySF6ChJIU/CA==
X-Received: by 2002:a17:903:1110:b0:13f:d25c:eac5 with SMTP id
 n16-20020a170903111000b0013fd25ceac5mr423673plh.5.1634750537152;
        Wed, 20 Oct 2021 10:22:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 q10sm2899730pgn.31.2021.10.20.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 10:22:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Marco Cavallini <m.cavallini@koansoftware.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-networking][PATCH 1/2] bluepy: Set PV and correct syntax for
 RDEPENDS
Date: Wed, 20 Oct 2021 10:22:13 -0700
Message-Id: <20211020172214.394631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:22:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93490

Also organize the recipe to to match OE style
Remove PYTHON_PN from DEPENDS, setuptools should be enough
Correct setting LIC_FILES_CHKSUM
Move setting git SHA to SRCREV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-connectivity/bluepy/bluepy_git.bb    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
index 03b1562b60..c1bcbc25b1 100644
--- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -1,17 +1,19 @@
 DESCRIPTION = "Python interface to Bluetooth LE on Linux"
 HOMEPAGE = "https://github.com/IanHarvey/bluepy"
 SECTION = "devel/python"
+LICENSE = "GPLv2 & PD"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+                    file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+DEPENDS = "glib-2.0"
+SRCREV = "7ad565231a97c304c0eff45f2649cd005e69db09"
+PV = "1.3.0+git${SRCPV}"
 
-DEPENDS = "${PYTHON_PN} glib-2.0"
-RDEPENDS_${PN} = "bluez5"
+SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https"
 
-LICENSE = "GPLv2 & PD"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+S = "${WORKDIR}/git"
 
 inherit setuptools3 pkgconfig
 
-SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https;rev=7ad565231a97c304c0eff45f2649cd005e69db09"
-S = "${WORKDIR}/git"
+RDEPENDS:${PN} = "bluez5"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.33.1


