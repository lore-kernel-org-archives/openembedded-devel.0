Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A27AC73D48
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 05:36:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t465aqS9027340
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 May 2015 22:36:52 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Tue, 5 May 2015 22:36:51 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 May 2015 13:36:50 +0800
Message-ID: <1430890610-28505-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] apache2: upgrade to 2.4.12
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
X-List-Received-Date: Wed, 06 May 2015 05:36:56 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Remove apache-CVE-2014-0117.patch which apache2 2.4.12 has it
Update the apache-ssl-ltmain-rpath.patch
Backport the patch to fix CVE-2015-0228

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...2-native_2.4.10.bb => apache2-native_2.4.12.bb} |   4 +-
 ...0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch |  58 +++++
 .../apache2/apache2/apache-CVE-2014-0117.patch     | 289 ---------------------
 .../apache2/apache2/apache-ssl-ltmain-rpath.patch  |  62 +++--
 .../{apache2_2.4.10.bb => apache2_2.4.12.bb}       |   6 +-
 5 files changed, 98 insertions(+), 321 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.10.bb => apache2-native_2.4.12.bb} (91%)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/apache-CVE-2014-0117.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.10.bb => apache2_2.4.12.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.10.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.12.bb
similarity index 91%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.10.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.12.bb
index 5963b79..1704bd9 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.10.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.12.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "44543dff14a4ebc1e9e2d86780507156"
-SRC_URI[sha256sum] = "176c4dac1a745f07b7b91e7f4fd48f9c48049fa6f088efe758d61d9738669c6a"
+SRC_URI[md5sum] = "b8dc8367a57a8d548a9b4ce16d264a13"
+SRC_URI[sha256sum] = "ad6d39edfe4621d8cc9a2791f6f8d6876943a9da41ac8533d77407a2e630eae4"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
                 --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch
