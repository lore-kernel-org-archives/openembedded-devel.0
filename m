Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D17F7704E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 07:59:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7G7xWoQ017826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 00:59:33 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 16 Aug 2016 00:59:32 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2016 15:58:40 +0800
Message-ID: <1471334320-22334-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] proftpd: 1.3.5a -> 1.3.5b
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
X-List-Received-Date: Tue, 16 Aug 2016 07:59:35 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Upgrade proftpd from 1.3.5a to 1.3.5b
* Remove two backport patches

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../proftpd/files/CVE-2016-3125.patch              | 247 ---------------------
 .../proftpd/files/Fix-build-errors.patch           |  64 ------
 .../recipes-daemons/proftpd/proftpd_1.3.5a.bb      | 131 -----------
 .../recipes-daemons/proftpd/proftpd_1.3.5b.bb      | 129 +++++++++++
 4 files changed, 129 insertions(+), 442 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
 delete mode 100644 meta-networking/recipes-daemons/proftpd/files/Fix-build-errors.patch
 delete mode 100644 meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
 create mode 100644 meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb

diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch b/meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
deleted file mode 100644
index 69c9be0..0000000
--- a/meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
+++ /dev/null
@@ -1,247 +0,0 @@
-From 7a8f683cedf9b0d1024a80362693c9f8b93a0f2b Mon Sep 17 00:00:00 2001
-From: TJ Saunders <tj@castaglia.org>
-Date: Thu, 10 Mar 2016 15:07:58 -0800
-Subject: [PATCH] Backport of fix for Bug#4230 to 1.3.5 branch.
-
-Upstream-Status: Backport
-CVE: CVE-2016-3125
-
-Author: TJ Saunders <tj@castaglia.org>
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- contrib/mod_tls.c | 167 +++++++++++++++++++++++++++++++++++++++++++++++-------
- 1 file changed, 147 insertions(+), 20 deletions(-)
-
-diff --git a/contrib/mod_tls.c b/contrib/mod_tls.c
-index df92658..5883cc7 100644
---- a/contrib/mod_tls.c
-+++ b/contrib/mod_tls.c
-@@ -411,6 +411,13 @@ static int tls_required_on_ctrl = 0;
- static int tls_required_on_data = 0;
- static unsigned char *tls_authenticated = NULL;
- 
-+/* Define the minimum DH group length we allow (unless the AllowWeakDH
-+ * TLSOption is used).  Ideally this would be 2048, per https://weakdh.org,
-+ * but for compatibility with older Java versions, which only support up to
-+ * 1024, we'll use 1024.  For now.
-+ */
-+#define TLS_DH_MIN_LEN				1024
-+
- /* mod_tls session flags */
- #define	TLS_SESS_ON_CTRL			0x0001
- #define TLS_SESS_ON_DATA			0x0002
-@@ -438,6 +445,7 @@ static unsigned char *tls_authenticated = NULL;
- #define TLS_OPT_USE_IMPLICIT_SSL			0x0200
- #define TLS_OPT_ALLOW_CLIENT_RENEGOTIATIONS		0x0400
- #define TLS_OPT_VERIFY_CERT_CN				0x0800
-+#define TLS_OPT_ALLOW_WEAK_DH				0x1000
- 
- /* mod_tls SSCN modes */
- #define TLS_SSCN_MODE_SERVER				0
-@@ -2417,24 +2425,139 @@ static int tls_ctrl_renegotiate_cb(CALLBACK_FRAME) {
- 
- static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
-   DH *dh = NULL;
-+  EVP_PKEY *pkey;
-+  int pkeylen = 0, use_pkeylen = FALSE;
-+
-+  /* OpenSSL will only ever call us (currently) with a keylen of 512 or 1024;
-+   * see the SSL_EXPORT_PKEYLENGTH macro in ssl_locl.h.  Sigh.
-+   *
-+   * Thus we adjust the DH parameter length according to the size of the
-+   * RSA/DSA private key used for the current connection.
-+   *
-+   * NOTE: This MAY cause interoperability issues with some clients, notably
-+   * Java 7 (and earlier) clients, since Java 7 and earlier supports
-+   * Diffie-Hellman only up to 1024 bits.  More sighs.  To deal with these
-+   * clients, then, you need to configure a certificate/key of 1024 bits.
-+   */
-+  pkey = SSL_get_privatekey(ssl);
-+  if (pkey != NULL) {
-+    if (EVP_PKEY_type(pkey->type) == EVP_PKEY_RSA ||
-+        EVP_PKEY_type(pkey->type) == EVP_PKEY_DSA) {
-+      pkeylen = EVP_PKEY_bits(pkey);
-+
-+      if (pkeylen < TLS_DH_MIN_LEN) {
-+        if (!(tls_opts & TLS_OPT_ALLOW_WEAK_DH)) {
-+          pr_trace_msg(trace_channel, 11,
-+            "certificate private key length %d less than %d bits, using %d "
-+            "(see AllowWeakDH TLSOption)", pkeylen, TLS_DH_MIN_LEN,
-+            TLS_DH_MIN_LEN);
-+          pkeylen = TLS_DH_MIN_LEN;
-+        }
-+      }
-+
-+      if (pkeylen != keylen) {
-+        pr_trace_msg(trace_channel, 13,
-+          "adjusted DH parameter length from %d to %d bits", keylen, pkeylen);
-+        use_pkeylen = TRUE;
-+      }
-+    }
-+  }
- 
-   if (tls_tmp_dhs != NULL &&
-       tls_tmp_dhs->nelts > 0) {
-     register unsigned int i;
--    DH **dhs;
-+    DH *best_dh = NULL, **dhs;
-+    int best_dhlen = 0;
- 
-     dhs = tls_tmp_dhs->elts;
-+
-+    /* Search the configured list of DH parameters twice: once for any sizes
-+     * matching the actual requested size (usually 1024), and once for any
-+     * matching the certificate private key size (pkeylen).
-+     *
-+     * This behavior allows site admins to configure a TLSDHParamFile that
-+     * contains 1024-bit parameters, for e.g. Java 7 (and earlier) clients.
-+     */
-+
-+    /* Note: the keylen argument is in BITS, but DH_size() returns the number
-+     * of BYTES.
-+     */
-     for (i = 0; i < tls_tmp_dhs->nelts; i++) {
--      /* Note: the keylength argument is in BITS, but DH_size() returns
--       * the number of BYTES.
-+      int dhlen;
-+
-+      dhlen = DH_size(dhs[i]) * 8;
-+      if (dhlen == keylen) {
-+        pr_trace_msg(trace_channel, 11,
-+          "found matching DH parameter for key length %d", keylen);
-+        return dhs[i];
-+      }
-+
-+      /* Try to find the next "best" DH to use, where "best" means
-+       * the smallest DH that is larger than the necessary keylen.
-        */
--      if (DH_size(dhs[i]) == (keylength / 8)) {
-+      if (dhlen > keylen) {
-+        if (best_dh != NULL) {
-+          if (dhlen < best_dhlen) {
-+            best_dh = dhs[i];
-+            best_dhlen = dhlen;
-+          }
-+
-+        } else {
-+          best_dh = dhs[i];
-+          best_dhlen = dhlen;
-+        }
-+      }
-+    }
-+
-+    for (i = 0; i < tls_tmp_dhs->nelts; i++) {
-+      int dhlen;
-+
-+      dhlen = DH_size(dhs[i]) * 8;
-+      if (dhlen == pkeylen) {
-+        pr_trace_msg(trace_channel, 11,
-+          "found matching DH parameter for certificate private key length %d",
-+          pkeylen);
-         return dhs[i];
-       }
-+
-+      if (dhlen > pkeylen) {
-+        if (best_dh != NULL) {
-+          if (dhlen < best_dhlen) {
-+            best_dh = dhs[i];
-+            best_dhlen = dhlen;
-+          }
-+
-+        } else {
-+          best_dh = dhs[i];
-+          best_dhlen = dhlen;
-+        }
-+      }
-+    }
-+
-+    if (best_dh != NULL) {
-+      pr_trace_msg(trace_channel, 11,
-+        "using best DH parameter for key length %d (length %d)", keylen,
-+        best_dhlen);
-+      return best_dh;
-     }
-   }
- 
--  switch (keylength) {
-+  /* Still no DH parameters found?  Use the built-in ones. */
-+
-+  if (keylen < TLS_DH_MIN_LEN) {
-+    if (!(tls_opts & TLS_OPT_ALLOW_WEAK_DH)) {
-+      pr_trace_msg(trace_channel, 11,
-+        "requested key length %d less than %d bits, using %d "
-+        "(see AllowWeakDH TLSOption)", keylen, TLS_DH_MIN_LEN, TLS_DH_MIN_LEN);
-+      keylen = TLS_DH_MIN_LEN;
-+    }
-+  }
-+
-+  if (use_pkeylen) {
-+    keylen = pkeylen;
-+  }
-+
-+  switch (keylen) {
-     case 512:
-       dh = get_dh512();
-       break;
-@@ -2443,32 +2566,33 @@ static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
-       dh = get_dh768();
-       break;
- 
--     case 1024:
--       dh = get_dh1024();
--       break;
-+    case 1024:
-+      dh = get_dh1024();
-+      break;
- 
--     case 1536:
--       dh = get_dh1536();
--       break;
-+    case 1536:
-+      dh = get_dh1536();
-+      break;
- 
--     case 2048:
--       dh = get_dh2048();
--       break;
-+    case 2048:
-+      dh = get_dh2048();
-+      break;
- 
--     default:
--       tls_log("unsupported DH key length %d requested, returning 1024 bits",
--         keylength);
--       dh = get_dh1024();
--       break;
-+    default:
-+      tls_log("unsupported DH key length %d requested, returning 1024 bits",
-+        keylen);
-+      dh = get_dh1024();
-+      break;
-   }
- 
-+  pr_trace_msg(trace_channel, 11, "using builtin DH for %d bits", keylen);
-+
-   /* Add this DH to the list, so that it can be freed properly later. */
-   if (tls_tmp_dhs == NULL) {
-     tls_tmp_dhs = make_array(session.pool, 1, sizeof(DH *));
-   }
- 
-   *((DH **) push_array(tls_tmp_dhs)) = dh;
--
-   return dh;
- }
- 
-@@ -8445,6 +8569,9 @@ MODRET set_tlsoptions(cmd_rec *cmd) {
-                strcmp(cmd->argv[i], "AllowClientRenegotiations") == 0) {
-       opts |= TLS_OPT_ALLOW_CLIENT_RENEGOTIATIONS;
- 
-+    } else if (strcmp(cmd->argv[i], "AllowWeakDH") == 0) {
-+      opts |= TLS_OPT_ALLOW_WEAK_DH;
-+
-     } else if (strcmp(cmd->argv[i], "EnableDiags") == 0) {
-       opts |= TLS_OPT_ENABLE_DIAGS;
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/proftpd/files/Fix-build-errors.patch b/meta-networking/recipes-daemons/proftpd/files/Fix-build-errors.patch
deleted file mode 100644
index 3b98560..0000000
--- a/meta-networking/recipes-daemons/proftpd/files/Fix-build-errors.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 253e6ef6a4fde5545111f7c439a9692afecc597b Mon Sep 17 00:00:00 2001
-From: TJ Saunders <tj@castaglia.org>
-Date: Thu, 10 Mar 2016 15:17:50 -0800
-Subject: [PATCH] Fix build errors; used wrong variable name, and pushed
- without building.  Shame.
-
-Upstream-Status: Backport
-
-Author: TJ Saunders <tj@castaglia.org>
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- contrib/mod_tls.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/contrib/mod_tls.c b/contrib/mod_tls.c
-index c557454..ecd9f56 100644
---- a/contrib/mod_tls.c
-+++ b/contrib/mod_tls.c
-@@ -2423,7 +2423,7 @@ static int tls_ctrl_renegotiate_cb(CALLBACK_FRAME) {
- }
- #endif
- 
--static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
-+static DH *tls_dh_cb(SSL *ssl, int is_export, int keylen) {
-   DH *dh = NULL;
-   EVP_PKEY *pkey;
-   int pkeylen = 0, use_pkeylen = FALSE;
-@@ -2597,7 +2597,7 @@ static DH *tls_dh_cb(SSL *ssl, int is_export, int keylength) {
- }
- 
- #ifdef PR_USE_OPENSSL_ECC
--static EC_KEY *tls_ecdh_cb(SSL *ssl, int is_export, int keylength) {
-+static EC_KEY *tls_ecdh_cb(SSL *ssl, int is_export, int keylen) {
-   static EC_KEY *ecdh = NULL;
-   static int init = 0;
- 
-@@ -5064,7 +5064,7 @@ static ssize_t tls_read(SSL *ssl, void *buf, size_t len) {
-   return count;
- }
- 
--static RSA *tls_rsa_cb(SSL *ssl, int is_export, int keylength) {
-+static RSA *tls_rsa_cb(SSL *ssl, int is_export, int keylen) {
-   BIGNUM *e = NULL;
- 
-   if (tls_tmp_rsa) {
-@@ -5082,13 +5082,13 @@ static RSA *tls_rsa_cb(SSL *ssl, int is_export, int keylength) {
-     return NULL;
-   }
- 
--  if (RSA_generate_key_ex(tls_tmp_rsa, keylength, e, NULL) != 1) {
-+  if (RSA_generate_key_ex(tls_tmp_rsa, keylen, e, NULL) != 1) {
-     BN_free(e);
-     return NULL;
-   }
- 
- #else
--  tls_tmp_rsa = RSA_generate_key(keylength, RSA_F4, NULL, NULL);
-+  tls_tmp_rsa = RSA_generate_key(keylen, RSA_F4, NULL, NULL);
- #endif /* OpenSSL version 0.9.8 and later */
- 
-   if (e != NULL) {
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
deleted file mode 100644
index 2332ef8..0000000
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5a.bb
+++ /dev/null
@@ -1,131 +0,0 @@
-SUMMARY = "Secure and configurable FTP server"
-SECTION = "net"
-HOMEPAGE = "http://www.proftpd.org"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
-
-SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
-           file://basic.conf.patch \
-           file://proftpd-basic.init \
-           file://default \
-           file://close-RequireValidShell-check.patch \
-           file://contrib.patch  \
-           file://build_fixup.patch \
-           file://proftpd.service \
-           file://CVE-2016-3125.patch \
-           file://Fix-build-errors.patch \
-           "
-
-SRC_URI[md5sum] = "b9d3092411478415b31d435f8e26d173"
-SRC_URI[sha256sum] = "a1f48df8539c414ec56e0cea63dcf4b8e16e606c05f10156f030a4a67fae5696"
-
-inherit autotools-brokensep useradd update-rc.d systemd
-
-PACKAGECONFIG ??= "shadow \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                  "
-
-PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses, --disable-curses --disable-ncurses, ncurses"
-PACKAGECONFIG[openssl] = "--enable-openssl, --disable-openssl, openssl, openssl"
-PACKAGECONFIG[pam] = "--enable-auth-pam, --disable-auth-pam, libpam, libpam"
-PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6"
-PACKAGECONFIG[shadow] = "--enable-shadow, --disable-shadow"
-PACKAGECONFIG[pcre] = "--enable-pcre, --disable-pcre, libpcre "
-
-# enable POSIX.1e capabilities
-PACKAGECONFIG[cap] = "--enable-cap, --disable-cap, libcap, libcap"
-
-#enable support for POSIX ACLs
-PACKAGECONFIG[acl] = "--enable-facl, --disable-facl"
-
-#enable proftpd controls via ftpdct
-PACKAGECONFIG[ctrls] = "--enable-ctrls, --disable-crtls"
-
-#prevent proftpd from using its bundled getopt implementation.
-PACKAGECONFIG[getopt] = "--with-getopt, --without-getopt"
-
-#do not strip debugging symbols from installed code
-PACKAGECONFIG[strip] = "--enable-strip, --disable-strip"
-
-#enable SIA authentication support (Tru64)
-PACKAGECONFIG[sia] = "--enable-sia, --disable-sia"
-PACKAGECONFIG[sendfile] = "-enable-sendfile, --disable-sendfile"
-
-#enable Native Language Support (NLS)
-PACKAGECONFIG[nls] = "--enable-nls, --disable-nls"
-
-#add mod_dso to core modules
-PACKAGECONFIG[dso] = "--enable-dso, --disable-dso"
-PACKAGECONFIG[largefile] = "--enable-largefile, --disable-largefile"
-
-#omit mod_auth_file from core modules
-PACKAGECONFIG[auth] = "--enable-auth-file, --disable-auth-file"
-
-
-# proftpd uses libltdl which currently makes configuring using
-# autotools.bbclass a pain...
-do_configure () {
-    oe_runconf
-    cp ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S}/libtool
-}
-
-FTPUSER = "ftp"
-FTPGROUP = "ftp"
-
-do_install () {
-    oe_runmake DESTDIR=${D} install
-    rmdir ${D}${libdir}/proftpd ${D}${datadir}/locale
-    [ -d ${D}${libexecdir} ] && rmdir ${D}${libexecdir}
-    sed -i '/ *User[ \t]*/s/ftp/${FTPUSER}/' ${D}${sysconfdir}/proftpd.conf
-    sed -i '/ *Group[ \t]*/s/ftp/${FTPGROUP}/' ${D}${sysconfdir}/proftpd.conf
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/proftpd-basic.init ${D}${sysconfdir}/init.d/proftpd
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/proftpd
-    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/proftpd
-    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/proftpd
-    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/proftpd
-
-    install -d ${D}${sysconfdir}/default
-    install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/proftpd
-
-    # create the pub directory
-    mkdir -p ${D}/home/${FTPUSER}/pub/
-    chown -R ${FTPUSER}:${FTPGROUP} ${D}/home/${FTPUSER}/pub
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
-        # install proftpd pam configuration
-        install -d ${D}${sysconfdir}/pam.d
-        install -m 644 ${S}/contrib/dist/rpm/ftp.pamd ${D}${sysconfdir}/pam.d/proftpd
-        sed -i '/ftpusers/d' ${D}${sysconfdir}/pam.d/proftpd
-        # specify the user Authentication config
-        sed -i '/^MaxInstances/a\AuthPAM                         on\nAuthPAMConfig                   proftpd' \
-            ${D}${sysconfdir}/proftpd.conf
-    fi
-
-    install -d ${D}/${systemd_unitdir}/system
-    install -m 644 ${WORKDIR}/proftpd.service ${D}/${systemd_unitdir}/system
-    sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
-        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-        -e 's,@SBINDIR@,${sbindir},g' \
-        -i ${D}${systemd_unitdir}/system/*.service
-
-    sed -e 's|--sysroot=${STAGING_DIR_HOST}||g' \
-        -e 's|${STAGING_DIR_NATIVE}||g' \
-        -e 's|-fdebug-prefix-map=[^ ]*||g' \
-        -i ${D}/${bindir}/prxs
-}
-
-INITSCRIPT_NAME = "proftpd"
-INITSCRIPT_PARAM = "defaults 85 15"
-
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "proftpd.service"
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system ${FTPGROUP}"
-USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/${FTPUSER} --no-create-home \
-                       --shell /bin/false ${FTPUSER}"
-
-FILES_${PN} += "/home/${FTPUSER}"
-
-RDEPENDS_${PN} += "perl"
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
new file mode 100644
index 0000000..5a53d0d
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
@@ -0,0 +1,129 @@
+SUMMARY = "Secure and configurable FTP server"
+SECTION = "net"
+HOMEPAGE = "http://www.proftpd.org"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
+
+SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
+           file://basic.conf.patch \
+           file://proftpd-basic.init \
+           file://default \
+           file://close-RequireValidShell-check.patch \
+           file://contrib.patch  \
+           file://build_fixup.patch \
+           file://proftpd.service \
+           "
+
+SRC_URI[md5sum] = "f7b8e3a383b34a894c2502db74ccccde"
+SRC_URI[sha256sum] = "afc1789f2478acf88dfdc7d70da90a4fa2786d628218e9574273295d044b4fc8"
+
+inherit autotools-brokensep useradd update-rc.d systemd
+
+PACKAGECONFIG ??= "shadow \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                  "
+
+PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses, --disable-curses --disable-ncurses, ncurses"
+PACKAGECONFIG[openssl] = "--enable-openssl, --disable-openssl, openssl, openssl"
+PACKAGECONFIG[pam] = "--enable-auth-pam, --disable-auth-pam, libpam, libpam"
+PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6"
+PACKAGECONFIG[shadow] = "--enable-shadow, --disable-shadow"
+PACKAGECONFIG[pcre] = "--enable-pcre, --disable-pcre, libpcre "
+
+# enable POSIX.1e capabilities
+PACKAGECONFIG[cap] = "--enable-cap, --disable-cap, libcap, libcap"
+
+#enable support for POSIX ACLs
+PACKAGECONFIG[acl] = "--enable-facl, --disable-facl"
+
+#enable proftpd controls via ftpdct
+PACKAGECONFIG[ctrls] = "--enable-ctrls, --disable-crtls"
+
+#prevent proftpd from using its bundled getopt implementation.
+PACKAGECONFIG[getopt] = "--with-getopt, --without-getopt"
+
+#do not strip debugging symbols from installed code
+PACKAGECONFIG[strip] = "--enable-strip, --disable-strip"
+
+#enable SIA authentication support (Tru64)
+PACKAGECONFIG[sia] = "--enable-sia, --disable-sia"
+PACKAGECONFIG[sendfile] = "-enable-sendfile, --disable-sendfile"
+
+#enable Native Language Support (NLS)
+PACKAGECONFIG[nls] = "--enable-nls, --disable-nls"
+
+#add mod_dso to core modules
+PACKAGECONFIG[dso] = "--enable-dso, --disable-dso"
+PACKAGECONFIG[largefile] = "--enable-largefile, --disable-largefile"
+
+#omit mod_auth_file from core modules
+PACKAGECONFIG[auth] = "--enable-auth-file, --disable-auth-file"
+
+
+# proftpd uses libltdl which currently makes configuring using
+# autotools.bbclass a pain...
+do_configure () {
+    oe_runconf
+    cp ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S}/libtool
+}
+
+FTPUSER = "ftp"
+FTPGROUP = "ftp"
+
+do_install () {
+    oe_runmake DESTDIR=${D} install
+    rmdir ${D}${libdir}/proftpd ${D}${datadir}/locale
+    [ -d ${D}${libexecdir} ] && rmdir ${D}${libexecdir}
+    sed -i '/ *User[ \t]*/s/ftp/${FTPUSER}/' ${D}${sysconfdir}/proftpd.conf
+    sed -i '/ *Group[ \t]*/s/ftp/${FTPGROUP}/' ${D}${sysconfdir}/proftpd.conf
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/proftpd-basic.init ${D}${sysconfdir}/init.d/proftpd
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/proftpd
+    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/proftpd
+    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/proftpd
+    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/proftpd
+
+    install -d ${D}${sysconfdir}/default
+    install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/proftpd
+
+    # create the pub directory
+    mkdir -p ${D}/home/${FTPUSER}/pub/
+    chown -R ${FTPUSER}:${FTPGROUP} ${D}/home/${FTPUSER}/pub
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
+        # install proftpd pam configuration
+        install -d ${D}${sysconfdir}/pam.d
+        install -m 644 ${S}/contrib/dist/rpm/ftp.pamd ${D}${sysconfdir}/pam.d/proftpd
+        sed -i '/ftpusers/d' ${D}${sysconfdir}/pam.d/proftpd
+        # specify the user Authentication config
+        sed -i '/^MaxInstances/a\AuthPAM                         on\nAuthPAMConfig                   proftpd' \
+            ${D}${sysconfdir}/proftpd.conf
+    fi
+
+    install -d ${D}/${systemd_unitdir}/system
+    install -m 644 ${WORKDIR}/proftpd.service ${D}/${systemd_unitdir}/system
+    sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
+        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+        -e 's,@SBINDIR@,${sbindir},g' \
+        -i ${D}${systemd_unitdir}/system/*.service
+
+    sed -e 's|--sysroot=${STAGING_DIR_HOST}||g' \
+        -e 's|${STAGING_DIR_NATIVE}||g' \
+        -e 's|-fdebug-prefix-map=[^ ]*||g' \
+        -i ${D}/${bindir}/prxs
+}
+
+INITSCRIPT_NAME = "proftpd"
+INITSCRIPT_PARAM = "defaults 85 15"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "proftpd.service"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system ${FTPGROUP}"
+USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/${FTPUSER} --no-create-home \
+                       --shell /bin/false ${FTPUSER}"
+
+FILES_${PN} += "/home/${FTPUSER}"
+
+RDEPENDS_${PN} += "perl"
-- 
2.8.1


