Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E98865C91
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2014 06:09:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA469Qw4001125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Nov 2014 22:09:26 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 3 Nov 2014 22:09:25 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Nov 2014 14:09:29 +0800
Message-ID: <1415081369-31169-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] net-snmp: fix for Security Advisory - CVE-2014-3565
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
X-List-Received-Date: Tue, 04 Nov 2014 06:09:30 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

snmplib/mib.c in net-snmp 5.7.0 and earlier, when the -OQ option is used,
allows remote attackers to cause a denial of service (snmptrapd crash) via
a crafted SNMP trap message, which triggers a conversion to the variable
type designated in the MIB file, as demonstrated by a NULL type in an ifMtu
trap message.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-3565

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...s-for-printing-variables-with-wrong-types.patch |  455 ++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |    1 +
 2 files changed, 456 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables-with-wrong-types.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables-with-wrong-types.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables-with-wrong-types.patch
new file mode 100644
index 0000000..30374cf
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Added-checks-for-printing-variables-with-wrong-types.patch
@@ -0,0 +1,455 @@
+From 7f4a7b891332899cea26e95be0337aae01648742 Mon Sep 17 00:00:00 2001
+From: Jan Safranek <jsafranek@users.sourceforge.net>
+Date: Thu, 31 Jul 2014 13:46:49 +0200
+Subject: [PATCH] Added checks for printing variables with wrong types.
+
+Upstream-Status: Backport
+
+When -OQ command line argument is used, variable formatter preffers the type
+of the varible parsed from a MIB file instead of checking type of the variable
+as parsed from SNMP message.
+
+This can lead to crashes when incoming packets contains a variable with
+NULL type, while the MIB says the variable should be non-NULL, like Integer.
+The formatter then tries to interpret the NULL (from packet) as Integer (from
+MIB file).
+
+Signed-off-by: Jan Safranek <jsafranek@users.sourceforge.net>
+---
+ snmplib/mib.c |  270 ++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 135 insertions(+), 135 deletions(-)
+
+diff --git a/snmplib/mib.c b/snmplib/mib.c
+index 9d3ca41..c6e0010 100644
+--- a/snmplib/mib.c
++++ b/snmplib/mib.c
+@@ -439,17 +439,16 @@ sprint_realloc_octet_string(u_char ** buf, size_t * buf_len,
+     u_char         *cp;
+     int             output_format, cnt;
+ 
+-    if ((var->type != ASN_OCTET_STR) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        const char      str[] = "Wrong Type (should be OCTET STRING): ";
+-        if (snmp_cstrcat
+-            (buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_OCTET_STR) {
++        if (!netsnmp_ds_get_boolean(
++                    NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            const char      str[] = "Wrong Type (should be OCTET STRING): ";
++            if (!snmp_cstrcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+ 
+@@ -702,16 +701,16 @@ sprint_realloc_float(u_char ** buf, size_t * buf_len,
+                      const struct enum_list *enums,
+                      const char *hint, const char *units)
+ {
+-    if ((var->type != ASN_OPAQUE_FLOAT) &&
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        if (snmp_cstrcat(buf, buf_len, out_len, allow_realloc, 
+-                         "Wrong Type (should be Float): ")) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_OPAQUE_FLOAT) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be Float): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+@@ -772,17 +771,16 @@ sprint_realloc_double(u_char ** buf, size_t * buf_len,
+                       const struct enum_list *enums,
+                       const char *hint, const char *units)
+ {
+-    if ((var->type != ASN_OPAQUE_DOUBLE) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        if (snmp_cstrcat
+-            (buf, buf_len, out_len, allow_realloc, 
+-             "Wrong Type (should be Double): ")) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_OPAQUE_DOUBLE) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be Double): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+@@ -847,20 +845,21 @@ sprint_realloc_counter64(u_char ** buf, size_t * buf_len, size_t * out_len,
+ {
+     char            a64buf[I64CHARSZ + 1];
+ 
+-    if ((var->type != ASN_COUNTER64
++    if (var->type != ASN_COUNTER64
+ #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
+         && var->type != ASN_OPAQUE_COUNTER64
+         && var->type != ASN_OPAQUE_I64 && var->type != ASN_OPAQUE_U64
+ #endif
+-        ) && (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        if (snmp_cstrcat(buf, buf_len, out_len, allow_realloc, 
+-                        "Wrong Type (should be Counter64): ")) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++        ) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be Counter64): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+@@ -948,23 +947,25 @@ sprint_realloc_opaque(u_char ** buf, size_t * buf_len,
+                       const struct enum_list *enums,
+                       const char *hint, const char *units)
+ {
+-    if ((var->type != ASN_OPAQUE
++    if (var->type != ASN_OPAQUE
+ #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
+         && var->type != ASN_OPAQUE_COUNTER64
+         && var->type != ASN_OPAQUE_U64
+         && var->type != ASN_OPAQUE_I64
+         && var->type != ASN_OPAQUE_FLOAT && var->type != ASN_OPAQUE_DOUBLE
+ #endif                          /* NETSNMP_WITH_OPAQUE_SPECIAL_TYPES */
+-        ) && (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        if (snmp_cstrcat(buf, buf_len, out_len, allow_realloc, 
+-                         "Wrong Type (should be Opaque): ")) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++        ) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be Opaque): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
++
+ #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
+     switch (var->type) {
+     case ASN_OPAQUE_COUNTER64:
+@@ -1040,17 +1041,16 @@ sprint_realloc_object_identifier(u_char ** buf, size_t * buf_len,
+ {
+     int             buf_overflow = 0;
+ 
+-    if ((var->type != ASN_OBJECT_ID) &&
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] =
+-            "Wrong Type (should be OBJECT IDENTIFIER): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_OBJECT_ID) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be OBJECT IDENTIFIER): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+@@ -1110,16 +1110,16 @@ sprint_realloc_timeticks(u_char ** buf, size_t * buf_len, size_t * out_len,
+ {
+     char            timebuf[40];
+ 
+-    if ((var->type != ASN_TIMETICKS) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] = "Wrong Type (should be Timeticks): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_TIMETICKS) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be Timeticks): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_NUMERIC_TIMETICKS)) {
+@@ -1277,17 +1277,18 @@ sprint_realloc_integer(u_char ** buf, size_t * buf_len, size_t * out_len,
+ {
+     char           *enum_string = NULL;
+ 
+-    if ((var->type != ASN_INTEGER) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] = "Wrong Type (should be INTEGER): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_INTEGER) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be INTEGER): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
++
+     for (; enums; enums = enums->next) {
+         if (enums->value == *var->val.integer) {
+             enum_string = enums->label;
+@@ -1380,16 +1381,16 @@ sprint_realloc_uinteger(u_char ** buf, size_t * buf_len, size_t * out_len,
+ {
+     char           *enum_string = NULL;
+ 
+-    if ((var->type != ASN_UINTEGER) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] = "Wrong Type (should be UInteger32): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_UINTEGER) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be UInteger32): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     for (; enums; enums = enums->next) {
+@@ -1477,17 +1478,16 @@ sprint_realloc_gauge(u_char ** buf, size_t * buf_len, size_t * out_len,
+ {
+     char            tmp[32];
+ 
+-    if ((var->type != ASN_GAUGE) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] =
+-            "Wrong Type (should be Gauge32 or Unsigned32): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_GAUGE) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be Gauge32 or Unsigned32): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+@@ -1550,16 +1550,16 @@ sprint_realloc_counter(u_char ** buf, size_t * buf_len, size_t * out_len,
+ {
+     char            tmp[32];
+ 
+-    if ((var->type != ASN_COUNTER) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] = "Wrong Type (should be Counter32): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_COUNTER) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be Counter32): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+@@ -1613,16 +1613,16 @@ sprint_realloc_networkaddress(u_char ** buf, size_t * buf_len,
+ {
+     size_t          i;
+ 
+-    if ((var->type != ASN_IPADDRESS) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] = "Wrong Type (should be NetworkAddress): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_IPADDRESS) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be NetworkAddress): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+@@ -1679,16 +1679,16 @@ sprint_realloc_ipaddress(u_char ** buf, size_t * buf_len, size_t * out_len,
+ {
+     u_char         *ip = var->val.string;
+ 
+-    if ((var->type != ASN_IPADDRESS) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] = "Wrong Type (should be IpAddress): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_IPADDRESS) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be IpAddress): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+@@ -1737,20 +1737,20 @@ sprint_realloc_null(u_char ** buf, size_t * buf_len, size_t * out_len,
+                     const struct enum_list *enums,
+                     const char *hint, const char *units)
+ {
+-    if ((var->type != ASN_NULL) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] = "Wrong Type (should be NULL): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_NULL) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be NULL): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+-    } else {
+-        u_char          str[] = "NULL";
+-        return snmp_strcat(buf, buf_len, out_len, allow_realloc, str);
+     }
++
++    u_char          str[] = "NULL";
++    return snmp_strcat(buf, buf_len, out_len, allow_realloc, str);
+ }
+ 
+ 
+@@ -1785,16 +1785,16 @@ sprint_realloc_bitstring(u_char ** buf, size_t * buf_len, size_t * out_len,
+     u_char         *cp;
+     char           *enum_string;
+ 
+-    if ((var->type != ASN_BIT_STR && var->type != ASN_OCTET_STR) &&
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] = "Wrong Type (should be BITS): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_BIT_STR && var->type != ASN_OCTET_STR) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be BITS): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+@@ -1869,16 +1869,16 @@ sprint_realloc_nsapaddress(u_char ** buf, size_t * buf_len,
+                            const struct enum_list *enums, const char *hint,
+                            const char *units)
+ {
+-    if ((var->type != ASN_NSAP) && 
+-        (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT))) {
+-        u_char          str[] = "Wrong Type (should be NsapAddress): ";
+-        if (snmp_strcat(buf, buf_len, out_len, allow_realloc, str)) {
+-            return sprint_realloc_by_type(buf, buf_len, out_len,
++    if (var->type != ASN_NSAP) {
++        if (!netsnmp_ds_get_boolean(
++                NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICKE_PRINT)) {
++            u_char          str[] = "Wrong Type (should be NsapAddress): ";
++            if (!snmp_strcat(buf, buf_len, out_len, allow_realloc, str))
++                return 0;
++        }
++        return sprint_realloc_by_type(buf, buf_len, out_len,
+                                           allow_realloc, var, NULL, NULL,
+                                           NULL);
+-        } else {
+-            return 0;
+-        }
+     }
+ 
+     if (!netsnmp_ds_get_boolean(NETSNMP_DS_LIBRARY_ID, NETSNMP_DS_LIB_QUICK_PRINT)) {
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index 9012615..82ce4db 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5
 DEPENDS = "openssl libnl pciutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
+        file://0001-Added-checks-for-printing-variables-with-wrong-types.patch \
         file://init \
         file://snmpd.conf \
         file://snmptrapd.conf \
-- 
1.7.10.4


