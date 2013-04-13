Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0na-0007UU-JT
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:30 +0200
Received: by mail-ea0-f180.google.com with SMTP id d10so1560107eaj.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=mpKIyIB1YJ0mRZXAWN7lDhnggBvSDm+5aBRsS4UP6gA=;
	b=FNGYt114fn9iLOsjVHFZDegSqjcLm8hcJvx3AnOV1+jBo/T02NX1gkJBeSvTxakBq/
	qlpNFruhgDRzsvRqR0R2Y7jDkSVTcYhgsRE7osQg+iQ1E3bhyGB5gOyy3anB3NdKHRZu
	b4TuyQVLIL/Lj3QXkDPBS9ECHiaQyjbxtkFyhN04bESppCHSYv8yql2BN5x2WMcUE6sq
	On8SkTqi5t7w9eHtEJ7gfr8iNm/2P6FWJ/o2Yi87exH+ZUKEnTKU/WBW0LjrYZ0NeiP8
	8ktuNhQEDI2Dx+ZtSfbFJDpsv8LMnOtNER1jG7qWno/rsO/R1kFdSW/80uhLONoopHil
	NfQw==
X-Received: by 10.14.181.196 with SMTP id l44mr32387640eem.44.1365859796825;
	Sat, 13 Apr 2013 06:29:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a41sm16483317eei.4.2013.04.13.06.29.56
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:29:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:23 +0200
Message-Id: <1365859790-20947-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 06/33] entrance: move systemd support from meta-systemd back to meta-efl
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:43 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:43 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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



