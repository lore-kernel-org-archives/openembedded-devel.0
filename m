Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A7F7860557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:08:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99886814"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Aug 2015 18:11:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7LA88bm001209
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 18:08:08 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 21 Aug 2015 18:08:12 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 18:08:04 +0800
Message-ID: <1440151684-4103-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH] net-snmp: upgrade 5.7.2.1 -> 5.7.3
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
X-List-Received-Date: Fri, 21 Aug 2015 10:08:19 -0000
Content-Type: text/plain

* Dropped backported patches
  --ifmib.patch
  --0001-Added-checks-for-printing-variables-with-wrong-types.patch
  --0001-Fix-CVE-2014-2285.patch
  --net-snmp-5.7.2-fix-mib-timeout-values.patch

* Update patches
  --dont-return-incompletely-parsed-varbinds.patch
  --systemd-support.patch

* Add a new patch to avoid build Errors.
  --0001-config_os_headers-Error-Fix.patch

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-protocols/net-snmp/files/ifmib.patch   |  66 ---
 ...s-for-printing-variables-with-wrong-types.patch | 455 ---------------------
 .../net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch |  49 ---
 .../0001-config_os_headers-Error-Fix.patch         |  37 ++
 .../dont-return-incompletely-parsed-varbinds.patch |  55 +--
 .../net-snmp-5.7.2-fix-mib-timeout-values.patch    |  56 ---
 .../net-snmp/net-snmp/systemd-support.patch        | 178 ++++----
 .../{net-snmp_5.7.2.1.bb => net-snmp_5.7.3.bb}     |  12 +-
 8 files changed, 176 insertions(+), 732 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/files/ifmib.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables-with-wrong-types.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-mib-timeout-values.patch
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.7.2.1.bb => net-snmp_5.7.3.bb} (93%)

