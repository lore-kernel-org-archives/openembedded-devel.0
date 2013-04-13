Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0o1-0007YK-8r
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:48:52 +0200
Received: by mail-ee0-f51.google.com with SMTP id c4so1591969eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=bVzSiKX+cONvAn8ZEZh7q8mjbnSK3L1AE3t/xsBKppY=;
	b=k8Y+T1cs3urTC98e+ZhL6v3BbizboyIypVXDRpLmvzhi90Wk0IDK/4hh2hnVF7IV1n
	YnfxbjBplFgGBN3lh4yGab6rAjauGBoYxKEFJG5MUD61JAIczxiwgT0txTVz5DHW+TSj
	nV9PzqxZgjuisNJwVroPavVR8DAgdLb6ZqY4OjhjmV8BEs8HYD1pDmyy1YM9cUaExS9T
	X6vQMkGeQMVhGg/TyJaZQKn7OYsJCYZZ/DF4aL8XWL/BRyCPO55bK3z62zKOimlyFI0M
	d1O0tg+2+nVcHfU7mUJ2qwMRD+vdco0ulY0OpSJEDlD6eMLvF28pUGvPZXn5v+yeUr60
	JrCQ==
X-Received: by 10.15.24.71 with SMTP id i47mr28316716eeu.0.1365859823599;
	Sat, 13 Apr 2013 06:30:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id cd3sm16465337eeb.6.2013.04.13.06.30.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:42 +0200
Message-Id: <1365859790-20947-25-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 25/33] syslog-ng: move systemd support from meta-systemd back to meta-oe
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
 meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc  | 12 ++++++++++--
 .../nonworking/syslog-ng/syslog-ng_3.2.5.bbappend           | 13 -------------
 2 files changed, 10 insertions(+), 15 deletions(-)
 delete mode 100644 meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend

diff --git a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
index 584e4a4..bac1be1 100644
--- a/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng.inc
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
 # update-rc.d and update-alternatives is important
 RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
-INC_PR = "r9"
+INC_PR = "r12"
 
-inherit autotools
+inherit autotools systemd
 
 SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
 
@@ -27,6 +27,9 @@ EXTRA_OECONF = " \
   --disable-sql \
 "
 
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--enable-systemd', '--disable-systemd', d)}"
+
 do_configure_prepend() {
         eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
 }
@@ -51,6 +54,11 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"
 CONFFILES_${PN} = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf"
 
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.service"
+
 pkg_postinst_${PN} () {
         /etc/init.d/syslog stop
         update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 200
diff --git a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
deleted file mode 100644
index 0ed05df..0000000
--- a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng_3.2.5.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-EXTRA_OECONF += " \
-  --enable-systemd \
-  --with-systemdsystemunitdir=${systemd_unitdir}/system \
-"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.service"
-- 
1.8.1.5



