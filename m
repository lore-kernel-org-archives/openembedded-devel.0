Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC01375E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Sep 2015 09:05:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8195K11019172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Sep 2015 02:05:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 1 Sep 2015 02:05:19 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Sep 2015 17:00:33 +0800
Message-ID: <1441098033-26923-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] collectd: fix a floating dependence on libvirt
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
X-List-Received-Date: Tue, 01 Sep 2015 09:05:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Even though the PACKAGECONFIG of libvirt is used to fix the floating
dependence, but enable-libvirt/disable-libvirt become useless after
collectd upgrade, and libvirt is checked unconditionally, and lead to
a floating dependence on libvirt.

check if libvirt is available only when a user wants to use libvirt
to fix this issue

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-conditionally-check-libvirt.patch         | 39 ++++++++++++++++++++++
 .../recipes-extended/collectd/collectd_5.5.0.bb    |  4 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch b/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
new file mode 100644
index 0000000..d0a5804
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-conditionally-check-libvirt.patch
@@ -0,0 +1,39 @@
+[PATCH] conditionally check libvirt
+
+Upstream-Statue: Pending
+
+check if libvirt is available only when a user wants to use libvirt
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure.ac | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 923498e..7206095 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4778,12 +4778,14 @@ then
+ 		with_libxml2="no (pkg-config doesn't know libxml-2.0)"
+ 	fi
+ 
+-	$PKG_CONFIG --exists libvirt 2>/dev/null
+-	if test "$?" = "0"
+-	then
+-		with_libvirt="yes"
+-	else
+-		with_libvirt="no (pkg-config doesn't know libvirt)"
++	if test "x$enable_libvirt" = "xyes"; then
++		$PKG_CONFIG --exists libvirt 2>/dev/null
++		if test "$?" = "0"
++		then
++			with_libvirt="yes"
++		else
++			with_libvirt="no (pkg-config doesn't know libvirt)"
++		fi
+ 	fi
+ fi
+ if test "x$with_libxml2" = "xyes"
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index feda26b..fd3b1ab 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -10,7 +10,9 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://collectd-version.patch \
            file://0001-redefine-the-dependence.patch  \
            file://collectd.init \
-           file://collectd.service"
+           file://collectd.service \
+           file://0001-conditionally-check-libvirt.patch \
+"
 SRC_URI[md5sum] = "c39305ef5514b44238b0d31f77e29e6a"
 SRC_URI[sha256sum] = "847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f1343b1062a4b569e88"
 
-- 
1.9.1


