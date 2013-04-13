Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nf-0007W4-QJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:30 +0200
Received: by mail-ee0-f43.google.com with SMTP id e50so1661585eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=44rwqtEOde5MGRSwCfik2bwObToh7MEjfVK0wsbeEqY=;
	b=mmyUR9IWlm7beg4jDB31xhGVqjORVovRymSxM4+cTKJ1+k1BbjXlmrsM5T8jFXKaCE
	h572UMBfMiepeiTEyks+q3oRbEyCxE5w1tM75haxQxb9UMmoaIg47Ni1Afrmy7EVWdq2
	M/8JsKk7B7YdEhQZGGWcsVT334SnjuMmVkAKT1V4cX0zT3pm7K/XODYsQTy5nV4A/qtQ
	1ZNEN3M/xF+DUBfA6khLtnu+B8mLpQQH5PkW+hWeafgYEF1Zw67rceoh8ZlUHhA1zOw8
	7LWGfaW0vJzQuLi68N+f3v3JdAIt/+Fn4VdKcBOYZfKOG8AyRT7QZZ0sGKDkv6AOD5+b
	YyMg==
X-Received: by 10.14.218.66 with SMTP id j42mr39219266eep.46.1365859802181;
	Sat, 13 Apr 2013 06:30:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bj2sm16514955eeb.1.2013.04.13.06.30.01
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:27 +0200
Message-Id: <1365859790-20947-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 10/33] ntp: move systemd support from meta-systemd back to meta-networking
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:41 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:41 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:41 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp.inc        | 29 +++++++++++++++++++---
 .../recipes-support/ntp/ntp/ntpd.service           |  0
 .../recipes-support/ntp/ntp/ntpdate.service        |  0
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |  1 -
 .../recipes-support/ntp/ntp_4.2.6p5.bbappend       | 28 ---------------------
 5 files changed, 26 insertions(+), 32 deletions(-)
 rename {meta-systemd/meta-networking => meta-networking}/recipes-support/ntp/ntp/ntpd.service (100%)
 rename {meta-systemd/meta-networking => meta-networking}/recipes-support/ntp/ntp/ntpdate.service (100%)
 delete mode 100644 meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index d93f22d..3f53fff 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -8,7 +8,7 @@ SECTION = "console/network"
 LICENSE = "NTP"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
 
-INC_PR = "r3"
+INC_PR = "r6"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
            file://tickadj.c.patch \
@@ -18,9 +18,11 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntp.conf \
            file://ntpdate \
            file://ntpdate.default \
+           file://ntpdate.service \
+           file://ntpd.service \
            "
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
 # readline or curses
@@ -52,6 +54,10 @@ do_install_append() {
 	install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/ntpdate
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
+	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
 }
 
 PACKAGES += "ntpdate ${PN}-tickadj ${PN}-utils"
@@ -65,12 +71,29 @@ RPROVIDES_${PN}-utils = "${PN}-bin"
 RREPLACES_${PN}-utils = "${PN}-bin"
 RCONFLICTS_${PN}-utils = "${PN}-bin"
 
+SYSTEMD_PACKAGES = "${PN} ntpdate"
+SYSTEMD_SERVICE_${PN} = "ntpd.service"
+SYSTEMD_SERVICE_ntpdate = "ntpdate.service"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+
+RPROVIDES_ntpdate += "ntpdate-systemd"
+RREPLACES_ntpdate += "ntpdate-systemd"
+RCONFLICTS_ntpdate += "ntpdate-systemd"
+
 RSUGGESTS_${PN} = "iana-etc"
 
 FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
 FILES_${PN}-tickadj = "${bindir}/tickadj"
 FILES_${PN}-utils = "${bindir}"
-FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate-sync ${bindir}/ntpdate-sync ${sysconfdir}/default/ntpdate"
+FILES_ntpdate = "${bindir}/ntpdate \
+  ${sysconfdir}/network/if-up.d/ntpdate-sync \
+  ${bindir}/ntpdate-sync \
+  ${sysconfdir}/default/ntpdate \
+  ${systemd_unitdir}/system/ntpdate.service \
+"
 
 CONFFILES_${PN} = "${sysconfdir}/ntp.conf"
 CONFFILES_ntpdate = "${sysconfdir}/default/ntpdate"
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service b/meta-networking/recipes-support/ntp/ntp/ntpd.service
similarity index 100%
rename from meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpd.service
rename to meta-networking/recipes-support/ntp/ntp/ntpd.service
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service b/meta-networking/recipes-support/ntp/ntp/ntpdate.service
similarity index 100%
rename from meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
rename to meta-networking/recipes-support/ntp/ntp/ntpdate.service
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
index f1e9ecd..588a1b0 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
@@ -4,4 +4,3 @@ PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
 SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
-
diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
deleted file mode 100644
index 7f2a796..0000000
--- a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappend
+++ /dev/null
@@ -1,28 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SYSTEMD_PACKAGES = "${PN} ntpdate"
-SYSTEMD_SERVICE_${PN} = "ntpd.service"
-SYSTEMD_SERVICE_ntpdate = "ntpdate.service"
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-RPROVIDES_ntpdate += "ntpdate-systemd"
-RREPLACES_ntpdate += "ntpdate-systemd"
-RCONFLICTS_ntpdate += "ntpdate-systemd"
-
-FILES_ntpdate += "${systemd_unitdir}/system/ntpdate.service"
-
-SRC_URI += " \
-	file://ntpdate.service \
-        file://ntpd.service \
-"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
-	install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
-}
-- 
1.8.1.5



