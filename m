Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB83CECAAD8
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:03:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.5322.1663157014333825884
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c2h0vIvy;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id n8so3887149wmr.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uO9UAEe0OQQbf+tZsB+sYM1gxtwjdsru8/eOtUV11V8=;
        b=c2h0vIvymipqSr0+B6NJvPYIbwJTKWmz+PAZYdI+gy+lWmm8XfOR8yrjPj1EpuGHxZ
         edmWmxhqsOV1uyNKtZx+rOkOAI4+vEQWN8+E5LDdKK4UUNc6GVeOw5i+8PQmtn1GbpWO
         /8GpErdb5+leWvgvOTkxCayUkH/kkN9RwlzQ+aY3tTQSvRZvnKgpilaqnQsN/Khpw/F6
         S6b/ec44nnQ96j7mieB7zohjNv1Qwa3Stkdse40PFHzrywIuW3M00bai1wWmtWaenyZl
         esy3JykKyjFiMABe/q0MHnEcK87OeaK22kvhWDWo8O5iGpvZ8IP3ez+C5r6YLmdRe7zX
         3bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uO9UAEe0OQQbf+tZsB+sYM1gxtwjdsru8/eOtUV11V8=;
        b=nR/DtLm9G4vYsnffHjUmXfi+UN0pDXQ3QFHgufPILTgMfSrKi/AC/ZxQwiK/0+GK4g
         b2kRZco6tBz5xCJ16QafFb/RB8Ch0IBIfGM/O15HsbKMASZurxjBrlRaUf5yBrhUhnLY
         nmnksAFg2OtXyevnAq1fTTsOZ/zsbXPNzV3SaPYQ5b64neb19eaMiLeClm8J+cN7CkT6
         vA7Uvdg8ikkMxkXqzeR+LgfbMEV9fMXEDiOd/ajEgEPuDhS0bhQIUIgiXdixvr/N+/4L
         LOwnLgfl6AToR++G20T3bZUynzM4lVSM/Yl9Ix9qqPHmXel/Hew5PC3wPbLfh8v5ZWFy
         ryGA==
X-Gm-Message-State: ACgBeo2r39Ng5HP4X0raJteW/ysXLShUB0TelGRbY4ulo3Np2sCykI+V
	qUtZ/4vnO0aZEmYVojvVIv3b5QNaN5sRKQ==
X-Google-Smtp-Source: 
 AA6agR6Flq6ddHmU4EP/DEI7SulQ+wlH7qg1bOrCkr2hACvVZbd7ddv6qb3otl2hTQylJNmEp6khHA==
X-Received: by 2002:a05:600c:3512:b0:3b4:9240:7a5 with SMTP id
 h18-20020a05600c351200b003b4924007a5mr2919485wmq.42.1663157012841;
        Wed, 14 Sep 2022 05:03:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0022a2dbc80fdsm13286233wrt.10.2022.09.14.05.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:03:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 8/8] sip3: remove the recipe
Date: Wed, 14 Sep 2022 14:03:16 +0200
Message-Id: <20220914120316.551377-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914120316.551377-1-alex@linutronix.de>
References: <20220914120316.551377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 12:03:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98802

It is not compatible with python 3.11, and all
development has ceased:
https://riverbankcomputing.com/software/sip/download

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb  | 40 -------------------
 2 files changed, 41 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/sip/sip3_4.19.23.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 756ba46e3..cc1c87712 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -301,7 +301,6 @@ RDEPENDS:packagegroup-meta-oe-devtools ="\
     python3-distutils-extra \
     python3-pycups \
     rapidjson \
-    sip3 \
     squashfs-tools-ng \
     uftrace \
     unifex \
diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
deleted file mode 100644
index d6335585e..000000000
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "SIP is a C++/Python Wrapper Generator"
-HOMEPAGE = "https://riverbankcomputing.com/software/sip/"
-SECTION = "devel"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
-
-SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "70adc0c9734e2d9dcd241d3f931dfc74"
-SRC_URI[sha256sum] = "22ca9bcec5388114e40d4aafd7ccd0c4fe072297b628d0c5cdfa2f010c0bc7e7"
-
-inherit python3-dir python3native
-
-S = "${WORKDIR}/sip-${PV}"
-
-DEPENDS = "python3"
-
-PACKAGES += "python3-sip3"
-
-BBCLASSEXTEND = "native"
-
-CONFIGURE_SYSROOT = "${STAGING_DIR_HOST}"
-CONFIGURE_SYSROOT:class-native = "${STAGING_DIR_NATIVE}"
-
-do_configure:prepend() {
-    echo "py_platform = linux" > sip.cfg
-    echo "py_inc_dir = ${STAGING_INCDIR}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
-    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
-    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
-    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
-    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
-    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
-}
-
-do_install() {
-    oe_runmake install
-}
-
-FILES:python3-sip3 = "${libdir}/${PYTHON_DIR}/site-packages/"
-FILES:${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
-- 
2.30.2


