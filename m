Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857DDC433F5
	for <webhook@archiver.kernel.org>; Sun,  2 Jan 2022 10:54:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.11387.1641120886969885346
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jan 2022 02:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ceqHEZet;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso16932362wme.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jan 2022 02:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ch3pbVvY/MZ/v2OGUYnF7vpayIRnlNHClrLBkkogvz4=;
        b=ceqHEZetQrN2rgAnH6vA5xamf98y4iLW41zXGPIKQMHYnb+AncS33pPQaFjyKiWKtl
         lyw7CcveHh4plVObJWbWA9lw/mcdmPXFO86ueK1Q7StuagdlJCkfDuTARXJMIh1FSj61
         Kru2hchTMj7aL+EGtYZj1G6UqN9iVxOHIlTpLUMkXoQXOZ8LSnZCUsdcAYDRkMjLVHMc
         qgdoGmmM/TQdoLvnF6DzIr89TI4lnazO+VmqjTfb6zWQZXoI7LR1FhskMVk3zmXDllna
         085Sehx+H6mFYl0hO7r8S7BfqN0zQDKx9o7s9N6x+XalEGX9eOLfecK772FSGD5tgtnt
         8TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ch3pbVvY/MZ/v2OGUYnF7vpayIRnlNHClrLBkkogvz4=;
        b=nIIQWQSavIfUGyNeU2wwCzEbpWRfaXV7zTGjwhyxE9FBn7CCKT3blv2rbkfUUgkMmT
         FnhojsQapg7wzrt1xWbpuUABUBbQabgbZTdDsERh9eEYGP9M+CwtPrLcN/DGIXx/aFgU
         vX27PFzLV8gJ6aCs/8iMcSDGkcEHCM7+k6bEUcCkKJBcNZ2HtOEwreQOewy405uVIM5z
         71uZypX9e/9Jgp0ypLkx+7RaH3vQiXWbe9kwq/V9OM0mT5591S2nmqPfPz6qP9KX0G8u
         TlG/Bs24cU5Z3DP51rADKPhzyZFZ45tz3ZC0qC6oB1cfxvETmP6C4ij3IN2H4wsgzBMG
         jzAA==
X-Gm-Message-State: AOAM5336kdAsix/GoPBFfRCnSMPOZN9+1zVY+7xL3gtE6JeKn7COdMUu
	jxbirQceEKdD2dPIzo/Lxaxp0kimb0Q=
X-Google-Smtp-Source: 
 ABdhPJwHTlAuVqOmAvP2ifh/u2Bl7cD+Bsl6HPKqrVvzgM9bsiJ8U3eORK43gMXKTm5b2yy25H9LjQ==
X-Received: by 2002:a05:600c:643:: with SMTP id
 p3mr35017798wmm.130.1641120885094;
        Sun, 02 Jan 2022 02:54:45 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 c2sm35371349wri.50.2022.01.02.02.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 02:54:44 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] ifupdown-ng: Add recipe
Date: Sun,  2 Jan 2022 10:54:13 +0000
Message-Id: <20220102105412.17013-1-alexk@zuma.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Jan 2022 10:54:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94642

ifupdown-ng is a network device manager that is largely compatible with
Debian ifupdown, BusyBox ifupdown and Cumulus Networks' ifupdown2.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 ...w-sbin-to-be-overridden-for-usrmerge.patch | 42 +++++++++++++++++
 .../ifupdown-ng/ifupdown-ng_0.11.3.bb         | 47 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 meta-networking/recipes-support/ifupdown-ng/ifupdown-ng/0001-build-Allow-sbin-to-be-overridden-for-usrmerge.patch
 create mode 100644 meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11.3.bb

