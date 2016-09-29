Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A793960111
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 02:49:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T2nCjf028534
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 19:49:13 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 19:49:11 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Sep 2016 22:49:11 -0400
Message-ID: <1475117351-88945-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mariadb: replace the CC with CC_VERSION and CXX with CXX_VERSION
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
X-List-Received-Date: Thu, 29 Sep 2016 02:49:12 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

mysqlbug.sh is a bug report script. It makes a report with the build information,
including gcc version. The CC is the local path of gcc, which is useless for bug
report, and the path may expose private information, so change it to CC_VERSION.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc          |  1 +
 .../mysql/mariadb/change-cc-to-cc-version.patch    | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/change-cc-to-cc-version.patch

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index 73905b6..9d91aec 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz
            file://mysql-systemd-start \
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
+           file://change-cc-to-cc-version.patch \
           "
 
 SRC_URI[md5sum] = "5cfb169934170a429589e05f0f5aba9c"
diff --git a/meta-oe/recipes-support/mysql/mariadb/change-cc-to-cc-version.patch b/meta-oe/recipes-support/mysql/mariadb/change-cc-to-cc-version.patch
new file mode 100644
index 0000000..02bda24
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/change-cc-to-cc-version.patch
@@ -0,0 +1,26 @@
+mariadb: replace the CC with CC_VERSION and CXX with CXX_VERSION
+
+mysqlbug.sh is a bug report script. It makes a report with the build information,
+including gcc version. The CC is the local path of gcc, which is useless for bug
+report, and the path may expose private information, so change it to CC_VERSION.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+================================
+diff --git a/scripts/mysqlbug.sh.old b/scripts/mysqlbug.sh
+index e9df210..d4b8d53 100644
+--- a/scripts/mysqlbug.sh.old
++++ b/scripts/mysqlbug.sh
+@@ -24,8 +24,8 @@ VERSION="@VERSION@@MYSQL_SERVER_SUFFIX@"
+ COMPILATION_COMMENT="@COMPILATION_COMMENT@"
+ BUGmysql="maria-developers@lists.launchpad.net"
+ # This is set by configure
+-COMP_CALL_INFO="CC='@SAVE_CC@'  CFLAGS='@SAVE_CFLAGS@'  CXX='@SAVE_CXX@'  CXXFLAGS='@SAVE_CXXFLAGS@'  LDFLAGS='@SAVE_LDFLAGS@'  ASFLAGS='@SAVE_ASFLAGS@'"
+-COMP_RUN_INFO="CC='@CC@'  CFLAGS='@CFLAGS@'  CXX='@CXX@'  CXXFLAGS='@CXXFLAGS@'  LDFLAGS='@LDFLAGS@'  ASFLAGS='@ASFLAGS@'"
++COMP_CALL_INFO="CC='@CC_VERSION@'  CFLAGS='@SAVE_CFLAGS@'  CXX='@CXX_VERSION@'  CXXFLAGS='@SAVE_CXXFLAGS@'  LDFLAGS='@SAVE_LDFLAGS@'  ASFLAGS='@SAVE_ASFLAGS@'"
++COMP_RUN_INFO="CC='@CC_VERSION@'  CFLAGS='@CFLAGS@'  CXX='@CXX_VERSION@'  CXXFLAGS='@CXXFLAGS@'  LDFLAGS='@LDFLAGS@'  ASFLAGS='@ASFLAGS@'"
+ CONFIGURE_LINE="@CONF_COMMAND@"
+ 
+ LIBC_INFO=""
-- 
2.8.1


