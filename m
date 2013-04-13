Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQytF-0004dl-2C
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 13:45:23 +0200
Received: by mail-ee0-f49.google.com with SMTP id l10so1573678eei.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=AUQ03hc3ZMgmzueiZT5sRk/yLmna751SQWjGtGz2SSs=;
	b=Xva+R5VQhlBYvN114gGHClp3KPwOERczk2qUDiUhr71RpxFCqagCbdWnNzeo/zzd09
	u6mODlH7nQVr+DI7yMxWHIXddUEehD8OUWl+mhpt+Z2ooaOM3CUm9n8M1MrdyUWrcdu/
	8Z1qy9uuwdbI5sr5hm6FXaTpVL4CqOV24ox7VDGkIldgt/X/nO+oww+ndKNr8AhuaRpO
	LQ1tBVrwEuduzJ1hxiV9X7pmBPfTltkc8B/lLaIo9lphZr/T/do8NEDAoPvMQTda/WzA
	3IDyqRmhR3NVwN/6gV7ahF/svyV0CYByuFW3QuwQs8CnUpHomY8OgfR+NDijiSGmYKsz
	ZNig==
X-Received: by 10.14.210.132 with SMTP id u4mr38369145eeo.19.1365852458980;
	Sat, 13 Apr 2013 04:27:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bj2sm16014923eeb.1.2013.04.13.04.27.37
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 04:27:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 13:27:36 +0200
Message-Id: <1365852460-3361-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-systemd][PATCH 1/5] entrance: move systemd support from meta-systemd back to meta-efl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 11:45:36 -0000

---
 .../recipes-efl/efl/entrance/entrance.service       |  0
 meta-efl/recipes-efl/efl/entrance_svn.bb            | 19 ++++++++++++++++++-
 meta-systemd/conf/layer.conf                        |  2 --
 .../meta-efl/recipes-efl/efl/entrance_svn.bbappend  | 21 ---------------------
 4 files changed, 18 insertions(+), 24 deletions(-)
 rename {meta-systemd/meta-efl => meta-efl}/recipes-efl/efl/entrance/entrance.service (100%)
 delete mode 100644 meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend

diff --git a/meta-systemd/meta-efl/recipes-efl/efl/entrance/entrance.service b/meta-efl/recipes-efl/efl/entrance/entrance.service
similarity index 100%
rename from meta-systemd/meta-efl/recipes-efl/efl/entrance/entrance.service
rename to meta-efl/recipes-efl/efl/entrance/entrance.service
diff --git a/meta-efl/recipes-efl/efl/entrance_svn.bb b/meta-efl/recipes-efl/efl/entrance_svn.bb
index 585d552..02eb64b 100644
--- a/meta-efl/recipes-efl/efl/entrance_svn.bb
+++ b/meta-efl/recipes-efl/efl/entrance_svn.bb
@@ -4,18 +4,35 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "e/apps"
 
-inherit e gettext
+inherit e gettext systemd
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
   file://0001-pam-use-common-auth-instead-of-system-auth.patch \
+  file://entrance.service \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
 
+PR = "r4"
 PV = "0.0.4+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
 RDEPENDS_${PN} += "${PN}-themes sessreg xauth"
 CONFFILES_${PN} += "${sysconfdir}/entrance.conf"
+
 RCONFLICTS_${PN} += "xserver-nodm-init"
 RREPLACES_${PN} += "xserver-nodm-init"
+
+RCONFLICTS_${PN} += "xserver-nodm-init-systemd"
+RREPLACES_${PN} += "xserver-nodm-init-systemd"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+
+SYSTEMD_SERVICE_${PN} = "entrance.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/entrance.service ${D}${systemd_unitdir}/system
+}
diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
index d06cfa1..c064333 100644
--- a/meta-systemd/conf/layer.conf
+++ b/meta-systemd/conf/layer.conf
@@ -20,8 +20,6 @@ BBFILES += "\
                    '', '${LAYERDIR}/invalid.bb', d)} \
   ${@base_contains('BBFILE_COLLECTIONS', 'gnome-layer',\
                    '${LAYERDIR}/meta-gnome/recipes-*/*/*.bbappend', '', d)} \
-  ${@base_contains('BBFILE_COLLECTIONS', 'efl-layer',\
-                   '${LAYERDIR}/meta-efl/recipes-*/*/*.bbappend', '', d)} \
   ${@base_contains('BBFILE_COLLECTIONS', 'multimedia-layer',\
                    '${LAYERDIR}/meta-multimedia/recipes-*/*/*.bbappend', '', d)} \
   ${@base_contains('BBFILE_COLLECTIONS', 'networking',\
diff --git a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
deleted file mode 100644
index 63c33fb..0000000
--- a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
+++ /dev/null
@@ -1,21 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 3}"
-
-inherit systemd
-
-SRC_URI += "file://entrance.service"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-
-SYSTEMD_SERVICE_${PN} = "entrance.service"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/entrance.service ${D}${systemd_unitdir}/system
-}
-
-RCONFLICTS_${PN} += "xserver-nodm-init-systemd"
-RREPLACES_${PN} += "xserver-nodm-init-systemd"
-- 
1.8.1.5



