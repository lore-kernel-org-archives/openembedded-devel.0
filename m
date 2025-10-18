Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E72CCD184
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 07:21:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.1676.1760772055816827902
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Oct 2025 00:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J5fmBIUM;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4270a3464caso507245f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760772054; x=1761376854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZYG0PMGYHVncvNQDgAiqXEyA3dQZslqqBjNP55eaDg=;
        b=J5fmBIUMFCdjFkC0LElQtRCCsSblWsthHJh/7WyBaLR9PpmZndny9F6Atf5JGMnT4H
         A5SMy8CYOrRb1og5ty0V7RZx8nHX1Ssawa9wGAfcW1hcjrqYITIG37nQTvcNjFGztJDo
         tcvfuTSJzrtSfdP3Gxj430xEJgImGv/mJnwOM8rHJUIgK8XmtuTZJWSmmlrsg+MpcGds
         Im8Sl+pY6J0LH+LpMAuyg8dn0kt2A10H+qx7Avld5n3bQ+V7bl3ihqHE26P8jbJKYp5/
         GWFn9o7gC1/X1r+NRkEM7cnnI9Tc/mvH3izsnkRweMZcv41qE791NRXKUtCgs/TRQv+g
         iCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760772054; x=1761376854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZYG0PMGYHVncvNQDgAiqXEyA3dQZslqqBjNP55eaDg=;
        b=GbioqjcxZH8XZunm5IMqQMC1nZL8GUcaIOY/smFDlmp+fsgGfl4iOHkNztKPmjwUv/
         HRrZDX34RkCndHvo2/LBU0a2fJeZo3OG/phd9LbNehZrXD7qVU+mFoK3rQAWnDSjQTuT
         HIMQX8uSDi1eWf57gDlc61yOytu5R37WFK2tGwnLj+L28NeWnvC6RZ7+P+L1hACSp4/e
         gtkNZ5McHxpMS0DWDlnVi5Yl8yjlOFpqe9sFDv7NumZfefVHdAl4GkqmHmMWmmIUNyvq
         Abj4Kc2LrEmNFOmE275GMr+me6effYbZC9QXLs1Bt6JK1NfJwCfq1Hevw/TPs6mE025D
         rKoA==
X-Gm-Message-State: AOJu0YxRAjjsk5wlvDqyNOfkSdLCmv77WkomJHEqP0V2hIBNs+df2Qmf
	AAS69feQBRSan3us0kXCivyhrJf2Q2wk5ci6+/BeiuREdxkN9n21KT5hTCwQ/w==
X-Gm-Gg: ASbGncshAACwaifYP8fXTg3HXo6ItAvqHrTlmX4ckAqFOt/rfvG5LtjNFucPQzG07Uj
	zZbJW81eXZWCPtjVAv5IxukOhabvM9n9UnUfsvENUwDRorhUoNftB4sIZmc0dgEyaI7klvkK9Sl
	v0dBFbdahVtRYcPr7aPLtg2fQsJHHhSd7b/3RMUE/KEMSrHWsxB185TOpCAwoHwS8n4UH4W+LGM
	JUB+MG0XnRXJno0Mz5Iwl+xPlh00fRgFJojuJDV50Buh787Py2ed8icVefTDRMAu6n6lkfq/lHg
	q3H0o5oNL+WUHGWWrRQqMS+hTD0eqCs3nIRE84kNbL6P757Uxax0TmTFFkjhbz2F98H8M1NEq6d
	szeBUifUIAWo7gcQ74PIvu4BxfzPFC7Aoi+iTD4W8z3YldY4Q+rPu2LSCPIBf8bd0JJQ8XJDLpp
	nAfSbB86cN
X-Google-Smtp-Source: AGHT+IE+9iguSsj3QmsyshU/DG08d4VEEgt/ZzMQngagpMlrfju1g5Bpoz6BvBva25ncJSTaF/AzzA==
X-Received: by 2002:a05:6000:4287:b0:427:4b0:b3f9 with SMTP id ffacd0b85a97d-42704d830camr4350043f8f.3.1760772053927;
        Sat, 18 Oct 2025 00:20:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce678sm3616558f8f.51.2025.10.18.00.20.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 00:20:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] libxml++-5.0: fix ptests
Date: Sat, 18 Oct 2025 09:20:52 +0200
Message-ID: <20251018072052.3247880-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 07:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120782

The recipe inherits the ptest class, however installs no tests nor
run-ptest script.

This change rectifies this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest | 4 ++++
 meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb  | 7 +++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest

diff --git a/meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest b/meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest
new file mode 100644
index 0000000000..4f54f90e09
--- /dev/null
+++ b/meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+for t in `ls ./*_test`; do
+	$t && echo PASS: $t || echo FAIL: $t
+done
diff --git a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb b/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
index c0f0b2e130..bb73f7fab7 100644
--- a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libxml++/${SHRT_VER}/libxml++-${PV}.tar.xz \
+           file://run-ptest \
 "
 SRC_URI[sha256sum] = "15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098"
 
@@ -16,5 +17,11 @@ DEPENDS = "libxml2 glibmm"
 
 inherit meson pkgconfig ptest
 
+do_install_ptest(){
+	for t in `ls ${B}/tests/*_test`; do
+		install $t ${D}${PTEST_PATH}/
+	done
+}
+
 FILES:${PN}-doc += "${datadir}/devhelp"
 FILES:${PN}-dev += "${libdir}/libxml++-${SHRT_VER}/include/libxml++config.h"

