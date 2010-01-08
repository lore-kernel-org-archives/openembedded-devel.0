Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NTH1P-000237-Io
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 16:45:10 +0100
Received: by fxm4 with SMTP id 4so16224618fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 07:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=wSm7oimVPAqpE+MAEipUrrIUoHYca0yJPhs7uOCATcs=;
	b=ZetRxBQK8XSGg+D/DdtsQ1jV39AcoxvmFlqe4H7qgtaM9K0NW7kYGeS/E/LJPZMEQG
	CYjErY9bhP7F7T3SSyKsC+YU/0pKisFL5IAViUqjfr54f7tT9jz3ZIhohFs5onJ/miQO
	uxvl6BsedFTl7U9udlwwm2NSsRmvofwqhSAtY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PRoT5Ve47gsz3v0wbTFn9OeYaif/fNprq2WwRDoG7xbv5UY4kJDvQwbvBYl7nfFIHS
	ur+S7uBHDcUvcsRa7QvJHPHbcI5guhyMqBjMJwKEizwRl/1zvnZHh4es/a170bu4PMTA
	Dl3WSHMERckNdedeD3tb1zUwVElp8bFvNVOVY=
Received: by 10.223.4.144 with SMTP id 16mr3101198far.36.1262965381584;
	Fri, 08 Jan 2010 07:43:01 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm8317436fxm.11.2010.01.08.07.43.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Jan 2010 07:43:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jan 2010 16:42:56 +0100
Message-Id: <1262965376-16205-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <hi7e2e$cda$1@ger.gmane.org>
References: <hi7e2e$cda$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] update-alternatives-cworth: use /usr/lib/opkg/alternatives directory instead of /usr/lib/ipkg/alternatives
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
X-List-Received-Date: Fri, 08 Jan 2010 15:45:10 -0000

* It's usefull to make it compatible with u-a script in opkg package
* Old entries are merged to new directory in quite verbose postinst
  script
* If entry exists only in old its moved
* If entry exists in both the one with more lines is used
* The one with less lines is not used and warning is shown
* If they have the same number of lines diff is checked
* If they are the same, old one is ignored
* If they are different, old one is ignored and warning is shown
---
 .../update-alternatives-cworth.inc                 |   44 +++++++++++++++++++-
 .../use-opkg-dir-instead-of-ipkg.patch             |   11 +++++
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 recipes/update-alternatives/update-alternatives-cworth/use-opkg-dir-instead-of-ipkg.patch

diff --git a/recipes/update-alternatives/update-alternatives-cworth.inc b/recipes/update-alternatives/update-alternatives-cworth.inc
index 2d8fd42..23d559b 100644
--- a/recipes/update-alternatives/update-alternatives-cworth.inc
+++ b/recipes/update-alternatives/update-alternatives-cworth.inc
@@ -1,8 +1,48 @@
 LICENSE = "GPL"
 SECTION = "base"
 SRC_URI = "${HANDHELDS_CVS};module=familiar/dist/ipkg;tag=${@'V' + bb.data.getVar('PV',d,1).replace('.', '-')} \
-           file://update-alternatives.use.last.patch;patch=1"
+           file://update-alternatives.use.last.patch;patch=1 \
+           file://use-opkg-dir-instead-of-ipkg.patch;patch=1 "
 S = "${WORKDIR}/ipkg/C"
 PACKAGE_ARCH = "all"
 
-INC_PR = "r3"
+INC_PR = "r4"
+
+# Moves all entries from /usr/lib/ipkg/alternatives to /usr/lib/opkg/alternatives
+# If it exists in both it use file with more lines
+
+pkg_postinst() {
+        alternatives_dir_old="${prefix}/lib/ipkg/alternatives"
+        alternatives_dir_new="${prefix}/lib/opkg/alternatives"
+        if [ -e "${alternatives_dir_old}" ] ; then
+                echo "Old alternatives directory ${alternatives_dir_old} exists, moving entries to new one ${alternatives_dir_new}"
+                echo "Creating backup copy of both ${alternatives_dir_old}-backup and ${alternatives_dir_new}-backup"
+                cp -ra "${alternatives_dir_old}" "${alternatives_dir_old}-backup"
+                cp -ra "${alternatives_dir_new}" "${alternatives_dir_new}-backup"
+
+                cd ${alternatives_dir_old}
+                for alt_file in * ; do
+                        if [ ! -e "${alternatives_dir_new}/${alt_file}" ] ; then
+                                echo "Moving old '${alternatives_dir_old}/${alt_file}' to '${alternatives_dir_new}/${alt_file}'";
+                                mv -f "${alternatives_dir_old}/${alt_file}" "${alternatives_dir_new}/${alt_file}"
+                        else
+                                OLD_LINES=`wc -l ${alternatives_dir_old}/${alt_file} | cut -d/ -f 1`;
+                                NEW_LINES=`wc -l ${alternatives_dir_new}/${alt_file} | cut -d/ -f 1`;
+                                if [ $OLD_LINES -gt $NEW_LINES ] ; then
+                                        echo "Replacing '${alternatives_dir_new}/${alt_file}' with '${alternatives_dir_old}/${alt_file}'";
+                                        mv -f "${alternatives_dir_old}/${alt_file}" "${alternatives_dir_new}/${alt_file}"
+                                elif [ $OLD_LINES -eq $NEW_LINES ] ; then
+                                        if diff -q "${alternatives_dir_new}/${alt_file}" "${alternatives_dir_old}/${alt_file}" >/dev/null ; then
+                                                echo "'{alternatives_dir_new}/${alt_file}' is the same"
+                                        else
+                                                echo "WARN: You have to update manually if needed. Please check: diff '${alternatives_dir_old}-backup/${alt_file}' '${alternatives_dir_new}-backup/${alt_file}'"
+                                        fi
+                                else
+                                        echo "WARN: '${alternatives_dir_old}/${alt_file}' is shorter than new one, ignoring, but please check and update manually if needed"
+                                fi
+                        fi
+                done
+		rm -rf ${alternatives_dir_old}
+		echo "Merge finished, old directory '${alternatives_dir_old}' is removed"
+        fi
+}
diff --git a/recipes/update-alternatives/update-alternatives-cworth/use-opkg-dir-instead-of-ipkg.patch b/recipes/update-alternatives/update-alternatives-cworth/use-opkg-dir-instead-of-ipkg.patch
new file mode 100644
index 0000000..4355556
--- /dev/null
+++ b/recipes/update-alternatives/update-alternatives-cworth/use-opkg-dir-instead-of-ipkg.patch
@@ -0,0 +1,11 @@
+--- C.orig/update-alternatives	2010-01-08 15:40:20.000000000 +0100
++++ C/update-alternatives	2010-01-08 15:40:47.000000000 +0100
+@@ -21,7 +21,7 @@
+ set -e
+ 
+ # admin dir
+-ad="$IPKG_OFFLINE_ROOT/usr/lib/ipkg/alternatives"
++ad="$IPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"
+ 
+ usage() {
+ 	echo "update-alternatives: $*
-- 
1.6.6



