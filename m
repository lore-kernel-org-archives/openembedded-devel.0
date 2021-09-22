Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.248.1632333293613116368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 10:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IizetA/M;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id v22so12601783edd.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AgCcjlzaExv9aX91yZAvkPayiMCY0xF2zCs5Pf/xns=;
        b=IizetA/MahVYL34YeAASQn7cEtrLlKVnpXXUuRjuL5XBUE8YjlCFVPyP2CWcgFN7ty
         p7/S8cbKpkiSimelCuQ5wPz4L9FNSH0/lq3wvtiQpCEGaubGS2eTAqcSKfR0lUL8eRE3
         dDUZFGAnx8a7iYMEqyz1n94HKeitEpzZbZ0UrbNdai6v6hXuSp182/PhcxgCl1Voii79
         lWRBgTxcPP9THzKeBs48nTllYiVtm/ZFNJDEmkDzVzXLoAcxiDdcgCRFMDSwiPKfWzrx
         iZmgFsWevk0qIyclYm++otwYuJn2HtVWZn2/p8iQ0Zqh2ilBaP4S+WopjXFuQYXALy/+
         tOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+AgCcjlzaExv9aX91yZAvkPayiMCY0xF2zCs5Pf/xns=;
        b=BAmpQvQFJ+Spfqt3nnQMyfCPvJydnyHj6lpTpB+FjI586APDIw/XPpJAlgV9eLlPx6
         L1FLBB9QghM4DahUZboMZyJDbPUhghE1k/KB5CPDiF50rAXgdqUpu2Vxo4A/G/oKYa/N
         ry2MqMCg+xzRo6HWJkrmQQyz089RIjRJcw5OFP8WpDxDeCEm8N6M2xp3aRfMoLmleFL+
         EASKw4sk+QJ+DBje8DdfPOZFD3ecWlDZ0Z7AVF7/XTVC7FlenAlH/Q46wcNVlz/n9RGp
         6QAEaiw5FaXlvDAPJ5YT83xJrkxm8DzMztoixbSaXTEB3sCl+UUewsVRPAt3QJemOt3w
         Nc1g==
X-Gm-Message-State: AOAM533m0jfd0cVtyGqw1bmVrBtwz2rsxKVOgLMp8zraFL1waZsVN0t8
	+k+oTxkMIxrrB5eQD43lntHKYnfN04o=
X-Google-Smtp-Source: ABdhPJymwQbZZI/8KFihb+Q7XnDk2Pt0M9HDXc8NLNpZk95m/aXNIiyJEfglS3UYbAJwuZP78RdTxg==
X-Received: by 2002:aa7:d392:: with SMTP id x18mr669915edq.334.1632333291220;
        Wed, 22 Sep 2021 10:54:51 -0700 (PDT)
Return-Path: <jan.vermaete@gmail.com>
Received: from localhost.localdomain (78-20-166-56.access.telenet.be. [78.20.166.56])
        by smtp.googlemail.com with ESMTPSA id b3sm1313056ejb.7.2021.09.22.10.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 10:54:50 -0700 (PDT)
From: "jan" <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH v2] netdata: Fixed the recipe (v2).
Date: Wed, 22 Sep 2021 19:54:32 +0200
Message-Id: <20210922175432.2907192-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netdata website was not accessable due to some (changed) permissions.
The systemd service file will start netdata deamon with the netdata user.
The netdata group as existing, but the netdata user was missing.

I moved some directory creations from systemd to the bitbake recipe.

The project website address changed too.

Removed the creation of the pid file in the service of systemd.
Netdata itself has an option to create the pid file.  Because it's an
options, it's probably also not needed in systemd.

Tested with meta-raspberrypi on rpi4-32.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/netdata/netdata.service           | 12 +++++++-----
 .../recipes-webadmin/netdata/netdata_git.bb   | 19 ++++++++++++++-----
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
index b244d1866..ca13f7287 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
@@ -1,13 +1,15 @@
+# SPDX-License-Identifier: GPL-3.0-or-later
 [Unit]
-Description=Netdata, Real-time performance monitoring
+Description=Real time performance monitoring
 RequiresMountsFor=/var
+After=network.target
 
 [Service]
-User=root
+Type=simple
 ExecStartPre=/bin/mkdir -p /var/log/netdata
-ExecStartPre=/bin/chown -R nobody.netdata @@datadir/netdata/web
-ExecStartPre=/bin/chown -R nobody.netdata /var/cache/netdata
-ExecStart=/usr/sbin/netdata -nd
+ExecStartPre=/bin/chown -R netdata.netdata /var/log/netdata
+ExecStart=/usr/sbin/netdata -D -u netdata
+
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index 7c48b8a37..7ec989815 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -1,17 +1,19 @@
-HOMEPAGE = "https://github.com/firehol/netdata/"
+HOMEPAGE = "https://github.com/netdata/netdata/"
 SUMMARY = "Real-time performance monitoring"
+DESCRIPTION = "Netdata is high-fidelity infrastructure monitoring and troubleshooting. \
+               Open-source, free, preconfigured, opinionated, and always real-time."
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-SRC_URI = "git://github.com/firehol/netdata.git;protocol=https"
+SRC_URI:append = " git://github.com/firehol/netdata.git;protocol=https"
 SRCREV = "1be9200ba8e11dc81a2101d85a2725137d43f766"
 PV = "1.22.1"
 
 # default netdata.conf for netdata configuration
-SRC_URI += "file://netdata.conf"
+SRC_URI += " file://netdata.conf"
 
 # file for providing systemd service support
-SRC_URI += "file://netdata.service"
+SRC_URI += " file://netdata.service"
 
 S = "${WORKDIR}/git"
 
@@ -31,7 +33,7 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 
 #User specific
 USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM:${PN} = "--system netdata"
+USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata --user-group netdata"
 
 do_install:append() {
     #set S UID for plugins
@@ -50,6 +52,13 @@ do_install:append() {
     sed -i -e 's,@@sysconfdir,${sysconfdir},g' ${D}${sysconfdir}/netdata/netdata.conf
     sed -i -e 's,@@libdir,${libexecdir},g' ${D}${sysconfdir}/netdata/netdata.conf
     sed -i -e 's,@@datadir,${datadir},g' ${D}${sysconfdir}/netdata/netdata.conf
+
+    install --group netdata --owner netdata --directory ${D}${localstatedir}/cache/netdata
+    install --group netdata --owner netdata --directory ${D}${localstatedir}/lib/netdata
+
+    chown -R netdata:netdata ${D}${datadir}/netdata/web
 }
 
+FILES_${PN} += "${localstatedir}/cache/netdata/ ${localstatedir}/lib/netdata/"
+
 RDEPENDS:${PN} = "bash zlib"
-- 
2.25.1

