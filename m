Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7475F7213F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:50:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 07 Jan 2015 06:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,714,1413270000"; d="scan'208";a="665825747"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 06:50:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 14:50:21 +0000
Message-Id: <67efbba181469c277710945b500fa776de541d21.1420641979.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v4 06/13] modphp: remove
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
X-List-Received-Date: Wed, 07 Jan 2015 14:50:45 -0000

This is now built out of the standard php recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-using-pkgconfig-to-check-libxml.patch     |  74 ------
 .../recipes-php/modphp/files/70_mod_php5.conf      |  12 -
 .../recipes-php/modphp/files/configure.patch       |  11 -
 .../modphp/files/php-CVE-2014-3587.patch           |  31 ---
 .../modphp/files/php-CVE-2014-3597.patch           | 282 ---------------------
 .../modphp/files/php-CVE-2014-5120.patch           |  35 ---
 .../modphp/files/pthread-check-threads-m4.patch    |  30 ---
 meta-webserver/recipes-php/modphp/modphp5.inc      | 112 --------
 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb |   7 -
 9 files changed, 594 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/files/0001-using-pkgconfig-to-check-libxml.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
 delete mode 100644 meta-webserver/recipes-php/modphp/files/configure.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-3587.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-3597.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-5120.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp5.inc
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb

