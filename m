Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A84D72858
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 06:14:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0G6EBef024723
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:14:11 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 15 Jan 2015 22:14:10 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jan 2015 14:14:02 +0800
Message-ID: <ff80f76eb33148ab069f48d71e50f1cb8451ce44.1421388212.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421388212.git.jackie.huang@windriver.com>
References: <cover.1421388212.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] net-snmp: add knob whether nlist.h are checked
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
X-List-Received-Date: Fri, 16 Jan 2015 06:14:15 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Previously, it still was checked when there was no nlish.h in sysroots directory.
Add knob to decide whether nlist.h are checked or not.

Fixed by using PACKAGECONFIG to check elf, with default disabled set.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...snmp-add-knob-whether-nlist.h-are-checked.patch | 35 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |  4 +++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
new file mode 100644
index 0000000..74b0c12
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
@@ -0,0 +1,35 @@
+net-snmp: add knob whether nlist.h are checked
+
+Previously, it still was checked when there was no nlish.h in sysroots directory.
+Add knob to decide whether nlist.h are checked or not.
+
+Upstream-status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ configure.d/config_os_headers |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
+index d903f58..a05d30e 100644
+--- a/configure.d/config_os_headers
++++ b/configure.d/config_os_headers
+@@ -31,6 +31,7 @@ AC_CHECK_HEADERS([getopt.h   pthread.h  regex.h      ] dnl
+                  [sys/un.h           ])
+ 
+ #  Library and Agent:
++if test "x$with_elf" != "xno"; then
+ AC_CHECK_HEADERS([nlist.h],,,[
+ AC_INCLUDES_DEFAULT
+ [
+@@ -38,6 +39,7 @@ AC_INCLUDES_DEFAULT
+ #define LIBBSD_DISABLE_DEPRECATED 1
+ #endif
+ ]])
++fi
+ 
+ #  Library:
+ AC_CHECK_HEADERS([fcntl.h    io.h       kstat.h                 ] dnl
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index 1e398d4..6736718 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://snmptrapd.service \
         file://ifmib.patch \
         file://fix-libtool-finish.patch \
+        file://net-snmp-add-knob-whether-nlist.h-are-checked.patch \
 "
 
 SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"
@@ -41,6 +42,9 @@ EXTRA_OECONF = "--disable-embedded-perl \
 # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
 EXTRA_OECONF += "--with-mib-modules=smux"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
+
 CACHED_CONFIGUREVARS = " \
     ac_cv_header_valgrind_valgrind_h=no \
     ac_cv_header_valgrind_memcheck_h=no \
-- 
1.9.1


