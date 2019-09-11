Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43BAE7EC43
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 14:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6B54018288
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:52:59 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id rJ9rGoYnEDKv
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:52:56 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 72370183A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:52:56 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B1111E074
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:52:56 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FDA21E06E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:52:56 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:52:56 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by thoth.se.axis.com (Postfix) with ESMTP id 4434E2D3D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:52:56 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x8BEqucL015735
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:52:56 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x8BEquF6015734
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Sep 2019 16:52:56 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Sep 2019 16:52:54 +0200
Message-Id: <20190911145254.15693-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH] lvm2/libdevmapper: Make it build for native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2019 14:52:59 -0000
Content-Transfer-Encoding: 8bit

Backport a patch from upstream master that corrects the passing of
link flags through configure.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...gure-Fix-setting-of-CLDFLAGS-default.patch | 78 +++++++++++++++++++
 meta-oe/recipes-support/lvm2/lvm2.inc         |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch

diff --git a/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch b/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
new file mode 100644
index 000000000..07cb88ffb
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
@@ -0,0 +1,78 @@
+From 4a3e707402032788e09282e0f54fdf82c8a0f8fc Mon Sep 17 00:00:00 2001
+From: Marian Csontos <mcsontos@redhat.com>
+Date: Mon, 19 Aug 2019 14:54:43 +0200
+Subject: [PATCH] configure: Fix setting of CLDFLAGS default
+
+---
+ configure    | 6 +++---
+ configure.ac | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=lvm2.git;a=commit;h=4a3e707402032788e09282e0f54fdf82c8a0f8fc]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+
+diff --git a/configure b/configure
+index ff3a59b6b..4c8476502 100755
+--- a/configure
++++ b/configure
+@@ -3077,7 +3077,7 @@ if test -z "$CFLAGS"; then :
+ fi
+ case "$host_os" in
+ 	linux*)
+-		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"} -Wl,--version-script,.export.sym"
++		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"} -Wl,--version-script,.export.sym"
+ 		# equivalent to -rdynamic
+ 		ELDFLAGS="-Wl,--export-dynamic"
+ 		# FIXME Generate list and use --dynamic-list=.dlopen.sym
+@@ -3098,7 +3098,7 @@ case "$host_os" in
+ 		;;
+ 	darwin*)
+ 		CFLAGS="$CFLAGS -no-cpp-precomp -fno-common"
+-		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
++		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
+ 		ELDFLAGS=
+ 		CLDWHOLEARCHIVE="-all_load"
+ 		CLDNOWHOLEARCHIVE=
+@@ -3111,7 +3111,7 @@ case "$host_os" in
+ 		BLKDEACTIVATE=no
+ 		;;
+ 	*)
+-		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
++		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
+ 		;;
+ esac
+ 
+diff --git a/configure.ac b/configure.ac
+index 5da694631..830edb8da 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -30,7 +30,7 @@ AC_CANONICAL_TARGET([])
+ AS_IF([test -z "$CFLAGS"], [COPTIMISE_FLAG="-O2"])
+ case "$host_os" in
+ 	linux*)
+-		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"} -Wl,--version-script,.export.sym"
++		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"} -Wl,--version-script,.export.sym"
+ 		# equivalent to -rdynamic
+ 		ELDFLAGS="-Wl,--export-dynamic"
+ 		# FIXME Generate list and use --dynamic-list=.dlopen.sym
+@@ -51,7 +51,7 @@ case "$host_os" in
+ 		;;
+ 	darwin*)
+ 		CFLAGS="$CFLAGS -no-cpp-precomp -fno-common"
+-		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
++		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
+ 		ELDFLAGS=
+ 		CLDWHOLEARCHIVE="-all_load"
+ 		CLDNOWHOLEARCHIVE=
+@@ -64,7 +64,7 @@ case "$host_os" in
+ 		BLKDEACTIVATE=no
+ 		;;
+ 	*)
+-		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
++		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
+ 		;;
+ esac
+ 
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index f358663b0..6c95bfd02 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -15,6 +15,7 @@ SRC_URI = "https://sourceware.org/pub/lvm2/LVM2.${PV}.tgz \
            file://0001-Avoid-bashisms-in-init-scripts.patch \
            file://0005-do-not-build-manual.patch \
            file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
+           file://0001-configure-Fix-setting-of-CLDFLAGS-default.patch \
            "
 SRC_URI[md5sum] = "5fc07da5461a3794a751dcfc355827d5"
 SRC_URI[sha256sum] = "550ba750239fd75b7e52c9877565cabffef506bbf6d7f6f17b9700dee56c720f"
-- 
2.21.0


