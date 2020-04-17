Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.6208.1587114854062347471
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2020 02:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03H9ECHe015817
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2020 02:14:12 -0700 (PDT)
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 17 Apr
 2020 02:14:11 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] postfix: split ${PN}-bin from ${PN} to solve recursive dependency
Date: Fri, 17 Apr 2020 17:14:09 +0800
Message-ID: <20200417091409.27563-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

The commit 89d86b96f80d8a136d38113baf69d8ccad5a5ff6 which tries to fix
the installation issue for ostree introduces a recursive dependency
issue. When installing the postfix package on target via online
repository, the postinst function for postfix-cfg package needs
newaliases but this command is from postfix package which causes an
error:
  Configuring postfix-cfg.
  /var/lib/opkg/info/postfix-cfg.postinst: line 9: newaliases: not found
  pkg_run_script: package "postfix-cfg" postinst script returned status 127.

Split a new package postfix-bin from postfix and make it as the runtime
dependency for postfix-cfg.

Set USERADD_PACKAGES to ${PN}-bin to avoid image do_rootfs warnings when
installing postfix via IMAGE_INSTALL:
  [log_check] warning: group postdrop does not exist - using root
  [log_check] warning: user postfix does not exist - using root

Set ALTERNATIVE to ${PN}-bin to make sure the newaliases symbolic link
is installed before installing postfix-cfg.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-daemons/postfix/postfix.inc          | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 64c20d0f5..4b9940cc7 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -20,16 +20,16 @@ CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native"
 
-inherit update-rc.d useradd update-alternatives systemd
+inherit update-rc.d useradd update-alternatives systemd lib_package
 
 INITSCRIPT_NAME = "postfix"
 INITSCRIPT_PARAMS = "start 58 3 4 5 . stop 13 0 1 6 ."
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = \
+USERADD_PACKAGES = "${PN}-bin"
+USERADD_PARAM_${PN}-bin = \
 "-d /var/spool/postfix -r -g postfix --shell /bin/false postfix; \
  -d /var/spool/vmail -r -g vmail --shell /bin/false vmail \
 "
-GROUPADD_PARAM_${PN} = "--system postfix;--system postdrop;--system vmail"
+GROUPADD_PARAM_${PN}-bin = "--system postfix;--system postdrop;--system vmail"
 
 export SYSLIBS = "${LDFLAGS}"
 
@@ -185,9 +185,9 @@ do_install_append_class-native() {
     ln -sf ../sbin/sendmail.postfix ${D}${bindir}/mailq
 }
 
-ALTERNATIVE_${PN} = "sendmail mailq newaliases"
+ALTERNATIVE_${PN}-bin = "sendmail mailq newaliases"
 # /usr/lib/sendmial is required by LSB core test
-ALTERNATIVE_${PN}_linuxstdbase = "sendmail mailq newaliases usr-lib-sendmail"
+ALTERNATIVE_${PN}-bin_linuxstdbase = "sendmail mailq newaliases usr-lib-sendmail"
 ALTERNATIVE_TARGET[mailq] = "${bindir}/mailq"
 ALTERNATIVE_TARGET[newaliases] = "${bindir}/newaliases"
 ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
@@ -212,9 +212,11 @@ pkg_postinst_ontarget_${PN}-cfg () {
 }
 
 PACKAGES =+ "${PN}-cfg"
+RDEPENDS_${PN}-cfg_class-target += "${PN}-bin"
 RDEPENDS_${PN}_class-target += "${PN}-cfg"
 # Exclude .debug directories from the main package
-FILES_${PN} = "${localstatedir} ${bindir}/* ${sbindir}/* \
+FILES_${PN}-bin += "${localstatedir} ${bindir}/* ${sbindir}/* \
                ${libexecdir}/* ${systemd_unitdir}/*"
 FILES_${PN}-cfg = "${sysconfdir}"
 FILES_${PN}-dbg += "${libexecdir}/postfix/.debug"
+ALLOW_EMPTY_${PN} = "1"
-- 
2.17.1