diff --git a/meta-webserver/recipes-php/modphp/files/0001-using-pkgconfig-to-check-libxml.patch b/meta-webserver/recipes-php/modphp/files/0001-using-pkgconfig-to-check-libxml.patch
deleted file mode 100644
index bab5ff2..0000000
--- a/meta-webserver/recipes-php/modphp/files/0001-using-pkgconfig-to-check-libxml.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-[PATCH] using pkgconfig to check libxml
-
-Upstream-Status: Pending
-
-Use pkg-config for the libxml2 dependency, not the -config script.
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- acinclude.m4 | 48 ++++++------------------------------------------
- 1 file changed, 6 insertions(+), 42 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index d348f57..9f691a5 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -2530,49 +2530,13 @@ dnl
- dnl Common setup macro for libxml
- dnl
- AC_DEFUN([PHP_SETUP_LIBXML], [
--AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
--[
--  for i in $PHP_LIBXML_DIR /usr/local /usr; do
--    if test -x "$i/bin/xml2-config"; then
--      ac_cv_php_xml2_config_path="$i/bin/xml2-config"
--      break
--    fi
--  done
--])
-+  PKG_CHECK_MODULES(PKG_XML2, [libxml-2.0],,)
-+  if test "x$PKG_XML2_CFLAGS" != "x"; then
-+    PHP_EVAL_INCLINE($PKG_XML2_CFLAGS, $1)
-+    PHP_EVAL_LIBLINE($PKG_XML2_LIBS)
-+    AC_DEFINE(HAVE_LIBXML, 1, [ ])
-+    $2
- 
--  if test -x "$ac_cv_php_xml2_config_path"; then
--    XML2_CONFIG="$ac_cv_php_xml2_config_path"
--    libxml_full_version=`$XML2_CONFIG --version`
--    ac_IFS=$IFS
--    IFS="."
--    set $libxml_full_version
--    IFS=$ac_IFS
--    LIBXML_VERSION=`expr [$]1 \* 1000000 + [$]2 \* 1000 + [$]3`
--    if test "$LIBXML_VERSION" -ge "2006011"; then
--      LIBXML_LIBS=`$XML2_CONFIG --libs`
--      LIBXML_INCS=`$XML2_CONFIG --cflags`
--      PHP_EVAL_LIBLINE($LIBXML_LIBS, $1)
--      PHP_EVAL_INCLINE($LIBXML_INCS)
--
--      dnl Check that build works with given libs
--      AC_CACHE_CHECK(whether libxml build works, php_cv_libxml_build_works, [
--        PHP_TEST_BUILD(xmlInitParser,
--        [
--          php_cv_libxml_build_works=yes
--        ], [
--          AC_MSG_RESULT(no)
--          AC_MSG_ERROR([build test failed.  Please check the config.log for details.])
--        ], [
--          [$]$1
--        ])
--      ])
--      if test "$php_cv_libxml_build_works" = "yes"; then
--        AC_DEFINE(HAVE_LIBXML, 1, [ ])
--      fi
--      $2
--    else
--      AC_MSG_ERROR([libxml2 version 2.6.11 or greater required.])
--    fi
- ifelse([$3],[],,[else $3])
-   fi
- ])
--- 
-1.9.1
-
diff --git a/meta-webserver/recipes-php/modphp/files/70_mod_php5.conf b/meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
deleted file mode 100644
index 1de6fb1..0000000
--- a/meta-webserver/recipes-php/modphp/files/70_mod_php5.conf
+++ /dev/null
@@ -1,12 +0,0 @@
-# vim: ft=apache sw=4 ts=4
-<IfDefine PHP5>
-	# Load the module first
-	<IfModule !sapi_apache2.c>
-		LoadModule php5_module    lib/apache2/modules/libphp5.so
-	</IfModule>
-
-	# Set it to handle the files
-	AddHandler php5-script .php .phtml .php3 .php4 .php5
-	AddType application/x-httpd-php-source .phps
-	DirectoryIndex index.html index.html.var index.php index.phtml
-</IfDefine>
diff --git a/meta-webserver/recipes-php/modphp/files/configure.patch b/meta-webserver/recipes-php/modphp/files/configure.patch
deleted file mode 100644
index c5334c7..0000000
--- a/meta-webserver/recipes-php/modphp/files/configure.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- php-5.1.6/configure.old	2006-09-12 07:54:14.000000000 -0700
-+++ php-5.1.6/configure	2006-09-12 07:54:37.000000000 -0700
-@@ -14715,8 +14715,6 @@
- 
- 
- 
--  unset ac_cv_func_dlopen
--  unset ac_cv_func___dlopen
-   unset found
-   
-   echo $ac_n "checking for dlopen""... $ac_c" 1>&6
diff --git a/meta-webserver/recipes-php/modphp/files/php-CVE-2014-3587.patch b/meta-webserver/recipes-php/modphp/files/php-CVE-2014-3587.patch
deleted file mode 100644
index e1c40f2..0000000
--- a/meta-webserver/recipes-php/modphp/files/php-CVE-2014-3587.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-modphp: Security Advisory - php - CVE-2014-3587
-
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
-From 7ba1409a1aee5925180de546057ddd84ff267947 Mon Sep 17 00:00:00 2001
-From: Remi Collet <rcollet@redhat.com>
-Date: Thu, 14 Aug 2014 17:19:03 -0700
-Subject: [PATCH] Fix bug #67716 - Segfault in cdf.c
-
----
- ext/fileinfo/libmagic/cdf.c |    2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/ext/fileinfo/libmagic/cdf.c b/ext/fileinfo/libmagic/cdf.c
-index 429f3b9..2c0a2d9 100644
---- a/ext/fileinfo/libmagic/cdf.c
-+++ b/ext/fileinfo/libmagic/cdf.c
-@@ -820,7 +820,7 @@ cdf_read_property_info(const cdf_stream_t *sst, const cdf_header_t *h,
- 		q = (const uint8_t *)(const void *)
- 		    ((const char *)(const void *)p + ofs
- 		    - 2 * sizeof(uint32_t));
--		if (q > e) {
-+		if (q < p || q > e) {
- 			DPRINTF(("Ran of the end %p > %p\n", q, e));
- 			goto out;
- 		}
--- 
-1.7.9.5
-
diff --git a/meta-webserver/recipes-php/modphp/files/php-CVE-2014-3597.patch b/meta-webserver/recipes-php/modphp/files/php-CVE-2014-3597.patch
deleted file mode 100644
index 73f4e32..0000000
--- a/meta-webserver/recipes-php/modphp/files/php-CVE-2014-3597.patch
+++ /dev/null
@@ -1,282 +0,0 @@
-modphp: Security Advisory - php - CVE-2014-3597
-
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
-From 2fefae47716d501aec41c1102f3fd4531f070b05 Mon Sep 17 00:00:00 2001
-From: Remi Collet <remi@php.net>
-Date: Tue, 19 Aug 2014 08:33:49 +0200
-Subject: [PATCH] Fixed Sec Bug #67717 segfault in dns_get_record
- CVE-2014-3597
-
-Incomplete fix for CVE-2014-4049
-
-Check possible buffer overflow
-- pass real buffer end to dn_expand calls
-- check buffer len before each read
----
- ext/standard/dns.c |   84 +++++++++++++++++++++++++++++++++++++---------------
- 1 file changed, 60 insertions(+), 24 deletions(-)
-
-diff --git a/ext/standard/dns.c b/ext/standard/dns.c
-index 214a7dc..0b5e69c 100644
---- a/ext/standard/dns.c
-+++ b/ext/standard/dns.c
-@@ -412,8 +412,14 @@ PHP_FUNCTION(dns_check_record)
- 
- #if HAVE_FULL_DNS_FUNCS
- 
-+#define CHECKCP(n) do { \
-+	if (cp + n > end) { \
-+		return NULL; \
-+	} \
-+} while (0)
-+
- /* {{{ php_parserr */
--static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int store, int raw, zval **subarray)
-+static u_char *php_parserr(u_char *cp, u_char *end, querybuf *answer, int type_to_fetch, int store, int raw, zval **subarray)
- {
- 	u_short type, class, dlen;
- 	u_long ttl;
-@@ -425,16 +431,18 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 
- 	*subarray = NULL;
- 
--	n = dn_expand(answer->qb2, answer->qb2+65536, cp, name, sizeof(name) - 2);
-+	n = dn_expand(answer->qb2, end, cp, name, sizeof(name) - 2);
- 	if (n < 0) {
- 		return NULL;
- 	}
- 	cp += n;
- 
-+	CHECKCP(10);
- 	GETSHORT(type, cp);
- 	GETSHORT(class, cp);
- 	GETLONG(ttl, cp);
- 	GETSHORT(dlen, cp);
-+	CHECKCP(dlen);
- 	if (type_to_fetch != T_ANY && type != type_to_fetch) {
- 		cp += dlen;
- 		return cp;
-@@ -461,12 +469,14 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 
- 	switch (type) {
- 		case DNS_T_A:
-+			CHECKCP(4);
- 			add_assoc_string(*subarray, "type", "A", 1);
- 			snprintf(name, sizeof(name), "%d.%d.%d.%d", cp[0], cp[1], cp[2], cp[3]);
- 			add_assoc_string(*subarray, "ip", name, 1);
- 			cp += dlen;
- 			break;
- 		case DNS_T_MX:
-+			CHECKCP(2);
- 			add_assoc_string(*subarray, "type", "MX", 1);
- 			GETSHORT(n, cp);
- 			add_assoc_long(*subarray, "pri", n);
-@@ -485,7 +495,7 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 			if (type == DNS_T_PTR) {
- 				add_assoc_string(*subarray, "type", "PTR", 1);
- 			}
--			n = dn_expand(answer->qb2, answer->qb2+65536, cp, name, (sizeof name) - 2);
-+			n = dn_expand(answer->qb2, end, cp, name, (sizeof name) - 2);
- 			if (n < 0) {
- 				return NULL;
- 			}
-@@ -495,18 +505,22 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 		case DNS_T_HINFO:
- 			/* See RFC 1010 for values */
- 			add_assoc_string(*subarray, "type", "HINFO", 1);
-+			CHECKCP(1);
- 			n = *cp & 0xFF;
- 			cp++;
-+			CHECKCP(n);
- 			add_assoc_stringl(*subarray, "cpu", (char*)cp, n, 1);
- 			cp += n;
-+			CHECKCP(1);
- 			n = *cp & 0xFF;
- 			cp++;
-+			CHECKCP(n);
- 			add_assoc_stringl(*subarray, "os", (char*)cp, n, 1);
- 			cp += n;
- 			break;
- 		case DNS_T_TXT:
- 			{
--				int ll = 0;
-+				int l1 = 0, l2 = 0;
- 				zval *entries = NULL;
- 
- 				add_assoc_string(*subarray, "type", "TXT", 1);
-@@ -515,37 +529,41 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 				MAKE_STD_ZVAL(entries);
- 				array_init(entries);
- 				
--				while (ll < dlen) {
--					n = cp[ll];
--					if ((ll + n) >= dlen) {
-+				while (l1 < dlen) {
-+					n = cp[l1];
-+					if ((l1 + n) >= dlen) {
- 						// Invalid chunk length, truncate
--						n = dlen - (ll + 1);
-+						n = dlen - (l1 + 1);
-+					}
-+					if (n) {
-+						memcpy(tp + l2 , cp + l1 + 1, n);
-+						add_next_index_stringl(entries, cp + l1 + 1, n, 1);
- 					}
--					memcpy(tp + ll , cp + ll + 1, n);
--					add_next_index_stringl(entries, cp + ll + 1, n, 1);
--					ll = ll + n + 1;
-+					l1 = l1 + n + 1;
-+					l2 = l2 + n;
- 				}
--				tp[dlen] = '\0';
-+				tp[l2] = '\0';
- 				cp += dlen;
- 
--				add_assoc_stringl(*subarray, "txt", tp, (dlen>0)?dlen - 1:0, 0);
-+				add_assoc_stringl(*subarray, "txt", tp, l2, 0);
- 				add_assoc_zval(*subarray, "entries", entries);
- 			}
- 			break;
- 		case DNS_T_SOA:
- 			add_assoc_string(*subarray, "type", "SOA", 1);
--			n = dn_expand(answer->qb2, answer->qb2+65536, cp, name, (sizeof name) -2);
-+			n = dn_expand(answer->qb2, end, cp, name, (sizeof name) -2);
- 			if (n < 0) {
- 				return NULL;
- 			}
- 			cp += n;
- 			add_assoc_string(*subarray, "mname", name, 1);
--			n = dn_expand(answer->qb2, answer->qb2+65536, cp, name, (sizeof name) -2);
-+			n = dn_expand(answer->qb2, end, cp, name, (sizeof name) -2);
- 			if (n < 0) {
- 				return NULL;
- 			}
- 			cp += n;
- 			add_assoc_string(*subarray, "rname", name, 1);
-+			CHECKCP(5*4);
- 			GETLONG(n, cp);
- 			add_assoc_long(*subarray, "serial", n);
- 			GETLONG(n, cp);
-@@ -559,6 +577,7 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 			break;
- 		case DNS_T_AAAA:
- 			tp = (u_char*)name;
-+			CHECKCP(8*2);
- 			for(i=0; i < 8; i++) {
- 				GETSHORT(s, cp);
- 				if (s != 0) {
-@@ -593,6 +612,7 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 		case DNS_T_A6:
- 			p = cp;
- 			add_assoc_string(*subarray, "type", "A6", 1);
-+			CHECKCP(1);
- 			n = ((int)cp[0]) & 0xFF;
- 			cp++;
- 			add_assoc_long(*subarray, "masklen", n);
-@@ -628,6 +648,7 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 				cp++;
- 			}
- 			for (i = (n + 8) / 16; i < 8; i++) {
-+				CHECKCP(2);
- 				GETSHORT(s, cp);
- 				if (s != 0) {
- 					if (tp > (u_char *)name) {
-@@ -657,7 +678,7 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 			tp[0] = '\0';
- 			add_assoc_string(*subarray, "ipv6", name, 1);
- 			if (cp < p + dlen) {
--				n = dn_expand(answer->qb2, answer->qb2+65536, cp, name, (sizeof name) - 2);
-+				n = dn_expand(answer->qb2, end, cp, name, (sizeof name) - 2);
- 				if (n < 0) {
- 					return NULL;
- 				}
-@@ -666,6 +687,7 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 			}
- 			break;
- 		case DNS_T_SRV:
-+			CHECKCP(3*2);
- 			add_assoc_string(*subarray, "type", "SRV", 1);
- 			GETSHORT(n, cp);
- 			add_assoc_long(*subarray, "pri", n);
-@@ -673,7 +695,7 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 			add_assoc_long(*subarray, "weight", n);
- 			GETSHORT(n, cp);
- 			add_assoc_long(*subarray, "port", n);
--			n = dn_expand(answer->qb2, answer->qb2+65536, cp, name, (sizeof name) - 2);
-+			n = dn_expand(answer->qb2, end, cp, name, (sizeof name) - 2);
- 			if (n < 0) {
- 				return NULL;
- 			}
-@@ -681,21 +703,35 @@ static u_char *php_parserr(u_char *cp, querybuf *answer, int type_to_fetch, int
- 			add_assoc_string(*subarray, "target", name, 1);
- 			break;
- 		case DNS_T_NAPTR:
-+			CHECKCP(2*2);
- 			add_assoc_string(*subarray, "type", "NAPTR", 1);
- 			GETSHORT(n, cp);
- 			add_assoc_long(*subarray, "order", n);
- 			GETSHORT(n, cp);
- 			add_assoc_long(*subarray, "pref", n);
-+
-+			CHECKCP(1);
- 			n = (cp[0] & 0xFF);
--			add_assoc_stringl(*subarray, "flags", (char*)++cp, n, 1);
-+			cp++;
-+			CHECKCP(n);
-+			add_assoc_stringl(*subarray, "flags", (char*)cp, n, 1);
- 			cp += n;
-+
-+			CHECKCP(1);
- 			n = (cp[0] & 0xFF);
--			add_assoc_stringl(*subarray, "services", (char*)++cp, n, 1);
-+			cp++;
-+			CHECKCP(n);
-+			add_assoc_stringl(*subarray, "services", (char*)cp, n, 1);
- 			cp += n;
-+
-+			CHECKCP(1);
- 			n = (cp[0] & 0xFF);
--			add_assoc_stringl(*subarray, "regex", (char*)++cp, n, 1);
-+			cp++;
-+			CHECKCP(n);
-+			add_assoc_stringl(*subarray, "regex", (char*)cp, n, 1);
- 			cp += n;
--			n = dn_expand(answer->qb2, answer->qb2+65536, cp, name, (sizeof name) - 2);
-+
-+			n = dn_expand(answer->qb2, end, cp, name, (sizeof name) - 2);
- 			if (n < 0) {
- 				return NULL;
- 			}
-@@ -888,7 +924,7 @@ PHP_FUNCTION(dns_get_record)
- 			while (an-- && cp && cp < end) {
- 				zval *retval;
- 
--				cp = php_parserr(cp, &answer, type_to_fetch, store_results, raw, &retval);
-+				cp = php_parserr(cp, end, &answer, type_to_fetch, store_results, raw, &retval);
- 				if (retval != NULL && store_results) {
- 					add_next_index_zval(return_value, retval);
- 				}
-@@ -901,7 +937,7 @@ PHP_FUNCTION(dns_get_record)
- 				while (ns-- > 0 && cp && cp < end) {
- 					zval *retval = NULL;
- 
--					cp = php_parserr(cp, &answer, DNS_T_ANY, authns != NULL, raw, &retval);
-+					cp = php_parserr(cp, end, &answer, DNS_T_ANY, authns != NULL, raw, &retval);
- 					if (retval != NULL) {
- 						add_next_index_zval(authns, retval);
- 					}
-@@ -913,7 +949,7 @@ PHP_FUNCTION(dns_get_record)
- 				while (ar-- > 0 && cp && cp < end) {
- 					zval *retval = NULL;
- 
--					cp = php_parserr(cp, &answer, DNS_T_ANY, 1, raw, &retval);
-+					cp = php_parserr(cp, end, &answer, DNS_T_ANY, 1, raw, &retval);
- 					if (retval != NULL) {
- 						add_next_index_zval(addtl, retval);
- 					}
--- 
-1.7.9.5
-
diff --git a/meta-webserver/recipes-php/modphp/files/php-CVE-2014-5120.patch b/meta-webserver/recipes-php/modphp/files/php-CVE-2014-5120.patch
deleted file mode 100644
index f2e23b3..0000000
--- a/meta-webserver/recipes-php/modphp/files/php-CVE-2014-5120.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-modphp: Security Advisory - php - CVE-2014-5120
-
-Upstream-Status: Backport
-
-Signed-off-by Yue Tao <yue.tao@windriver.com>
-
-From 706aefb78112a44d4932d4c9430c6a898696f51f Mon Sep 17 00:00:00 2001
-From: Stanislav Malyshev <stas@php.net>
-Date: Mon, 18 Aug 2014 22:49:10 -0700
-Subject: [PATCH] Fix bug #67730 - Null byte injection possible with imagexxx
- functions
-
----
- ext/gd/gd_ctx.c |    5 +++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/ext/gd/gd_ctx.c b/ext/gd/gd_ctx.c
-index bff691f..eafbab5 100644
---- a/ext/gd/gd_ctx.c
-+++ b/ext/gd/gd_ctx.c
-@@ -124,6 +124,11 @@ static void _php_image_output_ctx(INTERNAL_FUNCTION_PARAMETERS, int image_type,
- 				RETURN_FALSE;
- 			}
- 		} else if (Z_TYPE_P(to_zval) == IS_STRING) {
-+			if (CHECK_ZVAL_NULL_PATH(to_zval)) {
-+				php_error_docref(NULL TSRMLS_CC, E_WARNING, "Invalid 2nd parameter, filename must not contain null bytes");
-+				RETURN_FALSE;
-+			}
-+
- 			stream = php_stream_open_wrapper(Z_STRVAL_P(to_zval), "wb", REPORT_ERRORS|IGNORE_PATH|IGNORE_URL_WIN, NULL);
- 			if (stream == NULL) {
- 				RETURN_FALSE;
--- 
-1.7.9.5
-
diff --git a/meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch b/meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch
deleted file mode 100644
index 0c564cd..0000000
--- a/meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d8067ceacbf54e79c9c6b68675332c09eaa0b55d Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Mon, 8 Apr 2013 14:29:51 +0800
-Subject: [PATCH] pthread-check
-
-Enable pthreads support when cross-compiling
-
-Upstream-Status: Inapproprate [config]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- TSRM/threads.m4 |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/TSRM/threads.m4 b/TSRM/threads.m4
-index 38494ce..15d9454 100644
---- a/TSRM/threads.m4
-+++ b/TSRM/threads.m4
-@@ -86,7 +86,7 @@ int main() {
-   pthreads_working=no
-   ], [
-   dnl For cross compiling running this test is of no use. NetWare supports pthreads
--  pthreads_working=no
-+  pthreads_working=yes
-   case $host_alias in
-   *netware*)
-     pthreads_working=yes
--- 
-1.7.4.1
-
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
deleted file mode 100644
index f60c7bb..0000000
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ /dev/null
@@ -1,112 +0,0 @@
-SECTION = "console/network"
-DESCRIPTION = "A server-side, HTML-embedded scripting language. This package provides the apache php module."
-LICENSE = "PHP-3.0"
-INC_PR = "r1"
-DEPENDS = "apache2-native apache2 zlib bzip2 libmcrypt"
-
-SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
-           file://configure.patch \
-           file://pthread-check-threads-m4.patch \
-           file://70_mod_php5.conf \
-           file://0001-using-pkgconfig-to-check-libxml.patch \
-           file://php-CVE-2014-5120.patch \
-           file://php-CVE-2014-3587.patch \
-           file://php-CVE-2014-3597.patch \
-"
-
-S = "${WORKDIR}/php-${PV}"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
-
-inherit autotools pkgconfig
-
-PNBLACKLIST[modphp] ?= "CONFLICT: 466 header files conflict with php"
-# e.g. sysroots/qemux86-64/usr/include/php/main/win95nt.h
-
-CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
-
-EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
-                --with-pic \
-                --enable-maintainer-zts \
-                --without-mysql \
-                --disable-cgi \
-                --disable-cli \
-                --disable-pdo \
-                --without-pear \
-                --without-iconv \
-                --disable-ipv6 \
-                --disable-xml \
-                --disable-xmlreader \
-                --disable-xmlwriter \
-                --disable-simplexml \
-                --disable-dom \
-                --disable-rpath \
-                --libdir=${libdir}/php5 \
-                --with-zlib --with-zlib-dir=${STAGING_DIR_TARGET}${exec_prefix} \
-                --with-bz2=${STAGING_DIR_TARGET}${exec_prefix} \
-                --with-mcrypt=${STAGING_DIR_TARGET}${exec_prefix} \
-                --enable-zip \
-                --enable-mbstring \
-                --with-config-file-path=${sysconfdir}/php/apache2-php5 \
-                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'ac_cv_c_bigendian_php=no', 'ac_cv_c_bigendian_php=yes', d)}"
-
-PACKAGECONFIG ??= "mysql"
-PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config,--without-mysqli,mysql5"
-PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,mysql5"
-PACKAGECONFIG[libxml] = "--enable-libxml,--disable-libxml,libxml2"
-PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
-
-acpaths = ""
-
-do_configure_prepend () {
-    rm -f ${S}/build/libtool.m4 ${S}/ltmain.sh ${S}/aclocal.m4
-    find ${S} -name config.m4 | xargs -n1 sed -i 's!APXS_HTTPD=.*!APXS_HTTPD=${STAGING_BINDIR_NATIVE}/httpd!'
-}
-
-do_configure_append() {
-    # No libtool, we really don't want rpath set...
-    sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${HOST_SYS}-libtool
-    sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${HOST_SYS}-libtool
-}
-
-do_install  () {
-    install -d ${D}${libdir}/apache2/modules
-    install -d ${D}${sysconfdir}/apache2/modules.d
-    install -d ${D}${sysconfdir}/php/apache2-php5
-    install -m 755  libs/libphp5.so ${D}${libdir}/apache2/modules
-    install -m 644  ${WORKDIR}/70_mod_php5.conf ${D}${sysconfdir}/apache2/modules.d
-    sed -i s,lib/,${libdir}/, ${D}${sysconfdir}/apache2/modules.d/70_mod_php5.conf
-    cat ${S}/php.ini-production | \
-        sed -e 's,extension_dir = \"\./\",extension_dir = \"/usr/lib/extensions\",' \
-        > ${D}${sysconfdir}/php/apache2-php5/php.ini
-
-    install -d ${D}${bindir}
-    install -m 755 scripts/phpize ${D}${bindir}
-    install -m 755 scripts/php-config ${D}${bindir}
-    cat aclocal-copy/libtool.m4 aclocal-copy/lt~obsolete.m4 aclocal-copy/ltoptions.m4 \
-        aclocal-copy/ltsugar.m4 aclocal-copy/ltversion.m4 > ${S}/build/libtool.m4
-
-    oe_runmake install-build install-headers INSTALL_ROOT=${D}
-}
-
-SYSROOT_PREPROCESS_FUNCS += "php_sysroot_preprocess"
-
-php_sysroot_preprocess () {
-    install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 755 ${D}${bindir}/phpize ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-    install -m 755 ${D}${bindir}/php-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-
-    sed -i 's!eval echo /!eval echo ${STAGING_DIR_HOST}/!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/phpize
-    sed -i 's!^include_dir=.*!include_dir=${STAGING_INCDIR}/php!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/php-config
-}
-
-# phpize is not scanned for absolute paths by default (but php-config is).
-#
-SSTATE_SCAN_FILES += "phpize"
-
-RDEPENDS_${PN} = "apache2"
-
-FILES_${PN} = "${libdir}/apache2 ${sysconfdir}"
-FILES_${PN}-dev += "${bindir}/phpize ${bindir}/php-config ${libdir}/php5"
-FILES_${PN}-dbg += "${libdir}/apache2/modules/.debug"
-
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.15.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
deleted file mode 100644
index aed620f..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include modphp5.inc
-
-EXTRA_OECONF += "--disable-opcache"
-
-SRC_URI[md5sum] = "5cb5f2ed9099299f8a4c952d59d93812"
-SRC_URI[sha256sum] = "00f24226b12fee27e332383b6304f1b9ed3f4d9173dd728a68c5c3f5a59b8ba7"
-
-- 
1.9.3


