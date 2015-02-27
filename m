Return-Path: <joe@deserted.net>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id EDA48737D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 14:58:54 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so31335876ieb.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 06:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=Lmdy+6URWlSsqDfdYrAme9sM97JAWA48EWtQg/CZ43E=;
	b=G4t3hg/WiLE31CZKgSqWGPSkbWcVsoQv5rmroyuOOMrKLV3OtQYjocbOWO2tmN2ikY
	GJ8MGsc+qAEhs7sBghouUkyiz1s99kFjMd3aDUEdkRe1VvSF4OyC3toRS2eKiGItcWQh
	sQH4798JTiptdNpVukoxc1+bhvR6zwh2fd9Nc5jJiU1ih0Uekt8T/6lwT2sPpjSAraja
	ytx56QAwRNSl7aiBNU8RUg1w/FButFur+ZVtN8HzFeucJDTQwy4UmVPe+PYyohQYCnnm
	/QlBbzFh7q5Kt7G7eie/HtdHrbvghlGielosQaZHbdrqEMGRHhsszt4vPDuZ+WdP7fo9
	twWg==
X-Gm-Message-State: ALoCoQn3B53S6F60gqtL+H1gp/M5gfZ0RcpsBe/Jeay3ArvU30XPtUt8tjqRjVOU35xX2WzWPvq0
X-Received: by 10.50.222.70 with SMTP id qk6mr3276589igc.47.1425049135313;
	Fri, 27 Feb 2015 06:58:55 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id c8sm1314387igx.9.2015.02.27.06.58.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Feb 2015 06:58:54 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 09:59:54 -0500
Message-Id: <1425049194-19444-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] nis: update yp-tools and ypbind
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 14:58:56 -0000

Both yp-tools and ypbind-mt were out of date with their latest released
versions, so bump them up to current.  Remove two dead patches at the same
time and reorganize the recipes to better follow the preferred OE style.
Finally, the new release includes a new version of the GPLv2 COPYING file,
with a significant amount of whitespace fixes, so update the license
checksum.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

I started down the path of correcting the yp-tools world build failure but it
made more sense to update yp-tools to the latest released version, which also
appears to solve that problem and since there was a newer corresponding version
of ypbind-mt, I picked that up too.

-J.

 .../recipes-support/nis/files/libdl.patch          | 12 -----
 .../recipes-support/nis/files/no-selinux.patch     | 16 -------
 meta-networking/recipes-support/nis/nis.inc        |  2 +-
 .../recipes-support/nis/yp-tools_2.12.bb           | 31 -------------
 .../recipes-support/nis/yp-tools_2.14.bb           | 34 ++++++++++++++
 .../recipes-support/nis/ypbind-mt_1.36.bb          | 52 ---------------------
 .../recipes-support/nis/ypbind-mt_1.38.bb          | 54 ++++++++++++++++++++++
 7 files changed, 89 insertions(+), 112 deletions(-)
 delete mode 100644 meta-networking/recipes-support/nis/files/libdl.patch
 delete mode 100644 meta-networking/recipes-support/nis/files/no-selinux.patch
 delete mode 100644 meta-networking/recipes-support/nis/yp-tools_2.12.bb
 create mode 100644 meta-networking/recipes-support/nis/yp-tools_2.14.bb
 delete mode 100644 meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
 create mode 100644 meta-networking/recipes-support/nis/ypbind-mt_1.38.bb

