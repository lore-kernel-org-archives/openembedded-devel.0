Received: from mail-ea0-f180.google.com ([209.85.215.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0o3-0007YZ-OR
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ea0-f180.google.com with SMTP id d10so1560216eaj.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=AMvCVeX0pQeL1sOyRVAzzy+sQjPYr833+vzhDa7+kJI=;
	b=rGLEdWeMftAbj4iCBbOU1sOozkjQPo58KcQnutZc9BTczNn/OZZZz7nkMnGCP9feW1
	cfQM/ahteU96ITrp1tKO7R9PzpywwxMkrWJ6TzD87AYUDwmQJC3CML0iBDJjViCcmil9
	FZDzJQ15pRW+495GCrCGLvn7KP1NzWnQo46itwN2ncjr+ro4Z+1g6P/JLwIckQZUF273
	ZmFo1vKEbNGX0YZA1x823BFCyq8p5Vg2epKzvT1W/hlriyP6XxhH9VuVrms4pEoXC3LZ
	SL/cZ7x7cvbX7NXa6TECiYarKQ1hNEQ5Xu7F/jyx0piSlN1Lv51Sx+6qM0YcP9CydmkW
	OHqA==
X-Received: by 10.15.83.73 with SMTP id b49mr39484711eez.25.1365859826129;
	Sat, 13 Apr 2013 06:30:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	cb50sm16385673eeb.14.2013.04.13.06.30.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:44 +0200
Message-Id: <1365859790-20947-27-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 27/33] lxdm: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:49:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb                    | 12 ++++++++----
 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend | 10 ----------
 2 files changed, 8 insertions(+), 14 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index be83146..a6f266c 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -15,19 +15,18 @@ LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam
 SRCREV = "65e7cc8fdc150c2b925eb348ce82de17dee5eb0b"
 PV = "0.4.2+git${SRCPV}"
 PE = "1"
-PR = "r3"
+PR = "r6"
 
 DEPENDS = "cairo consolekit dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
 
 # combine oe-core way with angstrom DISTRO_TYPE
 DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
 
-inherit autotools gettext
+inherit autotools gettext systemd
 
 S = "${WORKDIR}/git"
 
-SYSTEMD_UNITDIR ??= "no"
-EXTRA_OECONF = "--with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
 do_compile_append() {
 	# default background configured not available / no password field available / no default screensaver
@@ -66,3 +65,8 @@ sed -i "s:last_langs=.*$:last_langs=$langs:g" ${localstatedir}/lib/lxdm/lxdm.con
 }
 
 RDEPENDS_${PN} = "pam-plugin-loginuid setxkbmap"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "lxdm.service"
diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
deleted file mode 100644
index a3e97bb..0000000
--- a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SYSTEMD_UNITDIR = "${systemd_unitdir}/system"
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "lxdm.service"
-- 
1.8.1.5



