Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF78C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.5208.1636118168756159516
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=goLz2MrG;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so2679069pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K1EZxW1O6eLy0BFP2HMoHgwfsdLFSpUHEH226lvine0=;
        b=goLz2MrGt0Sq2ZvCd1+Qek7gE4UUISQPsTne8Ncx/x/3v3HvcdGVf+ggpZLsnT37pS
         zTP6F1NAL5o+be76xMG4GOj6qYuY2bf7/xiasJO2C43uaeV8/qTBDtHngCd55z9zqt33
         /1Wt7QBhENvV0+8J7jT/SiDaQUlVLHW8iKMPwjO8a59HubTvqCLKeBNmYzZ2rxODmhZ3
         bcxPqEaLPgnBQC3kR2Uf6WE1rjyGIL7KFr/IoXEyA3L7IbvlZJ2O2fRrfUQuma498WPR
         1raxo2c7Z7iPzf4+3O/sgF1k54cOfmQLyDO9HRnO5g1QFUrY4/cvtC4xjJomH8Y0sV0c
         VG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K1EZxW1O6eLy0BFP2HMoHgwfsdLFSpUHEH226lvine0=;
        b=xWFQZulmlH9wktiksT34T5zWa6dwHF+1M/itFd1Y/jxSJx6fwQpym0Fdoc/kr0g+va
         lbgnKZnuEWytHG15PFzDTSrionG9qA/oe8exiYnwThdgg/LodSdMBDALhBp0OhraSKTg
         r/6cb4n/dK0jaybhSrU82ujgGXPyv/Kl7E0OllrrJAA2llICEikX2HPTnNT/LXXH3lmE
         BTZzIkE0Lja3Xrgk6lb6laKbpIlIDfyqGr7HknBULk3RNaavwC18Sx+NPgwtD5hCGlEy
         oYJwuyN/z8HzGfJ+xnBUCsu4+kGmLHcfOt2UMimciqc5M1P2jEj02JMq6VGef5MM5ODi
         SKGQ==
X-Gm-Message-State: AOAM530gdgiUwhx1bg28qXeSdg0wZcg2cqitX60EFg8ESxP21lDHtFcY
	MHD64amZW/YwFY6RYbRyYLgAcmzoKTk=
X-Google-Smtp-Source: 
 ABdhPJyg0gVfweRUUyaDcbztYkUYjQ92AewAwvzuI9rymkXEkdmj+MYrej24Wtt1v2i060RvGBzKvA==
X-Received: by 2002:a17:902:70cb:b0:13e:91f3:641a with SMTP id
 l11-20020a17090270cb00b0013e91f3641amr50469035plt.13.1636118168053;
        Fri, 05 Nov 2021 06:16:08 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:1036:3e93:cc4e:1fe7])
        by smtp.gmail.com with ESMTPSA id
 c85sm7899124pfc.146.2021.11.05.06.16.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:16:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/10] grpc: Define SRCREV_FORMAT
Date: Fri,  5 Nov 2021 06:15:54 -0700
Message-Id: 
 <46eb172b64eeeddafc80d8492ca01925f16cda5b.1636118048.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636118048.git.akuster808@gmail.com>
References: <cover.1636118048.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 13:16:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93839

From: Andreas Weger <weger@hs-mittweida.de>

Since it uses multiple fetch URIs make it explicit to define SRCREV_FORMAT

Signed-off-by: Andreas Weger <weger@hs-mittweida.de>

Change-Id: Ib24fce16b3986a465f1c5854166b8f28446b5186
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
index 752562eb33..4ce0c9c972 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRAN
            git://github.com/protocolbuffers/upb;name=upb;destsuffix=git/third_party/upb \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            "
+SRCREV_FORMAT = "grpc_upb"
 SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch \
                                "
 SRC_URI_append_class-nativesdk = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
-- 
2.25.1


