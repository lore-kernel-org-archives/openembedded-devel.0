Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NUqyw-0002KG-7X
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 01:21:09 +0100
Received: by fg-out-1718.google.com with SMTP id 22so1500fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 16:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=NAO6DbWjXvJ8c9Px9N7esWwz2SSkRHt2wYyhqcJCpPI=;
	b=MpaNNshkHVm+hKBYvRujmon2Weu7XBOpbmlywwagva4VVsCBuKITVdIAsw4IJ0KUuS
	STDhJXs/jvFvEa0CCgTCjyMYusWOUAH8/Ss6pNjSN6UIa5Mkb4rg60k2yDSzJTqnGyyw
	AXTH1D6yeXjNLNx3GYj0/H66Zov0BoJafugzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=R4gaebr6xyf20CL9MRrAH/ICoq+A+yxkp8FSsteDwNRYmlLOtcz6qXqxXGXU1k7+DY
	u8R+5U0ar/eslvZ1KdyedbT8jvL485DFfLKsja90WUWNa6I/sDzvVIYvpTfJ1iuom0a5
	6KL95t0wKBSZWnPLb1Ipc8bMxTmmTWsyoGMuU=
Received: by 10.87.62.29 with SMTP id p29mr8854902fgk.31.1263341938674;
	Tue, 12 Jan 2010 16:18:58 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm10521407fxm.3.2010.01.12.16.18.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Jan 2010 16:18:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jan 2010 01:17:18 +0100
Message-Id: <1263341840-19186-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <20100112222121.GD10781@jama>
References: <20100112222121.GD10781@jama>
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/3] opkg, update-alternatives-cworth: use /usr/lib/opkg/alternatives directory instead of /usr/lib/ipkg/alternatives
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
X-List-Received-Date: Wed, 13 Jan 2010 00:21:09 -0000

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
 recipes/opkg/opkg.inc                              |    2 +-
 recipes/opkg/opkg_svn.bb                           |    2 +
 recipes/opkg/update-alternatives-merge.inc         |   41 ++++++++++++++++++++
 .../update-alternatives-cworth.inc                 |    7 ++-
 .../use-opkg-dir-instead-of-ipkg.patch             |   11 +++++
 5 files changed, 60 insertions(+), 3 deletions(-)
 create mode 100644 recipes/opkg/update-alternatives-merge.inc
 create mode 100644 recipes/update-alternatives/update-alternatives-cworth/use-opkg-dir-instead-of-ipkg.patch

diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index 1716034..b317de4 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "curl gpgme"
 PV = "0.1.6+svnr${SRCPV}"
-INC_PR = "r18"
+INC_PR = "r20"
 
 FILESPATHPKG =. "opkg:"
 
diff --git a/recipes/opkg/opkg_svn.bb b/recipes/opkg/opkg_svn.bb
index 44c0baf..4945260 100644
--- a/recipes/opkg/opkg_svn.bb
+++ b/recipes/opkg/opkg_svn.bb
@@ -25,3 +25,5 @@ pkg_postinst_${PN} () {
 pkg_postrm_${PN} () {
   update-alternatives --remove opkg ${bindir}/opkg-cl
 }
+
+require update-alternatives-merge.inc
diff --git a/recipes/opkg/update-alternatives-merge.inc b/recipes/opkg/update-alternatives-merge.inc
new file mode 100644
index 0000000..69d949b
--- /dev/null
+++ b/recipes/opkg/update-alternatives-merge.inc
@@ -0,0 +1,41 @@
+# Moves all entries from /usr/lib/ipkg/alternatives to /usr/lib/opkg/alternatives
+# If it exists in both it use file with more lines
+
+pkg_postinst_append () {
+        alternatives_dir_old="${prefix}/lib/ipkg/alternatives"
+        alternatives_dir_new="${prefix}/lib/opkg/alternatives"
+        if [ -e "${alternatives_dir_old}" ] ; then
+        	if [ ! -e "${alternatives_dir_new}" ] ; then
+			mkdir -p "${alternatives_dir_new}";
+		fi
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
+                                                echo "'${alternatives_dir_new}/${alt_file}' is the same"
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
diff --git a/recipes/update-alternatives/update-alternatives-cworth.inc b/recipes/update-alternatives/update-alternatives-cworth.inc
index 2d8fd42..16d779e 100644
--- a/recipes/update-alternatives/update-alternatives-cworth.inc
+++ b/recipes/update-alternatives/update-alternatives-cworth.inc
@@ -1,8 +1,11 @@
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
+require ../opkg/update-alternatives-merge.inc
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



