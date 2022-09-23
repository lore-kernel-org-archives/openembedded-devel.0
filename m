Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A2DC6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 07:16:31 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.4991.1663917387030373091
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Sep 2022 00:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pl3oh1p7;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a26so26037010ejc.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Sep 2022 00:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=gFvOZxDqzEuKg7gg2vUEbGjODN6eQIy1xLKQMgTfhTM=;
        b=pl3oh1p7jWu4kwogDdAmc16jZ2rhbgqqnYtNPkjQuTKDMeKJAPP9TuIfwRE6xzuksG
         XfmRIgu4rtyC/ThkDN++1gBwX1VNYuZ7voZO3bDpqr4qt8c9e0KSAgcwxfr1vOt5NbyO
         aewbFdXG1D4iwzEJd8OfMCyrI8lPXP7OGscAGjcTizDFq3fGebnVlQJWGgrvOVpwgtAZ
         9jQDQhKDH8hEi5CPNaisx2zv0IeDVF9PMLvCKennCRe4SizqF97F1xbElaBQTOkOsSvq
         IStKIbVRjz78KMZLagaHByXDcLgfbqfHXT8C1xadDkPB1bbJmaZ1qb3G93BMtht+bueb
         Olww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=gFvOZxDqzEuKg7gg2vUEbGjODN6eQIy1xLKQMgTfhTM=;
        b=xJMG71J+k1VS1EFPAkW+TKdd+OUEDj1AGFZ9EBUoedRYeBH72xMAYsChHyATYLGCWJ
         Jo7eGxaKZhrd8BaGIFY/wU80aFZDcYvCN6irqLngYX6OfwQLiv516QExi7AMKpo3mlcZ
         LLAfIimaSVco7wUlBbaak/d9ijsEWo/s962c5b3b6aEoi0nNKTLHpwUV2GlpLzmtSk1H
         9aZV6Pj3oaFDsiq+Z2Jqi+HgxsEJgAgnfG5NOMDWKdAUiohauQmp7QUEAf7PYbdUixPv
         Hw3zrCd32Zspnka6i0UnXj5De+cWnnk7h0zP8hpPJlIQce+D57sAtj0CWCH4s3GOjTJB
         jcVA==
X-Gm-Message-State: ACrzQf1P60XbwKmB8GCApKf3M36IV/D2383BnvIeRLn3bei4YHLPq4jC
	GVrZ22hrUQHJbgFXPb/rmL+y6pquCpc=
X-Google-Smtp-Source: 
 AMsMyM6PXTB8XKTlJrtuEKbD7oC1vyNkVoiZyKewQfPXQ77A7xRUjGqnlqesbIunfRnsxIRhrhMsYA==
X-Received: by 2002:a17:907:75ee:b0:77b:c559:2bcc with SMTP id
 jz14-20020a17090775ee00b0077bc5592bccmr5478363ejc.537.1663917385161;
        Fri, 23 Sep 2022 00:16:25 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:230:1a0d:6910:eae7:58:ee6a])
        by smtp.gmail.com with ESMTPSA id
 u17-20020a1709061db100b0074a82932e3bsm3630837ejh.77.2022.09.23.00.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 00:16:24 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] libusbgx: add PACKAGECONFIG to make build
 predicable
Date: Fri, 23 Sep 2022 09:16:13 +0200
Message-Id: <20220923071613.6686-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Sep 2022 07:16:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98940

From: Ming Liu <liu.ming50@gmail.com>

Also introduce a ${PN}-examples subpackage since all binaries get
built only when --enable-examples is set to true, move them into
${PN}-examples package. Another advantage of this change is that now
libusbgx only contains a .so library so the recipes DEPENDs on it wont
involve in unnecessary binaries or systemd/sysvinit scripts.

Also uprev to the latest git hash in master and fix some inconsistent
coding style and an invalid EXTRA_OECONF.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../recipes-support/libusbgx/libusbgx_git.bb  | 29 ++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
index 023f7bfa6..16552fd3b 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
+++ b/meta-oe/recipes-support/libusbgx/libusbgx_git.bb
@@ -3,8 +3,6 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "libconfig"
-
 inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 PV = "0.2.0+git${SRCPV}"
@@ -19,27 +17,38 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE:${PN} = "usbgx.service"
+PACKAGECONFIG ??= "examples gadget-schemes libconfig"
+PACKAGECONFIG[libconfig] = "--with-libconfig=yes,--without-libconfig,libconfig"
+PACKAGECONFIG[examples] = "--enable-examples,--disable-examples"
+PACKAGECONFIG[gadget-schemes] = "--enable-gadget-schemes,--disable-gadget-schemes"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,cmocka"
+
+PACKAGE_BEFORE_PN = "${PN}-examples"
+
+SYSTEMD_PACKAGES = "${PN}-examples"
+SYSTEMD_SERVICE:${PN}-examples = "usbgx.service"
+SYSTEMD_AUTO_ENABLE:${PN}-examples = "${@bb.utils.contains('PACKAGECONFIG', 'examples', 'enable', 'disable', d)}"
 
+INITSCRIPT_PACKAGES = "${PN}-examples"
 INITSCRIPT_NAME = "usbgx"
 INITSCRIPT_PARAMS = "defaults"
-
-EXTRA_OECONF = "--includedir=${includedir}/usbgx"
+INHIBIT_UPDATERCD_BBCLASS = "${@bb.utils.contains('PACKAGECONFIG', 'examples', '1', '0', d)}"
 
 do_install:append() {
     install -Dm 0755 ${WORKDIR}/gadget-start ${D}/${bindir}/gadget-start
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -Dm 0644 ${WORKDIR}/usbgx.service ${D}${systemd_system_unitdir}/usbgx.service
     fi
+
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-		install -Dm 0755 ${WORKDIR}/usbgx.initd ${D}${sysconfdir}/init.d/usbgx
-	fi
+        install -Dm 0755 ${WORKDIR}/usbgx.initd ${D}${sysconfdir}/init.d/usbgx
+    fi
 }
 
-RDEPENDS:${PN} += "libusbgx-config"
+FILES:${PN}-examples = "${bindir}/* ${sysconfdir}/*"
+RDEPENDS:${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG', 'examples', 'libusbgx-config', '', d)}"
 
 ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE:${PN} = "gadget-acm-ecm show-gadgets"
+ALTERNATIVE:${PN}-examples = "${@bb.utils.contains('PACKAGECONFIG', 'examples', 'gadget-acm-ecm show-gadgets', '', d)}"
 ALTERNATIVE_LINK_NAME[gadget-acm-ecm] = "${bindir}/gadget-acm-ecm"
 ALTERNATIVE_LINK_NAME[show-gadgets] = "${bindir}/show-gadgets"
-- 
2.25.1


