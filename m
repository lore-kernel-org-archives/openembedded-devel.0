Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Uas2n-0006Jh-Ml
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 20:27:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 May 2013 11:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,650,1363158000"; d="scan'208";a="332101371"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.234])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 11:09:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2013 19:09:27 +0100
Message-Id: <3a2b69356793210f33744a8520588ece2770bf05.1368209301.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1368209301.git.paul.eggleton@linux.intel.com>
References: <cover.1368209301.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] apache2: update to 2.4.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 18:27:59 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../apache-configure_perlbin.patch                 |  0
 .../apache-ssl-ltmain-rpath.patch                  |  0
 .../fix-libtool-name.patch                         |  0
 .../httpd-2.4.1-corelimit.patch                    |  0
 .../httpd-2.4.1-selinux.patch                      |  0
 .../httpd-2.4.4-export.patch}                      |  6 +--
 .../httpd-2.4.4-r1332643.patch}                    | 44 +++++++++++-----------
 .../replace-lynx-to-curl-in-apachectl-script.patch |  0
 .../server-makefile.patch                          |  0
 ...he2-native_2.4.3.bb => apache2-native_2.4.4.bb} |  5 +--
 .../apache2/{apache2_2.4.3.bb => apache2_2.4.4.bb} |  9 ++---
 11 files changed, 31 insertions(+), 33 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/apache-configure_perlbin.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/apache-ssl-ltmain-rpath.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/fix-libtool-name.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/httpd-2.4.1-corelimit.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/httpd-2.4.1-selinux.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3/httpd-2.4.1-export.patch => apache2-2.4.4/httpd-2.4.4-export.patch} (81%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3/httpd-2.4.2-r1332643.patch => apache2-2.4.4/httpd-2.4.4-r1332643.patch} (88%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/replace-lynx-to-curl-in-apachectl-script.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-2.4.3 => apache2-2.4.4}/server-makefile.patch (100%)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.3.bb => apache2-native_2.4.4.bb} (89%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.3.bb => apache2_2.4.4.bb} (95%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/apache-configure_perlbin.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.3/apache-configure_perlbin.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.4/apache-configure_perlbin.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/apache-ssl-ltmain-rpath.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/apache-ssl-ltmain-rpath.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.3/apache-ssl-ltmain-rpath.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.4/apache-ssl-ltmain-rpath.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/fix-libtool-name.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/fix-libtool-name.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.3/fix-libtool-name.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.4/fix-libtool-name.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-corelimit.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.1-corelimit.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-corelimit.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.1-corelimit.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-selinux.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.1-selinux.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-selinux.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.1-selinux.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-export.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-export.patch
similarity index 81%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-export.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-export.patch
index ed629bf..afbed8e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.1-export.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-export.patch
@@ -8,8 +8,8 @@ Upstream-Status: Pending
 
 Note: EXPORT_DIRS change is conditional on using shared apr
 
---- httpd-2.4.1/server/Makefile.in.export
-+++ httpd-2.4.1/server/Makefile.in
+--- httpd-2.4.4/server/Makefile.in.export
++++ httpd-2.4.4/server/Makefile.in
 @@ -57,9 +57,6 @@ export_files:
  	( for dir in $(EXPORT_DIRS); do \
  	      ls $$dir/*.h ; \
@@ -17,6 +17,6 @@ Note: EXPORT_DIRS change is conditional on using shared apr
 -	  for dir in $(EXPORT_DIRS_APR); do \
 -	      ls $$dir/ap[ru].h $$dir/ap[ru]_*.h 2>/dev/null; \
 -	  done; \
- 	) | sort -u > $@
+ 	) | sed -e s,//,/,g | sort -u > $@
  
  exports.c: export_files
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.2-r1332643.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-r1332643.patch
similarity index 88%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.2-r1332643.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-r1332643.patch
index 16fd7d7..ba28231 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/httpd-2.4.2-r1332643.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/httpd-2.4.4-r1332643.patch
@@ -23,8 +23,8 @@ http://svn.apache.org/viewvc?view=revision&revision=1332643
 
 Upstream-Status: Backport
 
---- httpd-2.4.2/modules/ssl/ssl_private.h
-+++ httpd-2.4.2/modules/ssl/ssl_private.h
+--- httpd-2.4.4/modules/ssl/ssl_private.h
++++ httpd-2.4.4/modules/ssl/ssl_private.h
 @@ -139,6 +139,11 @@
  #define HAVE_FIPS
  #endif
@@ -37,7 +37,7 @@ Upstream-Status: Backport
  #if (OPENSSL_VERSION_NUMBER >= 0x10000000)
  #define MODSSL_SSL_CIPHER_CONST const
  #define MODSSL_SSL_METHOD_CONST const
-@@ -811,6 +816,7 @@
+@@ -840,6 +845,7 @@ int          ssl_callback_ServerNameIndication(SSL *, int *, modssl_ctx_t *);
  int         ssl_callback_SessionTicket(SSL *, unsigned char *, unsigned char *,
                                         EVP_CIPHER_CTX *, HMAC_CTX *, int);
  #endif
@@ -45,9 +45,9 @@ Upstream-Status: Backport
  
  /**  Session Cache Support  */
  void         ssl_scache_init(server_rec *, apr_pool_t *);
---- httpd-2.4.2/modules/ssl/mod_ssl.c
-+++ httpd-2.4.2/modules/ssl/mod_ssl.c
-@@ -260,6 +260,18 @@
+--- httpd-2.4.4/modules/ssl/mod_ssl.c
++++ httpd-2.4.4/modules/ssl/mod_ssl.c
+@@ -272,6 +272,18 @@ static const command_rec ssl_config_cmds[] = {
      AP_END_CMD
  };
  
@@ -66,9 +66,9 @@ Upstream-Status: Backport
  /*
   *  the various processing hooks
   */
---- httpd-2.4.2/modules/ssl/mod_ssl.h
-+++ httpd-2.4.2/modules/ssl/mod_ssl.h
-@@ -63,5 +63,26 @@
+--- httpd-2.4.4/modules/ssl/mod_ssl.h
++++ httpd-2.4.4/modules/ssl/mod_ssl.h
+@@ -63,5 +63,26 @@ APR_DECLARE_OPTIONAL_FN(int, ssl_proxy_enable, (conn_rec *));
  
  APR_DECLARE_OPTIONAL_FN(int, ssl_engine_disable, (conn_rec *));
  
@@ -95,9 +95,9 @@ Upstream-Status: Backport
 +
  #endif /* __MOD_SSL_H__ */
  /** @} */
---- httpd-2.4.2/modules/ssl/ssl_engine_init.c
-+++ httpd-2.4.2/modules/ssl/ssl_engine_init.c
-@@ -681,6 +681,11 @@
+--- httpd-2.4.4/modules/ssl/ssl_engine_init.c
++++ httpd-2.4.4/modules/ssl/ssl_engine_init.c
+@@ -725,6 +725,11 @@ static void ssl_init_ctx_callbacks(server_rec *s,
  #endif
  
      SSL_CTX_set_info_callback(ctx, ssl_callback_Info);
@@ -109,8 +109,8 @@ Upstream-Status: Backport
  }
  
  static void ssl_init_ctx_verify(server_rec *s,
---- httpd-2.4.2/modules/ssl/ssl_engine_io.c
-+++ httpd-2.4.2/modules/ssl/ssl_engine_io.c
+--- httpd-2.4.4/modules/ssl/ssl_engine_io.c
++++ httpd-2.4.4/modules/ssl/ssl_engine_io.c
 @@ -28,6 +28,7 @@
                                    core keeps dumping.''
                                              -- Unknown    */
@@ -119,7 +119,7 @@ Upstream-Status: Backport
  #include "apr_date.h"
  
  /*  _________________________________________________________________
-@@ -297,6 +298,7 @@
+@@ -297,6 +298,7 @@ typedef struct {
      apr_pool_t *pool;
      char buffer[AP_IOBUFSIZE];
      ssl_filter_ctx_t *filter_ctx;
@@ -127,7 +127,7 @@ Upstream-Status: Backport
  } bio_filter_in_ctx_t;
  
  /*
-@@ -1374,6 +1376,27 @@
+@@ -1385,6 +1387,27 @@ static apr_status_t ssl_io_filter_input(ap_filter_t *f,
          APR_BRIGADE_INSERT_TAIL(bb, bucket);
      }
  
@@ -155,7 +155,7 @@ Upstream-Status: Backport
      return APR_SUCCESS;
  }
  
-@@ -1855,6 +1878,7 @@
+@@ -1866,6 +1889,7 @@ static void ssl_io_input_add_filter(ssl_filter_ctx_t *filter_ctx, conn_rec *c,
      inctx->block = APR_BLOCK_READ;
      inctx->pool = c->pool;
      inctx->filter_ctx = filter_ctx;
@@ -163,8 +163,8 @@ Upstream-Status: Backport
  }
  
  /* The request_rec pointer is passed in here only to ensure that the
---- httpd-2.4.2/modules/ssl/ssl_engine_kernel.c
-+++ httpd-2.4.2/modules/ssl/ssl_engine_kernel.c
+--- httpd-2.4.4/modules/ssl/ssl_engine_kernel.c
++++ httpd-2.4.4/modules/ssl/ssl_engine_kernel.c
 @@ -29,6 +29,7 @@
                                    time I was too famous.''
                                              -- Unknown                */
@@ -173,10 +173,10 @@ Upstream-Status: Backport
  #include "util_md5.h"
  
  static void ssl_configure_env(request_rec *r, SSLConnRec *sslconn);
-@@ -2143,3 +2144,84 @@
-     return -1;
+@@ -2186,3 +2187,84 @@ int ssl_callback_SRPServerParams(SSL *ssl, int *ad, void *arg)
  }
- #endif
+ 
+ #endif /* OPENSSL_NO_SRP */
 +
 +#ifdef HAVE_TLS_NPN
 +/*
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/replace-lynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/replace-lynx-to-curl-in-apachectl-script.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.3/replace-lynx-to-curl-in-apachectl-script.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.4/replace-lynx-to-curl-in-apachectl-script.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-2.4.3/server-makefile.patch b/meta-webserver/recipes-httpd/apache2/apache2-2.4.4/server-makefile.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/apache2/apache2-2.4.3/server-makefile.patch
rename to meta-webserver/recipes-httpd/apache2/apache2-2.4.4/server-makefile.patch
diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.4.bb
similarity index 89%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.4.bb
index 064e6bd..2855648 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.3.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.4.bb
@@ -5,7 +5,6 @@ HOMEPAGE = "http://httpd.apache.org/"
 DEPENDS = "expat-native pcre-native apr-native apr-util-native"
 SECTION = "net"
 LICENSE = "Apache-2.0"
-PR = "r0"
 
 inherit native
 
@@ -14,8 +13,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
-SRC_URI[md5sum] = "87aaf7bc7e8715f0455997bb8c6791aa"
-SRC_URI[sha256sum] = "d82102b9c111f1892fb20a2bccf4370de579c6521b2f172ed0b36f2759fb249e"
+SRC_URI[md5sum] = "0e712ee2119cd798c8ae39d5f11a9206"
+SRC_URI[sha256sum] = "92aabddeca76a4ac7330b143df1407bbf35574c7291c15172238ac598d97655c"
 
 do_configure () {
     ./configure --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
similarity index 95%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
index 5589f1f..42a7b16 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.4.bb
@@ -5,14 +5,13 @@ HOMEPAGE = "http://httpd.apache.org/"
 DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
-PR = "r1"
 
 SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
            file://httpd-2.4.1-corelimit.patch \
-           file://httpd-2.4.1-export.patch \
+           file://httpd-2.4.4-export.patch \
            file://httpd-2.4.1-selinux.patch \
-           file://httpd-2.4.2-r1332643.patch \
+           file://httpd-2.4.4-r1332643.patch \
            file://apache-configure_perlbin.patch \
            file://replace-lynx-to-curl-in-apachectl-script.patch \
            file://apache-ssl-ltmain-rpath.patch \
@@ -20,8 +19,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://init"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
-SRC_URI[md5sum] = "87aaf7bc7e8715f0455997bb8c6791aa"
-SRC_URI[sha256sum] = "d82102b9c111f1892fb20a2bccf4370de579c6521b2f172ed0b36f2759fb249e"
+SRC_URI[md5sum] = "0e712ee2119cd798c8ae39d5f11a9206"
+SRC_URI[sha256sum] = "92aabddeca76a4ac7330b143df1407bbf35574c7291c15172238ac598d97655c"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
1.8.1.2



