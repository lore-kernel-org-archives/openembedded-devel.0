Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF44C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 16:25:53 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.10504.1651076743958288944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 09:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S/cvVrQd;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id t13so1837039pgn.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 09:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DxtnCx2TzVzl1Wl/RMQ7iFQMzKvDmge0jIr/ifpPQTQ=;
        b=S/cvVrQd4RJfArB1uoPuh2RidRN/1/pZ/zDx4QCL6I3HvpMU7xghL8d/lQRGdqHkDM
         z+waXOZYXFOcGH+HB/6HaCJI9jrnrVP9roT86/v85TILhOCUgHYQOPapzYmlUXfMDCms
         6MyC9QdbfpCi+jMPxGoGlnr1py90eFpM5bzFvVMjF1zFXmvZlzAaJ3dFzs3yCVLrYn9Y
         sEgEsBbNLpzGntw/CtOh0Hv/EBJyiy7ROa4l6HSWw/yP/6jYqqVsOlevdIVvUenli3sj
         9P60H2rxuHdejs0g2c4ScN1s/IJflMxTivZVqQzKwkLa2f9LadGyOldiXdE3iRSAjBQc
         cHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DxtnCx2TzVzl1Wl/RMQ7iFQMzKvDmge0jIr/ifpPQTQ=;
        b=kOAca1twJ9y9jRxJYWuN8fRcfLmaVHylHmae3U1qMJHyF0ns0xsc8FZcaKcDAKfaGD
         FBR3vxSLLUmoXyGXxoa0h3ilqXTaTxLcdCoQVOYAHc1pszsJ9CKAEzn+2BUtr7eHc7D9
         Oe5Vlt4vCttjCqIiEyEhxAvJs1Tc2DlmDfdD24cvUwVi64mLMXV9Fw9c2d+eq3oK0PeZ
         PR8MIYw+SqWlT3IdRR1BteN8tPG2zJJgCbmBHAV0IrOQjdCACg0oz0n4JjCsToM2g1Hb
         /DURd7d9pnykbtDxmzvIQd4maXlcoanHIh6hwWp0oO4E+V3QHkfC66T0hmC5GtXovvmS
         IARg==
X-Gm-Message-State: AOAM533YPZ4XYioiifSzrsu1JY/8Byn7LT4zXrExVUEzcjlgVYIFIorE
	TFU5sxnHPvXTrrigb0QEy5w/U7/D1WC24Q==
X-Google-Smtp-Source: 
 ABdhPJyfFHhAGytazPEUCSxHLqqkbeRIARXz7JDg0gGSyAV4mPhIZ6fTI/rLO7pUSZhos1cPJRkVJQ==
X-Received: by 2002:a05:6a00:1a49:b0:505:7ab3:e5c7 with SMTP id
 h9-20020a056a001a4900b005057ab3e5c7mr30813337pfv.62.1651076743029;
        Wed, 27 Apr 2022 09:25:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 9-20020a17090a034900b001d7e6226b3csm3520858pjf.27.2022.04.27.09.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 09:25:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] boinc-client: Make script install not depend on host
 install paths
Date: Wed, 27 Apr 2022 09:25:39 -0700
Message-Id: <20220427162539.2428673-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Apr 2022 16:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96812

