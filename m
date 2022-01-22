Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B57C433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 21:47:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.2189.1642888020742448461
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DRIYO0u4;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso25017963wms.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Av4d37wmz/Sn+Ja6B/XSA++eCylW0a2PipOKUF8SobE=;
        b=DRIYO0u4prJRU0KLvX/9avqe/AxiLwCtuIAg/e19DzWTKr2FW56UBCuDTcX+RZFjMa
         SG9DiKQiJutsfaA+vaCdeYKiWklcyxg1XcrXoYKrtCw1XTu+SoUVqg6XEbKwtCyzs/6s
         i54pl/JQWQF4SweDY9ZOARcKnkoJY5kF7nyghc9YT6gco1AiwJp5UC51bAEJ3Eg1pCQK
         CRxtSuslH+ghGIvLwz/TYecVjavC9yvXLGAfCU1Ork5UDvllQuz5+q1L5ClTFp0YGXuJ
         EuHMA5WRM0F2noWDJy24Cgd6viZ6ZBkbGMcLo1AM1KHFFk5P0rkQ6W7ieskzu6Z5boAs
         kqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Av4d37wmz/Sn+Ja6B/XSA++eCylW0a2PipOKUF8SobE=;
        b=ASVc9b30d8hZzBjKsur1sCN6Wzprur0rGmJyZLApKSwX9IZORSJeXzSV60WQ8h05gk
         rLgmYvwTjopeVdvlVGQ9/4JKy6jFol+wZWwXtqwkAjR+TCEhQmXANyKQF1ME35ml6vlZ
         TONYTRF7/2bthbEeTfi18S9iFr3BgOHQuPVJoSLx+AGdU2t08MI1Ilxa0/DCjqnHZ5CW
         iKGUaHIhkzWsEFOMRgPPqmLQEIbTuDYETo3YC9C4idTCUjgP/2HGsyNj1VVJmatYXpvJ
         WqJ7mO7jXtLhDmDB3zwCGEQgb650QSNA9jaPwC+Fe3SXNAuCqqGWV1UGDTou5MpBhOQl
         BQJg==
X-Gm-Message-State: AOAM532VlYqZofCPgafQyP0opzgifTpIgd8A9ouJpu1ZWNtjqG+fyTiU
	n+rBb3+hHVLCrLCMyBGoM/2VX1hBQpI=
X-Google-Smtp-Source: 
 ABdhPJxZIWj7GO2woc5I7FQ9IittSorAPBBMPOLwDC3l0k8vK96obB4YT7GGk4AtCqXBWu3xpi5kwg==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr5651352wmq.107.1642888019300;
        Sat, 22 Jan 2022 13:46:59 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 h11sm14491343wmb.12.2022.01.22.13.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 13:46:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] libvncserver: disable ffmpeg support due to
 incompatiblility with ffmpeg 5.0
Date: Sat, 22 Jan 2022 22:46:51 +0100
Message-Id: <20220122214652.929263-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220122214652.929263-1-alex@linutronix.de>
References: <20220122214652.929263-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Jan 2022 21:47:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95010

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
index c3b664599..e3f2dafec 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
@@ -5,10 +5,10 @@ PRIORITY = "optional"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
 
+# ffmpeg support is not currently compatible with ffmpeg 5.0
 PACKAGECONFIG ??= " \
     24bpp \
     filetransfer \
-    ${@bb.utils.contains('LICENSE_FLAGS_WHITELIST','commercial','ffmpeg','',d)} \
     gcrypt \
     gnutls \
     jpeg \
-- 
2.20.1


