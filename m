Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8A50C6B7A6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 19:01:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Feb 2014 11:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,556,1389772800"; d="scan'208";a="489424550"
Received: from ssaevars-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.24])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2014 11:00:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 19:00:33 +0000
Message-Id: <122827440ede4ee16ff73aca16c12d37e2afe5f4.1393527452.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393527452.git.paul.eggleton@linux.intel.com>
References: <cover.1393527452.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393527452.git.paul.eggleton@linux.intel.com>
References: <cover.1393527452.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v3 1/3] apache2: update to 2.4.7
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
X-List-Received-Date: Thu, 27 Feb 2014 19:01:33 -0000

* LIC_FILES_CHKSUM changed because of the introduction of an extra blank
  line in the LICENSE file (!)
* Refreshed TLS Next Protocol Negotiation support patch for conflict
  with 2.4.7. Thanks to Hongxu Jia for doing this work.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...he2-native_2.4.6.bb => apache2-native_2.4.7.bb} |   6 +-
 .../apache-configure_perlbin.patch                 |   0
 .../apache-ssl-ltmain-rpath.patch                  |   0
 .../fix-libtool-name.patch                         |   0
 .../httpd-2.4.1-corelimit.patch                    |   0
 .../httpd-2.4.1-selinux.patch                      |   0
 .../httpd-2.4.4-export.patch                       |   0
 .../npn-patch-2.4.7.patch}                         | 111 +++++++++++++--------
 .../replace-lynx-to-curl-in-apachectl-script.patch |   0
 .../server-makefile.patch                          |   0
 .../apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} |   8 +-
 11 files changed, 77 insertions(+), 48 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.6.bb => apache2-native_2.4.7.bb} (84%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-configure_perlbin.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/apache-ssl-ltmain-rpath.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/fix-libtool-name.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-corelimit.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.1-selinux.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/httpd-2.4.4-export.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6/httpd-2.4.4-r1332643.patch => apache2/npn-patch-2.4.7.patch} (80%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/replace-lynx-to-curl-in-apachectl-script.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.6 => apache2}/server-makefile.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.6.bb => apache2_2.4.7.bb} (95%)

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
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch b/meta-webserver/recipes-httpd/apache2/apache2/npn-patch-2.4.7.patch
similarity index 80%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/npn-patch-2.4.7.patch
index ba28231..a4f1855 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.6/httpd-2.4.4-r1332643.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/npn-patch-2.4.7.patch
@@ -9,7 +9,7 @@ Add support for TLS Next Protocol Negotiation:
 * modules/ssl/ssl_engine_io.c (ssl_io_filter_input): Invoke
   next-protocol discovery hook.
 
-* modules/ssl/ssl_engine_kernel.c (ssl_callback_AdvertiseNextProtos): 
+* modules/ssl/ssl_engine_kernel.c (ssl_callback_AdvertiseNextProtos):
   New callback.
 
 * modules/ssl/ssl_private.h: Add prototype.
@@ -17,37 +17,36 @@ Add support for TLS Next Protocol Negotiation:
 Submitted by: Matthew Steele <mdsteele google.com>
   with slight tweaks by jorton
 
-https://bugzilla.redhat.com//show_bug.cgi?id=809599
-
 http://svn.apache.org/viewvc?view=revision&revision=1332643
-
+https://bugzilla.redhat.com//show_bug.cgi?id=809599
 Upstream-Status: Backport
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ CHANGES                         |  2 +
+ modules/ssl/mod_ssl.c           | 12 ++++++
+ modules/ssl/mod_ssl.h           | 21 +++++++++++
+ modules/ssl/ssl_engine_init.c   |  5 +++
+ modules/ssl/ssl_engine_io.c     | 24 ++++++++++++
+ modules/ssl/ssl_engine_kernel.c | 82 +++++++++++++++++++++++++++++++++++++++++
+ modules/ssl/ssl_private.h       |  6 +++
+ 7 files changed, 152 insertions(+)
 
