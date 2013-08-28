Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C6EBD6BC98
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 10:44:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Aug 2013 03:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,975,1367996400"; d="scan'208";a="394649056"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.7])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2013 03:44:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2013 11:43:28 +0100
Message-Id: <2314a09e0fe7dc4fc20ab80c2a0972adfd4dcb48.1377686481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1377686481.git.paul.eggleton@linux.intel.com>
References: <cover.1377686481.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe,meta-gnome][PATCH 6/6] ca-certificates: remove
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
X-List-Received-Date: Wed, 28 Aug 2013 10:44:46 -0000

This is now in OE-Core as of ad2851cf0abc2ab35e0f60c96d3142c29a07c8fc.
ca-certificates-cross is no longer used (effectively replaced by a native
BBCLASSEXTEND in the main recipe).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../ca-certificates/ca-certificates-20130119.inc   | 15 ------
 .../ca-certificates-cross_20130119.bb              | 12 -----
 ...01-update-ca-certificates-remove-c-rehash.patch | 45 -----------------
 .../0002-update-ca-certificates-use-SYSROOT.patch  | 56 ----------------------
 .../ca-certificates/ca-certificates_20130119.bb    | 30 ------------
 5 files changed, 158 deletions(-)
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates-20130119.inc
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb

diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates-20130119.inc b/meta-oe/recipes-support/ca-certificates/ca-certificates-20130119.inc
deleted file mode 100644
index ac993bc..0000000
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates-20130119.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Common CA certificates"
-HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
-SECTION = "misc"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=6135800ff6d893c7904d7aad90972eb5"
-PR = "r1"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
-           file://0001-update-ca-certificates-remove-c-rehash.patch \
-           file://0002-update-ca-certificates-use-SYSROOT.patch"
-
-SRC_URI[md5sum] = "1fbbec2028a33cf865b79c204aa2e626"
-SRC_URI[sha256sum] = "fb51ec9a2c551838cc1646a0b3c9e6bea5c1bb20ff5d71c542451fac4b191c22"
-
-inherit allarch
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
deleted file mode 100644
index 171d6a0..0000000
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates-cross_20130119.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ca-certificates-${PV}.inc
-
-do_install() {
-    install -d ${D}${bindir_crossscripts}
-    install -m755 ${S}/sbin/update-ca-certificates ${D}${bindir_crossscripts}
-}
-
-SYSROOT_PREPROCESS_FUNCS += "ca_certificates_sysroot_preprocess"
-
-ca_certificates_sysroot_preprocess() {
-    sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
-}
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch b/meta-oe/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
deleted file mode 100644
index ccb0efc..0000000
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 111e905fe931da1a3800accfc675cc01c8ee080c Mon Sep 17 00:00:00 2001
-From: Ulf Samuelsson <ulf@emagii.com>
-Date: Tue, 28 Feb 2012 06:42:58 +0100
-Subject: [PATCH] update-ca-certificates: remove c rehash
-
-Updated earlier patch to apply clean on 2012-02-12
-Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
----
- sbin/update-ca-certificates |   20 ++++++++++----------
- 1 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index 5375950..c567e3d 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -132,16 +132,16 @@ rm -f "$CERTBUNDLE"
- ADDED_CNT=$(wc -l < "$ADDED")
- REMOVED_CNT=$(wc -l < "$REMOVED")
- 
--if [ "$ADDED_CNT" -gt 0 ] || [ "$REMOVED_CNT" -gt 0 ]
--then
--  # only run if set of files has changed
--  if [ "$verbose" = 0 ]
--  then
--    c_rehash . > /dev/null
--  else
--    c_rehash .
--  fi
--fi
-+#if [ "$ADDED_CNT" -gt 0 ] || [ "$REMOVED_CNT" -gt 0 ]
-+#then
-+#  # only run if set of files has changed
-+#  if [ "$verbose" = 0 ]
-+#  then
-+#    c_rehash . > /dev/null
-+#  else
-+#    c_rehash .
-+#  fi
-+#fi
- 
- chmod 0644 "$TEMPBUNDLE"
- mv -f "$TEMPBUNDLE" "$CERTBUNDLE"
--- 
-1.7.4.1
-
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch b/meta-oe/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
deleted file mode 100644
index 689fdd9..0000000
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates/0002-update-ca-certificates-use-SYSROOT.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Pending
-
-From 724cb153ca0f607fb38b3a8db3ebb2742601cd81 Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Tue, 19 Mar 2013 17:14:33 +0100
-Subject: [PATCH 2/2] update-ca-certificates: use $SYSROOT
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
----
- sbin/update-ca-certificates |   14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
-index c567e3d..923b68a 100755
---- a/sbin/update-ca-certificates
-+++ b/sbin/update-ca-certificates
-@@ -37,11 +37,11 @@ do
-   shift
- done
- 
--CERTSCONF=/etc/ca-certificates.conf
--CERTSDIR=/usr/share/ca-certificates
--LOCALCERTSDIR=/usr/local/share/ca-certificates
-+CERTSCONF=$SYSROOT/etc/ca-certificates.conf
-+CERTSDIR=$SYSROOT/usr/share/ca-certificates
-+LOCALCERTSDIR=$SYSROOT/usr/local/share/ca-certificates
- CERTBUNDLE=ca-certificates.crt
--ETCCERTSDIR=/etc/ssl/certs
-+ETCCERTSDIR=$SYSROOT/etc/ssl/certs
- 
- cleanup() {
-   rm -f "$TEMPBUNDLE"
-@@ -64,9 +64,9 @@ add() {
-   PEM="$ETCCERTSDIR/$(basename "$CERT" .crt | sed -e 's/ /_/g' \
-                                                   -e 's/[()]/=/g' \
-                                                   -e 's/,/_/g').pem"
--  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "$CERT" ]
-+  if ! test -e "$PEM" || [ "$(readlink "$PEM")" != "${CERT##$SYSROOT}" ]
-   then
--    ln -sf "$CERT" "$PEM"
-+    ln -sf "${CERT##$SYSROOT}" "$PEM"
-     echo +$PEM >> "$ADDED"
-   fi
-   cat "$CERT" >> "$TEMPBUNDLE"
-@@ -148,7 +148,7 @@ mv -f "$TEMPBUNDLE" "$CERTBUNDLE"
- 
- echo "$ADDED_CNT added, $REMOVED_CNT removed; done."
- 
--HOOKSDIR=/etc/ca-certificates/update.d
-+HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
- echo -n "Running hooks in $HOOKSDIR...."
- VERBOSE_ARG=
- [ "$verbose" = 0 ] || VERBOSE_ARG=--verbose
--- 
-1.7.10.4
-
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
deleted file mode 100644
index 504190f..0000000
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20130119.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DEPENDS = "ca-certificates-cross"
-
-require ca-certificates-${PV}.inc
-
-inherit autotools
-
-do_install_prepend() {
-    mkdir -p ${D}/usr/share/ca-certificates
-    mkdir -p ${D}/usr/sbin
-    mkdir -p ${D}/etc/ssl/certs
-    mkdir -p ${D}/etc/ca-certificates/update.d
-}
-
-do_install_append() {
-    cd ${D}/usr/share/ca-certificates
-    echo "# Lines starting with # will be ignored" > ${D}/etc/ca-certificates.conf
-    echo "# Lines starting with ! will remove certificate on next update" >> ${D}/etc/ca-certificates.conf
-    echo "#" >> ${D}/etc/ca-certificates.conf
-    for crt in $(find . -type f -name '*.crt' -print)
-    do
-        crt=$(echo $crt | sed -e 's/\.\///')
-        echo $crt >> ${D}/etc/ca-certificates.conf
-    done
-}
-
-pkg_postinst_${PN} () {
-SYSROOT="$D" update-ca-certificates
-}
-
-CONFFILES_${PN} = "/etc/ca-certificates.conf"
-- 
1.8.1.2