The install target is checking for install paths on build host assuming
thats where it will run too, which breaks cross builds. Add a patch to
aide the install from recipe.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Do-not-check-for-files-on-build-host.patch | 52 +++++++++++++++++++
 .../boinc/boinc-client_7.18.1.bb              | 18 +++----
 2 files changed, 60 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/0001-scripts-Do-not-check-for-files-on-build-host.patch

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/0001-scripts-Do-not-check-for-files-on-build-host.patch b/meta-oe/recipes-extended/boinc/boinc-client/0001-scripts-Do-not-check-for-files-on-build-host.patch
new file mode 100644
index 0000000000..6d9e94cb8a
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client/0001-scripts-Do-not-check-for-files-on-build-host.patch
@@ -0,0 +1,52 @@
+From 8a8305c78143438e2bd497d55188a0da3442db08 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 27 Apr 2022 09:11:38 -0700
+Subject: [PATCH] scripts: Do not check for files on build host
+
+This will result in varied behaviour depending upon what kind of host is
+used to build it. We dont want that. Instead check for these files and
+dirs in staging area and create these markers in recipe via a
+do_install_prepend to aide install piece a bit here ( systemd vs
+sysvinit ) etc.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ client/scripts/Makefile.am | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/client/scripts/Makefile.am b/client/scripts/Makefile.am
+index 2a53203d84..62a0defa93 100644
+--- a/client/scripts/Makefile.am
++++ b/client/scripts/Makefile.am
+@@ -2,21 +2,21 @@
+ 
+ install-exec-hook:
+ 	chmod +x boinc-client
+-	if [ -d /etc/init.d ] ; then \
++	if [ -d $(DESTDIR)/etc/init.d ] ; then \
+ 		$(INSTALL) -d $(DESTDIR)$(sysconfdir)/init.d ; \
+ 		$(INSTALL) -b boinc-client $(DESTDIR)$(sysconfdir)/init.d/boinc-client ; \
+ 	fi
+-	if [ -d /usr/lib/systemd/system ] ; then \
++	if [ -d $(DESTDIR)/usr/lib/systemd/system ] ; then \
+ 		$(INSTALL) -d $(DESTDIR)/usr/lib/systemd/system/ ; \
+ 		$(INSTALL_DATA) boinc-client.service $(DESTDIR)/usr/lib/systemd/system/boinc-client.service ; \
+-	elif [ -d /lib/systemd/system ] ; then \
++	elif [ -d $(DESTDIR)/lib/systemd/system ] ; then \
+ 		$(INSTALL) -d $(DESTDIR)/lib/systemd/system/ ; \
+ 		$(INSTALL_DATA) boinc-client.service $(DESTDIR)/lib/systemd/system/boinc-client.service ; \
+ 	fi
+-	if [ -d /etc/sysconfig ] ; then \
++	if [ -d $(DESTDIR)/etc/sysconfig ] ; then \
+ 	  $(INSTALL) -d $(DESTDIR)$(sysconfdir)/sysconfig ; \
+ 	  $(INSTALL_DATA) $(srcdir)/boinc-client.conf $(DESTDIR)$(sysconfdir)/sysconfig/boinc-client ; \
+-	elif [ -d /etc/default ] ; then \
++	elif [ -d $(DESTDIR)/etc/default ] ; then \
+ 	  $(INSTALL) -d $(DESTDIR)$(sysconfdir)/default ; \
+ 	  $(INSTALL_DATA) $(srcdir)/boinc-client.conf $(DESTDIR)$(sysconfdir)/default/boinc-client ; \
+ 	else \
+-- 
+2.36.0
+
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
index abcb304d30..8f85a508e7 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
            file://gtk-configure.patch \
            file://4563.patch \
+           file://0001-scripts-Do-not-check-for-files-on-build-host.patch \
 "
 
 inherit gettext autotools pkgconfig features_check systemd
@@ -75,17 +76,14 @@ do_compile:prepend () {
 	sed -i -e 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${B}/libtool
 }
 
-do_install:append() {
-	if ! ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)} -a \
-            -e ${D}${nonarch_libdir}/systemd/system/boinc-client.service; then
-		install -d ${D}${systemd_system_unitdir}
-		mv \
-		${D}${nonarch_libdir}/systemd/system/boinc-client.service \
-		${D}${systemd_system_unitdir}/boinc-client.service
-		rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/systemd/system \
-		${D}${nonarch_libdir}/systemd \
-		${D}${nonarch_libdir}
+do_install:prepend() {
+	# help script install a bit to do right thing for OE
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		mkdir -p ${D}${systemd_system_unitdir}
+	else
+		mkdir -p ${D}${sysconfdir}/init.d
 	fi
+	mkdir -p ${D}${sysconfdir}/default
 }
 
 SYSTEMD_SERVICE:${PN} = "boinc-client.service"
-- 
2.36.0


