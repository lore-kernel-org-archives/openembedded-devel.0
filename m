Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id B04BD60559
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 09:06:24 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n15so5963930wiw.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 02:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WQXRRHgjFsxJdoFyG1FGarLWgWQbXLmnz7PlvRFdfrQ=;
	b=hLqrwAIvqaurUZw0e2D2wfx5fMA1yMRqpgjPTCeky9G/Y8hWb3c85yHn9Cv/nNUbzF
	Cwum/oE1+VjPgZF4Mw6TwOZLpkUG9C9yCQSLLHU37YMqtzjEn9+cHdBJiYWNK6C7y3Ob
	V3xqK/aAjNAzmNDIqF+WU9BwHzbgeR3sceUwJXb3QYfCYTbznxq1iGowvPAydD1YuXwm
	eBk9kavYUZpOMrtPiUv4mUH2sf26b1T3Iv9VNWzsnJtO/rSvIAuitRorXAtuMPtEcpwJ
	IML1WU4rqs0eCOaeZYFxFYWOupBcJ3I3I1JCy6RmVjURT8joqpbSK17UjstyR6hJ145n
	MtlQ==
X-Gm-Message-State: ALoCoQkGk6xIdsbUJ7aeOaL0xvahPQdfWfF9aRt4nXkZMf8JuXRTl/OpM2oFvc/JcQkNd8nTVa05
X-Received: by 10.194.62.210 with SMTP id a18mr10616789wjs.4.1399453585470;
	Wed, 07 May 2014 02:06:25 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	gp15sm25801597wjc.10.2014.05.07.02.06.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 02:06:24 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 11:06:22 +0200
Message-Id: <1399453582-13107-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv2] openldap: fix build against gnutls3
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
X-List-Received-Date: Wed, 07 May 2014 09:06:27 -0000

OE-core update from gnutls2 to gnutls3, openldap needs patches to cope with that. Also add libgcrypt to DEPENDS since openldap links against it directly now instead of through gnutls.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../0205e83f4670d10ad3c6ae4b8fc5ec1d0c7020c0.patch | 44 ++++++++++++++++++++++
 .../openldap-2.4.28-gnutls-gcrypt.patch            | 17 +++++++++
 .../recipes-support/openldap/openldap_2.4.23.bb    |  4 +-
 3 files changed, 64 insertions(+), 1 deletion(-)
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
index 5c6f9ea..306a786 100644
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
@@ -48,7 +50,7 @@ PACKAGECONFIG ??= "gnutls modules \
                    ldap meta monitor null passwd shell proxycache dnssrv \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
-PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls"
+PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls libgcrypt"
 PACKAGECONFIG[openssl] = "--with-tls=openssl,,openssl"
 
 PACKAGECONFIG[sasl] = "--with-cyrus-sasl,--without-cyrus-sasl,cyrus-sasl"
-- 
1.9.0


