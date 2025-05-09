Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF589C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 06:06:41 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.8062.1746770792472137924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 May 2025 23:06:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kw62N5D3;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22fac0694aaso11860175ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 23:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746770792; x=1747375592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzXEerqPqFaenR4XAJn5Yda5pvuDoct3Eg31Uwhx30Q=;
        b=Kw62N5D3ny9o25SVTXPKGuH/vf8yiJ+UjWgz+sfrjVjg/jicOQXvk5bDj1SPQNckON
         TSlaz0oFC394oaGW5Al3LE5vqm9K2y+ZUdiux4nYTGleHmGqsTEw4Fy2siahyq+AJJwA
         vEe5XzqMuOe8vd9r4F4Dj/vkZASavzMxuPEwdfRklli/1zq1o/wChR8wFxWBnurougaC
         qlF6d0KWKB1x9gTOXTllncJ3GHw5M1SuLjYfdByrO7gSvwMljjwmvPB19HtkyqGgwLCk
         XjapS9uCAZ1l0VPMzymMX5vgh005CZFfKvSdIndyYayNkBySGC/tO1GaSccy2evuuUcs
         vdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746770792; x=1747375592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZzXEerqPqFaenR4XAJn5Yda5pvuDoct3Eg31Uwhx30Q=;
        b=pnIoNZXTDMq91uzi5ZBkQcbIbQd9qlzgO6r5oioUCASJ0GtY6KeTX/mxW8kkUHnzWI
         7OowvMtfXdSrPt09zW1KDVHGq7nIgAGyo7v5BmyDKnNZw8oejnGFjLs+LwVwxiMwvyz6
         e/Q7Tkfsy8ei38BMy49FlK/hZGTC7scqfcoAcjggqyHvHWYcYhn5qtNPl9EcUZqBR41K
         B438yrF9B2pSLkl7J3O1Ul/HvY6UU1cwNg4GxMtUUNzSPUuTx4c33lkFMzo3XXwsgg3s
         zYBs0EEBk1v6BWugqjuKRmvogEfjy/cV9XD0H1uVUNe/sMl1FnilU+GJwy2r9GvvP+yD
         8IlQ==
X-Gm-Message-State: AOJu0Ywf6dx6yYfleQ1nOufVEzDjwL6GIdVbut+g1sFHK7HzYUv1n8tb
	sQIMS9OgjJRBwNWNnGbQh4EI2TiJ8Vn4PTMTqYANCEjIq28ICTc4J6a8RB+T
X-Gm-Gg: ASbGncvwbVTHo1k74sNUFjt22ZQvcUIoXSjcfeQ5DvJlkRQjnklAJ1kDhHHYAMqXyz7
	JK06OQZdImjz52U7EqlstrScTyGJ7UG/VyGE/GYv6S8/PwUcIvoDRsqJYq8OCm+MFkOMIX4PHvS
	z2cjppgGPyKri9hZ4Svzj/fa3ujibt1xY12L/hUnn0khVK0wgOsRC/+isGUaUtiawU5PxfEc9cy
	GhV96wGhYwNcXUzI/H8xMNYUaeRX8sPYkJgfCc2H2rtOlakZ1C6uZGwW2aKd8iSqz2G9CQ1cxXe
	7KQp3DjX8ZuRyHh4HVT2RfQkCplam/mL
X-Google-Smtp-Source: AGHT+IFe7miAGz6L+WceQ3NcPLRNmq61D030jEg7z2ls3zUTUattQvE9RjHZDzWQjJguBQIOcn+lcg==
X-Received: by 2002:a17:902:f78e:b0:22e:8354:dc8a with SMTP id d9443c01a7336-22fc8e99da3mr32776195ad.37.1746770791438;
        Thu, 08 May 2025 23:06:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82bfc20sm9509955ad.256.2025.05.08.23.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:06:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] cockpit: Upgrade to 337
Date: Thu,  8 May 2025 23:06:28 -0700
Message-ID: <20250509060628.1082632-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 May 2025 06:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117373

Get rid of remoeved configure options

ERROR: QA Issue: cockpit: configure was passed unrecognised options: --disable-pcp --enable-old-bridge --with-cockpit-ws-instance-user --disable-ssh --disable-polkit --with-cockpit-ws-instance-group --with-cockpit-group --with-cockpit-user [unknown-configure-option]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{cockpit_304.bb => cockpit_337.bb}        | 40 ++++++++++---------
 1 file changed, 22 insertions(+), 18 deletions(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_304.bb => cockpit_337.bb} (82%)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
similarity index 82%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
index edd51bc671..29bb771cd2 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
     file://cockpit.pam \
     "
-SRC_URI[sha256sum] = "a87d090c930e2058bb3e970ca7f2bafe678687966b5c0b8b42a802977e391ce9"
+SRC_URI[sha256sum] = "df51ef5920fae69e1b435f657376aa93772c0c1720b954a3bac10ebba26bfedf"
 
 inherit gettext pkgconfig autotools systemd features_check
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3targetconfig', d)}
@@ -28,11 +28,7 @@ COCKPIT_WS_USER_GROUP ?= "${COCKPIT_USER_GROUP}"
 
 EXTRA_AUTORECONF = "-I tools"
 EXTRA_OECONF = " \
-    --with-cockpit-user=${COCKPIT_USER_GROUP} \
-    --with-cockpit-group=${COCKPIT_USER_GROUP} \
     --with-admin-group=${COCKPIT_USER_GROUP} \
-    --with-cockpit-ws-instance-user=${COCKPIT_WS_USER_GROUP} \
-    --with-cockpit-ws-instance-group=${COCKPIT_WS_USER_GROUP} \
     --disable-doc \
     --with-systemdunitdir=${systemd_system_unitdir} \
     --with-pamdir=${base_libdir}/security \
@@ -40,14 +36,12 @@ EXTRA_OECONF = " \
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
-    old-bridge \
 "
 