diff --git a/meta-networking/recipes-support/nis/files/libdl.patch b/meta-networking/recipes-support/nis/files/libdl.patch
deleted file mode 100644
index 605af31..0000000
--- a/meta-networking/recipes-support/nis/files/libdl.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- pwdutils-2.6/configure.in.orig	2005-04-19 20:22:36.603052192 -0700
-+++ pwdutils-2.6/configure.in	2005-04-19 21:09:45.308023672 -0700
-@@ -178,6 +178,9 @@
-     AC_CHECK_LIB(ldap, main, LDAP_LIBS="-lldap $LDAP_LIBS" found_ldap_lib=yes,,$LDAP_LIBS)
-   fi
- 
-+  dnl this always needs dl
-+  AC_CHECK_LIB(dl, dlopen, LDAP_LIBS="$LDAP_LIBS -ldl")
-+
-   if test -z "$found_ldap_lib" -a \( $with_ldap_lib = auto -o $with_ldap_lib = netscape5 \); then
-     AC_CHECK_LIB(ldap50, main, LDAP_LIBS="-lldap50 -lssldap50 -lssl3 -lnss3 -lnspr4 -lprldap50 -lplc4 -lplds4" found_ldap_lib=yes need_pthread=true,, -lpthread)
-   fi
diff --git a/meta-networking/recipes-support/nis/files/no-selinux.patch b/meta-networking/recipes-support/nis/files/no-selinux.patch
deleted file mode 100644
index 71da3e3..0000000
--- a/meta-networking/recipes-support/nis/files/no-selinux.patch
+++ /dev/null
@@ -1,16 +0,0 @@
---- pwdutils-2.6/lib/copy_xattr.c.orig	2005-04-16 17:15:52.916660880 -0700
-+++ pwdutils-2.6/lib/copy_xattr.c	2005-04-16 17:18:10.345768480 -0700
-@@ -127,8 +127,11 @@
- 
- 	  if (lsetxattr (to, name, value, size, 0) != 0)
- 	    {
--	      if (strcmp (name, "security.selinux") == 0 &&
--		  is_selinux_enabled() == 0)
-+	      if (strcmp (name, "security.selinux") == 0
-+#if defined(WITH_SELINUX)
-+				  && is_selinux_enabled() == 0
-+#endif
-+				  )
- 		fprintf (stderr,
- 			 _("SELinux not enabled, ignore attribute %s for `%s'.\n"),
- 			 name, to);
diff --git a/meta-networking/recipes-support/nis/nis.inc b/meta-networking/recipes-support/nis/nis.inc
index 075d275..eaff949 100644
--- a/meta-networking/recipes-support/nis/nis.inc
+++ b/meta-networking/recipes-support/nis/nis.inc
@@ -7,7 +7,7 @@ DESCRIPTION = "NIS Server and Tools"
 HOMEPAGE = "http://www.linux-nis.org/nis/"
 SECTION = "console/network"
 LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 inherit autotools gettext pkgconfig
 
diff --git a/meta-networking/recipes-support/nis/yp-tools_2.12.bb b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
deleted file mode 100644
index 0017845..0000000
--- a/meta-networking/recipes-support/nis/yp-tools_2.12.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-# This package builds tools to manage NIS
-# The source package is utils/net/NIS/yp-tools
-#
-PR = "r3"
-DESCRIPTION="\
-Network Information Service tools.  \
-This package contains ypcat, ypmatch, ypset, \
-ypwhich, yppasswd, domainname, nisdomainname \
-and ypdomainname."
-
-require nis.inc
-SRC_URI = "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
-           file://domainname.service \
-"
-
-SRC_URI[md5sum] = "ce1e06d86caa285fa8cd76fdf103f51e"
-SRC_URI[sha256sum] = "6ae8321666eea7837da343eea90ea30273fb74943ad111d5a4befd2afb252063"
-
-CACHED_CONFIGUREVARS += "ac_cv_prog_STRIP=/bin/true"
-
-inherit systemd
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "domainname.service"
-
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system
-}
diff --git a/meta-networking/recipes-support/nis/yp-tools_2.14.bb b/meta-networking/recipes-support/nis/yp-tools_2.14.bb
new file mode 100644
index 0000000..8c6837b
--- /dev/null
+++ b/meta-networking/recipes-support/nis/yp-tools_2.14.bb
@@ -0,0 +1,34 @@
+# This package builds tools to manage NIS
+# The source package is utils/net/NIS/yp-tools
+#
+require nis.inc
+
+SUMMARY = "NIS client programs"
+DESCRIPTION = " \
+Network Information Service tools.  \
+This package contains ypcat, ypmatch, ypset, \
+ypwhich, yppasswd, domainname, nisdomainname \
+and ypdomainname. \
+\
+This is the final IPv4-only version of yp-tools. \
+"
+
+SRC_URI = "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
+           file://domainname.service \
+"
+SRC_URI[md5sum] = "ba1f121c17e3ad65368be173b977cd13"
+SRC_URI[sha256sum] = "d01f70fadc643a55107a0edc47c6be99d0306bcc4f66df56f65e74238b0124c9"
+
+inherit systemd
+SYSTEMD_SERVICE_${PN} = "domainname.service"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+
+CACHED_CONFIGUREVARS += "ac_cv_prog_STRIP=/bin/true"
+
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system
+}
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
deleted file mode 100644
index 35ef16a..0000000
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-# This package builds the NIS ypbind daemon
-# The source package is utils/net/NIS/ypbind-mt
-#
-PR = "r3"
-DESCRIPTION="\
-Multithreaded NIS bind service (ypbind-mt).  \
-ypbind-mt is a complete new implementation of a NIS \
-binding daemon for Linux. It has the following \
-features.  Supports ypbind protocol V1 and V2.  \
-Uses threads for better response.  Supports multiple \
-domain bindings.  Supports /var/yp/binding/* file \
-for Linux libc 4/5 and glibc 2.x.  Supports a list \
-of known secure NIS server (/etc/yp.conf) Binds to \
-the server which answered as first."
-HOMEPAGE="http://www.linux-nis.org/nis/ypbind-mt/index.html"
-
-require nis.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=082c9a0886c7c3db1bc862b5b62ffe08"
-
-SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
-           file://ypbind-yocto.init \
-           file://ypbind.service \
-"
-SRC_URI[md5sum] = "135834db97d78ff6d79fdee2810b4056"
-SRC_URI[sha256sum] = "0eff76c1849f4b38ea1a60280d8397c4240369c641fe5402ce57edf1a90958c7"
-
-# ypbind-mt now provides all the functionality of ypbind
-# and is used in place of it.
-PROVIDES += "ypbind"
-
-CACHED_CONFIGUREVARS = "ac_cv_prog_STRIP=/bin/true"
-
-do_install_append () {
-    install -d ${D}${sysconfdir}/init.d
-    install -d ${D}${sysconfdir}/rcS.d
-
-    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.d/ypbind
-
-    # TODO, use update-rc.d
-    ln -s ../init.d/ypbind ${D}${sysconfdir}/rcS.d/S44ypbind
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
-}
-
-inherit systemd
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "ypbind.service"
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
new file mode 100644
index 0000000..ed90e90
--- /dev/null
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
@@ -0,0 +1,54 @@
+# This package builds the NIS ypbind daemon
+# The source package is utils/net/NIS/ypbind-mt
+#
+require nis.inc
+
+DESCRIPTION = " \
+Multithreaded NIS bind service (ypbind-mt).  \
+ypbind-mt is a complete new implementation of a NIS \
+binding daemon for Linux. It has the following \
+features.  Supports ypbind protocol V1 and V2.  \
+Uses threads for better response.  Supports multiple \
+domain bindings.  Supports /var/yp/binding/* file \
+for Linux libc 4/5 and glibc 2.x.  Supports a list \
+of known secure NIS server (/etc/yp.conf) Binds to \
+the server which answered as first. \
+\
+This is the final IPv4-only version of ypbind-mt. \
+"
+HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
+DEPENDS = "yp-tools"
+# ypbind-mt now provides all the functionality of ypbind
+# and is used in place of it.
+PROVIDES += "ypbind"
+
+SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
+           file://ypbind-yocto.init \
+           file://ypbind.service \
+"
+SRC_URI[md5sum] = "094088c0e282fa7f3b3dd6cc51d0a4e1"
+SRC_URI[sha256sum] = "1930ce19f6ccfe10400f3497b31867f71690d2bcd3f5b575199fa915559b7746"
+
+SYSTEMD_SERVICE_${PN} = "ypbind.service"
+
+inherit systemd
+
+CACHED_CONFIGUREVARS = "ac_cv_prog_STRIP=/bin/true"
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/rcS.d
+
+    install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.d/ypbind
+
+    # TODO, use update-rc.d
+    ln -s ../init.d/ypbind ${D}${sysconfdir}/rcS.d/S44ypbind
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
+}
+
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
-- 
1.9.1


