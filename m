Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CEEC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:20:59 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.58793.1715602853674630547
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 05:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EwXrO0N4;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: pdoshi@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f4ed9dc7beso1291490b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1715602853; x=1716207653; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbBtVc936UM0hTa/+YD3VHyjDcm0U75Dzr4X9q/83GI=;
        b=EwXrO0N4C6I5YpnzqVbfzEnqIWFyaeMRzi5NPMzK3Njt/KZ6f8c/6+C6EYBcNMj02N
         Kiw7sR1XombyR3/p5kO3GWOZKxqP/4syBGfa+P77eMev6xDq9ke43GlbgkNFGdnQOWzY
         1l5P6C57W36rPO51KZQ2ERSRMlQpzjKO0JTQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715602853; x=1716207653;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbBtVc936UM0hTa/+YD3VHyjDcm0U75Dzr4X9q/83GI=;
        b=f+Drk1H6bhSvoBpSB2LEzYPHMOY/YymXUQV7D+mRx5GIoFbuI3Hc1X+g5PXEq3aKss
         UHOoKtus9LmMVLbcNiwZJDE+N/qqY9T6jCBcPLFnR3MEKwYWnpkBsXcHB7RgG6PtBSdC
         EWtTURqaNBoFRI0f5pZtXiwI0VeyUDClrF2wyu+3YjkKf0KPY+xPRfk3EO24vQ+p+xpx
         Hu3tYi087+WuiSfWrwK5dHCQDXVorckzvEPlap8lUOTHsDDX02nxuVMO9gA4Ld3JpHbo
         y3rp2Z0btEJnRcdQbV3ZeMcPVc3Jgi4Y8qu0EEQ0LeCND6BVKeVdw4SxTrNoyXsCJaWX
         Tp0g==
X-Gm-Message-State: AOJu0Ywy3AsP/Gp7G9slwU7eW9gm2x7MrttfS5yq6clEfkhmKLfx55nQ
	beeLy5hoRsZOiZDwhkafY4N2ySLQkqDVUBQOELidXmpFC3JYoOQJB6viAshBimHDepszRu1uCq7
	N
X-Google-Smtp-Source: AGHT+IEGVFm/KEcjekOUVcA6CXdOSSMTxqiA3G8fvR5AGiu0nL82CN1loM/LIjONgyRQoAZ+Ex+5cQ==
X-Received: by 2002:a05:6a21:7888:b0:1ac:3b81:2b5a with SMTP id adf61e73a8af0-1afde0b710emr15313171637.8.1715602852898;
        Mon, 13 May 2024 05:20:52 -0700 (PDT)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f6608586e2sm682879b3a.85.2024.05.13.05.20.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2024 05:20:51 -0700 (PDT)
From: pdoshi@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [oe] [meta-oe][kirkstone][PATCH V1] ITS#10094 libldap/OpenSSL: fix setting ciphersuites
Date: Mon, 13 May 2024 17:50:45 +0530
Message-Id: <1715602845-8547-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 12:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110338

From: Priyal Doshi <pdoshi@mvista.com>

Backport-from: https://git.openldap.org/openldap/openldap/-/merge_requests/654/diffs?commit_id=8c482cec9a68e74b3609b1e44738bee352f6577a

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 ...-libldap-OpenSSL-fix-setting-ciphersuites.patch | 69 ++++++++++++++++++++++
 .../recipes-support/openldap/openldap_2.5.16.bb    |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch b/meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch
new file mode 100644
index 0000000..211dbe9
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch
@@ -0,0 +1,69 @@
+From 7cee69298857e2393799780ee472dfe0a378ee2d Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Thu, 12 Oct 2023 17:22:48 +0100
+Subject: [PATCH] ITS#10094 libldap/OpenSSL: fix setting ciphersuites
+
+Don't try old-style ciphersuite list if only v1.3 or newer ciphers were specified
+
+Upstream-Status: Backport from https://git.openldap.org/openldap/openldap/-/merge_requests/654/diffs?commit_id=8c482cec9a68e74b3609b1e44738bee352f6577a
+
+Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
+---
+ libraries/libldap/tls_o.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/libraries/libldap/tls_o.c b/libraries/libldap/tls_o.c
+index d6405bc..4123a9b 100644
+--- a/libraries/libldap/tls_o.c
++++ b/libraries/libldap/tls_o.c
+@@ -294,7 +294,7 @@ tlso_stecpy( char *dst, const char *src, const char *end )
+  * Try to find any TLS1.3 ciphers in the given list of suites.
+  */
+ static void
+-tlso_ctx_cipher13( tlso_ctx *ctx, char *suites )
++tlso_ctx_cipher13( tlso_ctx *ctx, char *suites, char **oldsuites )
+ {
+ 	char tls13_suites[1024], *ts = tls13_suites, *te = tls13_suites + sizeof(tls13_suites);
+ 	char *ptr, *colon, *nptr;
+@@ -303,6 +303,8 @@ tlso_ctx_cipher13( tlso_ctx *ctx, char *suites )
+ 	SSL *s = SSL_new( ctx );
+ 	int ret;
+ 
++	*oldsuites = NULL;
++
+ 	if ( !s )
+ 		return;
+ 
+@@ -334,8 +336,15 @@ tlso_ctx_cipher13( tlso_ctx *ctx, char *suites )
+ 					if ( tls13_suites[0] )
+ 						ts = tlso_stecpy( ts, ":", te );
+ 					ts = tlso_stecpy( ts, nptr, te );
++				} else if (! *oldsuites) {
++					/* should never happen, set_ciphersuites should
++					 * only succeed for TLSv1.3 and above
++					 */
++					*oldsuites = ptr;
+ 				}
+ 			}
++		} else if (! *oldsuites) {
++			*oldsuites = ptr;
+ 		}
+ 		if ( !colon || ts >= te )
+ 			break;
+@@ -415,10 +424,11 @@ tlso_ctx_init( struct ldapoptions *lo, struct ldaptls *lt, int is_server )
+ 	}
+ 
+ 	if ( lo->ldo_tls_ciphersuite ) {
++		char *oldsuites = lt->lt_ciphersuite;
+ #if OPENSSL_VERSION_NUMBER >= 0x10101000
+-		tlso_ctx_cipher13( ctx, lt->lt_ciphersuite );
++		tlso_ctx_cipher13( ctx, lt->lt_ciphersuite, &oldsuites );
+ #endif
+-		if ( !SSL_CTX_set_cipher_list( ctx, lt->lt_ciphersuite ) )
++		if ( oldsuites && !SSL_CTX_set_cipher_list( ctx, oldsuites ) )
+ 		{
+ 			Debug1( LDAP_DEBUG_ANY,
+ 				   "TLS: could not set cipher list %s.\n",
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.16.bb b/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
index 9e9d059..7e1c8fd 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
+    file://0001-ITS-10094-libldap-OpenSSL-fix-setting-ciphersuites.patch \
 "
 
 SRC_URI[sha256sum] = "546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327"
-- 
2.7.4


