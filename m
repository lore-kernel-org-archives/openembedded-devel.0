Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4755C77BC3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 08:22:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3Q8MCij023725
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 01:22:14 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Apr 2017 01:22:10 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 16:22:00 +0800
Message-ID: <5704d47ddbc03ea09a9b8471e142a6d742ace6f7.1493194374.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493194374.git.jackie.huang@windriver.com>
References: <cover.1493194374.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/8 v2] openhpi: add new recipe
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
X-List-Received-Date: Wed, 26 Apr 2017 08:22:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

OpenHPI is an open source project created with
the intent of providing an implementation of
the SA Forum's Hardware Platform Interface (HPI).

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../files/openhpi-add-libnetsnmp-when-link.patch   |  25 +++
 .../files/openhpi-fix-alignment-issue.patch        |  23 +++
 .../openhpi/files/openhpi-fix-host-gcc.patch       |  24 +++
 .../files/openhpi-fix-testfail-errors.patch        |  31 +++
 .../openhpi/files/openhpi-glib-cross-compile.patch |  33 +++
 .../files/openhpi-hpi-shell-thread-fix.patch       |  29 +++
 .../openhpi/files/openhpi-invalide-session.patch   |  21 ++
 .../files/openhpi-libxml2-cross-compile.patch      |  21 ++
 .../openhpi/files/openhpi-linkfix.patch            |  33 +++
 .../files/openhpi-netsnmp-cross-compile.patch      |  48 +++++
 .../files/openhpi-sysfs-cross-compile.patch        |  23 +++
 ...i-use-serial-tests-config-needed-by-ptest.patch |  31 +++
 .../recipes-daemons/openhpi/files/openhpi.init     | 230 +++++++++++++++++++++
 .../recipes-daemons/openhpi/files/openhpid.service |  11 +
 .../recipes-daemons/openhpi/files/run-ptest        |   5 +
 .../recipes-daemons/openhpi/openhpi_3.6.1.bb       | 109 ++++++++++
 16 files changed, 697 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-add-libnetsnmp-when-link.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-alignment-issue.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-host-gcc.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-glib-cross-compile.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-invalide-session.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-linkfix.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-netsnmp-cross-compile.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-sysfs-cross-compile.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
 create mode 100755 meta-networking/recipes-daemons/openhpi/files/openhpi.init
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/openhpid.service
 create mode 100755 meta-networking/recipes-daemons/openhpi/files/run-ptest
 create mode 100644 meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb

diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-add-libnetsnmp-when-link.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-add-libnetsnmp-when-link.patch
new file mode 100644
index 000000000..4644910b7
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-add-libnetsnmp-when-link.patch
@@ -0,0 +1,25 @@
+[PATCH] add libnetsnmp when link
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ plugins/snmp_bc/t/Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/snmp_bc/t/Makefile.am b/plugins/snmp_bc/t/Makefile.am
+index 57e77ac..9894620 100644
+--- a/plugins/snmp_bc/t/Makefile.am
++++ b/plugins/snmp_bc/t/Makefile.am
+@@ -74,7 +74,7 @@ nodist_libsnmp_bc_la_SOURCES = $(GENERATED_EVENT_CODE) $(REMOTE_SIM_SOURCES)
+ # libopenhpi_la_LIBADD    = $(top_builddir)/utils/libopenhpiutils.la
+ # libopenhpi_la_LDFLAGS   = -L$(top_builddir)/utils -version-info @HPI_LIB_VERSION@ -export-symbols $(top_srcdir)/src/hpi.sym
+ 
+-libsnmp_bc_la_LIBADD = -luuid @SNMPLIBS@ $(top_builddir)/utils/libopenhpiutils.la
++libsnmp_bc_la_LIBADD = -luuid @SNMPLIBS@ $(top_builddir)/utils/libopenhpiutils.la -lnetsnmp
+ libsnmp_bc_la_LDFLAGS = -L$(top_builddir)/utils -module -version-info @HPI_LIB_VERSION@
+ # libsnmp_bc_la_LDFLAGS = -version 0:0:0
+ 
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-alignment-issue.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-alignment-issue.patch
new file mode 100644
index 000000000..077e26cbf
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-alignment-issue.patch
@@ -0,0 +1,23 @@
+Fix alignment issue in ipmi_inventory.c
+
+Upstream-Status: Pending
+
+Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/plugins/ipmi/ipmi_inventory.c b/plugins/ipmi/ipmi_inventory.c
+index 5382186..01655c6 100644
+--- a/plugins/ipmi/ipmi_inventory.c
++++ b/plugins/ipmi/ipmi_inventory.c
+@@ -2546,8 +2546,11 @@ static SaErrorT modify_inventory(SaHpiIdrFieldT *field,
+ 			if (tb->DataLength == 0) {
+ 				rv = ipmi_fru_set_board_info_mfg_time(fru, 0);
+ 			} else {
++                time_t the_time;
++                /* tb->Data is not aligned -- copy to temp */
++                memcpy(&the_time, tb->Data, sizeof(the_time));
+ 				rv = ipmi_fru_set_board_info_mfg_time(fru,
+-					*(time_t *)tb->Data);
++					the_time);
+ 			}
+ 			break;
+ 		case SAHPI_IDR_FIELDTYPE_MANUFACTURER:
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-host-gcc.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-host-gcc.patch
new file mode 100644
index 000000000..029b857bc
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-host-gcc.patch
@@ -0,0 +1,24 @@
+fix host gcc warnings
+
+Remove gcc warnings when gcc is v3.2
+
+Upstream-Status: Pending
+
+Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/configure.ac b/configure.ac
+index f5a5b74..4a20154 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -605,11 +605,6 @@ AC_ARG_ENABLE([werror],
+     fi],
+     [])
+ 
+-if test -n "`gcc --version | grep ' 3.2'`" ; then
+-        CC_WARNINGS=`echo $CC_WARNINGS | sed -e 's/-Wno-strict-aliasing//g'`
+-        CXX_WARNINGS=`echo $CC_WARNINGS | sed -e 's/-Wno-strict-aliasing//g'`
+-fi
+-
+ case $host_os in
+     solaris*)
+         CC_WARNINGS=`echo $CC_WARNINGS | sed -e 's/-Wcast-qual//g'`
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
new file mode 100644
index 000000000..205696e65
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-fix-testfail-errors.patch
@@ -0,0 +1,31 @@
+Fix for saftest failures.
+
+Upstream-Status: Pending
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+
+diff -urpN a/openhpid/safhpi.c b/openhpid/safhpi.c
+--- a/openhpid/safhpi.c
++++ b/openhpid/safhpi.c
+@@ -1976,7 +1976,7 @@ SaErrorT SAHPI_API saHpiSensorThresholds
+         oh_release_domain(d); /* Unlock domain */
+ 
+         OH_CALL_ABI(h, set_sensor_thresholds, SA_ERR_HPI_INVALID_CMD, rv,
+-                    ResourceId, SensorNum, SensorThresholds);
++                    ResourceId, SensorNum, &tmp);
+         oh_release_handler(h);
+ 
+         return rv;
+diff -urpN a/utils/sahpi_struct_utils.c b/utils/sahpi_struct_utils.c
+--- a/utils/sahpi_struct_utils.c
++++ b/utils/sahpi_struct_utils.c
+@@ -3855,6 +3855,9 @@ SaHpiBoolT oh_valid_textbuffer(SaHpiText
+                                         /* found a unpaired surrogate */
+                                         return SAHPI_FALSE;
+                                 }
++                        } else {
++                            /*the first 2 bytes wrong*/
++                            return SAHPI_FALSE;
+                         }
+                 }
+                 break;
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-glib-cross-compile.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-glib-cross-compile.patch
new file mode 100644
index 000000000..1627c9797
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-glib-cross-compile.patch
@@ -0,0 +1,33 @@
+Fix glib cross compile
+
+Uses proper PKG_CONFIG_PATH when cross-compiling
+
+Upstream-Status: Pending
+
+Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/configure.ac b/configure.ac
+index b5f5aad..f5a5b74 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -110,13 +110,13 @@ else
+ *** GLIB is always available from ftp://ftp.gtk.org/.])
+ fi
+ 
+-exact_version=`pkg-config --modversion $GLIB`;
+-GLIB_CFLAGS=`pkg-config --cflags $GLIB $GTHREAD`
+-GLIB_LIBS=`pkg-config --libs $GLIB $GTHREAD`
+-GLIB_ONLY_CFLAGS=`pkg-config --cflags $GLIB`
+-GLIB_ONLY_LIBS=`pkg-config --libs $GLIB`
+-GMODULE_ONLY_CFLAGS=`pkg-config --cflags $GMODULE`
+-GMODULE_ONLY_LIBS=`pkg-config --libs $GMODULE`
++exact_version=`PKG_CONFIG_PATH=$PKG_CONFIG_PATH pkg-config --modversion $GLIB`;
++GLIB_CFLAGS=`PKG_CONFIG_PATH=$PKG_CONFIG_PATH pkg-config --cflags $GLIB $GTHREAD`
++GLIB_LIBS=`PKG_CONFIG_PATH=$PKG_CONFIG_PATH pkg-config --libs $GLIB $GTHREAD`
++GLIB_ONLY_CFLAGS=`PKG_CONFIG_PATH=$PKG_CONFIG_PATH pkg-config --cflags $GLIB`
++GLIB_ONLY_LIBS=`PKG_CONFIG_PATH=$PKG_CONFIG_PATH pkg-config --libs $GLIB`
++GMODULE_ONLY_CFLAGS=`PKG_CONFIG_PATH=$PKG_CONFIG_PATH pkg-config --cflags $GMODULE`
++GMODULE_ONLY_LIBS=`PKG_CONFIG_PATH=$PKG_CONFIG_PATH pkg-config --libs $GMODULE`
+ 
+ # On some versions of Solaris the pkg-config file for gthread-2.0 contains a
+ # compiler option, '-mt', that is incompatible with gcc
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
new file mode 100644
index 000000000..7dac45318
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-hpi-shell-thread-fix.patch
@@ -0,0 +1,29 @@
+commit e9f9a73c9dba8dd59f3d6c3acd9988ec8361d55a
+Author: Aws Ismail <aws.ismail@windriver.com>
+Date:   Mon Dec 17 16:23:45 2012 -0500
+
+    Correct dangling g_thread_exit in session.c
+    
+    hpi_shell's session.c has its progress_bar
+    thread created using pthread_create but
+    exited using g_thread_exit. Use pthread_exit
+    instead to avoid unpredictable GLIB thread
+    errors.
+    
+    Upstream-Status: Pending
+    
+    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/hpi_shell/session.c b/hpi_shell/session.c
+index 85c31bf..187da4c 100644
+--- a/hpi_shell/session.c
++++ b/hpi_shell/session.c
+@@ -66,7 +66,7 @@ static void* progress_bar(void *unused)
+ 		if (i < (PROGRESS_BUF_SIZE - mes_len - 1)) i++;
+ 		t++;
+ 	};
+-        g_thread_exit(0);
++        pthread_exit(0);
+ 	return (void *)1;
+ }
+ 
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-invalide-session.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-invalide-session.patch
new file mode 100644
index 000000000..d03c97e18
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-invalide-session.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Submitted
+
+Package saftest run a test case to pass invalid session id to function
+saHpiResourceIdGet that expect return SA_ERR_HPI_INVALID_SESSION. But the check
+for SA_ERR_HPI_INVALID_SESSION is missed somehow in function saHpiResourceIdGet.
+
+Add check for SA_ERR_HPI_INVALID_SESSION.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+-----
+--- openhpi-3.4.0/baselib/safhpi.cpp.orig	2014-02-25 10:45:20.911734868 +0800
++++ openhpi-3.4.0/baselib/safhpi.cpp	2014-02-25 10:46:05.366925389 +0800
+@@ -477,6 +477,8 @@
+                                  &rpt_update_count );
+     if ( rv == SA_ERR_HPI_NOT_PRESENT ) {
+         return SA_ERR_HPI_NOT_PRESENT;
++    } else if ( rv == SA_ERR_HPI_INVALID_SESSION) {
++        return SA_ERR_HPI_INVALID_SESSION;
+     } else if ( rv != SA_OK ) {
+         return SA_ERR_HPI_UNKNOWN;
+     }
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
new file mode 100644
index 000000000..6d3b6648a
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-libxml2-cross-compile.patch
@@ -0,0 +1,21 @@
+Fix libxml2 for cross-compiling
+
+Use proper XML2_INCLUDE path when cross-compiling
+
+Upstream-Status: Pending
+
+Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
+
+diff --git a/configure.ac b/configure.ac
+index 30a792c..b5f5aad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -175,7 +175,7 @@ AC_CHECK_HEADERS([openssl/md2.h openssl/md5.h openssl/bio.h openssl/ssl.h openss
+ 
+ dnl xml is used for XML-based communication in ilo2_ribcl and oa_soap
+ AC_CHECK_LIB([xml2],[xmlParseMemory],[XML2_LIB=-lxml2],[XML2_LIB=])
+-AC_CHECK_HEADERS([libxml2/libxml/xmlexports.h],[XML2_INCLUDE="-I/usr/include/libxml2"],[XML2_INCLUDE])
++AC_CHECK_HEADERS([libxml2/libxml/xmlexports.h],[XML2_INCLUDE="$XML2_INCLUDE"],[XML2_INCLUDE])
+ AC_SUBST(XML2_LIB)
+ AC_SUBST(XML2_INCLUDE)
+ 
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-linkfix.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-linkfix.patch
new file mode 100644
index 000000000..3222f5d13
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-linkfix.patch
@@ -0,0 +1,33 @@
+Fix ipmi plugin's test dir compilation
+
+The ipmi plugin's test dir is not included
+in compilation since it does not compile
+properly with SSL
+
+Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ plugins/ipmi/Makefile.in | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/plugins/ipmi/Makefile.in b/plugins/ipmi/Makefile.in
+index 7c6b0a4..6204dbe 100644
+--- a/plugins/ipmi/Makefile.in
++++ b/plugins/ipmi/Makefile.in
+@@ -448,7 +448,9 @@ top_srcdir = @top_srcdir@
+ MAINTAINERCLEANFILES = Makefile.in
+ AM_CPPFLAGS = -DG_LOG_DOMAIN=\"ipmi\" @OPENHPI_INCLUDES@
+ EXTRA_DIST = ipmi.sym ekeyfru.h
+-SUBDIRS = t
++#SUBDIRS = t
++#Tests don't compile wih SSL properly so comment them out
++SUBDIRS =
+ AM_CFLAGS = @OPENIPMI_CFLAGS@
+ pkglib_LTLIBRARIES = libipmi.la
+ libipmi_la_SOURCES = ipmi.c 		\
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-netsnmp-cross-compile.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-netsnmp-cross-compile.patch
new file mode 100644
index 000000000..95b0abc91
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-netsnmp-cross-compile.patch
@@ -0,0 +1,48 @@
+Fix net-snmp when cross-compiling
+
+Remove irrelevant references to net-snmp libs and flags
+when cross-compiling net-snmp
+
+Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ acinclude.m4 | 4 ++--
+ configure    | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 82c33f6..727e461 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -160,8 +160,8 @@ AC_DEFUN([OH_CHECK_NETSNMP],
+     ],
+     [
+         have_netsnmp=yes
+-        SNMPFLAGS=`${net_snmp_config:-net-snmp-config} --cflags | perl -p -e 's/-O\S*//g'`
+-        SNMPLIBS=`${net_snmp_config:-net-snmp-config} --libs`
++        SNMPFLAGS=""
++        SNMPLIBS=""
+         AC_MSG_RESULT(yes)
+     ],
+     [AC_MSG_RESULT(no.  No SNMP based plugins can be built!)])
+diff --git a/configure b/configure
+index 00067bc..36b913c 100755
+--- a/configure
++++ b/configure
+@@ -15949,8 +15949,8 @@ _ACEOF
+ if ac_fn_c_try_link "$LINENO"; then :
+ 
+         have_netsnmp=yes
+-        SNMPFLAGS=`${net_snmp_config:-net-snmp-config} --cflags | perl -p -e 's/-O\S*//g'`
+-        SNMPLIBS=`${net_snmp_config:-net-snmp-config} --libs`
++        SNMPFLAGS=""
++        SNMPLIBS=""
+         { $as_echo "$as_me:${as_lineno-$LINENO}: result: yes" >&5
+ $as_echo "yes" >&6; }
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-sysfs-cross-compile.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-sysfs-cross-compile.patch
new file mode 100644
index 000000000..38d9a6742
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-sysfs-cross-compile.patch
@@ -0,0 +1,23 @@
+Fix sysfs when cross-compiling
+
+Use proper paths for sysfs plugins when cross-compiling
+
+Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+diff --git a/plugins/sysfs/sysfs2hpi.c b/plugins/sysfs/sysfs2hpi.c
+index a745214..3685598 100644
+--- a/plugins/sysfs/sysfs2hpi.c
++++ b/plugins/sysfs/sysfs2hpi.c
+@@ -18,7 +18,7 @@
+ 
+ #include <stdlib.h>
+ #include <string.h>
+-#include <libsysfs.h>
++#include <sysfs/libsysfs.h>
+ 
+ #include <SaHpi.h>
+ #include <oh_utils.h>
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch b/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
new file mode 100644
index 000000000..51537ef12
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi-use-serial-tests-config-needed-by-ptest.patch
@@ -0,0 +1,31 @@
+From 36fbaa27e7299f63c1324b0ad22b970e9365d6a7 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 24 Dec 2014 10:54:59 +0800
+Subject: [PATCH] openhpi: use serial-tests config needed by ptest
+
+ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+
+Upstream-Status: Inappropriate [default automake behavior incompatible with ptest]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4b51971..16136b3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -7,7 +7,7 @@ dnl   various hacks by Sean Dague <http://dague.net/sean> 4/23/03
+ AC_PREREQ(2.57)
+ AC_INIT(openhpi, 3.5.0)
+ AC_CONFIG_SRCDIR(openhpi.spec.in)
+-AM_INIT_AUTOMAKE([1.8])
++AM_INIT_AUTOMAKE([1.8 serial-tests])
+ 
+ AM_CONFIG_HEADER(config.h)
+ AH_TOP([#ifndef __OPENHPI_CONFIG_H
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpi.init b/meta-networking/recipes-daemons/openhpi/files/openhpi.init
new file mode 100755
index 000000000..3a5f4a06a
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpi.init
@@ -0,0 +1,230 @@
+#! /bin/sh
+#
+### BEGIN INIT INFO
+# Provides:          openhpid
+# Required-Start:    $network $remote_fs $syslog
+# Required-Stop:     $network $remote_fs $syslog
+# Should-Start:      $named
+# Should-Stop:       $named
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Start OpenHPI daemon at boot time
+# Description:       Enable OpenHPI service which is provided by openhpid.
+### END INIT INFO
+#
+# openhpid.sh    Start/Stop the openhpi daemon.
+#
+# description: openhpid is standard UNIX program which uses the OpenHPI \
+#              APIs and provides a standard internet server to access those \
+#              APIs for client programs.
+# processname: openhpid
+# config: the standard openhpi conf file specified on the command line or the env.
+# pidfile: /var/run/openhpid.pid
+#
+# Author(s):
+#	W. David Ashley <dashley@us.ibm.com>
+#	Daniel de Araujo <ddearauj@us.ibm.com>
+
+# Source function library.
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+prog="OpenHPI"
+
+# If the openhpid executable is not available, we can't do any of this
+test -f /usr/sbin/openhpid || exit 0
+
+# Determine whether the lsb package is installed
+# If it is, determine which lsb is installed:
+# redhat, suse, or standard lsb
+
+if test -f /etc/init.d/functions
+then
+   lsbtype="rh"
+   . /etc/init.d/functions
+elif test -f /etc/rc.status
+then
+   lsbtype="suse"
+   . /etc/rc.status
+elif test -f /lib/lsb/init-functions
+then
+   lsbtype="lsb"
+   . /lib/lsb/init-functions
+elif test -f /etc/gentoo-release
+then
+   lsbtype="gentoo"
+   . /sbin/functions.sh
+else
+   lsbtype="nolsb"
+fi
+
+print_outcome()
+{
+
+	case "${lsbtype}" in
+
+		suse)
+ 			rc_status -v
+			;;
+
+		lsb)
+			if test "$?" -eq 0
+   			then
+      			log_success_msg "success"
+   			else
+				log_failure_msg "failed"
+   			fi
+  			;;
+  
+  		gentoo)
+  			eend $?
+  			;;
+
+		nolsb | rh)
+			if test "$?" -eq 0
+			then
+				echo " ... success"
+			fi
+			if test "$?" -ne 0
+			then
+				echo " ... failed"
+			fi
+			;;
+   	esac
+}
+
+start() {
+	case "${lsbtype}" in
+
+		suse)
+			echo -n "Starting $prog: "
+			startproc /usr/sbin/openhpid -c /etc/openhpi/openhpi.conf
+			RETVAL=$?
+			;;
+		lsb)
+			echo -n "Starting $prog: "
+			start_daemon /usr/sbin/openhpid -c /etc/openhpi/openhpi.conf
+			RETVAL=$?
+			;;
+		gentoo | rh)
+			echo "Starting $prog: "
+			start-stop-daemon --start --quiet --exec /usr/sbin/openhpid -- -c /etc/openhpi/openhpi.conf
+			RETVAL=$?
+			;;
+		nolsb)
+			echo -n "Starting $prog: "
+			/usr/sbin/openhpid -c /etc/openhpi/openhpi.conf
+			RETVAL=$?
+			;;
+
+	esac
+
+	print_outcome
+
+}
+
+stop() {
+	case "${lsbtype}" in
+
+		lsb | suse)
+			echo -n "Stopping $prog: "
+			killproc /usr/sbin/openhpid
+			RETVAL=$?
+			;;
+
+		gentoo)
+			echo "Stopping $prog: "
+			start-stop-daemon --stop --quiet --exec /usr/sbin/openhpid
+			RETVAL=$?
+			;;
+
+		nolsb | rh)
+			echo -n "Stopping $prog: "
+			if test -f /var/run/openhpid.pid && test "`cat /var/run/openhpid.pid`" != ""
+         		then
+            			kill "`cat /var/run/openhpid.pid`"
+				RETVAL=$?
+			else
+				RETVAL=0
+			fi
+			;;
+
+	esac
+
+	print_outcome
+
+	if test "$RETVAL" -eq 0 && test -f /var/run/openhpid.pid
+	then
+		rm -f /var/lock/openhpid
+		rm -f /var/run/openhpid.pid
+	fi
+
+}
+
+dstatus() {
+	echo "Checking for $prog daemon: "
+
+	case "${lsbtype}" in
+
+		suse)
+			checkproc /usr/sbin/openhpid
+			rc_status -v
+			;;
+		lsb)
+			pid="`pidofproc /usr/sbin/openhpid`"
+         		if test "${pid}" != ""
+			then
+				log_success_msg "$prog is running"
+			else
+				log_success_msg "$prog is not running"
+			fi
+			;;
+		gentoo | nolsb | rh)
+			if test -f /var/run/openhpid.pid &&
+				test "`cat /var/run/openhpid.pid`" != "" &&
+				kill -s 0 "`cat /var/run/openhpid.pid`"
+			then
+				echo "$prog is running"
+			else
+				echo "$prog is not running"
+			fi
+
+			;;
+
+	esac
+
+
+
+}
+
+restart() {
+  	stop
+	start
+}
+
+force_reload() {
+	# We don't currently support a reload, but can do a restart
+	stop
+	start
+}
+
+# See how we were called.
+
+case "$1" in
+  start)
+  	start
+	;;
+  stop)
+  	stop
+	;;
+  restart)
+  	restart
+	;;
+  status)
+  	dstatus
+	;;
+  force-reload)
+  	force_reload
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|status|force-reload}"
+	exit 1
+esac
diff --git a/meta-networking/recipes-daemons/openhpi/files/openhpid.service b/meta-networking/recipes-daemons/openhpi/files/openhpid.service
new file mode 100644
index 000000000..cd4168f8e
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/openhpid.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Daemon providing access to the SAF Hardware Platform Interface
+After=syslog.target
+
+[Service]
+Type=forking
+PIDFile=/var/run/openhpid.pid
+ExecStart=@SBINDIR@/openhpid -c @SYSCONFDIR@/openhpi/openhpi.conf
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/openhpi/files/run-ptest b/meta-networking/recipes-daemons/openhpi/files/run-ptest
new file mode 100755
index 000000000..5b187d908
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+for x in `find ./ -name Makefile`;
+do
+	make -C `dirname ${x}` -k runtest-TESTS
+done
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
new file mode 100644
index 000000000..b9b0437b2
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
@@ -0,0 +1,109 @@
+SUMMARY = "Hardware Platform Interface Library and Tools"
+
+DESCRIPTION = "\
+OpenHPI is an open source project created with the intent of providing an \
+implementation of the SA Forum's Hardware Platform Interface (HPI). HPI \
+provides an abstracted interface to managing computer hardware, typically for \
+chassis and rack based servers. HPI includes resource modeling; access to and \
+control over sensor, control, watchdog, and inventory data associated with \
+resources; abstracted System Event Log interfaces; hardware events and alerts; \
+and a managed hotswap interface. \
+\
+OpenHPI provides a modular mechanism for adding new hardware and device support \
+easily. Many plugins exist in the OpenHPI source tree to provide access to \
+various types of hardware. This includes, but is not limited to, IPMI based \
+servers, Blade Center, and machines which export data via sysfs. \
+"
+
+HOMEPAGE = "http://openhpi.sourceforge.net/Home"
+SECTION = "net"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e3c772a32386888ccb5ae1c0ba95f1a4"
+
+DEPENDS = "net-snmp libxml2 ncurses openssl glib-2.0 popt e2fsprogs"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://openhpi-netsnmp-cross-compile.patch \
+           file://openhpi-sysfs-cross-compile.patch \
+           file://openhpi-libxml2-cross-compile.patch \
+           file://openhpi-glib-cross-compile.patch \
+           file://openhpi-linkfix.patch \
+           file://openhpi-fix-host-gcc.patch \
+           file://openhpi-hpi-shell-thread-fix.patch \
+           file://openhpi-fix-testfail-errors.patch \
+           file://openhpi-add-libnetsnmp-when-link.patch \
+           file://openhpi-invalide-session.patch \
+           file://openhpi-use-serial-tests-config-needed-by-ptest.patch \
+           file://openhpi-fix-alignment-issue.patch \
+           \
+           file://openhpi.init \
+           file://openhpid.service \
+           file://run-ptest \
+"
+
+SRC_URI[md5sum] = "4718b16e0f749b5ad214a9b04f45dd23"
+SRC_URI[sha256sum] = "e0a810cb401c4bdcfc9551f2e6afd5a8ca4b411f5ee3bc60c19f82fd6e84a3dc"
+
+inherit autotools pkgconfig ptest update-rc.d systemd
+
+PACKAGES =+ "${PN}-libs"
+
+FILES_${PN}-libs = "${libdir}/${BPN}/*.so /usr/lib/${BPN}/*.so"
+
+INSANE_SKIP_${PN}-libs = "dev-so"
+RDEPENDS_${PN} += "${PN}-libs"
+
+PACKAGECONFIG ??= "libgcrypt"
+PACKAGECONFIG[sysfs] = "--enable-sysfs,--disable-sysfs,sysfsutils,"
+PACKAGECONFIG[libgcrypt] = "--enable-encryption,--disable-encryption,libgcrypt,"
+
+do_install_append () {
+    install -m 0755 -d ${D}${sysconfdir}/${BPN}
+    install -m 0755 ${S}/openhpiclient.conf.example ${D}${sysconfdir}/${BPN}/openhpiclient.conf
+    install -m 0700 ${S}/openhpi.conf.example ${D}${sysconfdir}/${BPN}/openhpi.conf
+    install -m 0755 ${S}/simulation.data.example ${D}${sysconfdir}/${BPN}/simulation.data
+    install -m 0755 ${S}/test_agent.data.example ${D}${sysconfdir}/${BPN}/test_agent.data
+    install -m 0755 ${WORKDIR}/openhpi.init ${D}${sysconfdir}/init.d/openhpid
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/openhpid.service ${D}${systemd_unitdir}/system
+    sed -i -e "s,@SBINDIR@,${sbindir},g" -e "s,@SYSCONFDIR@,${sysconfdir},g" \
+        ${D}${systemd_unitdir}/system/openhpid.service
+}
+
+do_compile_ptest () {
+    for x in `find ${B} -name Makefile -exec grep -l buildtest-TESTS {} \;`; do
+        dir=`dirname ${x}`
+        upper=`dirname ${dir}`
+        if [ `basename ${upper}` != "cpp" ]; then
+            oe_runmake -C ${dir} buildtest-TESTS
+        fi
+    done
+}
+
+do_install_ptest () {
+    cp -rf ${B}/openhpid/t/ohpi/.libs/* ${B}/openhpid/t/ohpi/
+    TESTS="utils marshal openhpid"
+    for subtest in ${TESTS}; do
+        mkdir -p ${D}${PTEST_PATH}/${subtest}/t
+        cp -rf ${B}/${subtest}/t/* ${D}${PTEST_PATH}/${subtest}/t
+    done
+
+    for x in `find ${D}${PTEST_PATH} -name Makefile`; do
+        sed -i "s:${S}:${PTEST_PATH}/:g" ${x};
+        sed -i "s/^Makefile:/MM:/g" ${x};
+    done;
+
+    mkdir -p ${D}${PTEST_PATH}/plugins/watchdog/
+    cp -L ${D}/${libdir}/${BPN}/libwatchdog.so ${D}${PTEST_PATH}/plugins/watchdog/
+    cp -L ${D}/${libdir}/${BPN}/libsimulator.so ${D}${PTEST_PATH}/plugins/watchdog/
+    find ${D}${PTEST_PATH}/ -name "*.c" -exec rm {} \;
+    find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
+    find ${D}${PTEST_PATH}/ -name "*.h" -exec rm {} \;
+}
+
+INITSCRIPT_NAME = "openhpid"
+INITSCRIPT_PARAMS = "start 30 . stop 70 0 1 2 3 4 5 6 ."
+
+SYSTEMD_SERVICE_${PN} = "openhpid.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.11.0