-PACKAGECONFIG[pcp] = "--enable-pcp,--disable-pcp,pcp"
-PACKAGECONFIG[dashboard] = "--enable-ssh,--disable-ssh,libssh"
-PACKAGECONFIG[storaged] = ",,,udisks2"
-PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit"
-PACKAGECONFIG[old-bridge] = "--enable-old-bridge"
+PACKAGECONFIG[pcp] = ",,pcp"
+PACKAGECONFIG[dashboard] = ",,libssh"
+PACKAGECONFIG[storaged] = ",,udisks2"
+PACKAGECONFIG[polkit] = ",,polkit"
 
 PACKAGES =+ " \
     ${PN}-pcp \
@@ -83,27 +77,28 @@ FILES:${PN}-systemd = "${datadir}/cockpit/systemd"
 FILES:${PN}-users = "${datadir}/cockpit/users"
 FILES:${PN}-kdump = " \
     ${datadir}/cockpit/kdump \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-kdump.metainfo.xml \
+    ${datadir}/metainfo/org.cockpit_project.cockpit_kdump.metainfo.xml \
 "
 FILES:${PN}-sosreport = " \
     ${datadir}/cockpit/sosreport \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-sosreport.metainfo.xml \
+    ${datadir}/metainfo/org.cockpit_project.cockpit_sosreport.metainfo.xml \
     ${datadir}/pixmaps/cockpit-sosreport.png \
+    ${datadir}/icons/hicolor/64x64/apps/cockpit-sosreport.png \
 "
 FILES:${PN}-storaged = " \
     ${datadir}/cockpit/storaged \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-storaged.metainfo.xml \
+    ${datadir}/metainfo/org.cockpit_project.cockpit_storaged.metainfo.xml \
 "
 
 FILES:${PN}-networkmanager = " \
     ${datadir}/cockpit/networkmanager \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-networkmanager.metainfo.xml \
+    ${datadir}/metainfo/org.cockpit_project.cockpit_networkmanager.metainfo.xml \
 "
 RDEPENDS:${PN}-networkmanager = "networkmanager"
 
 FILES:${PN}-selinux = " \
     ${datadir}/cockpit/selinux \
-    ${datadir}/metainfo/org.cockpit-project.cockpit-selinux.metainfo.xml \
+    ${datadir}/metainfo/org.cockpit_project.cockpit_selinux.metainfo.xml \
 "
 FILES:${PN}-playground = "${datadir}/cockpit/playground"
 FILES:${PN}-dashboard = "${datadir}/cockpit/dashboard"
@@ -143,6 +138,9 @@ FILES:${PN}-ws = " \
     ${systemd_system_unitdir}/cockpit-wsinstance-https@.socket \
     ${systemd_system_unitdir}/cockpit-wsinstance-https@.service \
     ${systemd_system_unitdir}/system-cockpithttps.slice \
+    ${systemd_system_unitdir}/cockpit-session-socket-user.service \
+    ${systemd_system_unitdir}/cockpit-wsinstance-socket-user.service \
+    ${systemd_system_unitdir}/cockpit-issue.service \
     ${libdir}/tmpfiles.d/cockpit-tempfiles.conf \
     ${sbindir}/remotectl \
     ${base_libdir}/security/pam_ssh_add.so \
@@ -169,7 +167,8 @@ FILES:${PN} += " \
     ${datadir}/cockpit/ssh \
     ${libexecdir}/cockpit-ssh \
     ${datadir}/cockpit \
-    ${datadir}/metainfo/cockpit.appdata.xml \
+    ${datadir}/icons/hicolor/128x128/apps/cockpit.png \
+    ${datadir}/metainfo/org.cockpit_project.cockpit.appdata.xml \
     ${datadir}/pixmaps/cockpit.png \
     ${nonarch_libdir}/tmpfiles.d \
     ${nonarch_libdir}/firewalld \
@@ -187,7 +186,12 @@ do_install:append() {
     install -p -m 0644 ${UNPACKDIR}/cockpit.pam ${D}${sysconfdir}/pam.d/cockpit
 
     # provided by firewalld
-    rm -rf ${D}${libdir}/firewalld
+    rm -rf ${D}${libdir}/firewalld \
+    ${D}${PYTHON_SITEPACKAGES_DIR}/*/__pycache__ \
+    ${D}${PYTHON_SITEPACKAGES_DIR}/*/*/__pycache__ \
+    ${D}${PYTHON_SITEPACKAGES_DIR}/*/*/*/__pycache__ \
+    ${D}${PYTHON_SITEPACKAGES_DIR}/*/*/*/*/__pycache__ \
+    ${D}${PYTHON_SITEPACKAGES_DIR}/${BP}.dist-info/direct_url.json
 
     if ! ${@bb.utils.contains('PACKAGECONFIG', 'storaged', 'true', 'false', d)}; then
         for filename in ${FILES:${PN}-storaged}

