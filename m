Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EAA496F7A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 03:26:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2D3Qlh3002294
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 20:26:49 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 12 Mar 2014 20:26:44 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Mar 2014 11:26:41 +0800
Message-ID: <33774fda5678b57926b40f827521045dadb6129a.1394681037.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394681037.git.Chong.Lu@windriver.com>
References: <cover.1394681037.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] net-snmp: add knob whether nlist.h are checked
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
X-List-Received-Date: Thu, 13 Mar 2014 03:26:49 -0000
Content-Type: text/plain

Previously, it still was checked when there was no nlish.h in sysroots directory.
Add knob to decide whether nlist.h are checked or not.

Fixed by using PACKAGECONFIG to check elf, with default disabled set.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...snmp-add-knob-whether-nlist.h-are-checked.patch | 35 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |  4 +++
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
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
index d21995a..f644e19 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
@@ -6,6 +6,9 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5
 
 DEPENDS = "openssl libnl pciutils"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
+
 PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
@@ -16,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://snmpd.service \
         file://snmptrapd.service \
         file://ifmib.patch \
+        file://net-snmp-add-knob-whether-nlist.h-are-checked.patch \
 "
 
 SRC_URI[md5sum] = "5bddd02e2f82b62daa79f82717737a14"
-- 
1.8.1.2


