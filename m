Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 663A07F96A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2019 02:13:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBD2DnWE026639
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:13:49 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 12 Dec 2019 18:13:48 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Dec 2019 10:13:42 +0800
Message-ID: <20191213021342.8636-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213021342.8636-1-kai.kang@windriver.com>
References: <20191213021342.8636-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] corosync: fix build error when package config rdma enabled
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
X-List-Received-Date: Fri, 13 Dec 2019 02:13:48 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix corosync build error when package config rdma enabled.

* replace dependency librdmacm from layer meta-cloud-services with
  rdma-core from meta-networking
* add patch to fix issue that fail to find rdma library via pkgconfig

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...igure.ac-fix-pkgconfig-issue-of-rdma.patch | 32 +++++++++++++++++++
 .../corosync/corosync_2.4.5.bb                |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync/0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch

diff --git a/meta-networking/recipes-extended/corosync/corosync/0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch b/meta-networking/recipes-extended/corosync/corosync/0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch
new file mode 100644
index 000000000..bdc7645ce
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync/0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch
@@ -0,0 +1,32 @@
+Subject: [PATCH] configure.ac: fix pkgconfig issue of rdma
+
+pkgconfig files from rdma-core(https://github.com/linux-rdma/rdma-core)
+are named start with lib, such as librdmacm.pc and libibverbs.pc. When
+rdma support is enabled, it fails to find rdma related libraries. Update
+configure.ac to the issue.
+
+Upstream-Status: Submitted [https://github.com/corosync/corosync/pull/515]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ac513e93..240cfed4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -459,8 +459,8 @@ if test "x${enable_testagents}" = xyes; then
+ fi
+ 
+ if test "x${enable_rdma}" = xyes; then
+-	PKG_CHECK_MODULES([rdmacm],[rdmacm])
+-	PKG_CHECK_MODULES([ibverbs],[ibverbs])
++	PKG_CHECK_MODULES([rdmacm],[librdmacm])
++	PKG_CHECK_MODULES([ibverbs],[libibverbs])
+ 	AC_DEFINE_UNQUOTED([HAVE_RDMA], 1, [have rdmacm])
+ 	PACKAGE_FEATURES="$PACKAGE_FEATURES rdma"
+ 	WITH_LIST="$WITH_LIST --with rdma"
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.5.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.5.bb
index 1f4a3e1c6..eefbcca8a 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.5.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.5.bb
@@ -9,6 +9,7 @@ inherit autotools pkgconfig systemd useradd
 
 SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz \
            file://corosync.conf \
+           file://0001-configure.ac-fix-pkgconfig-issue-of-rdma.patch \
           "
 
 SRC_URI[md5sum] = "e36a056b893c313c4ec1fe0d7e6cdebd"
@@ -36,7 +37,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[qdevice] = "--enable-qdevices,--disable-qdevices"
 PACKAGECONFIG[qnetd] = "--enable-qnetd,--disable-qnetd"
-PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma,librdmacm"
+PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma,rdma-core"
 PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_unitdir},--disable-systemd --without-systemddir,systemd"
 
-- 
2.17.1


