Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3341B74DCB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:48 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id 31-v6so5766169plc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y4o8J9Km1uYhzVtrFnjqF+l6mlJwFjRodNZbPipZddU=;
	b=dqBA8huBEOYLUbD2i1521YH80kVGsVGKUplrWtDi31QtgR7U94mMstSpdG2o25o3rM
	CIDPgY8tiaG0X5uuOHQOHLe6dvKg0h/U6IvdI9w+Lu3zLMlJtMZVNaq72Nsm7zOtTbZs
	6sKwz151B+rVD/jq9xQXjrcVHP7NoPUNALHyJlTPuX1auw6GdlQdxH35XIodTnQTXg8/
	MilzqapVRYxik/Ijf7mpT41IeFfqWh6n5NtQL7HJ1xe7jevQmE+Sd0BFxgBRAyokdrHJ
	fV2RmP0AJNEfkLwGNSL8s+8RzC/auJWDIyW+9U6WwmKxpK8pmDiJzEKXC5UKsd86EtSx
	jrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=y4o8J9Km1uYhzVtrFnjqF+l6mlJwFjRodNZbPipZddU=;
	b=VHjL9DbzMF0rO62X68TliDY6+cfl9Vc/Ryve5BdCbWCYrQBmp5vjegjV9KxugrRw73
	I1sExM7CEP2xkVM77yhsJVg2lDrcbG8W64MNVRpD2fJZxeQ6BjM5v6e1m1ZH7zy5w5pi
	rsPfaviSBt57zSUCCdn6kZu0hn4AMvoRk6ztg3qgrinfnGzfLVuo0/RdcqXRPO51Z5KA
	AXBuxKZryQdHyiZhIIs8BOdejJPJ86Mp6RkFb+6izIUO7MccDi/y3qq1rDsiv2P11khP
	OAo0xMFdDuPugu82lkXmbDAKQ8b31gQ/efTof2EkxfeBnGLOiiNhs7Ck1WeS2sJ2HUZv
	zSQQ==
X-Gm-Message-State: APt69E01hSD7/SBqI1+kM/xStbu4+n0KzWGdS0/yeyOaaS14s/Bv8rCv
	et+Nic32CMj7SSzYrO/RVJKKgQ==
X-Google-Smtp-Source: ADUXVKISgQ0EF3kIK/6F1Yyz+AfnNLgxryV3m/GA5DlszA6MCy73vs3xIi4x3IML54XuRg8Otl4VnA==
X-Received: by 2002:a17:902:8d96:: with SMTP id
	v22-v6mr9531159plo.176.1529867988981; 
	Sun, 24 Jun 2018 12:19:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:44 -0700
Message-Id: <20180624191845.31082-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 19/20] net-snmp: Refresh openssl support patch
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:48 -0000

Avoid fuzz warnings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../net-snmp/fix-openssl-build-errors.patch   | 50 +++++++++++--------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch
index 53bc372267..5c6436c343 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/fix-openssl-build-errors.patch
@@ -5,8 +5,10 @@ OpenSSL 1.0.x and 1.1.x.
 
 Author: Sharmila Podury <sharmila.podury@brocade.com>
 
---- a/apps/snmpusm.c
-+++ b/apps/snmpusm.c
+Index: net-snmp-5.7.3/apps/snmpusm.c
+===================================================================
+--- net-snmp-5.7.3.orig/apps/snmpusm.c
++++ net-snmp-5.7.3/apps/snmpusm.c
 @@ -125,6 +125,32 @@ char           *usmUserPublic_val = NULL
  int             docreateandwait = 0;
  
