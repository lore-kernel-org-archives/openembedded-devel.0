Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE70C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 18:50:07 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.582.1646938206187230057
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F5b1Tb3D;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id v4so6090571pjh.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 10:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xoAEfLd6fcWNAPk+mOUlIhtmrn6zJOpL4HRGkQNgtKY=;
        b=F5b1Tb3DIXjz5QX80hUFQNB+d2M3ZLZQIjfX2GS8BiI6FjtRPMN9RRfxp52A5mrRlT
         7rHTTjIPXq345xxgMTyDnoGNzxT41XBWYAwXU3uM4gFoRfA0XLA+OBiTrlFjF0R7JCJe
         CUC2BddKKM6X/WuHc9yM4la44JfzXCjRqjX/b5Ix2ogozo7nhREGQj6aLFvrov3fhjXq
         NBL8zRtr3rQH5k21xW+Hdc+lwssgKIbZoIgH1DFkbJqEVBTyPk+GvOoIj5w70Q8RrrDf
         1z7jerFNEmi9dyVI+o+e3qX9hB09EYfogZ+clj6YimmePYhdskwMWSHzs2OBWn9twd0d
         AXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xoAEfLd6fcWNAPk+mOUlIhtmrn6zJOpL4HRGkQNgtKY=;
        b=0eL7oyDmQveGhIklDIwlHpEk2Jm7oDqvCNcI1vvGFXa3hvSh45xMoYyx1eEKJZz2EZ
         te4pnxIvGszro6Uj1i2+tupqjE9mX/Ix/7PikLtOrY7K4NxjDEQTkcAsMiYL2z/A+5vq
         nXO8L9hLNNwbM4yJYiueT85EJd3FKaycdmo/WwwrMV9ulq13VY+n1xWnOlPcRwm6sQr2
         d3a1xQ+BaC804TCvwNU7MEwxlspnek7MX40pKJIil7CmmvZORWZCy2eFh/IltauZE8oc
         6AOwxq32DWHUq5Eco2kc1bdrlvm6wcQQrbdZXXMgc92tVwnkQOhWNgC9BpNP7nfjTgVL
         nOow==
X-Gm-Message-State: AOAM531DaCCgXILY6KmCONQA+uAaWIHRlvADw/dKMyGNcGVP34GvfZtw
	EGCV5tebFxODYgcCP670BoUA49K9Elr7tQ==
X-Google-Smtp-Source: 
 ABdhPJwDPJ2zcV32b7EJQ2BL9+asBCd9sqquHcLbzWslbmEJLmtF9iXdQ57Bez+oITIZ7qibGmGNnA==
X-Received: by 2002:a17:90b:1d0a:b0:1bf:b772:30ba with SMTP id
 on10-20020a17090b1d0a00b001bfb77230bamr6458921pjb.99.1646938205409;
        Thu, 10 Mar 2022 10:50:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a17090a8d8400b001bc386dc44bsm10397548pjo.23.2022.03.10.10.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 10:50:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pcp: Upgrade to 5.3.6
Date: Thu, 10 Mar 2022 10:50:02 -0800
Message-Id: <20220310185002.2896400-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Mar 2022 18:50:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95941

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pcp/{pcp-native_5.3.5.bb => pcp-native_5.3.6.bb}     | 0
 meta-oe/recipes-support/pcp/pcp.inc                      | 9 +++------
 .../recipes-support/pcp/{pcp_5.3.5.bb => pcp_5.3.6.bb}   | 0
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/pcp/{pcp-native_5.3.5.bb => pcp-native_5.3.6.bb} (100%)
 rename meta-oe/recipes-support/pcp/{pcp_5.3.5.bb => pcp_5.3.6.bb} (100%)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb b/meta-oe/recipes-support/pcp/pcp-native_5.3.6.bb
similarity index 100%
rename from meta-oe/recipes-support/pcp/pcp-native_5.3.5.bb
rename to meta-oe/recipes-support/pcp/pcp-native_5.3.6.bb
diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 97a9095b97..1c1a977b97 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -7,15 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
                     "
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRC_URI = "https://performancecopilot.jfrog.io/artifactory/pcp-source-release/pcp-5.3.5.src.tar.gz \
+SRC_URI = "https://performancecopilot.jfrog.io/artifactory/pcp-source-release/${BP}.src.tar.gz \
 	   file://config.linux \
 	   "
+SRC_URI[sha256sum] = "6ef33b7aa14c09860ba7cd8873e76d38ccd24eab0c94a50e235f813e77fe3610"
 
-SRC_URI[sha256sum] = "589a610f753a49af6d2015cede87e9d469bd07880ebef26fe1607b6ded375e97"
-
-inherit setuptools3-base pkgconfig autotools
-
-B = "${S}"
+inherit setuptools3-base pkgconfig autotools-brokensep
 
 # Specify any options you want to pass to the configure script using EXTRA_OECONF:
 CACHED_CONFIGUREVARS = "PACKAGE_DISTRIBUTION=arch"
diff --git a/meta-oe/recipes-support/pcp/pcp_5.3.5.bb b/meta-oe/recipes-support/pcp/pcp_5.3.6.bb
similarity index 100%
rename from meta-oe/recipes-support/pcp/pcp_5.3.5.bb
rename to meta-oe/recipes-support/pcp/pcp_5.3.6.bb
-- 
2.35.1