diff --git a/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng/0001-build-Allow-sbin-to-be-overridden-for-usrmerge.patch b/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng/0001-build-Allow-sbin-to-be-overridden-for-usrmerge.patch
new file mode 100644
index 000000000000..7738eea19f1e
--- /dev/null
+++ b/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng/0001-build-Allow-sbin-to-be-overridden-for-usrmerge.patch
@@ -0,0 +1,42 @@
+From 8df83410c0db4a9688c76529d9396859a8cf25a7 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Thu, 30 Dec 2021 17:35:22 +0000
+Subject: [PATCH] build: Allow /sbin to be overridden for usrmerge
+
+To support usrmerge installation in Yocto, make SBINDIR a variable which
+can be overridden.
+
+Upstream-Status: Submitted [https://github.com/ifupdown-ng/ifupdown-ng/pull/164]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+---
+ Makefile | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9fb6199a5e80..527fbd7a911f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -7,6 +7,7 @@ PACKAGE_NAME := ifupdown-ng
+ PACKAGE_VERSION := 0.11.3
+ PACKAGE_BUGREPORT := https://github.com/ifupdown-ng/ifupdown-ng/issues/new
+ 
++SBINDIR := /sbin
+ 
+ INTERFACES_FILE := /etc/network/interfaces
+ STATE_FILE := /run/ifstate
+@@ -146,9 +147,9 @@ check: ${LIBIFUPDOWN_LIB} ${CMDS}
+ 	kyua test || (kyua report --verbose && exit 1)
+ 
+ install: all
+-	install -D -m755 ${MULTICALL} ${DESTDIR}/sbin/${MULTICALL}
++	install -D -m755 ${MULTICALL} ${DESTDIR}${SBINDIR}/${MULTICALL}
+ 	for i in ${CMDS}; do \
+-		ln -s /sbin/${MULTICALL} ${DESTDIR}/sbin/$$i; \
++		ln -s ${SBINDIR}/${MULTICALL} ${DESTDIR}${SBINDIR}/$$i; \
+ 	done
+ 	for i in ${EXECUTOR_SCRIPTS}; do \
+ 		install -D -m755 executor-scripts/${LAYOUT}/$$i ${DESTDIR}${EXECUTOR_PATH}/$$i; \
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11.3.bb b/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11.3.bb
new file mode 100644
index 000000000000..0b815c07f047
--- /dev/null
+++ b/meta-networking/recipes-support/ifupdown-ng/ifupdown-ng_0.11.3.bb
@@ -0,0 +1,47 @@
+SUMMARY = "Flexible ifup/ifdown implementation"
+DESCRIPTION = "ifupdown-ng is a network device manager that is largely \
+compatible with Debian ifupdown, BusyBox ifupdown and Cumulus Networks' \
+ifupdown2."
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=451f521abe917914139c9739ea0f2bc5"
+
+DEPENDS = "libbsd"
+
+PV .= "+git${SRCPV}"
+
+SRC_URI = "git://github.com/ifupdown-ng/ifupdown-ng.git;protocol=https;branch=main \
+           file://0001-build-Allow-sbin-to-be-overridden-for-usrmerge.patch \
+"
+SRCREV = "e978d1a42c1fe6978ba55aaa733fcda3a7dc3717"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig update-alternatives
+
+LIBBSD_CFLAGS = "`pkg-config --cflags libbsd-overlay`"
+LIBBSD_LIBS = "`pkg-config --cflags --libs libbsd-overlay`"
+
+EXTRA_OEMAKE = "\
+    CC='${CC} ${CFLAGS} ${LDFLAGS}' \
+    LD='${LD} ${LDFLAGS}' \
+    SBINDIR='${base_sbindir}' \
+    LIBBSD_CFLAGS='${LIBBSD_CFLAGS}' \
+    LIBBSD_LIBS='${LIBBSD_LIBS}' \
+    INTERFACES_FILE='${sysconfdir}/network/interfaces' \
+    CONFIG_FILE='${sysconfdir}/network/ifupdown-ng.conf' \
+    EXECUTOR_PATH='${libexecdir}/${BPN}' \
+"
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+}
+
+ALTERNATIVE_PRIORITY = "120"
+ALTERNATIVE:${PN} = "ifup ifdown"
+
+ALTERNATIVE_LINK_NAME[ifup] = "${base_sbindir}/ifup"
+ALTERNATIVE_LINK_NAME[ifdown] = "${base_sbindir}/ifdown"
-- 
2.34.1


