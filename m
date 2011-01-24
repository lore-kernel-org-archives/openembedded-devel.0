Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhSsQ-0000KR-3r
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 21:19:02 +0100
Received: by qyk8 with SMTP id 8so3213748qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 12:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=k9NfyNyWS4yxpRcR+uFj0vFEulG3yLbfGQwWoQTrFJ8=;
	b=v5ftZPiEGw8EB4yi6R2r6gMdwVtUtm1kQnJ2/86wK6IOS8SZlccl24RiuIfBgff7Fl
	q/wgbf4xCf459Q6w0NzcNZFMwNd5A8PKaLSAFl96Tu8ESBFV1bAy0tZnAaeTVSWAjyNX
	HY83ugbJIgrA2UYkW2XzEHcxsynO3MhfQwfrk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vas7cU+4Max3gCw/ujcDBv9iCsZ7DA5f5jeF01veEYovlO8tn5582dNSpBFuInvNG9
	ijrwhllmmadZVMEyezirz0trZpGbGjESVPK7Cd+VO+Q5ncXrc4pPof4pDIf09xxxITEb
	4R8v7aKqAJIDlgHSDWySdMCqBvJoSKp89+qeo=
Received: by 10.224.80.210 with SMTP id u18mr4556461qak.122.1295900295948;
	Mon, 24 Jan 2011 12:18:15 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t7sm9616474qcs.28.2011.01.24.12.18.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 12:18:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 12:18:10 -0800
Message-Id: <1295900293-25470-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295900293-25470-1-git-send-email-raj.khem@gmail.com>
References: <1295900293-25470-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/5] opkg-utils_svn.bb: Sync with yocto
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
X-List-Received-Date: Mon, 24 Jan 2011 20:19:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opkg-utils/index-ignore-filenotfound.patch     |   54 ++++++++++++++++++++
 recipes/opkg-utils/opkg-utils_svn.bb               |   24 ++++++---
 2 files changed, 69 insertions(+), 9 deletions(-)
 create mode 100644 recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch

diff --git a/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch b/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
new file mode 100644
index 0000000..e4a5481
--- /dev/null
+++ b/recipes/opkg-utils/opkg-utils/index-ignore-filenotfound.patch
@@ -0,0 +1,54 @@
+If we're building an image and some package rebuilds while this is happening
+some package can be removed/added to the ipk deploy directory. The image will
+not depend on this package so we can safely ignore these cases rather than 
+error out.
+
+RP - 26/8/09
+
+Index: opkg-utils/opkg-make-index
+===================================================================
+--- opkg-utils.orig/opkg-make-index	2009-08-26 17:21:26.000000000 +0100
++++ opkg-utils/opkg-make-index	2009-08-27 16:11:22.000000000 +0100
+@@ -96,6 +96,7 @@
+ files=glob(pkg_dir + '/*.ipk') + glob(pkg_dir + '/*.deb')
+ files.sort()
+ for filename in files:
++  try:
+      basename = os.path.basename(filename)
+      pkg = None
+      fnameStat = os.stat(filename)
+@@ -130,6 +131,12 @@
+                to_morgue(basename)
+           if opt_s:
+                print filename
++  except OSError:
++      sys.stderr.write("Package %s disappeared on us!\n" % (filename))
++      continue
++  except IOError:
++      sys.stderr.write("Package %s disappeared on us!\n" % (filename))
++      continue
+ 
+ pkgsStampsFile = open(stamplist_filename, "w")
+ for f in pkgsStamps.keys():
+@@ -148,6 +155,7 @@
+ names = packages.packages.keys()
+ names.sort()
+ for name in names:
++  try:
+      pkg = packages.packages[name]
+      if locales_dir and pkg.depends:
+          depends = string.split(pkg.depends, ',')
+@@ -165,6 +173,13 @@
+      if (verbose):
+           sys.stderr.write("Writing info for package %s\n" % (pkg.package,))
+      print pkg
++  except OSError:
++      sys.stderr.write("Package %s disappeared on us!\n" % (name))
++      continue
++  except IOError:
++      sys.stderr.write("Package %s disappeared on us!\n" % (name))
++      continue
++
+ if packages_filename:
+      sys.stdout.close()
+      sys.stdout = old_stdout
diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/opkg-utils_svn.bb
index 4634690..951580a 100644
--- a/recipes/opkg-utils/opkg-utils_svn.bb
+++ b/recipes/opkg-utils/opkg-utils_svn.bb
@@ -1,18 +1,24 @@
 DESCRIPTION = "OPKG Package Manager Utilities"
 SECTION = "base"
+HOMEPAGE = "http://wiki.openmoko.org/wiki/Opkg"
 PRIORITY = "optional"
-LICENSE = "GPL"
 RDEPENDS_${PN} = "python"
-RDEPENDS_virtclass-native = ""
-SRCREV = "4595"
-PV = "0.0+svnr${SRCPV}"
+RDEPENDS_${PN}_virtclass-native = ""
+SRCREV = "4747"
+PV = "0.1.8+svnr${SRCPV}"
 PR = "r5"
 
-BBCLASSEXTEND = "native"
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http"
+SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
+           file://index-ignore-filenotfound.patch"
 
-TARGET_CC_ARCH += "${LDFLAGS}"
 S = "${WORKDIR}/opkg-utils"
 
-inherit autotools
+# Avoid circular dependencies from package_ipk.bbclass
+PACKAGES_virtclass-native = ""
+
+do_install() {
+        oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+}
+
+BBCLASSEXTEND = "native"
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.0.4



