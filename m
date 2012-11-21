Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TbAPX-0007uq-NC
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 14:32:22 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2729880eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 05:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=WdJIv4ueYV68sjFua09pG6xIeF7ADrK/l+5nxlFRSOY=;
	b=JvHZnE9DzfItz0oSEdGNUvB2huxwvej3YumteFAuOuO1ybXK3Sz4vgmL0h59c6+FxL
	IDlnd932cpRHV3RlEhzjk4suE2UxMCjrHHlqF2FhkxlU+e5Ofh8UdQa7qjuFW0FbejlZ
	JekQNn9n61Q17J3LCPPdhSPyLGFVtl+g+NY+9Lzdz14CRMsC+oGPR38MgA5+KQXkWeFd
	TpPbOxh9x9VbBm+LZz7LUO7rX5V4lVz7qsRPm0eBQLZqV8FQvov86JHNYanvFMIbVC8e
	usg/nYmo73p7c1Lb76pV+7/iRdQhVXzXwudPXZpbQZ+tQXTE8K9T/xT1YRsyAi98iPJg
	ITsQ==
Received: by 10.14.221.9 with SMTP id q9mr45811887eep.3.1353503890993;
	Wed, 21 Nov 2012 05:18:10 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id 42sm203489eee.0.2012.11.21.05.18.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 05:18:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2012 14:16:45 +0100
Message-Id: <1353503805-5711-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd] lxdm: bugfixes by updating to latest git
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
X-List-Received-Date: Wed, 21 Nov 2012 13:32:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* make keyboard layout combobox display languages properly
* systemd-support is included mainline
* autologin for timeouts < 5s works as expected

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |   10 ++++++++--
 .../recipes-graphics/lxdm/lxdm/lxdm.service.in     |   10 ----------
 .../recipes-graphics/lxdm/lxdm_git.bbappend        |   10 +---------
 3 files changed, 9 insertions(+), 21 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index fd28c41..f3d4eff 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -12,8 +12,10 @@ SRC_URI = " \
 
 LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)}"
 
-SRCREV = "d681bc90b62ec2e13ed62fc30cdaf5dbbba23cdc"
+SRCREV = "65e7cc8fdc150c2b925eb348ce82de17dee5eb0b"
 PV = "0.4.2+git${SRCPV}"
+PE = "1"
+PR = "r1"
 
 DEPENDS = "cairo consolekit dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
 
@@ -24,10 +26,14 @@ inherit autotools gettext
 
 S = "${WORKDIR}/git"
 
+SYSTEMD_UNITDIR ??= "no"
+EXTRA_OECONF = "--with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
+
 do_compile_append() {
 	# default background configured not available / no password field available
 	sed -i 	-e 's,bg=,# bg=,g' \
 		-e 's,# skip_password=,skip_password=,g' \
+		-e 's,keyboard=0,keyboard=1,g' \
 		${S}/data/lxdm.conf.in
 	# add default configuration
 	oe_runmake -C ${S}/data lxdm.conf
@@ -59,4 +65,4 @@ done
 sed -i "s:last_langs=.*$:last_langs=$langs:g" ${localstatedir}/lib/lxdm/lxdm.conf
 }
 
-RDEPENDS_${PN} = "pam-plugin-loginuid"
+RDEPENDS_${PN} = "pam-plugin-loginuid setxkbmap"
diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in
deleted file mode 100644
index 0bc6774..0000000
--- a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=LXDE Display Manager
-After=systemd-user-sessions.service
-
-[Service]
-ExecStart=%sbindir%/lxdm
-StandardOutput=syslog
-
-[Install]
-Alias=display-manager.service
diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
index e4cf44d..2828a70 100644
--- a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
@@ -3,14 +3,6 @@ PRINC := "${@int(PRINC) + 1}"
 
 inherit systemd
 
-SRC_URI += "file://lxdm.service.in"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	sed -e 's,%sbindir%,${sbindir},g' \
-		< ${WORKDIR}/lxdm.service.in \
-		> ${D}${systemd_unitdir}/system/lxdm.service
-}
-
+SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "lxdm.service"
-- 
1.7.6.5



