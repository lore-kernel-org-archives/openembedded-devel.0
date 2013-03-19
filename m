Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UI2XE-0006BH-Sh
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 20:49:25 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2013 20:32:29 +0100
Message-Id: <1363721551-8539-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 1/2] ca-certificates: support running update-ca-certificates during do_rootfs
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
X-List-Received-Date: Tue, 19 Mar 2013 19:49:25 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../ca-certificates/ca-certificates-20130119.inc   |   15 ++++++
 .../ca-certificates-cross_20130119.bb              |   12 +++++
 .../0002-update-ca-certificates-use-SYSROOT.patch  |   56 ++++++++++++++++++++
 .../ca-certificates/ca-certificates_20130119.bb    |   20 ++-----
 4 files changed, 87 insertions(+), 16 deletions(-)
 create mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates-20130119.inc
 create mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
 create mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch

diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates-20130119.inc b/meta-oe/recipes-support/ca-certificates/ca-certificates-20130119.inc
new file mode 100644
index 0000000..ac993bc
--- /dev/null
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates-20130119.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "Common CA certificates"
+HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
+SECTION = "misc"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=6135800ff6d893c7904d7aad90972eb5"
+PR = "r1"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
+           file://0001-update-ca-certificates-remove-c-rehash.patch \
+           file://0002-update-ca-certificates-use-SYSROOT.patch"
+
+SRC_URI[md5sum] = "1fbbec2028a33cf865b79c204aa2e626"
+SRC_URI[sha256sum] = "fb51ec9a2c551838cc1646a0b3c9e6bea5c1bb20ff5d71c542451fac4b191c22"
+
+inherit allarch
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
new file mode 100644
index 0000000..8e344fd
--- /dev/null
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
@@ -0,0 +1,12 @@
+require ca-certificates-${PV}.inc
+
+do_install() {
+        install -d ${D}${bindir_crossscripts}
+        install -m755 ${S}/sbin/update-ca-certificates ${D}${bindir_crossscripts}
+}
+
+SYSROOT_PREPROCESS_FUNCS += "ca_certificates_sysroot_preprocess"
+
+ca_certificates_sysroot_preprocess() {
+        sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
+}
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch b/meta-oe/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
new file mode 100644
index 0000000..689fdd9
--- /dev/null
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Pending
+
+From 724cb153ca0f607fb38b3a8db3ebb2742601cd81 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Tue, 19 Mar 2013 17:14:33 +0100
+Subject: [PATCH 2/2] update-ca-certificates: use $SYSROOT
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ sbin/update-ca-certificates |   14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index c567e3d..923b68a 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
+@@ -37,11 +37,11 @@ do
+   shift
+ done
+ 
+-CERTSCONF=/etc/ca-certificates.conf
+-CERTSDIR=/usr/share/ca-certificates
+-LOCALCERTSDIR=/usr/local/share/ca-certificates
++CERTSCONF=$SYSROOT/etc/ca-certificates.conf
++CERTSDIR=$SYSROOT/usr/share/ca-certificates
++LOCALCERTSDIR=$SYSROOT/usr/local/share/ca-certificates
+ CERTBUNDLE=ca-certificates.crt
+-ETCCERTSDIR=/etc/ssl/certs
++ETCCERTSDIR=$SYSROOT/etc/ssl/certs
+ 
+ cleanup() {
+   rm -f "$TEMPBUNDLE"
+@@ -64,9 +64,9 @@ add() {
+   PEM="$ETCCERTSDIR/$(basename "$CERT" .crt | sed -e 's/ /_/g' \
+                                                   -e 's/[()]/=/g' \
+                                                   -e 's/,/_/g').pem"
+-  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "$CERT" ]
++  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${CERT##$SYSROOT}" ]
+   then
+-    ln -sf "$CERT" "$PEM"
++    ln -sf "${CERT##$SYSROOT}" "$PEM"
+     echo +$PEM >> "$ADDED"
+   fi
+   cat "$CERT" >> "$TEMPBUNDLE"
+@@ -148,7 +148,7 @@ mv -f "$TEMPBUNDLE" "$CERTBUNDLE"
+ 
+ echo "$ADDED_CNT added, $REMOVED_CNT removed; done."
+ 
+-HOOKSDIR=/etc/ca-certificates/update.d
++HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
+ echo -n "Running hooks in $HOOKSDIR...."
+ VERBOSE_ARG=
+ [ "$verbose" = 0 ] || VERBOSE_ARG=--verbose
+-- 
+1.7.10.4
+
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
index 5ad4485..a1eb1c4 100644
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
@@ -1,16 +1,8 @@
-DESCRIPTION = "Common CA certificates"
-HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
-SECTION = "misc"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=6135800ff6d893c7904d7aad90972eb5"
+DEPENDS = "ca-certificates-cross"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
-           file://0001-update-ca-certificates-remove-c-rehash.patch"
+require ca-certificates-${PV}.inc
 
-SRC_URI[md5sum] = "1fbbec2028a33cf865b79c204aa2e626"
-SRC_URI[sha256sum] = "fb51ec9a2c551838cc1646a0b3c9e6bea5c1bb20ff5d71c542451fac4b191c22"
-
-inherit autotools allarch
+inherit autotools
 
 do_install_prepend() {
         mkdir -p ${D}/usr/share/ca-certificates
@@ -32,11 +24,7 @@ do_install_append() {
 }
 
 pkg_postinst_${PN} () {
-if [ -n "$D" ] ; then
-	exit 1
-fi
-
-${sbindir}/update-ca-certificates
+SYSROOT="$D" update-ca-certificates
 }
 
 CONFFILES_${PN} = "/etc/ca-certificates.conf"
-- 
1.7.10.4