---- httpd-2.4.4/modules/ssl/ssl_private.h
-+++ httpd-2.4.4/modules/ssl/ssl_private.h
-@@ -139,6 +139,11 @@
- #define HAVE_FIPS
- #endif
+diff --git a/CHANGES b/CHANGES
+--- a/CHANGES
++++ b/CHANGES
+@@ -1,6 +1,8 @@
+                                                          -*- coding: utf-8 -*-
  
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
+ Changes with Apache 2.4.7
++  *) mod_ssl: Add support for TLS Next Protocol Negotiation.  PR 52210.
++     [Matthew Steele <mdsteele google.com>]
  
- /**  Session Cache Support  */
- void         ssl_scache_init(server_rec *, apr_pool_t *);
---- httpd-2.4.4/modules/ssl/mod_ssl.c
-+++ httpd-2.4.4/modules/ssl/mod_ssl.c
-@@ -272,6 +272,18 @@ static const command_rec ssl_config_cmds[] = {
+   *) APR 1.5.0 or later is now required for the event MPM.
+   
+diff --git a/modules/ssl/mod_ssl.c b/modules/ssl/mod_ssl.c
+--- a/modules/ssl/mod_ssl.c
++++ b/modules/ssl/mod_ssl.c
+@@ -275,6 +275,18 @@ static const command_rec ssl_config_cmds[] = {
      AP_END_CMD
  };
  
@@ -66,8 +65,9 @@ Upstream-Status: Backport
  /*
   *  the various processing hooks
   */
---- httpd-2.4.4/modules/ssl/mod_ssl.h
-+++ httpd-2.4.4/modules/ssl/mod_ssl.h
+diff --git a/modules/ssl/mod_ssl.h b/modules/ssl/mod_ssl.h
+--- a/modules/ssl/mod_ssl.h
++++ b/modules/ssl/mod_ssl.h
 @@ -63,5 +63,26 @@ APR_DECLARE_OPTIONAL_FN(int, ssl_proxy_enable, (conn_rec *));
  
  APR_DECLARE_OPTIONAL_FN(int, ssl_engine_disable, (conn_rec *));
@@ -95,10 +95,11 @@ Upstream-Status: Backport
 +
  #endif /* __MOD_SSL_H__ */
  /** @} */
