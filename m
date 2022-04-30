Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343CBC433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:31 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.25983.1651346370185193581
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S++6fu3p;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id j6so9447053pfe.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=02Zll4jES9SLzF4+ZKpO8hfJzsfWeol1G3hMuLnljdU=;
        b=S++6fu3p8vcPR/ZB0C9jjSyOYML/iHJHqorW+Iu6DsKmxTiB1r1TvyPJLRwOFNOIMV
         rcsx2nPJKavaYPt62GxlbGjqkKu8tl+HZRIqRprAq7bSxcYgZA4VBwhjKkF1HaR2XpFi
         Wc+T3cZt5fk8tivy4/U5NHcWtlPXfgrPM+VRS33bjrzXyvq3bUQeXDb4pqylG2vnLLSw
         eIqqE/2ASUExT5VTDD9cQ4nPH7ixvUYoYZyJjYU/bLDDP4E1PyJdh10Do4LC15pyuOPh
         AoBU+mVL+oPpGkLlKMAbsQCc0UI5wpGPodRNI6OgT4K7WEeUePpBvE9rA+XIalVfCaoj
         BC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=02Zll4jES9SLzF4+ZKpO8hfJzsfWeol1G3hMuLnljdU=;
        b=W1GMVRE1wkh3n0LTQQtY+LchsOZdpgdAa4rlCeUwA2X4GzhuEr/GXpUGuAfp+bEKrD
         EvI1U0hLNQWcPrgAuv49GfGNARl+12W4NmFBoiVj/sNqbAH4mqIGt6Zpt1pK+GV9JCSv
         AEK2qEAhl4b194oIFmWAH/xU9aetFUUD+pZ6wO3bWWgjj4tWEgTYAzGUOQ41hVEBueuT
         3AteRe6p+YfeOpuzxP7Bph+XQwygySrL/yuTMU6GvOhhrHbSSQcDTVTZhWCHNhOOsEPg
         TqUHo9Ors8lw6WFtqTsoWtuwl1M69UfaMCkfgCLGtQKy3gGQkK68c9lFTjZHge7B0j7k
         gxsQ==
X-Gm-Message-State: AOAM5301ifTcpDcaqOrn3xvFUQ+ypYUlpbCBNMbPWWgXDSz19mzBbyqI
	0mO2Y2sommMcYDeE1Fs1CZpmCcBMZalqOw==
X-Google-Smtp-Source: 
 ABdhPJyunXcVGNn632eEs+P0ddxrn7nrD2PdQKxeUx44QEz5hW5t9Xo6+QbWcH/4c8/eLHE8W1dLnw==
X-Received: by 2002:a63:d908:0:b0:3c1:f140:c1a4 with SMTP id
 r8-20020a63d908000000b003c1f140c1a4mr1107896pgg.393.1651346369358;
        Sat, 30 Apr 2022 12:19:29 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 39/39] boinc-client: Make script install not depend on
 host install paths
Date: Sat, 30 Apr 2022 12:18:19 -0700
Message-Id: 
 <3b4da37a947c6ea244061929e7c457d02f34f748.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96906

From: Khem Raj <raj.khem@gmail.com>

The install target is checking for install paths on build host assuming
thats where it will run too, which breaks cross builds. Add a patch to
aide the install from recipe.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bbc6fa72c378c792bdae35cae9b6ff165ee196c9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


