Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1MqNvi-0001wl-Or
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Sep 2009 11:14:33 +0200
Received: by fg-out-1718.google.com with SMTP id e21so1257720fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2009 02:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=LxYAdZwpDOZB3taIoD0c+eFKvVejUyLFpsM+mgikvL8=;
	b=VwI6RyEj1t4btBx+7BEX63FWb8sANyLzNMlm8zzyQgpny5kfcAX1y6nZdVIK3Wiy2P
	k/vv7QmAQKqN7QR2z4gp9H+FV6PA/daPUgGa4Yxt/9iFx9NCnhHJVIdqV2U85fy/AA+r
	FrUSJuCSDz/+ivOXiylTAlCAPQ9XqcpPJwC8w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=bSMkfoWuwDHUt6CqpBOGWKbEzQZ7dRFaOywdT5urzuCuv9LzwiPSS8anRA71AXoAMb
	i3cEj/KJcPnrjajRlxfHS4eyTWuygV3E9T3nK8XvLrAxLEm430aG0FesJqKE6sj9Du9/
	3XshDZnr0WNNCusOOnNKKxvfc3EXVm/b2DTbE=
Received: by 10.86.187.27 with SMTP id k27mr1798684fgf.11.1253697234557;
	Wed, 23 Sep 2009 02:13:54 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l12sm1747756fgb.4.2009.09.23.02.13.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Sep 2009 02:13:54 -0700 (PDT)
From: "Martin.Jansa" <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Sep 2009 11:13:49 +0200
Message-Id: <1253697229-6181-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.rc1
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] findutils: fix update-alternatives and native packages
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
X-List-Received-Date: Wed, 23 Sep 2009 09:14:34 -0000

