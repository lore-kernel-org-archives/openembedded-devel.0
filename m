Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id E13F56B446
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 10:38:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Jan 2014 02:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,652,1384329600"; d="scan'208";a="457835846"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.149])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2014 02:38:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2014 10:38:26 +0000
Message-Id: <6bd83036ff76392e342be75b68e5e52af81cc505.1389609476.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389609476.git.paul.eggleton@linux.intel.com>
References: <cover.1389609476.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389609476.git.paul.eggleton@linux.intel.com>
References: <cover.1389609476.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 1/3] apache2: update to 2.4.7
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
X-List-Received-Date: Mon, 13 Jan 2014 10:38:37 -0000

* LIC_FILES_CHKSUM changed because of the introduction of an extra blank
  line in the LICENSE file (!)
* Drop httpd-2.4.4-r1332643.patch - it no longer applies and was dropped
  in Fedora on the 2.4.7 upgrade.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../apache2-2.4.6/httpd-2.4.4-r1332643.patch       | 260 ---------------------
 ...he2-native_2.4.6.bb => apache2-native_2.4.7.bb} |   6 +-
 .../apache-configure_perlbin.patch                 |   0
 .../apache-ssl-ltmain-rpath.patch                  |   0
 .../fix-libtool-name.patch                         |   0
 .../httpd-2.4.1-corelimit.patch                    |   0
 .../httpd-2.4.1-selinux.patch                      |   0
 .../httpd-2.4.4-export.patch                       |   0
 .../replace-lynx-to-curl-in-apachectl-script.patch |   0
 .../server-makefile.patch                          |   0
 .../apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} |   7 +-
 11 files changed, 6 insertions(+), 267 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.6.bb => apache2-native_2.4.7.bb} (84%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-configure_perlbin.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-ssl-ltmain-rpath.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/fix-libtool-name.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-corelimit.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-selinux.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.4-export.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/replace-lynx-to-curl-in-apachectl-script.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/server-makefile.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} (95%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch
deleted file mode 100644
index ba28231..0000000
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch
+++ /dev/null
@@ -1,260 +0,0 @@
-Add support for TLS Next Protocol Negotiation:
-
-* modules/ssl/mod_ssl.c, modules/ssl/mod_ssl.h: Add and implement new
-  hooks for next protocol advertisement/discovery.
-
-* modules/ssl/ssl_engine_init.c (ssl_init_ctx_callbacks): Enable
-  NPN advertisement callback in handshake.
-
-* modules/ssl/ssl_engine_io.c (ssl_io_filter_input): Invoke
-  next-protocol discovery hook.
-
-* modules/ssl/ssl_engine_kernel.c (ssl_callback_AdvertiseNextProtos): 
-  New callback.
-
-* modules/ssl/ssl_private.h: Add prototype.
-
-Submitted by: Matthew Steele <mdsteele google.com>
-  with slight tweaks by jorton
-
-https://bugzilla.redhat.com//show_bug.cgi?id=809599
-
-http://svn.apache.org/viewvc?view=revision&revision=1332643
-
-Upstream-Status: Backport
-
---- httpd-2.4.4/modules/ssl/ssl_private.h
-+++ httpd-2.4.4/modules/ssl/ssl_private.h
-@@ -139,6 +139,11 @@
- #define HAVE_FIPS
- #endif
- 
-+#if OPENSSL_VERSION_NUMBER >= 0x10001000L && !defined(OPENSSL_NO_NEXTPROTONEG) \
-+    && !defined(OPENSSL_NO_TLSEXT)
-+#define HAVE_TLS_NPN
-+#endif
-+
- #if (OPENSSL_VERSION_NUMBER >= 0x10000000)
- #define MODSSL_SSL_CIPHER_CONST const
- #define MODSSL_SSL_METHOD_CONST const
-@@ -840,6 +845,7 @@ int          ssl_callback_ServerNameIndication(SSL *, int *, modssl_ctx_t *);
- int         ssl_callback_SessionTicket(SSL *, unsigned char *, unsigned char *,
-                                        EVP_CIPHER_CTX *, HMAC_CTX *, int);
- #endif
-+int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **data, unsigned int *len, void *arg);
- 
- /**  Session Cache Support  */
- void         ssl_scache_init(server_rec *, apr_pool_t *);
---- httpd-2.4.4/modules/ssl/mod_ssl.c
-+++ httpd-2.4.4/modules/ssl/mod_ssl.c
-@@ -272,6 +272,18 @@ static const command_rec ssl_config_cmds[] = {
-     AP_END_CMD
- };
- 
-+/* Implement 'modssl_run_npn_advertise_protos_hook'. */
-+APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
-+    modssl, AP, int, npn_advertise_protos_hook,
-+    (conn_rec *connection, apr_array_header_t *protos),
-+    (connection, protos), OK, DECLINED);
-+
-+/* Implement 'modssl_run_npn_proto_negotiated_hook'. */
-+APR_IMPLEMENT_OPTIONAL_HOOK_RUN_ALL(
-+    modssl, AP, int, npn_proto_negotiated_hook,
-+    (conn_rec *connection, const char *proto_name, apr_size_t proto_name_len),
-+    (connection, proto_name, proto_name_len), OK, DECLINED);
-+
- /*
-  *  the various processing hooks
-  */
---- httpd-2.4.4/modules/ssl/mod_ssl.h
-+++ httpd-2.4.4/modules/ssl/mod_ssl.h
-@@ -63,5 +63,26 @@ APR_DECLARE_OPTIONAL_FN(int, ssl_proxy_enable, (conn_rec *));
- 
- APR_DECLARE_OPTIONAL_FN(int, ssl_engine_disable, (conn_rec *));
- 
-+/** The npn_advertise_protos optional hook allows other modules to add entries
-+ * to the list of protocol names advertised by the server during the Next
-+ * Protocol Negotiation (NPN) portion of the SSL handshake.  The hook callee is
-+ * given the connection and an APR array; it should push one or more char*'s
-+ * pointing to null-terminated strings (such as "http/1.1" or "spdy/2") onto
-+ * the array and return OK, or do nothing and return DECLINED. */
-+APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_advertise_protos_hook,
-+                          (conn_rec *connection, apr_array_header_t *protos));
-+
-+/** The npn_proto_negotiated optional hook allows other modules to discover the
-+ * name of the protocol that was chosen during the Next Protocol Negotiation
-+ * (NPN) portion of the SSL handshake.  Note that this may be the empty string
-+ * (in which case modules should probably assume HTTP), or it may be a protocol
-+ * that was never even advertised by the server.  The hook callee is given the
-+ * connection, a non-null-terminated string containing the protocol name, and
-+ * the length of the string; it should do something appropriate (i.e. insert or
-+ * remove filters) and return OK, or do nothing and return DECLINED. */
-+APR_DECLARE_EXTERNAL_HOOK(modssl, AP, int, npn_proto_negotiated_hook,
-+                          (conn_rec *connection, const char *proto_name,
-+                           apr_size_t proto_name_len));
-+
- #endif /* __MOD_SSL_H__ */
- /** @} */
---- httpd-2.4.4/modules/ssl/ssl_engine_init.c
-+++ httpd-2.4.4/modules/ssl/ssl_engine_init.c
-@@ -725,6 +725,11 @@ static void ssl_init_ctx_callbacks(server_rec *s,
- #endif
- 
-     SSL_CTX_set_info_callback(ctx, ssl_callback_Info);
-+
-+#ifdef HAVE_TLS_NPN
-+    SSL_CTX_set_next_protos_advertised_cb(
-+        ctx, ssl_callback_AdvertiseNextProtos, NULL);
-+#endif
- }
- 
- static void ssl_init_ctx_verify(server_rec *s,
---- httpd-2.4.4/modules/ssl/ssl_engine_io.c
-+++ httpd-2.4.4/modules/ssl/ssl_engine_io.c
-@@ -28,6 +28,7 @@
-                                   core keeps dumping.''
-                                             -- Unknown    */
- #include "ssl_private.h"
-+#include "mod_ssl.h"
- #include "apr_date.h"
- 
- /*  _________________________________________________________________
-@@ -297,6 +298,7 @@ typedef struct {
-     apr_pool_t *pool;
-     char buffer[AP_IOBUFSIZE];
-     ssl_filter_ctx_t *filter_ctx;
-+    int npn_finished;  /* 1 if NPN has finished, 0 otherwise */
- } bio_filter_in_ctx_t;
- 
- /*
-@@ -1385,6 +1387,27 @@ static apr_status_t ssl_io_filter_input(ap_filter_t *f,
-         APR_BRIGADE_INSERT_TAIL(bb, bucket);
-     }
- 
-+#ifdef HAVE_TLS_NPN
-+    /* By this point, Next Protocol Negotiation (NPN) should be completed (if
-+     * our version of OpenSSL supports it).  If we haven't already, find out
-+     * which protocol was decided upon and inform other modules by calling
-+     * npn_proto_negotiated_hook. */
-+    if (!inctx->npn_finished) {
-+        const unsigned char *next_proto = NULL;
-+        unsigned next_proto_len = 0;
-+
-+        SSL_get0_next_proto_negotiated(
-+            inctx->ssl, &next_proto, &next_proto_len);
-+        ap_log_cerror(APLOG_MARK, APLOG_DEBUG, APR_SUCCESS, f->c,
-+                      "SSL NPN negotiated protocol: '%s'",
-+                      apr_pstrmemdup(f->c->pool, (const char*)next_proto,
-+                                     next_proto_len));
-+        modssl_run_npn_proto_negotiated_hook(
-+            f->c, (const char*)next_proto, next_proto_len);
-+        inctx->npn_finished = 1;
-+    }
-+#endif
-+
-     return APR_SUCCESS;
- }
- 
-@@ -1866,6 +1889,7 @@ static void ssl_io_input_add_filter(ssl_filter_ctx_t *filter_ctx, conn_rec *c,
-     inctx->block = APR_BLOCK_READ;
-     inctx->pool = c->pool;
-     inctx->filter_ctx = filter_ctx;
-+    inctx->npn_finished = 0;
- }
- 
- /* The request_rec pointer is passed in here only to ensure that the
---- httpd-2.4.4/modules/ssl/ssl_engine_kernel.c
-+++ httpd-2.4.4/modules/ssl/ssl_engine_kernel.c
-@@ -29,6 +29,7 @@
-                                   time I was too famous.''
-                                             -- Unknown                */
- #include "ssl_private.h"
-+#include "mod_ssl.h"
- #include "util_md5.h"
- 
- static void ssl_configure_env(request_rec *r, SSLConnRec *sslconn);
-@@ -2186,3 +2187,84 @@ int ssl_callback_SRPServerParams(SSL *ssl, int *ad, void *arg)
- }
- 
- #endif /* OPENSSL_NO_SRP */
-+
-+#ifdef HAVE_TLS_NPN
-+/*
-+ * This callback function is executed when SSL needs to decide what protocols
-+ * to advertise during Next Protocol Negotiation (NPN).  It must produce a
-+ * string in wire format -- a sequence of length-prefixed strings -- indicating
-+ * the advertised protocols.  Refer to SSL_CTX_set_next_protos_advertised_cb
-+ * in OpenSSL for reference.
-+ */
-+int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **data_out,
-+                                     unsigned int *size_out, void *arg)
-+{
-+    conn_rec *c = (conn_rec*)SSL_get_app_data(ssl);
-+    apr_array_header_t *protos;
-+    int num_protos;
-+    unsigned int size;
-+    int i;
-+    unsigned char *data;
-+    unsigned char *start;
-+
-+    *data_out = NULL;
-+    *size_out = 0;
-+
-+    /* If the connection object is not available, then there's nothing for us
-+     * to do. */
-+    if (c == NULL) {
-+        return SSL_TLSEXT_ERR_OK;
-+    }
-+
-+    /* Invoke our npn_advertise_protos hook, giving other modules a chance to
-+     * add alternate protocol names to advertise. */
-+    protos = apr_array_make(c->pool, 0, sizeof(char*));
-+    modssl_run_npn_advertise_protos_hook(c, protos);
-+    num_protos = protos->nelts;
-+
-+    /* We now have a list of null-terminated strings; we need to concatenate
-+     * them together into a single string, where each protocol name is prefixed
-+     * by its length.  First, calculate how long that string will be. */
-+    size = 0;
-+    for (i = 0; i < num_protos; ++i) {
-+        const char *string = APR_ARRAY_IDX(protos, i, const char*);
-+        unsigned int length = strlen(string);
-+        /* If the protocol name is too long (the length must fit in one byte),
-+         * then log an error and skip it. */
-+        if (length > 255) {
-+            ap_log_cerror(APLOG_MARK, APLOG_ERR, 0, c,
-+                          "SSL NPN protocol name too long (length=%u): %s",
-+                          length, string);
-+            continue;
-+        }
-+        /* Leave room for the length prefix (one byte) plus the protocol name
-+         * itself. */
-+        size += 1 + length;
-+    }
-+
-+    /* If there is nothing to advertise (either because no modules added
-+     * anything to the protos array, or because all strings added to the array
-+     * were skipped), then we're done. */
-+    if (size == 0) {
-+        return SSL_TLSEXT_ERR_OK;
-+    }
-+
-+    /* Now we can build the string.  Copy each protocol name string into the
-+     * larger string, prefixed by its length. */
-+    data = apr_palloc(c->pool, size * sizeof(unsigned char));
-+    start = data;
-+    for (i = 0; i < num_protos; ++i) {
-+        const char *string = APR_ARRAY_IDX(protos, i, const char*);
-+        apr_size_t length = strlen(string);
-+        *start = (unsigned char)length;
-+        ++start;
-+        memcpy(start, string, length * sizeof(unsigned char));
-+        start += length;
-+    }
-+
-+    /* Success. */
-+    *data_out = data;
-+    *size_out = size;
-+    return SSL_TLSEXT_ERR_OK;
-+}
-+#endif
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.6.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.7.bb
similarity index 84%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.6.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.7.bb
index 6efd469..bd935eb 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.6.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.7.bb
@@ -12,9 +12,9 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
-SRC_URI[md5sum] = "ea5e361ca37b8d7853404419dd502efe"
-SRC_URI[sha256sum] = "dc9f3625ebc08bea55eeb0d16e71fba656f252e6cd0aa244ee7806dc3b022fea"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
+SRC_URI[md5sum] = "170d7fb6fe5f28b87d1878020a9ab94e"
+SRC_URI[sha256sum] = "64368d8301836815ae237f2b62d909711c896c1bd34573771e0ee5ad808ce71b"
 
 do_configure () {
     ./configure --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.6/apache-configure_perlbin.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/apache-ssl-ltmain-rpath.patch b/meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.6/apache-ssl-ltmain-rpath.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/apache-ssl-ltmain-rpath.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/fix-libtool-name.patch b/meta-webserver/recipes-httpd/apache2/apache2/fix-libtool-name.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.6/fix-libtool-name.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/fix-libtool-name.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.1-corelimit.patch b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-corelimit.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.1-corelimit.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-corelimit.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.1-selinux.patch b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-selinux.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.1-selinux.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.1-selinux.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-export.patch b/meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.4-export.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-export.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/httpd-2.4.4-export.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/replace-lynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.6/replace-lynx-to-curl-in-apachectl-script.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/replace-lynx-to-curl-in-apachectl-script.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/server-makefile.patch b/meta-webserver/recipes-httpd/apache2/apache2/server-makefile.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.6/server-makefile.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/server-makefile.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb
similarity index 95%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb
index cc88fac..f23776f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://httpd-2.4.1-corelimit.patch \
            file://httpd-2.4.4-export.patch \
            file://httpd-2.4.1-selinux.patch \
-           file://httpd-2.4.4-r1332643.patch \
            file://apache-configure_perlbin.patch \
            file://replace-lynx-to-curl-in-apachectl-script.patch \
            file://apache-ssl-ltmain-rpath.patch \
@@ -19,9 +18,9 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://init \
            file://apache2-volatile.conf"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
-SRC_URI[md5sum] = "ea5e361ca37b8d7853404419dd502efe"
-SRC_URI[sha256sum] = "dc9f3625ebc08bea55eeb0d16e71fba656f252e6cd0aa244ee7806dc3b022fea"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
+SRC_URI[md5sum] = "170d7fb6fe5f28b87d1878020a9ab94e"
+SRC_URI[sha256sum] = "64368d8301836815ae237f2b62d909711c896c1bd34573771e0ee5ad808ce71b"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
1.8.1.2


