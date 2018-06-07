Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4BC7852C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:21:35 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w57DLacP010631
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Jun 2018 15:21:36 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w57DLaSB011977;
	Thu, 7 Jun 2018 15:21:36 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 25CAB98F57A;
	Thu,  7 Jun 2018 15:21:36 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Jun 2018 15:21:08 +0200
Message-Id: <20180607132109.23396-4-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180607132109.23396-1-andrej.valek@siemens.com>
References: <20180607132109.23396-1-andrej.valek@siemens.com>
Subject: [meta-oe][PATCH 3/3] net-snmp: add support for openssl 1.1x
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
X-List-Received-Date: Thu, 07 Jun 2018 13:21:36 -0000

Patch was copied from [https://sourceforge.net/p/net-snmp/patches/1336].

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../net-snmp/fix-openssl-build-errors.patch        | 171 +++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch
new file mode 100644
index 000000000..53bc37226
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch
@@ -0,0 +1,171 @@
+net-snmp build fails on Debian 9 with OpenSSL 1.1.0
+
+With these changes, net-snmp builds with both
+OpenSSL 1.0.x and 1.1.x.
+
+Author: Sharmila Podury <sharmila.podury@brocade.com>
+
+--- a/apps/snmpusm.c
++++ b/apps/snmpusm.c
+@@ -125,6 +125,32 @@ char           *usmUserPublic_val = NULL
+ int             docreateandwait = 0;
+ 
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++
++#include <string.h>
++#include <openssl/engine.h>
++
++void DH_get0_pqg(const DH *dh,
++                const BIGNUM **p, const BIGNUM **q, const BIGNUM **g)
++{
++   if (p != NULL)
++       *p = dh->p;
++   if (q != NULL)
++       *q = dh->q;
++   if (g != NULL)
++       *g = dh->g;
++}
++
++void DH_get0_key(const DH *dh, const BIGNUM **pub_key, const BIGNUM **priv_key)
++{
++   if (pub_key != NULL)
++       *pub_key = dh->pub_key;
++   if (priv_key != NULL)
++       *priv_key = dh->priv_key;
++}
++
++#endif
++
+ void
+ usage(void)
+ {
+@@ -190,7 +216,7 @@ get_USM_DH_key(netsnmp_variable_list *va
+                oid *keyoid, size_t keyoid_len) {
+     u_char *dhkeychange;
+     DH *dh;
+-    BIGNUM *other_pub;
++    BIGNUM *p, *g, *pub_key, *other_pub;
+     u_char *key;
+     size_t key_len;
+             
+@@ -205,25 +231,29 @@ get_USM_DH_key(netsnmp_variable_list *va
+         dh = d2i_DHparams(NULL, &cp, dhvar->val_len);
+     }
+ 
+-    if (!dh || !dh->g || !dh->p) {
++    if (dh)
++        DH_get0_pqg(dh, &p, NULL, &g);
++
++    if (!dh || !g || !p) {
+         SNMP_FREE(dhkeychange);
+         return SNMPERR_GENERR;
+     }
+ 
+-    DH_generate_key(dh);
+-    if (!dh->pub_key) {
++    if (!DH_generate_key(dh)) {
+         SNMP_FREE(dhkeychange);
+         return SNMPERR_GENERR;
+     }
+             
+-    if (vars->val_len != (unsigned int)BN_num_bytes(dh->pub_key)) {
++    DH_get0_key(dh, &pub_key, NULL);
++
++    if (vars->val_len != (unsigned int)BN_num_bytes(pub_key)) {
+         SNMP_FREE(dhkeychange);
+         fprintf(stderr,"incorrect diffie-helman lengths (%lu != %d)\n",
+-                (unsigned long)vars->val_len, BN_num_bytes(dh->pub_key));
++                (unsigned long)vars->val_len, BN_num_bytes(pub_key));
+         return SNMPERR_GENERR;
+     }
+ 
+-    BN_bn2bin(dh->pub_key, dhkeychange + vars->val_len);
++    BN_bn2bin(pub_key, dhkeychange + vars->val_len);
+ 
+     key_len = DH_size(dh);
+     if (!key_len) {
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -327,10 +327,16 @@ if test "x$tryopenssl" != "xno" -a "x$tr
+              [[#include <openssl/evp.h>]])
+ 
+             AC_CHECK_LIB(${CRYPTO}, EVP_MD_CTX_create,
+-                AC_DEFINE([HAVE_EVP_MD_CTX_CREATE], [],
++                AC_DEFINE([HAVE_EVP_MD_CTX_CREATE], [1],
+                     [Define to 1 if you have the `EVP_MD_CTX_create' function.])
+-                AC_DEFINE([HAVE_EVP_MD_CTX_DESTROY], [],
++                AC_DEFINE([HAVE_EVP_MD_CTX_DESTROY], [1],
+                     [Define to 1 if you have the `EVP_MD_CTX_destroy' function.]))
++
++            AC_CHECK_LIB(${CRYPTO}, EVP_MD_CTX_new,
++                AC_DEFINE([HAVE_EVP_MD_CTX_NEW], [1],
++                    [Define to 1 if you have the `EVP_MD_CTX_new' function.])
++                AC_DEFINE([HAVE_EVP_MD_CTX_FREE], [1],
++                    [Define to 1 if you have the `EVP_MD_CTX_free' function.]))
+         fi
+         if echo " $transport_result_list " | $GREP "DTLS" > /dev/null; then
+ 	    AC_CHECK_LIB(ssl, DTLSv1_method,
+--- a/include/net-snmp/net-snmp-config.h.in
++++ b/include/net-snmp/net-snmp-config.h.in
+@@ -164,6 +164,12 @@
+ /* Define to 1 if you have the `EVP_MD_CTX_destroy' function. */
+ #undef HAVE_EVP_MD_CTX_DESTROY
+ 
++/* Define to 1 if you have the `EVP_MD_CTX_free' function. */
++#undef HAVE_EVP_MD_CTX_FREE
++
++/* Define to 1 if you have the `EVP_MD_CTX_new' function. */
++#undef HAVE_EVP_MD_CTX_NEW
++
+ /* Define if you have EVP_sha224/256 in openssl */
+ #undef HAVE_EVP_SHA224
+ 
+--- a/snmplib/keytools.c
++++ b/snmplib/keytools.c
+@@ -176,7 +176,9 @@ generate_Ku(const oid * hashtype, u_int
+         QUITFUN(SNMPERR_GENERR, generate_Ku_quit);
+     }
+ 
+-#ifdef HAVE_EVP_MD_CTX_CREATE
++#ifdef HAVE_EVP_MD_CTX_NEW
++    ctx = EVP_MD_CTX_new();
++#elif HAVE_EVP_MD_CTX_CREATE
+     ctx = EVP_MD_CTX_create();
+ #else
+     ctx = malloc(sizeof(*ctx));
+@@ -278,7 +280,9 @@ generate_Ku(const oid * hashtype, u_int
+     memset(buf, 0, sizeof(buf));
+ #ifdef NETSNMP_USE_OPENSSL
+     if (ctx) {
+-#ifdef HAVE_EVP_MD_CTX_DESTROY
++#ifdef HAVE_EVP_MD_CTX_FREE
++        EVP_MD_CTX_free(ctx);
++#elif HAVE_EVP_MD_CTX_DESTROY
+         EVP_MD_CTX_destroy(ctx);
+ #else
+         EVP_MD_CTX_cleanup(ctx);
+--- a/snmplib/scapi.c
++++ b/snmplib/scapi.c
+@@ -627,7 +627,9 @@ sc_hash(const oid * hashtype, size_t has
+         return SNMPERR_GENERR;
+ 
+ /** initialize the pointer */
+-#ifdef HAVE_EVP_MD_CTX_CREATE
++#ifdef HAVE_EVP_MD_CTX_NEW
++    cptr = EVP_MD_CTX_new();
++#elif HAVE_EVP_MD_CTX_CREATE
+     cptr = EVP_MD_CTX_create();
+ #else
+     cptr = malloc(sizeof(*cptr));
+@@ -648,7 +650,9 @@ sc_hash(const oid * hashtype, size_t has
+ /** do the final pass */
+     EVP_DigestFinal(cptr, MAC, &tmp_len);
+     *MAC_len = tmp_len;
+-#ifdef HAVE_EVP_MD_CTX_DESTROY
++#ifdef HAVE_EVP_MD_CTX_FREE
++    EVP_MD_CTX_free(cptr);
++#elif HAVE_EVP_MD_CTX_DESTROY
+     EVP_MD_CTX_destroy(cptr);
+ #else
+ #if !defined(OLD_DES)
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index faf73a563..ef71c6181 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -33,6 +33,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            file://net-snmp-fix-for-disable-des.patch \
            file://0001-Remove-U64-typedef.patch \
+           file://fix-openssl-build-errors.patch \
            "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
-- 
2.11.0


