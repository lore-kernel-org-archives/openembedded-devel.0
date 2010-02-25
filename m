Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NkjWc-0003P7-PL
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Feb 2010 20:37:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 4947DA2C3B1;
	Thu, 25 Feb 2010 20:34:46 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JzgjSN5k+34m; Thu, 25 Feb 2010 20:34:45 +0100 (CET)
Received: from localhost.localdomain (pD9E17B74.dip.t-dialin.net
	[217.225.123.116])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 8A6CEA2C3A8;
	Thu, 25 Feb 2010 20:34:45 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2010 20:34:41 +0100
Message-Id: <1267126481-27969-1-git-send-email-ml@vdm-design.de>
X-Mailer: git-send-email 1.7.0
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] [RFC] ca-certificates: add package for ssl certificates
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
X-List-Received-Date: Thu, 25 Feb 2010 19:37:43 -0000

* this is package for ssl certificates as they are no longer
  provided by curl nor openssl
* this package contains the certificates from debian
* uses update-ca-certificates from debian without the
  part that creates hash links to the certs, because
  that uses c_rehash from openssl which is a perl script

Signed-off-by: Thomas Zimmermann <ml@vdm-design.de>
---
 .../ca-certificates/ca-certificates_20090814.bb    |   38 ++++++++++++++++++++
 .../ca-certificates/files/remove-c-rehash.patch    |   29 +++++++++++++++
 2 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ca-certificates/ca-certificates_20090814.bb
 create mode 100644 recipes/ca-certificates/files/remove-c-rehash.patch

diff --git a/recipes/ca-certificates/ca-certificates_20090814.bb b/recipes/ca-certificates/ca-certificates_20090814.bb
new file mode 100644
index 0000000..75da160
--- /dev/null
+++ b/recipes/ca-certificates/ca-certificates_20090814.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "Common CA certificates"
+HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
+SECTION = "misc"
+PRIORITY = "optional"
+LICENSE = "GPL"
+
+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_${PV}.tar.gz;name=archive \
+           file://remove-c-rehash.patch;patch=1"
+SRC_URI[archive.md5sum] = "307052c985bec7f9a00eb84293eef779"
+SRC_URI[archive.sha256sum] = "6924fafc35dd020da99bc86842f95f2a97a3a5ff084b0635eea815fe2777fc7c"
+
+inherit autotools
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
+        touch ${D}/etc/ca-certificates.conf
+        for crt in $(find . -type f -name '*.crt' -print)
+        do
+                crt=$(echo $crt | sed -e 's/\.\///')
+                echo $crt >> ${D}/etc/ca-certificates.conf
+        done
+}
+
+PACKAGE_ARCH = "all"
+PACKAGES = "${PN}"
+
+pkg_postinst_${PN} () {
+        /usr/sbin/update-ca-certificates
+}
+
+CONFFILES_${PN} = "/etc/ca-certificates.conf"
diff --git a/recipes/ca-certificates/files/remove-c-rehash.patch b/recipes/ca-certificates/files/remove-c-rehash.patch
new file mode 100644
index 0000000..9d9b8ad
--- /dev/null
+++ b/recipes/ca-certificates/files/remove-c-rehash.patch
@@ -0,0 +1,29 @@
+--- ca-certificates-20090814/sbin/update-ca-certificates.orig	2010-02-25 19:25:08.272807308 +0100
++++ ca-certificates-20090814/sbin/update-ca-certificates	2010-02-25 19:25:33.962806273 +0100
+@@ -133,16 +133,16 @@
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
+ echo "$ADDED_CNT added, $REMOVED_CNT removed; done."
+ 
-- 
1.7.0



