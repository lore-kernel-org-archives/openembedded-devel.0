Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AFEC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 16:11:07 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.12512.1664467864408092036
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 09:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=RN9hz+Oq;
 spf=pass (domain: qtec.com, ip: 209.85.218.41, mailfrom: daniel@qtec.com)
Received: by mail-ej1-f41.google.com with SMTP id hy2so3787802ejc.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 09:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=tgXxWwWNYc6ky1vj2aFTwOxeiZSoqCC/R2sSWLcWXQ8=;
        b=RN9hz+Oq5vrbQ4nsadagkzNK08ZRCmXMMCD11yfXuoKDtc7l1CIlV3oevvK8rR4RaW
         5r5BgThHQH/h918mu3rIThWtbGAj9so/mao2TLsdyrMUvqCmyexnruWV8/JA3c668vHm
         J8f/ylArXMAiyeqIMSaGAmrzpSZd5Xa31fcFf76U8aepnJ2Jw2BxqUbIt2FZfu/2W+HX
         goqPOxjM6SiIlMGvdrCZpQiacIb6rl4gQ4yohs8EqSz2q8ObABjzFiC6D+UeSehwSmuY
         ii04+d2fPClipG+hrEbzdCFSUkFL23DTuNmtYfGpRcvJvs0+4kObqoER8xbGsuRqiGYW
         qOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=tgXxWwWNYc6ky1vj2aFTwOxeiZSoqCC/R2sSWLcWXQ8=;
        b=Op78wQs+DS9umMA4wNFU0TJabtVnUAhjMSZCRsHxg4WHQEHmzX+AhRAcNjOshGdSKk
         RGdASTXa6uN0rCvYRvXj8xxY/N9GQNHGDR5QEACdzOLeZ/V+tRlkuk8P//QPdhXgu55E
         wpRjOZq3CwpfbbEcNFKLRL1jswro6Jwco1yt5pIgCpNXWHscU70UGad02PSME4LXU+qQ
         ev9fgtYursgdQ8WCu0ct3sAv3pEMjeknFnhyGSQ9uGBOVmlg1G5pDvzA1KyZ0T2NyIod
         AZRTAx3RRyoHwXv7ETzWwdYn0/3s43P3MIlP8CI+2A9Q/R00JMp6tBWxWLUC/jSfCNvn
         Kvig==
X-Gm-Message-State: ACrzQf0t/RqB5UyvPBLtjXl5LBE0DClNWByPWBDCubXm+OR2Jb1KuaSn
	CyLOI+74ix+xFh01eRln6R9MTooFso0OXwcQg+7K1j/l4l047ilZ9FOlOyq7KiHtw9J0PH1SgZK
	3g7UfbQ9GpAeKZBfaQSfzowyjPf2Naka1orJVoEg0M2wr6WQSGRwONkSJD2cxlyRyKWxoZLx3Mt
	eSUaC7GM/ktfGM7U1a
X-Google-Smtp-Source: 
 AMsMyM68dIMHXjSHYTxqDVmLVfvxqjhcuMgVBnvoXYdtmq3ElQKk9IQEG9Pdetpc96gwbkeCmcAEEA==
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr3206152ejc.555.1664467861702;
        Thu, 29 Sep 2022 09:11:01 -0700 (PDT)
Received: from datops.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net.
 [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 dn12-20020a05640222ec00b004585a21df62sm4341edb.0.2022.09.29.09.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 09:11:01 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [oe][meta-multimedia][PATCH] gst-instruments: Update 0.2.3 ->
 0.3.1+cb8977a
Date: Thu, 29 Sep 2022 18:10:57 +0200
Message-Id: <20220929161057.64040-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Sep 2022 16:11:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99008

The project has moved the build system from autotools to meson. Latest
stable autotools version: 0.2.4.

Update to master: Version 0.3.1+cb8977a.

Format style with oe-stylize.py.

Add ui package to enable graphical interface.

Fix QA -dev issue:
ERROR: gst-instruments-git-r0 do_package_qa: QA Issue: -dev package
gst-instruments-dev contains non-symlink .so
'/usr/lib/libgstintercept.so'
-dev package gst-instruments-dev contains non-symlink .so
'/usr/lib/gstreamer-1.0/libgstinstruments.so' [dev-elf]

Remove dev-so from QA skip. Not required anymore.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 .../gst-instruments/gst-instruments_git.bb        | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
index 9a6c71cb7..8f0ad6512 100644
--- a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_git.bb
@@ -4,17 +4,20 @@ SECTION = "multimedia"

 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
 DEPENDS = "gstreamer1.0"
+SRCREV = "cb8977a6711657e32853159cd539d1d75fcbc772"
+PV = "0.3.1+git${SRCPV}"
+
+SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;branch=master"

 S = "${WORKDIR}/git"
-SRCREV = "3b862e52e5c53ad1023dc6808effa4cb75572c4b"
-SRC_URI = "git://github.com/kirushyk/gst-instruments.git;protocol=https;;branch=master"
+
+inherit vala meson pkgconfig

 FILES:${PN}-staticdev += "${libdir}/gstreamer-1.0/*a"
 FILES:${PN} += "${libdir}/*"

-INSANE_SKIP:${PN} = "dev-so"
-
-inherit autotools pkgconfig
+INSANE_SKIP:${PN}-dev = "dev-elf"

+PACKAGECONFIG ??= "ui"
+PACKAGECONFIG[ui] = "-Dui=enabled,-Dui=disabled,gtk+3"
--
2.35.1


