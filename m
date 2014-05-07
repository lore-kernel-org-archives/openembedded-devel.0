Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id DEB0C605B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 06:53:57 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so512868wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 23:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mVJMMxVGWg9moRgJZhr7Vjayo8BNy6vCcohn+Ha3rKI=;
	b=kOIr92gLEcKCxajmZgyAUyLMoK2TEg1yRx+5rFrqIhZixiJV6GMLq1iHpLdDrhrolG
	lwr6ksRrvXo8DBA86hYLyu378qjN37UvGWIynfnK9uIQ/v6KkZgBwTS5Hg3vdXjKXmB1
	zpFAMyp8TZ2mOUHefoMSzvnX6j9XTN2iy+/QTFRhB5XdfJJdxsbBEDmK1YlySyNhWDZ2
	XiDW8sOuNEgilIuFZWnK3oJoRO/4TkLH1kegMiTReVV07R0fkbOSgBNfIZHPGC0b8jzj
	Y111X928MGDUzb7/+pU8zaQaacxcWJXsHRpvWzHmDst3ObREbIIf0hUuwrAQtmUeY0eY
	Pf5w==
X-Gm-Message-State: ALoCoQmEIBYQ8BGFA1w4uoW1VRGvfREQ1dyPupkuekI8Oy5ItdG9ZP3yisEWUNEnZTY5tMfF1bCK
X-Received: by 10.180.91.1 with SMTP id ca1mr24479442wib.32.1399445638349;
	Tue, 06 May 2014 23:53:58 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id n5sm29621538wiz.1.2014.05.06.23.53.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 23:53:57 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 08:53:55 +0200
Message-Id: <1399445635-29373-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] openldap: fix build against gnutls3
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
X-List-Received-Date: Wed, 07 May 2014 06:53:59 -0000

OE-core update from gnutls2 to gnutls3, openldap needs patches to cope with that.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch | 44 ++++++++++++++++++++++
 .../openldap-2.4.28-gnutls-gcrypt.patch            | 17 +++++++++
 .../recipes-support/openldap/openldap_2.4.23.bb    |  2 +
 3 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.23/0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-2.4.28-gnutls-gcrypt.patch

diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch b/meta-oe/recipes-support/openldap/openldap-2.4.23/0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch
new file mode 100644
index 0000000..dffd3ca
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.23/0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch
@@ -0,0 +1,44 @@
+From 0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0 Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Sat, 7 Sep 2013 09:39:24 -0700
+Subject: [PATCH] ITS#7430 GnuTLS: Avoid use of deprecated function
+
+Upstream-status: Backport
+
+---
+ libraries/libldap/tls_g.c |   12 ++++++++++++
+ 1 files changed, 12 insertions(+), 0 deletions(-)
+
+diff --git a/libraries/libldap/tls_g.c b/libraries/libldap/tls_g.c
+index 9acffaf..c793828 100644
+--- a/libraries/libldap/tls_g.c
++++ b/libraries/libldap/tls_g.c
+@@ -368,6 +368,17 @@ tlsg_ctx_init( struct ldapoptions *lo, struct ldaptls *lt, int is_server )
+ 		 * then we have to build the cert chain.
+ 		 */
+ 		if ( max == 1 && !gnutls_x509_crt_check_issuer( certs[0], certs[0] )) {
++#if GNUTLS_VERSION_NUMBER >= 0x020c00
++			unsigned int i;
++			for ( i = 1; i<VERIFY_DEPTH; i++ ) {
++				if ( gnutls_certificate_get_issuer( ctx->cred, certs[i-1], &certs[i], 0 ))
++					break;
++				max++;
++				/* If this CA is self-signed, we're done */
++				if ( gnutls_x509_crt_check_issuer( certs[i], certs[i] ))
++					break;
++			}
++#else
+ 			gnutls_x509_crt_t *cas;
+ 			unsigned int i, j, ncas;
+ 
+@@ -387,6 +398,7 @@ tlsg_ctx_init( struct ldapoptions *lo, struct ldaptls *lt, int is_server )
+ 				if ( j == ncas )
+ 					break;
+ 			}
++#endif
+ 		}
+ 		rc = gnutls_certificate_set_x509_key( ctx->cred, certs, max, key );
+ 		if ( rc ) return -1;
+-- 
+1.7.4.2
+
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-2.4.28-gnutls-gcrypt.patch
new file mode 100644
index 0000000..c7b1552
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.23/openldap-2.4.28-gnutls-gcrypt.patch
@@ -0,0 +1,17 @@
+From http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-nds/openldap/files/
+
+Upstream-status: Unknown
+
+--
+
+--- openldap-2.4.28/configure.in.orig	2012-02-11 22:40:36.004360795 +0000
++++ openldap-2.4.28/configure.in	2012-02-11 22:40:13.410986851 +0000
+@@ -1214,7 +1214,7 @@
+ 				ol_with_tls=gnutls
+ 				ol_link_tls=yes
+ 
+-				TLS_LIBS="-lgnutls"
++				TLS_LIBS="-lgnutls -lgcrypt"
+ 
+ 				AC_DEFINE(HAVE_GNUTLS, 1, 
+ 					[define if you have GNUtls])
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 5c6f9ea..d85de03 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -16,6 +16,8 @@ LDAP_VER = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz \
     file://openldap-m4-pthread.patch \
     file://kill-icu.patch \
+    file://0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch \
+    file://openldap-2.4.28-gnutls-gcrypt.patch \
     file://initscript \
 "
 SRC_URI[md5sum] = "90150b8c0d0192e10b30157e68844ddf"
-- 
1.9.0


