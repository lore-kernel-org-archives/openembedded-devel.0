Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.21486.1610905602399398566
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kY2njKuY;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id b8so7365437plx.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kiANLEt5Kw7WFnUtObXKKWSWD2+66weQt+VCuYADXaU=;
        b=kY2njKuYkIWAPTU6/hCM7Cn5GZ67HkbDiH3t8tog5ui7vBMxKOA1cSHE8ousgS/bI6
         oKsR0gPOTSU7rSzCCWb9sBMnV/m7P8wpTBvvr8HIpPiP/KJtjDmCjZymLEdBso5yW+6V
         6+3R7Uxm+SqvCm2GhoxSa+GmhigV243/U9Ni7dWo2G4zQzbChy1GbPGj/a0PbvOKkZpv
         QYE6JteTCRvpf5KjVwFT7VY2sZ6doJlh4OvWfuUGT6AEvgGk3OFoF788boef+MK3214Q
         NM1bo/Nv1Z+yMTQVcIU15YPUpyJucgNOmUTbZCnfqNI8yUNLVfregKVMIhcZ76eYwwRO
         THvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kiANLEt5Kw7WFnUtObXKKWSWD2+66weQt+VCuYADXaU=;
        b=REdIgdd2i3a8yjsfoZGIdcQVGP82SbTxBLSYef4ziL8skWjfNa6sEIlcgJYJ/5d352
         mDOeZePr3hpraH6WhxKU2CqrNpAW6VTXLgMysINYR331ERlPUQ7HRL/7qmrBlgIFUjxT
         ZV7pvTJn7n8HnBN6hWf6gYDntHzUDU67U9xm2JE8JP5NlHPKspNwJFPDdUE1ciYn4vI1
         qrDHD4n32flGOoXfHtlNc+bYK0cFRtYZqgfM1OBC+yzClFUsNrOOCYwl/0UcTTfdma2x
         9lR851A/uG8APQc7J0DzlNZXW65FzsegyzTzcPiKYbmL/oXSJiNRhdwiPv4/d6aL8aFj
         eZ+A==
X-Gm-Message-State: AOAM532qEa89jGaxdL3CaxhVDrX0HY08APWBDAGBsrWTZVmSq5A0LLPS
	VVmZSUR6yoYEGlcsH02oNRg4GGlsywAzpQ==
X-Google-Smtp-Source: ABdhPJxCkxxUEK2kWRvMDKKQ7LdrbKDs4AgvKEicWLT8OeRPS6wD1cSc+ad9f+8bw73EVxH+QNmFIA==
X-Received: by 2002:a17:902:ec04:b029:de:9184:7247 with SMTP id l4-20020a170902ec04b02900de91847247mr6078093pld.57.1610905601856;
        Sun, 17 Jan 2021 09:46:41 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:41 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/28] php: remove the failing ${D}/${TMPDIR} code
Date: Sun, 17 Jan 2021 09:46:08 -0800
Message-Id: <cf29a55578192461dd86084c78e32fe8fba73eee.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Max Kellermann <max.kellermann@gmail.com>

Appending ${TMPDIR} to ${D} doesn't make any sense, because both are
absolute paths.  And additionally, the code fails:

 rmdir: failed to remove '/usr/src/oe/tmp-musl/work/core2-64-oe-linux-musl/php/7.1.9-r0/image//usr': Directory not empty

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit f6338892d9c57c51ed48b04f587b468f7718a8ba)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/php_7.4.9.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index cd874d3c8b..fc01ea1953 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -154,7 +154,6 @@ do_install_prepend_class-target() {
 # fixme
 do_install_append_class-target() {
     install -d ${D}${sysconfdir}/
-    rm -rf ${D}/${TMPDIR}
     rm -rf ${D}/.registry
     rm -rf ${D}/.channels
     rm -rf ${D}/.[a-z]*
@@ -178,14 +177,6 @@ do_install_append_class-target() {
             ${D}${systemd_unitdir}/system/php-fpm.service
     fi
 
-    TMP=`dirname ${D}/${TMPDIR}`
-    while test ${TMP} != ${D}; do
-        if [ -d ${TMP} ]; then
-            rmdir ${TMP}
-        fi
-        TMP=`dirname ${TMP}`;
-    done
-
     if ${@bb.utils.contains('PACKAGECONFIG', 'apache2', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/apache2/modules.d
         install -d ${D}${sysconfdir}/php/apache2-php${PHP_MAJOR_VERSION}
-- 
2.17.1