diff --git a/meta-networking/recipes-protocols/net-snmp/files/ifmib.patch b/meta-networking/recipes-protocols/net-snmp/files/ifmib.patch
deleted file mode 100644
index 859c52c..0000000
--- a/meta-networking/recipes-protocols/net-snmp/files/ifmib.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Signed-off-by: Jack Mitchell <jack@embed.me.uk>
-Upstream-Status: Pending
-Bug-Report: http://sourceforge.net/p/net-snmp/bugs/2449/
-
-diff --git a/agent/mibgroup/if-mib/data_access/interface_linux.c b/agent/mibgroup/if-mib/data_access/interface_linux.c
-index 3419811..d6eb91a 100644
---- a/agent/mibgroup/if-mib/data_access/interface_linux.c
-+++ b/agent/mibgroup/if-mib/data_access/interface_linux.c
-@@ -18,7 +18,31 @@ netsnmp_feature_require(interface_ioctl_flags_set)
- 
- #ifdef HAVE_PCI_LOOKUP_NAME
- #include <pci/pci.h>
-+#include <setjmp.h>
- static struct pci_access *pci_access;
-+
-+/* Avoid letting libpci call exit(1) when no PCI bus is available. */
-+static int do_longjmp =0;
-+static jmp_buf err_buf;
-+static void
-+netsnmp_pci_error(char *msg, ...)
-+{
-+    va_list args;
-+    char *buf;
-+    int buflen;
-+
-+    va_start(args, msg);
-+    buflen = strlen("pcilib: ")+strlen(msg)+2;
-+    buf = malloc(buflen);
-+    snprintf(buf, buflen, "pcilib: %s\n", msg);
-+    snmp_vlog(LOG_ERR, buf, args);
-+    free(buf);
-+    va_end(args);
-+    if (do_longjmp)
-+	longjmp(err_buf, 1);
-+    else
-+	exit(1);
-+}
- #endif
- 
- #ifdef HAVE_LINUX_ETHTOOL_H
-@@ -147,10 +171,22 @@ netsnmp_arch_interface_init(void)
- 
- #ifdef HAVE_PCI_LOOKUP_NAME
-     pci_access = pci_alloc();
--    if (pci_access)
-+    if (!pci_access) {
-+	snmp_log(LOG_ERR, "pcilib: pci_alloc failed\n");
-+	return;
-+    }
-+
-+    pci_access->error = netsnmp_pci_error;
-+
-+    do_longjmp = 1;
-+    if (setjmp(err_buf)) {
-+        pci_cleanup(pci_access);
-+	snmp_log(LOG_ERR, "pcilib: pci_init failed\n");
-+        pci_access = NULL;
-+    }
-+    else if (pci_access)
- 	pci_init(pci_access);
--    else
--	snmp_log(LOG_ERR, "Unable to create pci access method\n");
-+    do_longjmp = 0;
- #endif
- }
- 
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables-with-wrong-types.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables-with-wrong-types.patch
deleted file mode 100644
index 30374cf..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables-with-wrong-types.patch
+++ /dev/null
@@ -1,455 +0,0 @@
-From 7f4a7b891332899cea26e95be0337aae01648742 Mon Sep 17 00:00:00 2001
-From: Jan Safranek <jsafranek@users.sourceforge.net>
-Date: Thu, 31 Jul 2014 13:46:49 +0200
-Subject: [PATCH] Added checks for printing variables with wrong types.
-
-Upstream-Status: Backport
-
-When -OQ command line argument is used, variable formatter preffers the type
-of the varible parsed from a MIB file instead of checking type of the variable
-as parsed from SNMP message.
-
-This can lead to crashes when incoming packets contains a variable with
-NULL type, while the MIB says the variable should be non-NULL, like Integer.
-The formatter then tries to interpret the NULL (from packet) as Integer (from
-MIB file).
-
-Signed-off-by: Jan Safranek <jsafranek@users.sourceforge.net>
----
- snmplib/mib.c |  270 ++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 135 insertions(+), 135 deletions(-)
-
-diff --git a/snmplib/mib.c b/snmplib/mib.c
-index 9d3ca41..c6e0010 100644
---- a/snmplib/mib.c
-+++ b/snmplib/mib.c
-@@ -439,17 +439,16 @@ sprint_realloc_octet_string(u_char ** buf, size_t * buf_len,
-     u_char         *cp;
-     int             output_format, cnt;
- 
--    if ((var->type != ASN_OCTET_STR) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        const char      str[] = "Wrong Type (should be OCTET STRING): ";
--        if (snmp_cstrcat
--            (buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_OCTET_STR) {
-+        if (!netsnmp_ds_get_boolean(
-+                    NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            const char      str[] = "Wrong Type (should be OCTET STRING): ";
-+            if (!snmp_cstrcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
- 
-@@ -702,16 +701,16 @@ sprint_realloc_float(u_char ** buf, size_t * buf_len,
-                      const struct enum_list *enums,
-                      const char *hint, const char *units)
- {
--    if ((var->type != ASN_OPAQUE_FLOAT) &&
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        if (snmp_cstrcat(buf, buf_len, out_len, allow_realloc, 
--                         "Wrong Type (should be Float): ")) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_OPAQUE_FLOAT) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be Float): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
-@@ -772,17 +771,16 @@ sprint_realloc_double(u_char ** buf, size_t * buf_len,
-                       const struct enum_list *enums,
-                       const char *hint, const char *units)
- {
--    if ((var->type != ASN_OPAQUE_DOUBLE) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        if (snmp_cstrcat
--            (buf, buf_len, out_len, allow_realloc, 
--             "Wrong Type (should be Double): ")) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_OPAQUE_DOUBLE) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be Double): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
-@@ -847,20 +845,21 @@ sprint_realloc_counter64(u_char ** buf, size_t * buf_len, size_t * out_len,
- {
-     char            a64buf[I64CHARSZ + 1];
- 
--    if ((var->type != ASN_COUNTER64
-+    if (var->type != ASN_COUNTER64
- #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
-         && var->type != ASN_OPAQUE_COUNTER64
-         && var->type != ASN_OPAQUE_I64 && var->type != ASN_OPAQUE_U64
- #endif
--        ) && (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        if (snmp_cstrcat(buf, buf_len, out_len, allow_realloc, 
--                        "Wrong Type (should be Counter64): ")) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+        ) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be Counter64): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
-@@ -948,23 +947,25 @@ sprint_realloc_opaque(u_char ** buf, size_t * buf_len,
-                       const struct enum_list *enums,
-                       const char *hint, const char *units)
- {
--    if ((var->type != ASN_OPAQUE
-+    if (var->type != ASN_OPAQUE
- #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
-         && var->type != ASN_OPAQUE_COUNTER64
-         && var->type != ASN_OPAQUE_U64
-         && var->type != ASN_OPAQUE_I64
-         && var->type != ASN_OPAQUE_FLOAT && var->type != ASN_OPAQUE_DOUBLE
- #endif                          /* NETSNMP_WITH_OPAQUE_SPECIAL_TYPES */
--        ) && (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        if (snmp_cstrcat(buf, buf_len, out_len, allow_realloc, 
--                         "Wrong Type (should be Opaque): ")) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+        ) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be Opaque): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
-+
- #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
-     switch (var->type) {
-     case ASN_OPAQUE_COUNTER64:
-@@ -1040,17 +1041,16 @@ sprint_realloc_object_identifier(u_char ** buf, size_t * buf_len,
- {
-     int             buf_overflow = 0;
- 
--    if ((var->type != ASN_OBJECT_ID) &&
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] =
--            "Wrong Type (should be OBJECT IDENTIFIER): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_OBJECT_ID) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be OBJECT IDENTIFIER): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
-@@ -1110,16 +1110,16 @@ sprint_realloc_timeticks(u_char ** buf, size_t * buf_len, size_t * out_len,
- {
-     char            timebuf[40];
- 
--    if ((var->type != ASN_TIMETICKS) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] = "Wrong Type (should be Timeticks): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_TIMETICKS) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be Timeticks): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_NUMERIC_TIMETICKS)) {
-@@ -1277,17 +1277,18 @@ sprint_realloc_integer(u_char ** buf, size_t * buf_len, size_t * out_len,
- {
-     char           *enum_string = NULL;
- 
--    if ((var->type != ASN_INTEGER) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] = "Wrong Type (should be INTEGER): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_INTEGER) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be INTEGER): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
-+
-     for (; enums; enums = enums->next) {
-         if (enums->value == *var->val.integer) {
-             enum_string = enums->label;
-@@ -1380,16 +1381,16 @@ sprint_realloc_uinteger(u_char ** buf, size_t * buf_len, size_t * out_len,
- {
-     char           *enum_string = NULL;
- 
--    if ((var->type != ASN_UINTEGER) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] = "Wrong Type (should be UInteger32): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_UINTEGER) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be UInteger32): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     for (; enums; enums = enums->next) {
-@@ -1477,17 +1478,16 @@ sprint_realloc_gauge(u_char ** buf, size_t * buf_len, size_t * out_len,
- {
-     char            tmp[32];
- 
--    if ((var->type != ASN_GAUGE) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] =
--            "Wrong Type (should be Gauge32 or Unsigned32): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_GAUGE) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be Gauge32 or Unsigned32): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
-@@ -1550,16 +1550,16 @@ sprint_realloc_counter(u_char ** buf, size_t * buf_len, size_t * out_len,
- {
-     char            tmp[32];
- 
--    if ((var->type != ASN_COUNTER) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] = "Wrong Type (should be Counter32): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_COUNTER) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be Counter32): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
-@@ -1613,16 +1613,16 @@ sprint_realloc_networkaddress(u_char ** buf, size_t * buf_len,
- {
-     size_t          i;
- 
--    if ((var->type != ASN_IPADDRESS) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] = "Wrong Type (should be NetworkAddress): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_IPADDRESS) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be NetworkAddress): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
-@@ -1679,16 +1679,16 @@ sprint_realloc_ipaddress(u_char ** buf, size_t * buf_len, size_t * out_len,
- {
-     u_char         *ip = var->val.string;
- 
--    if ((var->type != ASN_IPADDRESS) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] = "Wrong Type (should be IpAddress): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_IPADDRESS) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be IpAddress): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
-@@ -1737,20 +1737,20 @@ sprint_realloc_null(u_char ** buf, size_t * buf_len, size_t * out_len,
-                     const struct enum_list *enums,
-                     const char *hint, const char *units)
- {
--    if ((var->type != ASN_NULL) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] = "Wrong Type (should be NULL): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_NULL) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be NULL): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
--    } else {
--        u_char          str[] = "NULL";
--        return snmp_strcat(buf, buf_len, out_len, allow_realloc, str);
-     }
-+
-+    u_char          str[] = "NULL";
-+    return snmp_strcat(buf, buf_len, out_len, allow_realloc, str);
- }
- 
- 
-@@ -1785,16 +1785,16 @@ sprint_realloc_bitstring(u_char ** buf, size_t * buf_len, size_t * out_len,
-     u_char         *cp;
-     char           *enum_string;
- 
--    if ((var->type != ASN_BIT_STR && var->type != ASN_OCTET_STR) &&
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] = "Wrong Type (should be BITS): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_BIT_STR && var->type != ASN_OCTET_STR) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be BITS): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
-@@ -1869,16 +1869,16 @@ sprint_realloc_nsapaddress(u_char ** buf, size_t * buf_len,
-                            const struct enum_list *enums, const char *hint,
-                            const char *units)
- {
--    if ((var->type != ASN_NSAP) && 
--        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
--        u_char          str[] = "Wrong Type (should be NsapAddress): ";
--        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
--            return sprint_realloc_by_type(buf, buf_len, out_len,
-+    if (var->type != ASN_NSAP) {
-+        if (!netsnmp_ds_get_boolean(
-+                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
-+            u_char          str[] = "Wrong Type (should be NsapAddress): ";
-+            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
-+                return 0;
-+        }
-+        return sprint_realloc_by_type(buf, buf_len, out_len,
-                                           allow_realloc, var, NULL, NULL,
-                                           NULL);
--        } else {
--            return 0;
--        }
-     }
- 
-     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch
deleted file mode 100644
index b1514b9..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 87a0d27102ceffb92e5c1d6fbbd24972a9dd33ac Mon Sep 17 00:00:00 2001
-From: Junling Zheng <zhengjunling@huawei.com>
-Date: Mon, 20 Apr 2015 10:23:08 +0000
-Subject: [PATCH] Fix CVE-2014-2285
-
-Sending SNMP trap with empty community string crashes snmptrapd if Perl
-handler is enabled.
-
-Refer to:
-https://bugzilla.redhat.com/show_bug.cgi?id=1072044
-
-Upstream Status: Backported
-
-Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
----
- perl/TrapReceiver/TrapReceiver.xs | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/perl/TrapReceiver/TrapReceiver.xs b/perl/TrapReceiver/TrapReceiver.xs
-index 531bfa4..ac94370 100644
---- a/perl/TrapReceiver/TrapReceiver.xs
-+++ b/perl/TrapReceiver/TrapReceiver.xs
-@@ -81,18 +81,18 @@ int   perl_trapd_handler( netsnmp_pdu           *pdu,
-         STOREPDUi("securitymodel", pdu->securityModel);
-         STOREPDUi("securitylevel", pdu->securityLevel);
-         STOREPDU("contextName",
--                 newSVpv(pdu->contextName, pdu->contextNameLen));
-+                 newSVpv(pdu->contextName ? pdu->contextName : "", pdu->contextNameLen));
-         STOREPDU("contextEngineID",
--                 newSVpv((char *) pdu->contextEngineID,
-+                 newSVpv((char *)(pdu->contextEngineID ? pdu->contextEngineID : ""),
-                                     pdu->contextEngineIDLen));
-         STOREPDU("securityEngineID",
--                 newSVpv((char *) pdu->securityEngineID,
-+                 newSVpv((char *)(pdu->securityEngineID ? pdu->securityEngineID : ""),
-                                     pdu->securityEngineIDLen));
-         STOREPDU("securityName",
--                 newSVpv((char *) pdu->securityName, pdu->securityNameLen));
-+                 newSVpv((char *)(pdu->securityName ? pdu->securityName : ""), pdu->securityNameLen));
-     } else {
-         STOREPDU("community",
--                 newSVpv((char *) pdu->community, pdu->community_len));
-+                 newSVpv((char *)(pdu->community ? pdu->community : ""), pdu->community_len));
-     }
- 
-     if (transport && transport->f_fmtaddr) {
--- 
-1.8.3.4
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
new file mode 100644
index 0000000..c6401fe
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-config_os_headers-Error-Fix.patch
@@ -0,0 +1,37 @@
+From 261a22096c79f8e6ef7b387514a74d208e4e5945 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 21 Aug 2015 18:23:13 +0900
+Subject: [PATCH] config_os_headers: Error Fix
+
+ERROR: This autoconf log indicates errors, it looked at host include
+and/or library paths while determining system capabilities.
+cc1: warning: include location "/usr/local/include" is unsafe for cross-compilation [-Wpoison-system-directories]
+conftest.c:168:17: fatal error: pkg.h: No such file or directory
+ #include <pkg.h>
+                 ^
+
+Upstream-Status: pending
+
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ configure.d/config_os_headers | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.d/config_os_headers b/configure.d/config_os_headers
+index 708aa09..0df32ca 100644
+--- a/configure.d/config_os_headers
++++ b/configure.d/config_os_headers
+@@ -482,8 +482,8 @@ then
+     unset ac_cv_header_pkg_h
+     netsnmp_save_CPPFLAGS="$CPPFLAGS"
+     netsnmp_save_LDFLAGS="$LDFLAGS"
+-    CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-    LDFLAGS="$LDFLAGS -L/usr/local/lib"
++    CPPFLAGS="$CPPFLAGS"
++    LDFLAGS="$LDFLAGS"
+     AC_CHECK_HEADERS(pkg.h,
+         NETSNMP_SEARCH_LIBS(pkg_init, pkg,
+ 	    AC_DEFINE(HAVE_LIBPKG, 1, [define if you have BSD pkg-ng])))
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/dont-return-incompletely-parsed-varbinds.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/dont-return-incompletely-parsed-varbinds.patch
index 04f2110..6bd0f93 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/dont-return-incompletely-parsed-varbinds.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/dont-return-incompletely-parsed-varbinds.patch
@@ -1,18 +1,24 @@
-the snmp_pdu_parse() function could leave
-incompletely parsed varBind variables in the list of variables in
-case the parsing of the SNMP PDU failed. If later processing tries to
-operate on the stale and incompletely processed varBind (e.g. when
-printing the variables), this can lead to e.g. crashes or, possibly,
-execution of arbitrary code
+From 6b93e686bdb6a908d00595608646a05527a5326b Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 21 Aug 2015 12:39:12 +0900
+Subject: [PATCH] the snmp_pdu_parse() function could leave incompletely parsed
+ varBind variables in the list of variables in case the parsing of the SNMP
+ PDU failed. If later processing tries to operate on the stale and
+ incompletely processed varBind (e.g. when printing the variables), this can
+ lead to e.g. crashes or, possibly, execution of arbitrary code
 
 Upstream-Status: Backport [net-snmp]
 
 Written-by: Robert Story
+---
+ snmplib/snmp_api.c | 53 ++++++++++++++++++++++++++++-------------------------
+ 1 file changed, 28 insertions(+), 25 deletions(-)
 
-diff -Nur net-snmp-5.7.2.1.orig/snmplib/snmp_api.c net-snmp-5.7.2.1/snmplib/snmp_api.c
---- net-snmp-5.7.2.1.orig/snmplib/snmp_api.c	2015-05-27 11:25:11.563747471 +0800
-+++ net-snmp-5.7.2.1/snmplib/snmp_api.c	2015-05-27 13:27:27.724748201 +0800
-@@ -4345,10 +4345,9 @@
+diff --git a/snmplib/snmp_api.c b/snmplib/snmp_api.c
+index 191debf..15a2d39 100644
+--- a/snmplib/snmp_api.c
++++ b/snmplib/snmp_api.c
+@@ -4350,10 +4350,9 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
      u_char          type;
      u_char          msg_type;
      u_char         *var_val;
@@ -22,9 +28,9 @@ diff -Nur net-snmp-5.7.2.1.orig/snmplib/snmp_api.c net-snmp-5.7.2.1/snmplib/snmp
 -    netsnmp_variable_list *vp = NULL;
 +    netsnmp_variable_list *vp = NULL, *vplast = NULL;
      oid             objid[MAX_OID_LEN];
+     u_char         *p;
  
-     /*
-@@ -4487,38 +4486,24 @@
+@@ -4493,31 +4492,17 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
                                (ASN_SEQUENCE | ASN_CONSTRUCTOR),
                                "varbinds");
      if (data == NULL)
@@ -60,25 +66,16 @@ diff -Nur net-snmp-5.7.2.1.orig/snmplib/snmp_api.c net-snmp-5.7.2.1/snmplib/snmp
          DEBUGDUMPSECTION("recv", "VarBind");
          data = snmp_parse_var_op(data, objid, &vp->name_length, &vp->type,
                                   &vp->val_len, &var_val, length);
-         if (data == NULL)
--            return -1;
-+            goto fail;
-         if (snmp_set_var_objid(vp, objid, vp->name_length))
--            return -1;
-+            goto fail;
- 
-         len = MAX_PACKET_LENGTH;
-         DEBUGDUMPHEADER("recv", "Value");
-@@ -4583,7 +4568,7 @@
+@@ -4604,7 +4589,7 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
                  vp->val.string = (u_char *) malloc(vp->val_len);
              }
              if (vp->val.string == NULL) {
 -                return -1;
 +                goto fail;
              }
-             asn_parse_string(var_val, &len, &vp->type, vp->val.string,
+             p = asn_parse_string(var_val, &len, &vp->type, vp->val.string,
                               &vp->val_len);
-@@ -4594,7 +4579,7 @@
+@@ -4619,7 +4604,7 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
              vp->val_len *= sizeof(oid);
              vp->val.objid = (oid *) malloc(vp->val_len);
              if (vp->val.objid == NULL) {
@@ -87,15 +84,16 @@ diff -Nur net-snmp-5.7.2.1.orig/snmplib/snmp_api.c net-snmp-5.7.2.1/snmplib/snmp
              }
              memmove(vp->val.objid, objid, vp->val_len);
              break;
-@@ -4606,19 +4591,35 @@
+@@ -4631,7 +4616,7 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
          case ASN_BIT_STR:
              vp->val.bitstring = (u_char *) malloc(vp->val_len);
              if (vp->val.bitstring == NULL) {
 -                return -1;
 +                goto fail;
              }
-             asn_parse_bitstring(var_val, &len, &vp->type,
+             p = asn_parse_bitstring(var_val, &len, &vp->type,
                                  vp->val.bitstring, &vp->val_len);
+@@ -4640,12 +4625,30 @@ snmp_pdu_parse(netsnmp_pdu *pdu, u_char * data, size_t * length)
              break;
          default:
              snmp_log(LOG_ERR, "bad type returned (%x)\n", vp->type);
@@ -112,6 +110,7 @@ diff -Nur net-snmp-5.7.2.1.orig/snmplib/snmp_api.c net-snmp-5.7.2.1/snmplib/snmp
 +        }
 +        vplast = vp;
 +        vp = NULL;
++
      }
 -    return badtype;
 +    return 0;
@@ -123,6 +122,10 @@ diff -Nur net-snmp-5.7.2.1.orig/snmplib/snmp_api.c net-snmp-5.7.2.1/snmplib/snmp
 +        snmp_free_var(vp);
 +
 +    return -1;
++
  }
  
  /*
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-mib-timeout-values.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-mib-timeout-values.patch
deleted file mode 100644
index 324d1c0..0000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-mib-timeout-values.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-net-snmp: fix mib representation of timeout values
-
-The patch comes from the follow three commits on upstream:
-78dac6e37943d1ad99841898806ea60b0eede636
-390303059fbd98b1ee7621ddd4ad4c11d100fff9
-96302af7fc3108c208227432f0f0b75f3e7b906d
-
-The first commit:
-Fix bug number #a2478: fix mib representation of timeout values.
-The second commit:
-Reverts 78dac6e37943d1ad99841898806ea60b0eede636 and resolve a2478
-in a way that avoids truncating
-The third commit:
-Corrects conversion factor from microseconds to centiseconds.
-
-Upstream-Status: Backport
-
-Signed-off-by: Per Hallsmark <per.hallsmark@windriver.com>
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
-
-diff -uarN net-snmp-5.7.2-org/agent/mibgroup/notification/snmpNotifyTable.c net-snmp-5.7.2/agent/mibgroup/notification/snmpNotifyTable.c
---- net-snmp-5.7.2-org/agent/mibgroup/notification/snmpNotifyTable.c	2015-04-09 15:24:18.393570318 +0800
-+++ net-snmp-5.7.2/agent/mibgroup/notification/snmpNotifyTable.c	2015-04-09 15:25:23.547569858 +0800
-@@ -331,7 +331,7 @@
-     ptr->tAddressLen = t->remote_length;
-     ptr->tAddress = t->remote;
- 
--    ptr->timeout = ss->timeout / 1000;
-+    ptr->timeout = ss->timeout / 10000;
-     ptr->retryCount = ss->retries;
-     SNMP_FREE(ptr->tagList);
-     ptr->tagList = strdup(ptr->name);
-diff -uarN net-snmp-5.7.2-org/agent/mibgroup/target/snmpTargetAddrEntry.h net-snmp-5.7.2/agent/mibgroup/target/snmpTargetAddrEntry.h
---- net-snmp-5.7.2-org/agent/mibgroup/target/snmpTargetAddrEntry.h	2015-04-09 15:24:18.593570085 +0800
-+++ net-snmp-5.7.2/agent/mibgroup/target/snmpTargetAddrEntry.h	2015-04-09 15:26:41.250570178 +0800
-@@ -51,7 +51,7 @@
-          int             tDomainLen;
-          unsigned char  *tAddress;
-          size_t          tAddressLen;
--         int             timeout;
-+         int             timeout;	/* Timeout in centiseconds */
-          int             retryCount;
-          char           *tagList;
-          char           *params;
-diff -uarN net-snmp-5.7.2-org/agent/mibgroup/target/target.c net-snmp-5.7.2/agent/mibgroup/target/target.c
---- net-snmp-5.7.2-org/agent/mibgroup/target/target.c	2015-04-09 15:24:18.592569768 +0800
-+++ net-snmp-5.7.2/agent/mibgroup/target/target.c	2015-04-09 15:25:52.586569961 +0800
-@@ -240,7 +240,7 @@
-                             }
- #endif
-                             memset(&thissess, 0, sizeof(thissess));
--                            thissess.timeout = (targaddrs->timeout) * 1000;
-+                            thissess.timeout = (targaddrs->timeout) * 10000;
-                             thissess.retries = targaddrs->retryCount;
-                             DEBUGMSGTL(("target_sessions",
-                                         "timeout: %d -> %ld\n",
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
index e19153b..c6af8c0 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/systemd-support.patch
@@ -1,4 +1,8 @@
-Systemd support backported from the master branch as of 23/04/2012 (post 5.7.1, pre 5.8).
+From 0cad0c6c36af2a2d589563804c9ed2b37b7085fb Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 21 Aug 2015 14:37:02 +0900
+Subject: [PATCH] ystemd support backported from the master branch as of
+ 23/04/2012 (post 5.7.1, pre 5.8).
 
 The following commits have been cherry-picked:
 
@@ -15,15 +19,44 @@ bf108d7f1354f6276fc43c129963f2c49b9fc242
 Upstream-Status: Backport
 
 Signed-off-by: Thomas Fitzsimmons <fitzsim@cisco.com>
+---
+ README.systemd                             |  41 +++
+ agent/snmpd.c                              |  33 +-
+ apps/snmptrapd.c                           |  32 +-
+ configure.d/config_modules_lib             |   8 +
+ configure.d/config_project_with_enable     |   9 +
+ dist/snmpd.servic                          |  18 +
+ dist/snmpd.socket                          |  17 +
+ dist/snmptrapd.service                     |  16 +
+ dist/snmptrapd.socket                      |  14 +
+ include/net-snmp/library/sd-daemon.h       | 290 ++++++++++++++++
+ snmplib/sd-daemon.c                        | 532 +++++++++++++++++++++++++++++
+ snmplib/transports/snmpTCPDomain.c         |  43 ++-
+ snmplib/transports/snmpTCPIPv6Domain.c     |  46 ++-
+ snmplib/transports/snmpUDPIPv4BaseDomain.c |  33 +-
+ snmplib/transports/snmpUDPIPv6Domain.c     |  34 +-
+ snmplib/transports/snmpUnixDomain.c        |  66 ++--
+ win32/libsnmp/Makefile.in                  |   6 +
+ win32/net-snmp/net-snmp-config.h           |   2 +
+ win32/net-snmp/net-snmp-config.h.in        |   2 +
+ 19 files changed, 1176 insertions(+), 66 deletions(-)
+ create mode 100644 README.systemd
+ create mode 100644 dist/snmpd.servic
+ create mode 100644 dist/snmpd.socket
+ create mode 100644 dist/snmptrapd.service
+ create mode 100644 dist/snmptrapd.socket
+ create mode 100644 include/net-snmp/library/sd-daemon.h
+ create mode 100644 snmplib/sd-daemon.c
+
 diff --git a/README.systemd b/README.systemd
 new file mode 100644
-index 0000000..f731851
+index 0000000..dba15d1
 --- /dev/null
 +++ b/README.systemd
 @@ -0,0 +1,41 @@
 +README.systemd
 +--------------
-+Net-SNMP provides two daemons, which support systemd system manager. 
++Net-SNMP provides two daemons, which support systemd system manager.
 +See http://www.freedesktop.org/wiki/Software/systemd to learn how
 +systemd works. Both socket activation and notification is supported by these
 +daemons.
@@ -62,9 +95,8 @@ index 0000000..f731851
 +If integration with SNMP agent using AgentX protocol is enabled, snmptrapd should
 +start during boot and not after first SNMP trap arrives. Same rules as for snmpd
 +applies then.
-\ No newline at end of file
 diff --git a/agent/snmpd.c b/agent/snmpd.c
-index b177d5b..08bdfc7 100644
+index cfc7bce..116ee5c 100644
 --- a/agent/snmpd.c
 +++ b/agent/snmpd.c
 @@ -164,6 +164,10 @@ typedef long    fd_mask;
@@ -78,7 +110,7 @@ index b177d5b..08bdfc7 100644
  netsnmp_feature_want(logging_file)
  netsnmp_feature_want(logging_stdio)
  netsnmp_feature_want(logging_syslog)
-@@ -441,18 +445,28 @@ main(int argc, char *argv[])
+@@ -443,19 +447,29 @@ main(int argc, char *argv[])
      int             agent_mode = -1;
      char           *pid_file = NULL;
      char            option_compatability[] = "-Le";
@@ -102,14 +134,16 @@ index b177d5b..08bdfc7 100644
       */
 -    for (i = getdtablesize() - 1; i > 2; --i) {
 -        (void) close(i);
+-    }
 +    if (!prepared_sockets) {
 +        for (i = getdtablesize() - 1; i > 2; --i) {
 +            (void) close(i);
-+        }
-     }
++        }    
++}
  #endif /* #WIN32 */
      
-@@ -1100,6 +1114,19 @@ main(int argc, char *argv[])
+     /*
+@@ -1107,6 +1121,19 @@ main(int argc, char *argv[])
      netsnmp_addrcache_initialise();
  
      /*
@@ -130,7 +164,7 @@ index b177d5b..08bdfc7 100644
       */
      DEBUGMSGTL(("snmpd/main", "We're up.  Starting to process data.\n"));
 diff --git a/apps/snmptrapd.c b/apps/snmptrapd.c
-index 1a52080..0857ae1 100644
+index bce0d47..c6a74ec 100644
 --- a/apps/snmptrapd.c
 +++ b/apps/snmptrapd.c
 @@ -125,6 +125,10 @@ SOFTWARE.
@@ -144,7 +178,7 @@ index 1a52080..0857ae1 100644
  #ifndef BSD4_3
  #define BSD4_2
  #endif
-@@ -655,15 +659,24 @@ main(int argc, char *argv[])
+@@ -657,16 +661,25 @@ main(int argc, char *argv[])
      int             agentx_subagent = 1;
  #endif
      netsnmp_trapd_handler *traph;
@@ -164,14 +198,16 @@ index 1a52080..0857ae1 100644
       */
 -    for (i = getdtablesize() - 1; i > 2; --i) {
 -        (void) close(i);
+-    }
 +    if (!prepared_sockets) {
 +        for (i = getdtablesize() - 1; i > 2; --i) {
 +            (void) close(i);
-+        }
-     }
++        }    
++}
  #endif /* #WIN32 */
      
-@@ -1311,6 +1324,19 @@ main(int argc, char *argv[])
+ #ifdef SIGTERM
+@@ -1318,6 +1331,19 @@ main(int argc, char *argv[])
  #endif
  #endif
  
@@ -192,7 +228,7 @@ index 1a52080..0857ae1 100644
      trapd_status = SNMPTRAPD_RUNNING;
  #endif
 diff --git a/configure.d/config_modules_lib b/configure.d/config_modules_lib
-index b6609c1..5849072 100644
+index 362ba0a..bb69daa 100644
 --- a/configure.d/config_modules_lib
 +++ b/configure.d/config_modules_lib
 @@ -53,6 +53,14 @@ if test "x$PARTIALTARGETOS" = "xmingw32" -o "x$PARTIALTARGETOS" = "xmingw32msvc"
@@ -211,10 +247,10 @@ index b6609c1..5849072 100644
  AC_SUBST(other_objs_list)
  AC_SUBST(other_lobjs_list)
 diff --git a/configure.d/config_project_with_enable b/configure.d/config_project_with_enable
-index 8b46ad2..59d6d5c 100644
+index 61ba026..d782d12 100644
 --- a/configure.d/config_project_with_enable
 +++ b/configure.d/config_project_with_enable
-@@ -689,6 +689,15 @@ if test "x$with_dummy_values" != "xyes"; then
+@@ -690,6 +690,15 @@ if test "x$with_dummy_values" != "xyes"; then
       data for])
  fi
  
@@ -230,11 +266,11 @@ index 8b46ad2..59d6d5c 100644
  NETSNMP_ARG_ENABLE(set-support,
  [  --disable-set-support           Do not allow SNMP set requests.])
  if test "x$enable_set_support" = "xno"; then
-diff --git a/dist/snmpd.service b/dist/snmpd.service
+diff --git a/dist/snmpd.servic b/dist/snmpd.servic
 new file mode 100644
 index 0000000..31391e5
 --- /dev/null
-+++ b/dist/snmpd.service
++++ b/dist/snmpd.servic
 @@ -0,0 +1,18 @@
 +#
 +# SNMP agent service file for systemd
@@ -301,24 +337,24 @@ index 0000000..e88a5b4
 +WantedBy=multi-user.target
 diff --git a/dist/snmptrapd.socket b/dist/snmptrapd.socket
 new file mode 100644
-index 0000000..0fc8a7c
+index 0000000..2d24fb8
 --- /dev/null
 +++ b/dist/snmptrapd.socket
 @@ -0,0 +1,14 @@
-+[Unit]
-+Description=Socket listening for SNMP trap messages
-+
-+[Socket]
-+ListenDatagram=0.0.0.0:162
-+# Uncomment other listening addresses as needed - TCP, UDP6, TCP6.
-+# It must match listening addresses/ports defined in snmptrapd.service
-+# or snmptrapd.conf.
-+# ListenStream=0.0.0.0:162
-+# ListenDatagram=[::]:162
-+# ListenStream=[::]:162
-+
-+[Install]
-+WantedBy=sockets.target
+++[Unit]
+++Description=Socket listening for SNMP trap messages
+++
+++[Socket]
+++ListenDatagram=0.0.0.0:162
+++# Uncomment other listening addresses as needed - TCP, UDP6, TCP6.
+++# It must match listening addresses/ports defined in snmptrapd.service
+++# or snmptrapd.conf.
+++# ListenStream=0.0.0.0:162
+++# ListenDatagram=[::]:162
+++# ListenStream=[::]:162
+++
+++[Install]
+++WantedBy=sockets.target
 diff --git a/include/net-snmp/library/sd-daemon.h b/include/net-snmp/library/sd-daemon.h
 new file mode 100644
 index 0000000..85274c9
@@ -1154,7 +1190,7 @@ index 0000000..42dba29
 +
 +#endif /* ! NETSNMP_NO_SYSTEMD */
 diff --git a/snmplib/transports/snmpTCPDomain.c b/snmplib/transports/snmpTCPDomain.c
-index b8bdba4..ab7f3a1 100644
+index 7feb028..a41b926 100644
 --- a/snmplib/transports/snmpTCPDomain.c
 +++ b/snmplib/transports/snmpTCPDomain.c
 @@ -43,6 +43,10 @@
@@ -1216,11 +1252,10 @@ index b8bdba4..ab7f3a1 100644
          }
  
          /*
-@@ -235,12 +254,13 @@ netsnmp_tcp_transport(struct sockaddr_in *addr, int local)
-         /*
+@@ -236,11 +255,13 @@ netsnmp_tcp_transport(struct sockaddr_in *addr, int local)
           * Now sit here and wait for connections to arrive.  
           */
--
+ 
 -        rc = listen(t->sock, NETSNMP_STREAM_QUEUE_LEN);
 -        if (rc != 0) {
 -            netsnmp_socketbase_close(t);
@@ -1237,7 +1272,7 @@ index b8bdba4..ab7f3a1 100644
          
          /*
 diff --git a/snmplib/transports/snmpTCPIPv6Domain.c b/snmplib/transports/snmpTCPIPv6Domain.c
-index 3c96856..305a861 100644
+index d2e0a2d..22de6d4 100644
 --- a/snmplib/transports/snmpTCPIPv6Domain.c
 +++ b/snmplib/transports/snmpTCPIPv6Domain.c
 @@ -49,6 +49,10 @@
@@ -1322,7 +1357,7 @@ index 3c96856..305a861 100644
          
          /*
 diff --git a/snmplib/transports/snmpUDPIPv4BaseDomain.c b/snmplib/transports/snmpUDPIPv4BaseDomain.c
-index c67427b..428e6d6 100644
+index 8c0fb05..00e5bbc 100644
 --- a/snmplib/transports/snmpUDPIPv4BaseDomain.c
 +++ b/snmplib/transports/snmpUDPIPv4BaseDomain.c
 @@ -40,6 +40,10 @@
@@ -1333,10 +1368,10 @@ index c67427b..428e6d6 100644
 +#include <net-snmp/library/sd-daemon.h>
 +#endif
 +
- #if (defined(linux) && defined(IP_PKTINFO)) \
-     || defined(IP_RECVDSTADDR) && HAVE_STRUCT_MSGHDR_MSG_CONTROL \
-                                && HAVE_STRUCT_MSGHDR_MSG_FLAGS
-@@ -67,6 +71,7 @@ netsnmp_udpipv4base_transport(struct sockaddr_in *addr, int local)
+ #if defined(HAVE_IP_PKTINFO) || defined(HAVE_IP_RECVDSTADDR)
+ int netsnmp_udpipv4_recvfrom(int s, void *buf, int len, struct sockaddr *from,
+                              socklen_t *fromlen, struct sockaddr *dstip,
+@@ -64,6 +68,7 @@ netsnmp_udpipv4base_transport(struct sockaddr_in *addr, int local)
      char           *client_socket = NULL;
      netsnmp_indexed_addr_pair addr_pair;
      socklen_t       local_addr_len;
@@ -1344,7 +1379,7 @@ index c67427b..428e6d6 100644
  
  #ifdef NETSNMP_NO_LISTEN_SUPPORT
      if (local)
-@@ -91,7 +96,19 @@ netsnmp_udpipv4base_transport(struct sockaddr_in *addr, int local)
+@@ -88,7 +93,19 @@ netsnmp_udpipv4base_transport(struct sockaddr_in *addr, int local)
          free(str);
      }
  
@@ -1365,10 +1400,10 @@ index c67427b..428e6d6 100644
      DEBUGMSGTL(("UDPBase", "openned socket %d as local=%d\n", t->sock, local)); 
      if (t->sock < 0) {
          netsnmp_transport_free(t);
-@@ -141,12 +158,14 @@ netsnmp_udpipv4base_transport(struct sockaddr_in *addr, int local)
-             DEBUGMSGTL(("netsnmp_udp", "set IP_RECVDSTADDR\n"));
+@@ -151,12 +168,14 @@ netsnmp_udpipv4base_transport(struct sockaddr_in *addr, int local)
+             }
          }
- #endif
+ #endif /* !defined(WIN32) */
 -        rc = bind(t->sock, (struct sockaddr *) addr,
 -                  sizeof(struct sockaddr));
 -        if (rc != 0) {
@@ -1387,7 +1422,7 @@ index c67427b..428e6d6 100644
          t->data = NULL;
          t->data_length = 0;
 diff --git a/snmplib/transports/snmpUDPIPv6Domain.c b/snmplib/transports/snmpUDPIPv6Domain.c
-index b3eaae4..35b617f 100644
+index 18de876..fd2ced4 100644
 --- a/snmplib/transports/snmpUDPIPv6Domain.c
 +++ b/snmplib/transports/snmpUDPIPv6Domain.c
 @@ -67,6 +67,10 @@ static const struct in6_addr in6addr_any = IN6ADDR_ANY_INIT;
@@ -1431,11 +1466,10 @@ index b3eaae4..35b617f 100644
      if (t->sock < 0) {
          netsnmp_transport_free(t);
          return NULL;
-@@ -242,13 +260,14 @@ netsnmp_udp6_transport(struct sockaddr_in6 *addr, int local)
- 	  } 
- 	}
+@@ -243,12 +261,14 @@ netsnmp_udp6_transport(struct sockaddr_in6 *addr, int local)
+         }
  #endif
--
+ 
 -        rc = bind(t->sock, (struct sockaddr *) addr,
 -		  sizeof(struct sockaddr_in6));
 -        if (rc != 0) {
@@ -1454,7 +1488,7 @@ index b3eaae4..35b617f 100644
          t->local = (unsigned char*)malloc(18);
          if (t->local == NULL) {
 diff --git a/snmplib/transports/snmpUnixDomain.c b/snmplib/transports/snmpUnixDomain.c
-index 674dc2b..9f3d3cb 100644
+index 47dffc1..8f34c37 100644
 --- a/snmplib/transports/snmpUnixDomain.c
 +++ b/snmplib/transports/snmpUnixDomain.c
 @@ -37,6 +37,10 @@
@@ -1538,7 +1572,7 @@ index 674dc2b..9f3d3cb 100644
          }
  
          /*
-@@ -391,16 +409,17 @@ netsnmp_unix_transport(struct sockaddr_un *addr, int local)
+@@ -391,14 +409,16 @@ netsnmp_unix_transport(struct sockaddr_un *addr, int local)
           * Now sit here and listen for connections to arrive.
           */
  
@@ -1561,53 +1595,50 @@ index 674dc2b..9f3d3cb 100644
 +                return NULL;
 +            }
          }
--
+ 
      } else {
-         t->remote = (u_char *)malloc(strlen(addr->sun_path));
-         if (t->remote == NULL) {
 diff --git a/win32/libsnmp/Makefile.in b/win32/libsnmp/Makefile.in
-index 98d83c8..dd5689b 100644
+index 98d83c8..b228d20 100644
 --- a/win32/libsnmp/Makefile.in
 +++ b/win32/libsnmp/Makefile.in
 @@ -42,6 +42,7 @@ LIB32_OBJS= \
  	"$(INTDIR)\read_config.obj" \
  	"$(INTDIR)\readdir.obj" \
  	"$(INTDIR)\scapi.obj" \
-+	"$(INTDIR)\sd-daemon.obj" \
++        "$(INTDIR)\sd-daemon.obj" \
  	"$(INTDIR)\snmp-tc.obj" \
  	"$(INTDIR)\snmp.obj" \
  	"$(INTDIR)\snmpCallbackDomain.obj" \
-@@ -307,6 +308,12 @@ SOURCE=..\..\snmplib\scapi.c
+@@ -138,6 +139,11 @@ SOURCE=..\..\snmplib\asn1.c
+ "$(INTDIR)\asn1.obj" : $(SOURCE) "$(INTDIR)"
  	$(CPP) $(CPP_PROJ) $(SOURCE)
  
- 
 +SOURCE=..\..\snmplib\sd-daemon.c
 +
 +"$(INTDIR)\sd-daemon.obj" : $(SOURCE) "$(INTDIR)"
-+	$(CPP) $(CPP_PROJ) $(SOURCE)
++       $(CPP) $(CPP_PROJ) $(SOURCE)
 +
-+
- SOURCE="..\..\snmplib\snmp-tc.c"
  
- "$(INTDIR)\snmp-tc.obj" : $(SOURCE) "$(INTDIR)"
+ SOURCE=..\..\snmplib\callback.c
+ 
 diff --git a/win32/net-snmp/net-snmp-config.h b/win32/net-snmp/net-snmp-config.h
-index 7791ee0..1eccf42 100644
+index 1608563..7aec547 100644
 --- a/win32/net-snmp/net-snmp-config.h
 +++ b/win32/net-snmp/net-snmp-config.h
-@@ -1705,6 +1705,8 @@ enum {
+@@ -1717,6 +1717,8 @@ enum {
  #define DMALLOC_FUNC_CHECK
  #endif
  
-+#define NETSNMP_NO_SYSTEMD
-+
+++#define NETSNMP_NO_SYSTEMD
+++
  /* #undef NETSNMP_ENABLE_LOCAL_SMUX */
  
  /* define if agentx transport is to use domain sockets only */
 diff --git a/win32/net-snmp/net-snmp-config.h.in b/win32/net-snmp/net-snmp-config.h.in
-index 5215865..1607bfa 100644
+index 9693730..96ec3d9 100644
 --- a/win32/net-snmp/net-snmp-config.h.in
 +++ b/win32/net-snmp/net-snmp-config.h.in
-@@ -1705,6 +1705,8 @@ enum {
+@@ -1717,6 +1717,8 @@ enum {
  #define DMALLOC_FUNC_CHECK
  #endif
  
@@ -1616,3 +1647,6 @@ index 5215865..1607bfa 100644
  /* #undef NETSNMP_ENABLE_LOCAL_SMUX */
  
  /* define if agentx transport is to use domain sockets only */
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
similarity index 93%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 464473e..431a633 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -8,27 +8,23 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5
 DEPENDS = "openssl libnl pciutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
-        file://0001-Added-checks-for-printing-variables-with-wrong-types.patch \
         file://init \
         file://snmpd.conf \
         file://snmptrapd.conf \
         file://systemd-support.patch \
         file://snmpd.service \
         file://snmptrapd.service \
-        file://ifmib.patch \
         file://net-snmp-add-knob-whether-nlist.h-are-checked.patch \
         file://fix-libtool-finish.patch \
         file://net-snmp-testing-add-the-output-format-for-ptest.patch \
         file://run-ptest \
-        file://0001-Fix-CVE-2014-2285.patch \
         file://dont-return-incompletely-parsed-varbinds.patch \
-        file://net-snmp-5.7.2-fix-mib-timeout-values.patch \
+        file://0001-config_os_headers-Error-Fix.patch \
 "
+SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
+SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
 
-SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"
-SRC_URI[sha256sum] = "ac9105539971f7cfb1456a86d479e18e8a8b3712212595ad40504347ba5843da"
-
-inherit autotools update-rc.d siteinfo systemd
+inherit autotools update-rc.d siteinfo systemd pkgconfig
 
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
 
-- 
1.8.4.2