@@ -85,10 +87,12 @@ Author: Sharmila Podury <sharmila.podury@brocade.com>
  
      key_len = DH_size(dh);
      if (!key_len) {
---- a/configure.d/config_os_libs2
-+++ b/configure.d/config_os_libs2
-@@ -327,10 +327,16 @@ if test "x$tryopenssl" != "xno" -a "x$tr
-              [[#include <openssl/evp.h>]])
+Index: net-snmp-5.7.3/configure.d/config_os_libs2
+===================================================================
+--- net-snmp-5.7.3.orig/configure.d/config_os_libs2
++++ net-snmp-5.7.3/configure.d/config_os_libs2
+@@ -293,10 +293,16 @@ if test "x$tryopenssl" != "xno" -a "x$tr
+                     [Define to 1 if you have the `AES_cfb128_encrypt' function.]))
  
              AC_CHECK_LIB(${CRYPTO}, EVP_MD_CTX_create,
 -                AC_DEFINE([HAVE_EVP_MD_CTX_CREATE], [],
@@ -106,9 +110,11 @@ Author: Sharmila Podury <sharmila.podury@brocade.com>
          fi
          if echo " $transport_result_list " | $GREP "DTLS" > /dev/null; then
  	    AC_CHECK_LIB(ssl, DTLSv1_method,
---- a/include/net-snmp/net-snmp-config.h.in
-+++ b/include/net-snmp/net-snmp-config.h.in
-@@ -164,6 +164,12 @@
+Index: net-snmp-5.7.3/include/net-snmp/net-snmp-config.h.in
+===================================================================
+--- net-snmp-5.7.3.orig/include/net-snmp/net-snmp-config.h.in
++++ net-snmp-5.7.3/include/net-snmp/net-snmp-config.h.in
+@@ -155,6 +155,12 @@
  /* Define to 1 if you have the `EVP_MD_CTX_destroy' function. */
  #undef HAVE_EVP_MD_CTX_DESTROY
  
@@ -121,11 +127,13 @@ Author: Sharmila Podury <sharmila.podury@brocade.com>
  /* Define if you have EVP_sha224/256 in openssl */
  #undef HAVE_EVP_SHA224
  
---- a/snmplib/keytools.c
-+++ b/snmplib/keytools.c
-@@ -176,7 +176,9 @@ generate_Ku(const oid * hashtype, u_int
-         QUITFUN(SNMPERR_GENERR, generate_Ku_quit);
-     }
+Index: net-snmp-5.7.3/snmplib/keytools.c
+===================================================================
+--- net-snmp-5.7.3.orig/snmplib/keytools.c
++++ net-snmp-5.7.3/snmplib/keytools.c
+@@ -149,7 +149,9 @@ generate_Ku(const oid * hashtype, u_int
+      */
+ #ifdef NETSNMP_USE_OPENSSL
  
 -#ifdef HAVE_EVP_MD_CTX_CREATE
 +#ifdef HAVE_EVP_MD_CTX_NEW
@@ -134,7 +142,7 @@ Author: Sharmila Podury <sharmila.podury@brocade.com>
      ctx = EVP_MD_CTX_create();
  #else
      ctx = malloc(sizeof(*ctx));
-@@ -278,7 +280,9 @@ generate_Ku(const oid * hashtype, u_int
+@@ -258,7 +260,9 @@ generate_Ku(const oid * hashtype, u_int
      memset(buf, 0, sizeof(buf));
  #ifdef NETSNMP_USE_OPENSSL
      if (ctx) {
@@ -145,10 +153,12 @@ Author: Sharmila Podury <sharmila.podury@brocade.com>
          EVP_MD_CTX_destroy(ctx);
  #else
          EVP_MD_CTX_cleanup(ctx);
---- a/snmplib/scapi.c
-+++ b/snmplib/scapi.c
-@@ -627,7 +627,9 @@ sc_hash(const oid * hashtype, size_t has
-         return SNMPERR_GENERR;
+Index: net-snmp-5.7.3/snmplib/scapi.c
+===================================================================
+--- net-snmp-5.7.3.orig/snmplib/scapi.c
++++ net-snmp-5.7.3/snmplib/scapi.c
+@@ -488,7 +488,9 @@ sc_hash(const oid * hashtype, size_t has
+     }
  
  /** initialize the pointer */
 -#ifdef HAVE_EVP_MD_CTX_CREATE
@@ -158,7 +168,7 @@ Author: Sharmila Podury <sharmila.podury@brocade.com>
      cptr = EVP_MD_CTX_create();
  #else
      cptr = malloc(sizeof(*cptr));
-@@ -648,7 +650,9 @@ sc_hash(const oid * hashtype, size_t has
+@@ -509,7 +511,9 @@ sc_hash(const oid * hashtype, size_t has
  /** do the final pass */
      EVP_DigestFinal(cptr, MAC, &tmp_len);
      *MAC_len = tmp_len;
-- 
2.18.0