---- httpd-2.4.4/modules/ssl/ssl_engine_init.c
-+++ httpd-2.4.4/modules/ssl/ssl_engine_init.c
-@@ -725,6 +725,11 @@ static void ssl_init_ctx_callbacks(server_rec *s,
- #endif
+diff --git a/modules/ssl/ssl_engine_init.c b/modules/ssl/ssl_engine_init.c
+--- a/modules/ssl/ssl_engine_init.c
++++ b/modules/ssl/ssl_engine_init.c
+@@ -546,6 +546,11 @@ static void ssl_init_ctx_callbacks(server_rec *s,
+     SSL_CTX_set_tmp_dh_callback(ctx,  ssl_callback_TmpDH);
  
      SSL_CTX_set_info_callback(ctx, ssl_callback_Info);
 +
@@ -109,8 +110,9 @@ Upstream-Status: Backport
  }
  
  static void ssl_init_ctx_verify(server_rec *s,
---- httpd-2.4.4/modules/ssl/ssl_engine_io.c
-+++ httpd-2.4.4/modules/ssl/ssl_engine_io.c
+diff --git a/modules/ssl/ssl_engine_io.c b/modules/ssl/ssl_engine_io.c
+--- a/modules/ssl/ssl_engine_io.c
++++ b/modules/ssl/ssl_engine_io.c
 @@ -28,6 +28,7 @@
                                    core keeps dumping.''
                                              -- Unknown    */
@@ -127,7 +129,7 @@ Upstream-Status: Backport
  } bio_filter_in_ctx_t;
  
  /*
-@@ -1385,6 +1387,27 @@ static apr_status_t ssl_io_filter_input(ap_filter_t *f,
+@@ -1412,6 +1414,27 @@ static apr_status_t ssl_io_filter_input(ap_filter_t *f,
          APR_BRIGADE_INSERT_TAIL(bb, bucket);
      }
  
@@ -155,7 +157,7 @@ Upstream-Status: Backport
      return APR_SUCCESS;
  }
  
-@@ -1866,6 +1889,7 @@ static void ssl_io_input_add_filter(ssl_filter_ctx_t *filter_ctx, conn_rec *c,
+@@ -1893,6 +1916,7 @@ static void ssl_io_input_add_filter(ssl_filter_ctx_t *filter_ctx, conn_rec *c,
      inctx->block = APR_BLOCK_READ;
      inctx->pool = c->pool;
      inctx->filter_ctx = filter_ctx;
@@ -163,8 +165,9 @@ Upstream-Status: Backport
  }
  
  /* The request_rec pointer is passed in here only to ensure that the
---- httpd-2.4.4/modules/ssl/ssl_engine_kernel.c
-+++ httpd-2.4.4/modules/ssl/ssl_engine_kernel.c
+diff --git a/modules/ssl/ssl_engine_kernel.c b/modules/ssl/ssl_engine_kernel.c
+--- a/modules/ssl/ssl_engine_kernel.c
++++ b/modules/ssl/ssl_engine_kernel.c
 @@ -29,6 +29,7 @@
                                    time I was too famous.''
                                              -- Unknown                */
@@ -173,10 +176,10 @@ Upstream-Status: Backport
  #include "util_md5.h"
  
  static void ssl_configure_env(request_rec *r, SSLConnRec *sslconn);
-@@ -2186,3 +2187,84 @@ int ssl_callback_SRPServerParams(SSL *ssl, int *ad, void *arg)
+@@ -2139,3 +2140,84 @@ int ssl_callback_SRPServerParams(SSL *ssl, int *ad, void *arg)
  }
  
- #endif /* OPENSSL_NO_SRP */
+ #endif /* HAVE_SRP */
 +
 +#ifdef HAVE_TLS_NPN
 +/*
@@ -257,4 +260,30 @@ Upstream-Status: Backport
 +    *size_out = size;
 +    return SSL_TLSEXT_ERR_OK;
 +}
++#endif /* HAVE_TLS_NPN */
+diff --git a/modules/ssl/ssl_private.h b/modules/ssl/ssl_private.h
+--- a/modules/ssl/ssl_private.h
++++ b/modules/ssl/ssl_private.h
+@@ -123,6 +123,11 @@
+ #define MODSSL_SSL_METHOD_CONST
+ #endif
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x10001000L && !defined(OPENSSL_NO_NEXTPROTONEG) \
++    && !defined(OPENSSL_NO_TLSEXT)
++#define HAVE_TLS_NPN
 +#endif
++
+ #if defined(OPENSSL_FIPS)
+ #define HAVE_FIPS
+ #endif
+@@ -800,6 +805,7 @@ int          ssl_callback_ServerNameIndication(SSL *, int *, modssl_ctx_t *);
+ int         ssl_callback_SessionTicket(SSL *, unsigned char *, unsigned char *,
+                                        EVP_CIPHER_CTX *, HMAC_CTX *, int);
+ #endif
++int ssl_callback_AdvertiseNextProtos(SSL *ssl, const unsigned char **data, unsigned int *len, void *arg);
+ 
+ /**  Session Cache Support  */
+ void         ssl_scache_init(server_rec *, apr_pool_t *);
+-- 
+1.8.1.2
+
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
index cc88fac..3c038a9 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.7.bb
@@ -11,17 +11,17 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://httpd-2.4.1-corelimit.patch \
            file://httpd-2.4.4-export.patch \
            file://httpd-2.4.1-selinux.patch \
-           file://httpd-2.4.4-r1332643.patch \
            file://apache-configure_perlbin.patch \
            file://replace-lynx-to-curl-in-apachectl-script.patch \
            file://apache-ssl-ltmain-rpath.patch \
            file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
+           file://npn-patch-2.4.7.patch \
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
1.8.5.3


