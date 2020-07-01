Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.10730.1593562052208742070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tLWINIDe;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id j4so9164804plk.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=368DkLsr9C0hvTEfohFiVqOOV5o7ZnFbqRPsKxbhlRc=;
        b=tLWINIDeyXb9xQRnMNUrjv4wVj+h367LOvd+5fgNcqF3l6q3CsxLyb9vWwG56B9M8Y
         V8rfL/HEYCwvWf1c3o78ULXopnfRJ45j63ikxTtFs7I6158SLjCR7kybb7LLWCjfRv4b
         aHEiVeYEWX1ktTys8+iAFu7pIrJ6kW0e20szG8AMieX+8HjktDIFSUN5jNqbfaDzU41U
         mxuVN+BGli2ZoaxcNZW77HMeH5cSnxTUMZOZ5l4fKUp64LpMEeX8NPFdaC/u9cuFL2He
         YfCNiR9wNYoHOHhYEn2CI/r79OV2wMguOR3Tok9y6bhXbdNLDOTVwR5NppMkEct2Hm0j
         PrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=368DkLsr9C0hvTEfohFiVqOOV5o7ZnFbqRPsKxbhlRc=;
        b=DtTw9V8x8T7uRAW/Uh0xz0aYvraHLMyITqd4lVyFvoowN4HARk1YM/PsMgppYz+EO4
         dHxkEfVPEw8KNpgd68O9uefIwpu19ftLRECT5RVfJmnGxq70VQeN7jiAhafe8b1/ZB+R
         lYLui7y9rgJ5UmIVqGrcQhwr1ivDCTQArLeE71kKtI0poJXhg3+Kr10FfJEN3wtfmSFI
         6MDO9xcv7On81KTtSwqdnxqTa9f9HOYSTYZ78/GAC4db2NCgCzN4dl+esGdkSVK4/363
         1A4vrvrgG46gmn5zFmlpBTftcvMWAotfkrkCYwYiftbskJQgDSgwhURPB2hwojFBFcn2
         L+wQ==
X-Gm-Message-State: AOAM530fKey8vZlH1znxlXv1q6YAeZqtPknrjVz5dnBK34SrMMxBfJgv
	Lo4bEKW7UF91L5zdLRjkHejTmQE0UbE=
X-Google-Smtp-Source: ABdhPJxQZ+wBqjSxlo9ckH9fKRbmfvZFEfi1pyrkhiiaeTFzsim3WmmMobphrIJdVSAn4sKcicUi3w==
X-Received: by 2002:a17:90b:4c0f:: with SMTP id na15mr24795462pjb.112.1593562051503;
        Tue, 30 Jun 2020 17:07:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:31 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 09/32] libblockdev: upgrade 2.23 -> 2.24
Date: Tue, 30 Jun 2020 17:06:54 -0700
Message-Id: <860610065ec2ffae9b4aa95c3ae6c2a3cb78eb70.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Change SRC_URI: all udisks related sources moved to
https://github.com/storaged-project

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dc25abfed8ce775ceb23dd483fe85924dc550bfe)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{libblockdev_2.23.bb => libblockdev_2.24.bb}           | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.23.bb => libblockdev_2.24.bb} (94%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.24.bb
similarity index 94%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_2.24.bb
index 3f4eec274f..99cdee5bba 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.23.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.24.bb
@@ -10,11 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 inherit autotools gobject-introspection
 
-SRCREV = "f5d2458e9e52d8c55b609ae8cf46ef0673b4a02a"
-SRC_URI = " \
-    git://github.com/rhinstaller/libblockdev;branch=master \
-"
-
+SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch"
+SRCREV = "f5a4ba8bb298f8cbc435707d0b19b4b2ff836a8e"
 S = "${WORKDIR}/git"
 
 FILES_${PN} += "${libdir}/python2.7/dist-packages ${libdir}/python3.*/site-packages"
-- 
2.17.1

