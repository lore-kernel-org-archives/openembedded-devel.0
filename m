Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1S2GI2-00024G-Nu
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 07:11:58 +0100
Received: from ipb3.telenor.se (ipb3.telenor.se [195.54.127.166])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id C14C9C209
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 07:03:30 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AkFIAO5sTE9T4znVPGdsb2JhbABDs3EZAQEBATc0gXMBXCMYFAMBAmgKDCGICge4aolpg34GBQmFEwoyDQEGD4NBBJU9km+BUw
X-IronPort-AV: E=Sophos;i="4.73,494,1325458800"; d="scan'208";a="55755245"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.213])
	by ipb3.telenor.se with ESMTP; 28 Feb 2012 07:03:30 +0100
From: ulf@emagii.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 07:03:21 +0100
Message-Id: <1330409002-31186-1-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] ca-certificates: Bump version to 20120212
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
X-List-Received-Date: Tue, 28 Feb 2012 06:11:58 -0000

From: Ulf Samuelsson <ulf@emagii.com>

20111211 has disappeared from the server

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 ...01-update-ca-certificates-remove-c-rehash.patch |   45 ++++++++++++++++++++
 .../ca-certificates/remove-c-rehash.patch          |   29 -------------
 .../ca-certificates/ca-certificates_20111211.bb    |   42 ------------------
 .../ca-certificates/ca-certificates_20120212.bb    |   42 ++++++++++++++++++
 4 files changed, 87 insertions(+), 71 deletions(-)
 create mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates/remove-c-rehash.patch
 delete mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb
 create mode 100644 meta-oe/recipes-support/ca-certificates/ca-certificates_20120212.bb

diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch b/meta-oe/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
new file mode 100644
index 0000000..ccb0efc
--- /dev/null
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch
@@ -0,0 +1,45 @@
+From 111e905fe931da1a3800accfc675cc01c8ee080c Mon Sep 17 00:00:00 2001
+From: Ulf Samuelsson <ulf@emagii.com>
+Date: Tue, 28 Feb 2012 06:42:58 +0100
+Subject: [PATCH] update-ca-certificates: remove c rehash
+
+Updated earlier patch to apply clean on 2012-02-12
+Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
+---
+ sbin/update-ca-certificates |   20 ++++++++++----------
+ 1 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index 5375950..c567e3d 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
+@@ -132,16 +132,16 @@ rm -f "$CERTBUNDLE"
+ ADDED_CNT=$(wc -l < "$ADDED")
+ REMOVED_CNT=$(wc -l < "$REMOVED")
+ 
+-if [ "$ADDED_CNT" -gt 0 ] || [ "$REMOVED_CNT" -gt 0 ]
+-then
+-  # only run if set of files has changed
+-  if [ "$verbose" = 0 ]
+-  then
+-    c_rehash . > /dev/null
+-  else
+-    c_rehash .
+-  fi
+-fi
++#if [ "$ADDED_CNT" -gt 0 ] || [ "$REMOVED_CNT" -gt 0 ]
++#then
++#  # only run if set of files has changed
++#  if [ "$verbose" = 0 ]
++#  then
++#    c_rehash . > /dev/null
++#  else
++#    c_rehash .
++#  fi
++#fi
+ 
+ chmod 0644 "$TEMPBUNDLE"
+ mv -f "$TEMPBUNDLE" "$CERTBUNDLE"
+-- 
+1.7.4.1
+
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates/remove-c-rehash.patch b/meta-oe/recipes-support/ca-certificates/ca-certificates/remove-c-rehash.patch
deleted file mode 100644
index 9d9b8ad..0000000
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates/remove-c-rehash.patch
+++ /dev/null
@@ -1,29 +0,0 @@
---- ca-certificates-20090814/sbin/update-ca-certificates.orig	2010-02-25 19:25:08.272807308 +0100
-+++ ca-certificates-20090814/sbin/update-ca-certificates	2010-02-25 19:25:33.962806273 +0100
-@@ -133,16 +133,16 @@
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
- echo "$ADDED_CNT added, $REMOVED_CNT removed; done."
- 
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb
deleted file mode 100644
index b79f5b1..0000000
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20111211.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "Common CA certificates"
-HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
-SECTION = "misc"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=6275b491c91b57d92ebe11205ebf4dfe"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
-           file://remove-c-rehash.patch"
-
-SRC_URI[md5sum] = "f99a90a91b23338b4df765c0d18eba73"
-SRC_URI[sha256sum] = "6f0633136d17ffef3ed0adfb171a00136a320f0fd79c9c75733ac02662a754a7"
-
-inherit autotools allarch
-
-do_install_prepend() {
-        mkdir -p ${D}/usr/share/ca-certificates
-        mkdir -p ${D}/usr/sbin
-        mkdir -p ${D}/etc/ssl/certs
-        mkdir -p ${D}/etc/ca-certificates/update.d
-}
-
-do_install_append() {
-        cd ${D}/usr/share/ca-certificates
-        echo "# Lines starting with # will be ignored" > ${D}/etc/ca-certificates.conf
-        echo "# Lines starting with ! will remove certificate on next update" >> ${D}/etc/ca-certificates.conf
-        echo "#" >> ${D}/etc/ca-certificates.conf
-        for crt in $(find . -type f -name '*.crt' -print)
-        do
-                crt=$(echo $crt | sed -e 's/\.\///')
-                echo $crt >> ${D}/etc/ca-certificates.conf
-        done
-}
-
-pkg_postinst_${PN} () {
-if [ -n "$D" ] ; then
-	exit 1
-fi
-
-${sbindir}/update-ca-certificates
-}
-
-CONFFILES_${PN} = "/etc/ca-certificates.conf"
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20120212.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20120212.bb
new file mode 100644
index 0000000..b3d7b9c
--- /dev/null
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates_20120212.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "Common CA certificates"
+HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
+SECTION = "misc"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=6275b491c91b57d92ebe11205ebf4dfe"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
+           file://0001-update-ca-certificates-remove-c-rehash.patch"
+
+SRC_URI[md5sum] = "391dea8d827db935ca0d0d1e6641bf23"
+SRC_URI[sha256sum] = "95f3eac93dad4433b5731bc9e106a26e2ccf210acace1927e597477b24187dce"
+
+inherit autotools allarch
+
+do_install_prepend() {
+        mkdir -p ${D}/usr/share/ca-certificates
+        mkdir -p ${D}/usr/sbin
+        mkdir -p ${D}/etc/ssl/certs
+        mkdir -p ${D}/etc/ca-certificates/update.d
+}
+
+do_install_append() {
+        cd ${D}/usr/share/ca-certificates
+        echo "# Lines starting with # will be ignored" > ${D}/etc/ca-certificates.conf
+        echo "# Lines starting with ! will remove certificate on next update" >> ${D}/etc/ca-certificates.conf
+        echo "#" >> ${D}/etc/ca-certificates.conf
+        for crt in $(find . -type f -name '*.crt' -print)
+        do
+                crt=$(echo $crt | sed -e 's/\.\///')
+                echo $crt >> ${D}/etc/ca-certificates.conf
+        done
+}
+
+pkg_postinst_${PN} () {
+if [ -n "$D" ] ; then
+	exit 1
+fi
+
+${sbindir}/update-ca-certificates
+}
+
+CONFFILES_${PN} = "/etc/ca-certificates.conf"
-- 
1.7.4.1



