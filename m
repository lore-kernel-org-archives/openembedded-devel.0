Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TGlyG-00064g-Ja
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2012 09:23:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8Q49YJ1005501
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Sep 2012 21:09:34 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 25 Sep 2012 21:09:33 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Sep 2012 12:09:32 +0800
Message-ID: <1348632572-23127-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, jackie.huang@eindriver.com
Subject: [meta-networking] [PATCH] iw: migrate from meta-oe into meta-networking and uprev to iw 3.6
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
X-List-Received-Date: Wed, 26 Sep 2012 07:23:49 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ....sh-don-t-use-git-describe-for-versioning.patch |   44 ++++++++++++++++++++
 meta-networking/recipes-support/iw/iw_3.2.bb       |   22 ++++++++++
 meta-networking/recipes-support/iw/iw_3.6.bb       |   27 ++++++++++++
 ....sh-don-t-use-git-describe-for-versioning.patch |   44 --------------------
 meta-oe/recipes-connectivity/iw/iw_3.2.bb          |   22 ----------
 5 files changed, 93 insertions(+), 66 deletions(-)
 create mode 100644 meta-networking/recipes-support/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 create mode 100644 meta-networking/recipes-support/iw/iw_3.2.bb
 create mode 100644 meta-networking/recipes-support/iw/iw_3.6.bb
 delete mode 100644 meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
 delete mode 100644 meta-oe/recipes-connectivity/iw/iw_3.2.bb

diff --git a/meta-networking/recipes-support/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta-networking/recipes-support/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
new file mode 100644
index 0000000..dfe3ca1
--- /dev/null
+++ b/meta-networking/recipes-support/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
@@ -0,0 +1,44 @@
+From 5310abba864cfe3a8b65af130729447604190b29 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 29 Nov 2011 17:03:27 +0100
+Subject: [PATCH] iw: version.sh: don't use git describe for versioning
+
+It will detect top-level git repositories like the Angstrom setup-scripts and break.
+
+Upstream-status: Unknown
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ version.sh |   16 +---------------
+ 1 files changed, 1 insertions(+), 15 deletions(-)
+
+diff --git a/version.sh b/version.sh
+index 3fb9f6d..e4a56cb 100755
+--- a/version.sh
++++ b/version.sh
+@@ -3,21 +3,7 @@
+ VERSION="3.2"
+ OUT="$1"
+ 
+-if head=`git rev-parse --verify HEAD 2>/dev/null`; then
+-	git update-index --refresh --unmerged > /dev/null
+-	descr=$(git describe)
+-
+-	# on git builds check that the version number above
+-	# is correct...
+-	[ "${descr%%-*}" = "v$VERSION" ] || exit 2
+-
+-	v="${descr#v}"
+-	if git diff-index --name-only HEAD | read dummy ; then
+-		v="$v"-dirty
+-	fi
+-else
+-	v="$VERSION"
+-fi
++v="$VERSION"
+ 
+ echo '#include "iw.h"' > "$OUT"
+ echo "const char iw_version[] = \"$v\";" >> "$OUT"
+-- 
+1.7.7.3
+
diff --git a/meta-networking/recipes-support/iw/iw_3.2.bb b/meta-networking/recipes-support/iw/iw_3.2.bb
new file mode 100644
index 0000000..65e7c8f
--- /dev/null
+++ b/meta-networking/recipes-support/iw/iw_3.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "nl80211 based CLI configuration utility for wireless devices"
+HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
+SECTION = "base"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
+
+PR = "r1"
+
+DEPENDS = "libnl pkgconfig"
+
+SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
+           file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
+          "
+
+SRC_URI[md5sum] = "80615c972a287dcd50890735469b0d1c"
+SRC_URI[sha256sum] = "370edabe6f73cc55be77a7502a3a25d23ec2aea900ae4ca3cec19d55bf8bdb12"
+
+CFLAGS += "-DCONFIG_LIBNL30"
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
diff --git a/meta-networking/recipes-support/iw/iw_3.6.bb b/meta-networking/recipes-support/iw/iw_3.6.bb
new file mode 100644
index 0000000..885624f
--- /dev/null
+++ b/meta-networking/recipes-support/iw/iw_3.6.bb
@@ -0,0 +1,27 @@
+SUMMARY = "nl80211 based CLI configuration utility for wireless devices"
+DESCRIPTION = "iw is a new nl80211 based CLI configuration utility for \
+wireless devices. It supports almost all new drivers that have been added \
+to the kernel recently. "
+HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
+SECTION = "base"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
+
+PR = "r0"
+
+DEPENDS = "libnl pkgconfig"
+
+SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
+           file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
+          "
+
+SRC_URI[md5sum] = "1c18bfbbc8773629e5e8ac733a39540c"
+SRC_URI[sha256sum] = "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b5840f948cdb6c857"
+
+# EXTRA_OEMAKE is typically: -e MAKEFLAGS=
+# the -e causes problems as CFLAGS is modified in the Makefile.
+EXTRA_OEMAKE = ""
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
diff --git a/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
deleted file mode 100644
index dfe3ca1..0000000
--- a/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5310abba864cfe3a8b65af130729447604190b29 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 29 Nov 2011 17:03:27 +0100
-Subject: [PATCH] iw: version.sh: don't use git describe for versioning
-
-It will detect top-level git repositories like the Angstrom setup-scripts and break.
-
-Upstream-status: Unknown
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- version.sh |   16 +---------------
- 1 files changed, 1 insertions(+), 15 deletions(-)
-
-diff --git a/version.sh b/version.sh
-index 3fb9f6d..e4a56cb 100755
---- a/version.sh
-+++ b/version.sh
-@@ -3,21 +3,7 @@
- VERSION="3.2"
- OUT="$1"
- 
--if head=`git rev-parse --verify HEAD 2>/dev/null`; then
--	git update-index --refresh --unmerged > /dev/null
--	descr=$(git describe)
--
--	# on git builds check that the version number above
--	# is correct...
--	[ "${descr%%-*}" = "v$VERSION" ] || exit 2
--
--	v="${descr#v}"
--	if git diff-index --name-only HEAD | read dummy ; then
--		v="$v"-dirty
--	fi
--else
--	v="$VERSION"
--fi
-+v="$VERSION"
- 
- echo '#include "iw.h"' > "$OUT"
- echo "const char iw_version[] = \"$v\";" >> "$OUT"
--- 
-1.7.7.3
-
diff --git a/meta-oe/recipes-connectivity/iw/iw_3.2.bb b/meta-oe/recipes-connectivity/iw/iw_3.2.bb
deleted file mode 100644
index 65e7c8f..0000000
--- a/meta-oe/recipes-connectivity/iw/iw_3.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "nl80211 based CLI configuration utility for wireless devices"
-HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
-SECTION = "base"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
-
-PR = "r1"
-
-DEPENDS = "libnl pkgconfig"
-
-SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
-           file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
-          "
-
-SRC_URI[md5sum] = "80615c972a287dcd50890735469b0d1c"
-SRC_URI[sha256sum] = "370edabe6f73cc55be77a7502a3a25d23ec2aea900ae4ca3cec19d55bf8bdb12"
-
-CFLAGS += "-DCONFIG_LIBNL30"
-
-do_install() {
-	oe_runmake DESTDIR=${D} install
-}
-- 
1.7.4