new file mode 100644
index 0000000..264fde7
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch
@@ -0,0 +1,58 @@
+From 643f0fcf3b8ab09a68f0ecd2aa37aafeda3e63ef Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Wed, 4 Feb 2015 14:44:23 +0000
+Subject: [PATCH]   *) SECURITY: CVE-2015-0228 (cve.mitre.org)      mod_lua: A
+ maliciously crafted websockets PING after a script      calls r:wsupgrade()
+ can cause a child process crash.      [Edward Lu <Chaosed0 gmail.com>]
+
+Upstream-Status: BackPort
+
+Discovered by Guido Vranken <guidovranken gmail.com>
+
+Submitted by: Edward Lu
+Committed by: covener
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1657261 13f79535-47bb-0310-9956-ffa450edef68
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ modules/lua/lua_request.c | 6 +++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/modules/lua/lua_request.c b/modules/lua/lua_request.c
+index dded599..1200c55 100644
+--- a/modules/lua/lua_request.c
++++ b/modules/lua/lua_request.c
+@@ -2227,6 +2227,7 @@ static int lua_websocket_read(lua_State *L)
+ {
+     apr_socket_t *sock;
+     apr_status_t rv;
++    int do_read = 1;
+     int n = 0;
+     apr_size_t len = 1;
+     apr_size_t plen = 0;
+@@ -2244,6 +2245,8 @@ static int lua_websocket_read(lua_State *L)
+     mask_bytes = apr_pcalloc(r->pool, 4);
+     sock = ap_get_conn_socket(r->connection);
+ 
++    while (do_read) { 
++    do_read = 0;
+     /* Get opcode and FIN bit */
+     if (plaintext) {
+         rv = apr_socket_recv(sock, &byte, &len);
+@@ -2377,10 +2380,11 @@ static int lua_websocket_read(lua_State *L)
+                 frame[0] = 0x8A;
+                 frame[1] = 0;
+                 apr_socket_send(sock, frame, &plen); /* Pong! */
+-                lua_websocket_read(L); /* read the next frame instead */
++                do_read = 1;
+             }
+         }
+     }
++    }
+     return 0;
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-CVE-2014-0117.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-CVE-2014-0117.patch
deleted file mode 100644
index 8585f0b..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-CVE-2014-0117.patch
+++ /dev/null
@@ -1,289 +0,0 @@
-apache: CVE-2014-0117
-
-The patch comes from upstream:
-http://svn.apache.org/viewvc?view=revision&revision=1610674
-
-SECURITY (CVE-2014-0117): Fix a crash in mod_proxy.  In a
-reverse proxy configuration, a remote attacker could send a carefully crafted
-request which could crash a server process, resulting in denial of service.
-
-Thanks to Marek Kroemeke working with HP's Zero Day Initiative for
-reporting this issue.
-
-Upstream-Status: Backport
-
-Submitted by: Edward Lu, breser, covener
-Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
----
- modules/proxy/mod_proxy_http.c | 8  +++-
- include/httpd.h                | 17 ++++++++
- modules/proxy/proxy_util.c     | 67 ++++++++++++++----------------
- server/util.c                  | 89 ++++++++++++++++++++++++++++++++++++++++++
- 4 files changed, 143 insertions(+), 38 deletions(-)
-
-diff --git a/modules/proxy/mod_proxy_http.c b/modules/proxy/mod_proxy_http.c
-index cffad2e..f11c16f 100644
---- a/modules/proxy/mod_proxy_http.c
-+++ b/modules/proxy/mod_proxy_http.c
-@@ -1362,6 +1362,7 @@ apr_status_t ap_proxy_http_process_response(apr_pool_t * p, request_rec *r,
-          */
-         if (apr_date_checkmask(buffer, "HTTP/#.# ###*")) {
-             int major, minor;
-+            int toclose;
- 
-             major = buffer[5] - '0';
-             minor = buffer[7] - '0';
-@@ -1470,7 +1471,12 @@ apr_status_t ap_proxy_http_process_response(apr_pool_t * p, request_rec *r,
-             te = apr_table_get(r->headers_out, "Transfer-Encoding");
- 
-             /* strip connection listed hop-by-hop headers from response */
--            backend->close = ap_proxy_clear_connection_fn(r, r->headers_out);
-+            toclose = ap_proxy_clear_connection_fn(r, r->headers_out);
-+            backend->close = (toclose != 0);
-+            if (toclose < 0) {
-+                return ap_proxyerror(r, HTTP_BAD_REQUEST,
-+                                     "Malformed connection header");
-+            }
- 
-             if ((buf = apr_table_get(r->headers_out, "Content-Type"))) {
-                 ap_set_content_type(r, apr_pstrdup(p, buf));
-diff --git a/include/httpd.h b/include/httpd.h
-index 36cd58d..9a2cf5c 100644
---- a/include/httpd.h
-+++ b/include/httpd.h
-@@ -1528,6 +1528,23 @@ AP_DECLARE(int) ap_find_etag_weak(apr_pool_t *p, const char *line, const char *t
- AP_DECLARE(int) ap_find_etag_strong(apr_pool_t *p, const char *line, const char *tok);
- 
- /**
-+ * Retrieve an array of tokens in the format "1#token" defined in RFC2616. Only
-+ * accepts ',' as a delimiter, does not accept quoted strings, and errors on
-+ * any separator.
-+ * @param p The pool to allocate from
-+ * @param tok The line to read tokens from
-+ * @param tokens Pointer to an array of tokens. If not NULL, must be an array
-+ *    of char*, otherwise it will be allocated on @a p when a token is found
-+ * @param skip_invalid If true, when an invalid separator is encountered, it
-+ *    will be ignored.
-+ * @return NULL on success, an error string otherwise.
-+ * @remark *tokens may be NULL on output if NULL in input and no token is found
-+ */
-+AP_DECLARE(const char *) ap_parse_token_list_strict(apr_pool_t *p, const char *tok,
-+                                                    apr_array_header_t **tokens,
-+                                                    int skip_invalid);
-+
-+/**
-  * Retrieve a token, spacing over it and adjusting the pointer to
-  * the first non-white byte afterwards.  Note that these tokens
-  * are delimited by semis and commas and can also be delimited
-diff --git a/modules/proxy/proxy_util.c b/modules/proxy/proxy_util.c
-index 67dc939..58daa21 100644
---- a/modules/proxy/proxy_util.c
-+++ b/modules/proxy/proxy_util.c
-@@ -2847,68 +2847,59 @@ PROXY_DECLARE(proxy_balancer_shared *) ap_proxy_find_balancershm(ap_slotmem_prov
- typedef struct header_connection {
-     apr_pool_t *pool;
-     apr_array_header_t *array;
--    const char *first;
--    unsigned int closed:1;
-+    const char *error;
-+    int is_req;
- } header_connection;
- 
- static int find_conn_headers(void *data, const char *key, const char *val)
- {
-     header_connection *x = data;
--    const char *name;
--
--    do {
--        while (*val == ',' || *val == ';') {
--            val++;
--        }
--        name = ap_get_token(x->pool, &val, 0);
--        if (!strcasecmp(name, "close")) {
--            x->closed = 1;
--        }
--        if (!x->first) {
--            x->first = name;
--        }
--        else {
--            const char **elt;
--            if (!x->array) {
--                x->array = apr_array_make(x->pool, 4, sizeof(char *));
--            }
--            elt = apr_array_push(x->array);
--            *elt = name;
--        }
--    } while (*val);
- 
--    return 1;
-+    x->error = ap_parse_token_list_strict(x->pool, val, &x->array, !x->is_req);
-+    return !x->error;
- }
- 
- /**
-  * Remove all headers referred to by the Connection header.
-+ * Returns -1 on error. Otherwise, returns 1 if 'Close' was seen in
-+ * the Connection header tokens, and 0 if not.
-  */
- static int ap_proxy_clear_connection(request_rec *r, apr_table_t *headers)
- {
--    const char **name;
-+    int closed = 0;
-     header_connection x;
- 
-     x.pool = r->pool;
-     x.array = NULL;
--    x.first = NULL;
--    x.closed = 0;
-+    x.error = NULL;
-+    x.is_req = (headers == r->headers_in);
- 
-     apr_table_unset(headers, "Proxy-Connection");
- 
-     apr_table_do(find_conn_headers, &x, headers, "Connection", NULL);
--    if (x.first) {
--        /* fast path - no memory allocated for one header */
--        apr_table_unset(headers, "Connection");
--        apr_table_unset(headers, x.first);
-+    apr_table_unset(headers, "Connection");
-+
-+    if (x.error) {
-+        ap_log_rerror(APLOG_MARK, APLOG_NOTICE, 0, r, APLOGNO()
-+                "Error parsing Connection header: %s", x.error);
-+        return -1;
-     }
-+
-     if (x.array) {
--        /* two or more headers */
--        while ((name = apr_array_pop(x.array))) {
--            apr_table_unset(headers, *name);
-+        int i;
-+        for (i = 0; i < x.array->nelts; i++) {
-+            const char *name = APR_ARRAY_IDX(x.array, i, const char *);
-+            ap_log_rerror(APLOG_MARK, APLOG_DEBUG, 0, r, APLOGNO()
-+                          "Removing header '%s' listed in Connection header",
-+                          name);
-+            if (!strcasecmp(name, "close")) {
-+                closed = 1;
-+            }
-+            apr_table_unset(headers, name);
-         }
-     }
- 
--    return x.closed;
-+    return closed;
- }
- 
- PROXY_DECLARE(int) ap_proxy_create_hdrbrgd(apr_pool_t *p,
-@@ -3095,7 +3086,9 @@ PROXY_DECLARE(int) ap_proxy_create_hdrbrgd(apr_pool_t *p,
-      * apr is compiled with APR_POOL_DEBUG.
-      */
-     headers_in_copy = apr_table_copy(r->pool, r->headers_in);
--    ap_proxy_clear_connection(r, headers_in_copy);
-+    if (ap_proxy_clear_connection(r, headers_in_copy) < 0) {
-+        return HTTP_BAD_REQUEST;
-+    }
-     /* send request headers */
-     headers_in_array = apr_table_elts(headers_in_copy);
-     headers_in = (const apr_table_entry_t *) headers_in_array->elts;
-diff --git a/server/util.c b/server/util.c
-index e0ba5c2..541c9f0 100644
---- a/server/util.c
-+++ b/server/util.c
-@@ -1449,6 +1449,95 @@ AP_DECLARE(int) ap_find_etag_weak(apr_pool_t *p, const char *line,
-     return find_list_item(p, line, tok, AP_ETAG_WEAK);
- }
- 
-+/* Grab a list of tokens of the format 1#token (from RFC7230) */
-+AP_DECLARE(const char *) ap_parse_token_list_strict(apr_pool_t *p,
-+                                                const char *str_in,
-+                                                apr_array_header_t **tokens,
-+                                                int skip_invalid)
-+{
-+    int in_leading_space = 1;
-+    int in_trailing_space = 0;
-+    int string_end = 0;
-+    const char *tok_begin;
-+    const char *cur;
-+
-+    if (!str_in) {
-+        return NULL;
-+    }
-+
-+    tok_begin = cur = str_in;
-+
-+    while (!string_end) {
-+        const unsigned char c = (unsigned char)*cur;
-+
-+        if (!TEST_CHAR(c, T_HTTP_TOKEN_STOP) && c != '\0') {
-+            /* Non-separator character; we are finished with leading
-+             * whitespace. We must never have encountered any trailing
-+             * whitespace before the delimiter (comma) */
-+            in_leading_space = 0;
-+            if (in_trailing_space) {
-+                return "Encountered illegal whitespace in token";
-+            }
-+        }
-+        else if (c == ' ' || c == '\t') {
-+            /* "Linear whitespace" only includes ASCII CRLF, space, and tab;
-+             * we can't get a CRLF since headers are split on them already,
-+             * so only look for a space or a tab */
-+            if (in_leading_space) {
-+                /* We're still in leading whitespace */
-+                ++tok_begin;
-+            }
-+            else {
-+                /* We must be in trailing whitespace */
-+                ++in_trailing_space;
-+            }
-+        }
-+        else if (c == ',' || c == '\0') {
-+            if (!in_leading_space) {
-+                /* If we're out of the leading space, we know we've read some
-+                 * characters of a token */
-+                if (*tokens == NULL) {
-+                    *tokens = apr_array_make(p, 4, sizeof(char *));
-+                }
-+                APR_ARRAY_PUSH(*tokens, char *) =
-+                    apr_pstrmemdup((*tokens)->pool, tok_begin,
-+                                   (cur - tok_begin) - in_trailing_space);
-+            }
-+            /* We're allowed to have null elements, just don't add them to the
-+             * array */
-+
-+            tok_begin = cur + 1;
-+            in_leading_space = 1;
-+            in_trailing_space = 0;
-+            string_end = (c == '\0');
-+        }
-+        else {
-+            /* Encountered illegal separator char */
-+            if (skip_invalid) {
-+                /* Skip to the next separator */
-+                const char *temp;
-+                temp = ap_strchr_c(cur, ',');
-+                if(!temp) {
-+                    temp = ap_strchr_c(cur, '\0');
-+                }
-+
-+                /* Act like we haven't seen a token so we reset */
-+                cur = temp - 1;
-+                in_leading_space = 1;
-+                in_trailing_space = 0;
-+            }
-+            else {
-+                return apr_psprintf(p, "Encountered illegal separator "
-+                                    "'\\x%.2x'", (unsigned int)c);
-+            }
-+        }
-+
-+        ++cur;
-+    }
-+
-+    return NULL;
-+}
-+
- /* Retrieve a token, spacing over it and returning a pointer to
-  * the first non-white byte afterwards.  Note that these tokens
-  * are delimited by semis and commas; and can also be delimited
--- 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
index 3a59fb0..413dc53 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
@@ -1,52 +1,57 @@
---- httpd-2.2.8.orig/build/ltmain.sh
-+++ httpd-2.2.8/build/ltmain.sh
-@@ -1515,7 +1515,7 @@ EOF
- 	dir=`$echo "X$arg" | $Xsed -e 's/^-L//'`
+ build/ltmain.sh | 32 +++++++++++++++++++++++++++-----
+ 1 file changed, 27 insertions(+), 5 deletions(-)
+
+diff --git a/build/ltmain.sh b/build/ltmain.sh
+index 5eca4ae..805b461 100644
+--- a/build/ltmain.sh
++++ b/build/ltmain.sh
+@@ -6944,7 +6944,7 @@ func_mode_link ()
+ 	dir=$func_resolve_sysroot_result
  	# We need an absolute path.
  	case $dir in
 -	[\\/]* | [A-Za-z]:[\\/]*) ;;
 +	=* | [\\/]* | [A-Za-z]:[\\/]*) ;;
  	*)
  	  absdir=`cd "$dir" && pwd`
- 	  if test -z "$absdir"; then
-@@ -2558,7 +2558,7 @@ EOF
- 	    $echo "*** $linklib is not portable!"
+ 	  test -z "$absdir" && \
+@@ -8137,7 +8137,7 @@ func_mode_link ()
+ 	    $ECHO "*** $linklib is not portable!"
  	  fi
- 	  if test "$linkmode" = lib &&
--	     test "$hardcode_into_libs" = yes; then
-+             test "x$wrs_use_rpaths" = "xyes" && test "$hardcode_into_libs" = yes; then
+ 	  if test lib = "$linkmode" &&
+-	     test yes = "$hardcode_into_libs"; then
++	     test "x$wrs_use_rpaths" = "xyes" && test "$hardcode_into_libs" = yes; then
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
-@@ -2832,7 +2832,7 @@ EOF
+@@ -8404,7 +8404,7 @@ func_mode_link ()
  
- 	if test "$linkmode" = lib; then
+ 	if test lib = "$linkmode"; then
  	  if test -n "$dependency_libs" &&
--	     { test "$hardcode_into_libs" != yes ||
-+             { test "$hardcode_into_libs" != yes || test "x$wrs_use_rpaths" != "xyes" ||
- 	       test "$build_old_libs" = yes ||
- 	       test "$link_static" = yes; }; then
+-	     { test yes != "$hardcode_into_libs" ||
++              { test yes != "$hardcode_into_libs" || test "x$wrs_use_rpaths" != "xyes" ||
+ 	       test yes = "$build_old_libs" ||
+ 	       test yes = "$link_static"; }; then
  	    # Extract -R from dependency_libs
-@@ -3426,7 +3426,8 @@ EOF
- 	  *) finalize_rpath="$finalize_rpath $libdir" ;;
+@@ -9025,7 +9025,8 @@ func_mode_link ()
+ 	  *) func_append finalize_rpath " $libdir" ;;
  	  esac
  	done
--	if test "$hardcode_into_libs" != yes || test "$build_old_libs" = yes; then
-+        if test "$hardcode_into_libs" != yes || test "x$wrs_use_rpaths" != "xyes" ||
-+           test "$build_old_libs" = yes; then
+-	if test yes != "$hardcode_into_libs" || test yes = "$build_old_libs"; then
++        if test yes != "$hardcode_into_libs"  || test "x$wrs_use_rpaths" != "xyes" ||
++           test yes = "$build_old_libs"; then
  	  dependency_libs="$temp_xrpath $dependency_libs"
  	fi
        fi
-@@ -3843,7 +3844,7 @@ EOF
-         case $archive_cmds in
-           *\$LD\ *) wl= ;;
+@@ -9473,7 +9474,7 @@ EOF
+ 	case $archive_cmds in
+ 	  *\$LD\ *) wl= ;;
          esac
--	if test "$hardcode_into_libs" = yes; then
-+        if test "$hardcode_into_libs" = yes && test "x$wrs_use_rpaths" = "xyes" ; then
+-	if test yes = "$hardcode_into_libs"; then
++	if test yes = "$hardcode_into_libs" && test "x$wrs_use_rpaths" = "xyes"; then
  	  # Hardcode the library paths
  	  hardcode_libdirs=
  	  dep_rpath=
-@@ -4397,6 +4398,27 @@ EOF
+@@ -10211,6 +10212,27 @@ EOF
        # Now hardcode the library paths
        rpath=
        hardcode_libdirs=
@@ -74,3 +79,6 @@
        for libdir in $compile_rpath $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
  	  if test -n "$hardcode_libdir_separator"; then
+-- 
+1.9.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb
index 55d507f..0712b4a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb
@@ -21,12 +21,12 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
-           file://apache-CVE-2014-0117.patch \
+           file://0001-SECURITY-CVE-2015-0228-cve.mitre.org.patch \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "44543dff14a4ebc1e9e2d86780507156"
-SRC_URI[sha256sum] = "176c4dac1a745f07b7b91e7f4fd48f9c48049fa6f088efe758d61d9738669c6a"
+SRC_URI[md5sum] = "b8dc8367a57a8d548a9b4ce16d264a13"
+SRC_URI[sha256sum] = "ad6d39edfe4621d8cc9a2791f6f8d6876943a9da41ac8533d77407a2e630eae4"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.1.0


