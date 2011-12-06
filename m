Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXrt3-0004Wz-H7
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:04:33 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1374062eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mSOyFP/yZH6O64vHRILc80h6Rqu02aQee6Z0CyOuaqE=;
	b=FuBOQMmuFk0vIV+uvAi55Mo5d9eWK0e0dFO7CiW2wa3//i8D8Y0nh4kJTxMZVY/psK
	CiRbRsUL+/KQaPKDFJprul5hhEbVG/YwYbVA4jFQxRWdhLyTH8RF7kzZQuH7EzRHMaN6
	OIoUdQBNBru8eS9k9bg52f9RL82ECYWOR4VNw=
Received: by 10.213.28.8 with SMTP id k8mr2204118ebc.61.1323165467973;
	Tue, 06 Dec 2011 01:57:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c9sm67379780eeb.0.2011.12.06.01.57.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 01:57:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 10:57:03 +0100
Message-Id: <9e3a6b890464734afdadc89f19db0339e1dcaabc.1323165311.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
References: <afdc12df305d22c372df0202f576cc3f85860b1a.1323165311.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323165311.git.Martin.Jansa@gmail.com>
References: <cover.1323165311.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-efl 04/16] elsa: add systemd service and add RCONFLICTS/RREPLACES with xserver-nodm-init
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
X-List-Received-Date: Tue, 06 Dec 2011 10:04:33 -0000

* add RCONFLICTS/RREPLACES also to PN-systemd, because that's where file
  collision with xserver-nodm-init is, in PN it's just functional
  collision
* fixes upgrade path for task-x11-utils

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elsa/xserver-nodm.service |    8 ++++++++
 meta-efl/recipes-efl/efl/elsa_svn.bb               |   20 +++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/elsa/xserver-nodm.service

diff --git a/meta-efl/recipes-efl/efl/elsa/xserver-nodm.service b/meta-efl/recipes-efl/efl/elsa/xserver-nodm.service
new file mode 100644
index 0000000..0b9c0f5
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elsa/xserver-nodm.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=Login manager for Enlightenment
+
+[Service]
+ExecStart=/usr/sbin/elsa
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index e2f6fd7..f885daf 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -7,14 +7,32 @@ SECTION = "e/apps"
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep \
   file://0001-pam-use-common-auth-instead-of-system-auth.patch \
+  file://xserver-nodm.service \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
 EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
 
-PR = "r1"
+PR = "r2"
 PV = "0.0.4+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
+do_install_append() {
+        install -d ${D}${base_libdir}/systemd/system/
+        install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${base_libdir}/systemd/system/xserver-nodm.service
+}
+
+inherit systemd
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "xserver-nodm.service"
+
+PACKAGES =+ "${PN}-systemd"
+FILES_${PN}-systemd += "${base_libdir}/systemd"
+RDEPENDS_${PN}-systemd += "${PN}"
+
 RDEPENDS_${PN} += "${PN}-themes sessreg xauth"
 CONFFILES_${PN} += "${sysconfdir}/elsa.conf"
+RCONFLICTS_${PN} += "xserver-nodm-init"
+RREPLACES_${PN} += "xserver-nodm-init"
+RCONFLICTS_${PN}-systemd += "xserver-nodm-init"
+RREPLACES_${PN}-systemd += "xserver-nodm-init"
-- 
1.7.8



