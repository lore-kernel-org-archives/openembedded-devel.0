Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 240E565C78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 02:39:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4Q2dRgK012073
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 19:39:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 25 May 2015 19:39:27 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 May 2015 10:33:56 +0800
Message-ID: <1432607636-4430-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] openldap: upgrade to 2.4.20
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
X-List-Received-Date: Tue, 26 May 2015 02:39:28 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. upgrade to 2.4.20
2. remove two backup patches
2. integrate two patches to fix CVE-2015-1545 and CVE-2015-1546
3. disable bdb/hdb backend, since BerkeleyDB 6.0.20+ license is
   incompatible with LDAP

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../ITS-7723-fix-reference-counting.patch          | 38 -------------------
 .../gnutls-Avoid-use-of-deprecated-function.patch  | 44 ----------------------
 ...-ITS-8027-require-non-empty-AttributeList.patch | 30 +++++++++++++++
 .../0001-ITS-8046-fix-vrFilter_free.patch          | 38 +++++++++++++++++++
 .../initscript                                     |  0
 .../install-strip.patch                            |  0
 .../kill-icu.patch                                 |  0
 .../openldap-2.4.28-gnutls-gcrypt.patch            |  0
 .../openldap-m4-pthread.patch                      |  0
 .../slapd.service                                  |  0
 .../thread_stub.patch                              |  0
 .../use-urandom.patch                              |  0
 .../{openldap_2.4.39.bb => openldap_2.4.40.bb}     | 10 ++---
 13 files changed, 73 insertions(+), 87 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/ITS-7723-fix-reference-counting.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/gnutls-Avoid-use-of-deprecated-function.patch
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8027-require-non-empty-AttributeList.patch
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8046-fix-vrFilter_free.patch
 rename meta-oe/recipes-support/openldap/{openldap-2.4.39 => openldap-2.4.40}/initscript (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.39 => openldap-2.4.40}/install-strip.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.39 => openldap-2.4.40}/kill-icu.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.39 => openldap-2.4.40}/openldap-2.4.28-gnutls-gcrypt.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.39 => openldap-2.4.40}/openldap-m4-pthread.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.39 => openldap-2.4.40}/slapd.service (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.39 => openldap-2.4.40}/thread_stub.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap-2.4.39 => openldap-2.4.40}/use-urandom.patch (100%)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.39.bb => openldap_2.4.40.bb} (96%)

diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/ITS-7723-fix-reference-counting.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/ITS-7723-fix-reference-counting.patch
deleted file mode 100644
index 9a0f4cb..0000000
--- a/meta-oe/recipes-support/openldap/openldap-2.4.39/ITS-7723-fix-reference-counting.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 59688044386dfeee0c837a15133f4e878f1bb661 Mon Sep 17 00:00:00 2001
-From: Jan Synacek <jsynacek@redhat.com>
-Date: Wed, 13 Nov 2013 09:06:54 +0100
-Subject: [PATCH] ITS#7723 fix reference counting
-
-Upstream-Status: Backport
-
-Commit 59688044386dfeee0c837a15133f4e878f1bb661 upstream
-
-Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- libraries/librewrite/session.c |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/libraries/librewrite/session.c b/libraries/librewrite/session.c
-index fcc7698..02fc054 100644
---- a/libraries/librewrite/session.c
-+++ b/libraries/librewrite/session.c
-@@ -161,6 +161,7 @@ rewrite_session_find(
- #ifdef USE_REWRITE_LDAP_PVT_THREADS
- 	if ( session ) {
- 		ldap_pvt_thread_mutex_lock( &session->ls_mutex );
-+		session->ls_count++;
- 	}
- 	ldap_pvt_thread_rdwr_runlock( &info->li_cookies_mutex );
- #endif /* USE_REWRITE_LDAP_PVT_THREADS */
-@@ -178,6 +179,7 @@ rewrite_session_return(
- )
- {
- 	assert( session != NULL );
-+	session->ls_count--;
- 	ldap_pvt_thread_mutex_unlock( &session->ls_mutex );
- }
- 
--- 
-1.7.5.4
-
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/gnutls-Avoid-use-of-deprecated-function.patch b/meta-oe/recipes-support/openldap/openldap-2.4.39/gnutls-Avoid-use-of-deprecated-function.patch
deleted file mode 100644
index dffd3ca..0000000
--- a/meta-oe/recipes-support/openldap/openldap-2.4.39/gnutls-Avoid-use-of-deprecated-function.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0 Mon Sep 17 00:00:00 2001
-From: Howard Chu <hyc@openldap.org>
-Date: Sat, 7 Sep 2013 09:39:24 -0700
-Subject: [PATCH] ITS#7430 GnuTLS: Avoid use of deprecated function
-
-Upstream-status: Backport
-
----
- libraries/libldap/tls_g.c |   12 ++++++++++++
- 1 files changed, 12 insertions(+), 0 deletions(-)
-
-diff --git a/libraries/libldap/tls_g.c b/libraries/libldap/tls_g.c
-index 9acffaf..c793828 100644
---- a/libraries/libldap/tls_g.c
-+++ b/libraries/libldap/tls_g.c
-@@ -368,6 +368,17 @@ tlsg_ctx_init( struct ldapoptions *lo, struct ldaptls *lt, int is_server )
- 		 * then we have to build the cert chain.
- 		 */
- 		if ( max == 1 && !gnutls_x509_crt_check_issuer( certs[0], certs[0] )) {
-+#if GNUTLS_VERSION_NUMBER >= 0x020c00
-+			unsigned int i;
-+			for ( i = 1; i<VERIFY_DEPTH; i++ ) {
-+				if ( gnutls_certificate_get_issuer( ctx->cred, certs[i-1], &certs[i], 0 ))
-+					break;
-+				max++;
-+				/* If this CA is self-signed, we're done */
-+				if ( gnutls_x509_crt_check_issuer( certs[i], certs[i] ))
-+					break;
-+			}
-+#else
- 			gnutls_x509_crt_t *cas;
- 			unsigned int i, j, ncas;
- 
-@@ -387,6 +398,7 @@ tlsg_ctx_init( struct ldapoptions *lo, struct ldaptls *lt, int is_server )
- 				if ( j == ncas )
- 					break;
- 			}
-+#endif
- 		}
- 		rc = gnutls_certificate_set_x509_key( ctx->cred, certs, max, key );
- 		if ( rc ) return -1;
--- 
-1.7.4.2
-
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8027-require-non-empty-AttributeList.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8027-require-non-empty-AttributeList.patch
new file mode 100644
index 0000000..91c2178
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8027-require-non-empty-AttributeList.patch
@@ -0,0 +1,30 @@
+From c32e74763f77675b9e144126e375977ed6dc562c Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Mon, 19 Jan 2015 22:25:53 +0000
+Subject: [PATCH] ITS#8027 require non-empty AttributeList
+
+Upstream-Status: Backup
+
+Fix the CVE: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1545
+
+---
+ servers/slapd/overlays/deref.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/servers/slapd/overlays/deref.c b/servers/slapd/overlays/deref.c
+index 9420e3e..05aa890 100644
+--- a/servers/slapd/overlays/deref.c
++++ b/servers/slapd/overlays/deref.c
+@@ -183,7 +183,8 @@ deref_parseCtrl (
+ 		ber_len_t cnt = sizeof(struct berval);
+ 		ber_len_t off = 0;
+ 
+-		if ( ber_scanf( ber, "{m{M}}", &derefAttr, &attributes, &cnt, off ) == LBER_ERROR )
++		if ( ber_scanf( ber, "{m{M}}", &derefAttr, &attributes, &cnt, off ) == LBER_ERROR
++			|| !cnt )
+ 		{
+ 			rs->sr_text = "Dereference control: derefSpec decoding error";
+ 			rs->sr_err = LDAP_PROTOCOL_ERROR;
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8046-fix-vrFilter_free.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8046-fix-vrFilter_free.patch
new file mode 100644
index 0000000..8a5c95f
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.40/0001-ITS-8046-fix-vrFilter_free.patch
@@ -0,0 +1,38 @@
+From 2f1a2dd329b91afe561cd06b872d09630d4edb6a Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Wed, 4 Feb 2015 02:03:55 +0000
+Subject: [PATCH] ITS#8046 fix vrFilter_free
+
+Upstream-Statue: Backup
+
+Fix CVE: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1546
+
+---
+ servers/slapd/filter.c | 10 +++-------
+ 1 file changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/servers/slapd/filter.c b/servers/slapd/filter.c
+index b859f73..22c81c8 100644
+--- a/servers/slapd/filter.c
++++ b/servers/slapd/filter.c
+@@ -1158,14 +1158,10 @@ get_vrFilter( Operation *op, BerElement *ber,
+ void
+ vrFilter_free( Operation *op, ValuesReturnFilter *vrf )
+ {
+-	ValuesReturnFilter	*p, *next;
++	ValuesReturnFilter	*next;
+ 
+-	if ( vrf == NULL ) {
+-		return;
+-	}
+-
+-	for ( p = vrf; p != NULL; p = next ) {
+-		next = p->vrf_next;
++	for ( ; vrf != NULL; vrf = next ) {
++		next = vrf->vrf_next;
+ 
+ 		switch ( vrf->vrf_choice & SLAPD_FILTER_MASK ) {
+ 		case LDAP_FILTER_PRESENT:
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/initscript b/meta-oe/recipes-support/openldap/openldap-2.4.40/initscript
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.39/initscript
rename to meta-oe/recipes-support/openldap/openldap-2.4.40/initscript
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/install-strip.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/install-strip.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.39/install-strip.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.40/install-strip.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/kill-icu.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/kill-icu.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.39/kill-icu.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.40/kill-icu.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/openldap-2.4.28-gnutls-gcrypt.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.39/openldap-2.4.28-gnutls-gcrypt.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.40/openldap-2.4.28-gnutls-gcrypt.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/openldap-m4-pthread.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/openldap-m4-pthread.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.39/openldap-m4-pthread.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.40/openldap-m4-pthread.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/slapd.service b/meta-oe/recipes-support/openldap/openldap-2.4.40/slapd.service
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.39/slapd.service
rename to meta-oe/recipes-support/openldap/openldap-2.4.40/slapd.service
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/thread_stub.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/thread_stub.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.39/thread_stub.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.40/thread_stub.patch
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/use-urandom.patch b/meta-oe/recipes-support/openldap/openldap-2.4.40/use-urandom.patch
similarity index 100%
rename from meta-oe/recipes-support/openldap/openldap-2.4.39/use-urandom.patch
rename to meta-oe/recipes-support/openldap/openldap-2.4.40/use-urandom.patch
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.39.bb b/meta-oe/recipes-support/openldap/openldap_2.4.40.bb
similarity index 96%
rename from meta-oe/recipes-support/openldap/openldap_2.4.39.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.40.bb
index 0183d02..5afcb6a 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.40.bb
@@ -19,16 +19,16 @@ LDAP_VER = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://openldap-m4-pthread.patch \
     file://kill-icu.patch \
-    file://gnutls-Avoid-use-of-deprecated-function.patch \
     file://openldap-2.4.28-gnutls-gcrypt.patch \
-    file://ITS-7723-fix-reference-counting.patch \
     file://use-urandom.patch \
     file://initscript \
     file://slapd.service \
     file://thread_stub.patch \
+    file://0001-ITS-8027-require-non-empty-AttributeList.patch \
+    file://0001-ITS-8046-fix-vrFilter_free.patch \
 "
-SRC_URI[md5sum] = "b0d5ee4b252c841dec6b332d679cf943"
-SRC_URI[sha256sum] = "8267c87347103fef56b783b24877c0feda1063d3cb85d070e503d076584bf8a7"
+SRC_URI[md5sum] = "423c1f23d2a0cb96b3e9baf7e9d7dda7"
+SRC_URI[sha256sum] = "d12611a5c25b6499293c2bb7b435dc2b174db73e83f5a8cb7e34f2ce5fa6dadb"
 
 DEPENDS = "util-linux groff-native"
 
@@ -53,7 +53,7 @@ EXTRA_OECONF += "--with-yielding-select=yes"
 EXTRA_OECONF += "--enable-dynamic"
 
 PACKAGECONFIG ??= "gnutls modules \
-                   bdb hdb ldap meta monitor null passwd shell proxycache dnssrv \
+                   ldap meta monitor null passwd shell proxycache dnssrv \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
 PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls libgcrypt"
-- 
1.9.1


