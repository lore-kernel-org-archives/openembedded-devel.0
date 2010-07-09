Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OXK9V-0001lN-Fi
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 22:26:34 +0200
Received: by pwi10 with SMTP id 10so1147062pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=O2hHzwBO594kDpYGG/JmQXiwF/sPtZ0MCNIiPG5lwlw=;
	b=WFa7j9tkKOC3WiNB2cuB3xrO+/DV9iZ9vRa3rYy7BeTW9ddz0+Mm8x5GV2fn6zVEzO
	36D/ZoUPq3COxwdjKwjsWC6l/jrwZH4GtPd9KAlq3CTtzYarb8x1sc8w1R8T6Tz83dpW
	+Qnk5aRE9kFknS+ZYOhFXyA4Rkesm/QKP1WTM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=srNezTfGMyg57nhXDpw40ZOMBqEnSiYx/9ve2RSQWZEzBuXElLpB4ACl7yD4rfA65H
	Atkls2C3rIZqu9AckYKwB9h1PCnlUI9aiYh9/v1B9fDQrI/Sw+wc/k243OxIwXJdNOnK
	DB9lvdz7+TPnjgZQM8jZKJlHRybV49dPD8LYo=
Received: by 10.114.57.6 with SMTP id f6mr11941854waa.24.1278706894141;
	Fri, 09 Jul 2010 13:21:34 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c24sm19170681wam.7.2010.07.09.13.21.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 09 Jul 2010 13:21:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Jul 2010 13:21:29 -0700
Message-Id: <1278706889-319-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] quilt: Add option QUILT_NO_RM_SYMLINKS so follow symlinks with quilt refresh
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
X-List-Received-Date: Fri, 09 Jul 2010 20:26:35 -0000

* OE now creates symlinks into metadata. This patch allows quilt to
  follow the symlinks so when a patch is refreshed then the result
  happens in the metadata location.

* Creating a new patch will still happen in local patches directory
  unless one uses path into metadata.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/quilt/quilt-0.48/no_rm_symlinks.patch |   34 +++++++++++++++++++++++++
 recipes/quilt/quilt-native.inc                |    6 ++--
 recipes/quilt/quilt-native_0.48.bb            |    2 +
 recipes/quilt/quilt.inc                       |    4 ++-
 recipes/quilt/quilt_0.48.bb                   |    2 +
 5 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 recipes/quilt/quilt-0.48/no_rm_symlinks.patch

diff --git a/recipes/quilt/quilt-0.48/no_rm_symlinks.patch b/recipes/quilt/quilt-0.48/no_rm_symlinks.patch
new file mode 100644
index 0000000..6c8415a
--- /dev/null
+++ b/recipes/quilt/quilt-0.48/no_rm_symlinks.patch
@@ -0,0 +1,34 @@
+#If you're so lucky as to be using a Windriver Linux product, and your
+#patch files are actually symlinks, this option set to yes will allow
+#the symlink to be preserved (resulting in the file the link is pointing to
+#to be refreshed).
+
+--- quilt-0.48.orig/quilt/scripts/patchfns.in.org	2010-07-09 11:35:07.992300000 -0700
++++ quilt-0.48/quilt/scripts/patchfns.in	2010-07-09 11:41:01.312300001 -0700
+@@ -783,7 +783,13 @@ cat_to_new_file()
+ {
+ 	local filename="$1"
+ 
+-	[ -e "$filename" ] && rm -f "$filename"
++	if [ -e "$filename" ]
++	then
++	    if [ "$QUILT_NO_RM_SYMLINKS" != "yes" ]
++	    then
++		rm -f "$filename"
++	    fi
++	fi
+ 
+ 	case "$filename" in
+ 	*.gz)
+--- quilt-0.48.orig/quilt.quiltrc.org	2010-07-09 11:45:07.582300001 -0700
++++ quilt-0.48/quilt.quiltrc	2010-07-09 11:46:35.222300001 -0700
+@@ -29,3 +29,9 @@ QUILT_PATCHES_PREFIX=yes
+ # Use a specific editor for quilt (defaults to the value of $EDITOR before
+ # sourcing this configuration file, or vi if $EDITOR wasn't set).
+ #EDITOR=nedit
++
++#If patch files are actually symlinks, this option set to yes will allow
++#the symlink to be preserved (resulting in the file the link is pointing to
++#to be refreshed).
++QUILT_NO_RM_SYMLINKS=yes
++
diff --git a/recipes/quilt/quilt-native.inc b/recipes/quilt/quilt-native.inc
index 5c5a015..2823454 100644
--- a/recipes/quilt/quilt-native.inc
+++ b/recipes/quilt/quilt-native.inc
@@ -1,15 +1,15 @@
 require quilt.inc
 
 SRC_URI_append_build-darwin = "?   file://non-gnu.patch "
-RDEPENDS_${PN} = "diffstat-native patch-native bzip2-native util-linux-native"
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/quilt-${PV}"
+RDEPENDS_${PN} = "libtimedate-perl-native diffstat-native patch-native bzip2-native util-linux-native"
 
+FILESPATHPKG =. quilt-${PV}
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
 inherit autotools native
 
 PATCHTOOL = "patch"
-EXTRA_OECONF = "--disable-nls --without-date"
+EXTRA_OECONF = "--disable-nls"
 
 do_configure () {
 	oe_runconf
diff --git a/recipes/quilt/quilt-native_0.48.bb b/recipes/quilt/quilt-native_0.48.bb
index 45b4b3c..c36d79e 100644
--- a/recipes/quilt/quilt-native_0.48.bb
+++ b/recipes/quilt/quilt-native_0.48.bb
@@ -1,4 +1,6 @@
 require quilt-native.inc
 
+PR="r1"
+
 SRC_URI[md5sum] = "f77adda60039ffa753f3c584a286f12b"
 SRC_URI[sha256sum] = "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"
diff --git a/recipes/quilt/quilt.inc b/recipes/quilt/quilt.inc
index fd0d40d..a9ed163 100644
--- a/recipes/quilt/quilt.inc
+++ b/recipes/quilt/quilt.inc
@@ -4,6 +4,8 @@ SECTION = "devel"
 LICENSE = "GPL"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
-           file://install.patch"
+           file://install.patch \
+	   file://no_rm_symlinks.patch \
+	   "
 
 S = "${WORKDIR}/quilt-${PV}"
diff --git a/recipes/quilt/quilt_0.48.bb b/recipes/quilt/quilt_0.48.bb
index aac3861..0a066df 100644
--- a/recipes/quilt/quilt_0.48.bb
+++ b/recipes/quilt/quilt_0.48.bb
@@ -1,4 +1,6 @@
 require quilt-package.inc
 
+PR="r1"
+
 SRC_URI[md5sum] = "f77adda60039ffa753f3c584a286f12b"
 SRC_URI[sha256sum] = "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"
-- 
1.7.1