Move update-alternatives logic to findutils-alternatives.inc which is not included in -native packages.
Patch mkinstalldirs.patch is needed also for findutils-native_4.2.29.
Remove version 4.4 as there is no tarball upstream (it's 4.4.0 actually).
Add latest version 4.4.2, probably not compatible with old glibc 2.6.1 (staging/armv4t-angstrom-linux-gnueabi/usr/include/stdio.h:654: error: conflicting types for 'rpl_fseeko'), findutils-native-4.4.2 is ok.

---
 recipes/findutils/findutils-alternatives.inc |   12 ++++++++++++
 recipes/findutils/findutils-native_4.2.29.bb |    2 ++
 recipes/findutils/findutils-native_4.4.2.bb  |    9 +++++++++
 recipes/findutils/findutils-native_4.4.bb    |    9 ---------
 recipes/findutils/findutils.inc              |    5 -----
 recipes/findutils/findutils_4.2.29.bb        |   11 ++---------
 recipes/findutils/findutils_4.4.2.bb         |    6 ++++++
 recipes/findutils/findutils_4.4.bb           |   14 --------------
 8 files changed, 31 insertions(+), 37 deletions(-)
 create mode 100644 recipes/findutils/findutils-alternatives.inc
 create mode 100644 recipes/findutils/findutils-native_4.4.2.bb
 delete mode 100644 recipes/findutils/findutils-native_4.4.bb
 create mode 100644 recipes/findutils/findutils_4.4.2.bb
 delete mode 100644 recipes/findutils/findutils_4.4.bb

diff --git a/recipes/findutils/findutils-alternatives.inc b/recipes/findutils/findutils-alternatives.inc
new file mode 100644
index 0000000..09d98a4
--- /dev/null
+++ b/recipes/findutils/findutils-alternatives.inc
@@ -0,0 +1,12 @@
+do_install_append() {
+	cd ${D}${bindir} && mv find find.findutils
+	cd ${D}${bindir} && mv xargs xargs.findutils
+}
+
+pkg_postinst_${PN} () {
+        for i in find xargs; do update-alternatives --install ${bindir}/$i $i $i.${PN} 100; done
+}
+
+pkg_prerm_${PN} () {
+        for i in find xargs; do update-alternatives --remove $i $i.${PN}; done
+}
diff --git a/recipes/findutils/findutils-native_4.2.29.bb b/recipes/findutils/findutils-native_4.2.29.bb
index cb6d72f..ab5c637 100644
--- a/recipes/findutils/findutils-native_4.2.29.bb
+++ b/recipes/findutils/findutils-native_4.2.29.bb
@@ -4,4 +4,6 @@ inherit native
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/findutils-${PV}"
 
+SRC_URI += "file://mkinstalldirs.patch;patch=1"
+
 S = "${WORKDIR}/findutils-${PV}"
diff --git a/recipes/findutils/findutils-native_4.4.2.bb b/recipes/findutils/findutils-native_4.4.2.bb
new file mode 100644
index 0000000..1a7b1fe
--- /dev/null
+++ b/recipes/findutils/findutils-native_4.4.2.bb
@@ -0,0 +1,9 @@
+require findutils.inc
+
+inherit native
+
+DEFAULT_PREFERENCE = "-1"
+
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/findutils-${PV}"
+
+S = "${WORKDIR}/findutils-${PV}"
diff --git a/recipes/findutils/findutils-native_4.4.bb b/recipes/findutils/findutils-native_4.4.bb
deleted file mode 100644
index 1a7b1fe..0000000
--- a/recipes/findutils/findutils-native_4.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require findutils.inc
-
-inherit native
-
-DEFAULT_PREFERENCE = "-1"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/findutils-${PV}"
-
-S = "${WORKDIR}/findutils-${PV}"
diff --git a/recipes/findutils/findutils.inc b/recipes/findutils/findutils.inc
index 209edd6..7feef27 100644
--- a/recipes/findutils/findutils.inc
+++ b/recipes/findutils/findutils.inc
@@ -12,8 +12,3 @@ inherit autotools gettext
 # because it uses __mempcpy, there are other things (TBD:
 # see diffutils.mk in buildroot)
 EXTRA_OECONF_linux-uclibc += "--without-included-regex"
-
-do_install_append() {
-	cd ${D}${bindir} && mv find find.findutils
-	cd ${D}${bindir} && mv xargs xargs.findutils
-}
diff --git a/recipes/findutils/findutils_4.2.29.bb b/recipes/findutils/findutils_4.2.29.bb
index a89d092..1d82471 100644
--- a/recipes/findutils/findutils_4.2.29.bb
+++ b/recipes/findutils/findutils_4.2.29.bb
@@ -1,15 +1,8 @@
 require findutils.inc
+require findutils-alternatives.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://mkinstalldirs.patch;patch=1"
 
 EXTRA_OECONF += " ac_cv_path_SORT=/usr/bin/sort "
-
-pkg_postinst_${PN} () {
-	for i in find xargs; do update-alternatives --install ${bindir}/$i $i $i.${PN} 100; done
-}
-
-pkg_prerm_${PN} () {
-	for i in find xargs; do update-alternatives --remove $i $i.${PN}; done
-}
diff --git a/recipes/findutils/findutils_4.4.2.bb b/recipes/findutils/findutils_4.4.2.bb
new file mode 100644
index 0000000..5c0686d
--- /dev/null
+++ b/recipes/findutils/findutils_4.4.2.bb
@@ -0,0 +1,6 @@
+require findutils.inc
+require findutils-alternatives.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+EXTRA_OECONF += " ac_cv_path_SORT=/usr/bin/sort "
diff --git a/recipes/findutils/findutils_4.4.bb b/recipes/findutils/findutils_4.4.bb
deleted file mode 100644
index 25dec25..0000000
--- a/recipes/findutils/findutils_4.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require findutils.inc
-
-PR = "r1"
-DEFAULT_PREFERENCE = "-1"
-
-EXTRA_OECONF += " ac_cv_path_SORT=/usr/bin/sort "
-
-pkg_postinst_${PN} () {
-	for i in find xargs; do update-alternatives --install ${bindir}/$i $i $i.${PN} 100; done
-}
-
-pkg_prerm_${PN} () {
-	for i in find xargs; do update-alternatives --remove $i $i.${PN}; done
-}
-- 
1.6.5.rc1



