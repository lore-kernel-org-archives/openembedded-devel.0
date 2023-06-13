Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22482C77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 06:49:35 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.7611.1686638966569959908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 23:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=gVHD+DOt;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: asharma@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-54fb3c168fcso480678a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jun 2023 23:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686638965; x=1689230965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=awZNe9LWoG9545tye80F+qgQaY/+eqybnyuVO4pBz5Q=;
        b=gVHD+DOteDPAmj2e0pRiJTJf0jh4meoSi1igOrEMZdg5Fm82Lud4sIrFP7rwhKv9pj
         ceTyrjd9KxABqPIYLe6XQtR8xqX45YjUnkPn+Ef5KJe76ixO8WGzHW1JxM+Z5eJD+IAR
         85ofDtT1KCyWffk8rm4Jz81k+cwwOC/uQ9H1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686638965; x=1689230965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awZNe9LWoG9545tye80F+qgQaY/+eqybnyuVO4pBz5Q=;
        b=LxoJXi1IEvhGEJOS2XuBNTtzzsdihxGJb/tqcdxC179UyUf8s2haT0mnQH71GoG3LA
         EkEHKmJZXrCjFL2C2G2yPrplbAAlPrUq2LQFIknNqFNXZZDsNaZO/E9xHIetv66NHoDn
         JQIXZMNkQ7dWPCGmGNNpoP5XkbAOX8oO8akwjo28GmYk7u82+6cgi/gF/pICyJ9jUwnu
         1FsPb3YVyBQOF+wvCFhgG1rOm4XjxLTDTmA3M6zLrBhoheQWo+qaknZ8LwnsG4VdFwwn
         38nbae2Ons6osxOekBwZn/mB17l6xYk4otkB9g3sQtCCieTulYwU7lrvTRpOyW9D2zGc
         3jUQ==
X-Gm-Message-State: AC+VfDz9VL8x7XAaR5KMqJ9eJzOTk8ZzyCxjm+K3EgrELpBXpYizkawe
	ZmAMPGLeT63Nsviz56COKIv6c7LM8brExu2b8FU=
X-Google-Smtp-Source: ACHHUZ7DumDKyKDmaKLaPExJHg78OCn0ANRC2aH9TfO2vEtvcbCRd/JHSs0cW1c1Vs+zYjv0tYYsug==
X-Received: by 2002:a17:902:b694:b0:1b1:a7d8:a3a1 with SMTP id c20-20020a170902b69400b001b1a7d8a3a1mr7912853pls.21.1686638965341;
        Mon, 12 Jun 2023 23:49:25 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.87.142])
        by smtp.gmail.com with ESMTPSA id jw22-20020a170903279600b001b3dada0e78sm2418056plb.258.2023.06.12.23.49.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jun 2023 23:49:25 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 13 Jun 2023 12:19:19 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] openldap: Fix CVE-2023-2953
Date: Tue, 13 Jun 2023 12:19:17 +0530
Message-Id: <20230613064917.14622-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 06:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103260

Upstream-Status: Backport
[https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce
&
https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d0398e78571d09fb808b]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../openldap/openldap/CVE-2023-2953-1.patch   | 30 ++++++++
 .../openldap/openldap/CVE-2023-2953-2.patch   | 76 +++++++++++++++++++
 .../openldap/openldap_2.5.12.bb               |  2 +
 3 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
 create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
new file mode 100644
index 0000000000..2517dac334
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
@@ -0,0 +1,30 @@
+From ea8dd2d279c5aeaf9d4672a4e95bebd99babcce1 Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Wed, 24 Aug 2022 14:40:51 +0100
+Subject: [PATCH] ITS#9904 ldif_open_url: check for ber_strdup failure
+
+Code present since 1999, df8f7cbb9b79be3be9205d116d1dd0b263d6861a
+
+Upstream-Status: Backport [https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce]
+CVE: CVE-2023-2953
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+---
+ libraries/libldap/fetch.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libraries/libldap/fetch.c b/libraries/libldap/fetch.c
+index 9e426dc647..536871bcfe 100644
+--- a/libraries/libldap/fetch.c
++++ b/libraries/libldap/fetch.c
+@@ -69,6 +69,8 @@ ldif_open_url(
+ 		}
+ 
+ 		p = ber_strdup( urlstr );
++		if ( p == NULL )
++			return NULL;
+ 
+ 		/* But we should convert to LDAP_DIRSEP before use */
+ 		if ( LDAP_DIRSEP[0] != '/' ) {
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
new file mode 100644
index 0000000000..2f24df9266
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
@@ -0,0 +1,76 @@
+From 3f2abd0b2eeec8522e50d5c4ea4992e70e8f9915 Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Thu, 25 Aug 2022 16:13:21 +0100
+Subject: [PATCH] ITS#9904 ldap_url_parsehosts: check for strdup failure
+
+Avoid unnecessary strdup in IPv6 addr parsing, check for strdup
+failure when dup'ing scheme.
+
+Code present since 2000, 8da110a9e726dbc612b302feafe0109271e6bc59
+
+Upstream-Status: Backport [https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d0398e78571d09fb808b]
+CVE: CVE-2023-2953
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+---
+ libraries/libldap/url.c | 21 ++++++++++++---------
+ 1 file changed, 12 insertions(+), 9 deletions(-)
+
+diff --git a/libraries/libldap/url.c b/libraries/libldap/url.c
+index 7e56564265..8df0abd044 100644
+--- a/libraries/libldap/url.c
++++ b/libraries/libldap/url.c
+@@ -1386,24 +1386,22 @@ ldap_url_parsehosts(
+ 		}
+ 		ludp->lud_port = port;
+ 		ludp->lud_host = specs[i];
+-		specs[i] = NULL;
+ 		p = strchr(ludp->lud_host, ':');
+ 		if (p != NULL) {
+ 			/* more than one :, IPv6 address */
+ 			if ( strchr(p+1, ':') != NULL ) {
+ 				/* allow [address] and [address]:port */
+ 				if ( *ludp->lud_host == '[' ) {
+-					p = LDAP_STRDUP(ludp->lud_host+1);
+-					/* copied, make sure we free source later */
+-					specs[i] = ludp->lud_host;
+-					ludp->lud_host = p;
+-					p = strchr( ludp->lud_host, ']' );
++					p = strchr( ludp->lud_host+1, ']' );
+ 					if ( p == NULL ) {
+ 						LDAP_FREE(ludp);
+ 						ldap_charray_free(specs);
+ 						return LDAP_PARAM_ERROR;
+ 					}
+-					*p++ = '\0';
++					/* Truncate trailing ']' and shift hostname down 1 char */
++					*p = '\0';
++					AC_MEMCPY( ludp->lud_host, ludp->lud_host+1, p - ludp->lud_host );
++					p++;
+ 					if ( *p != ':' ) {
+ 						if ( *p != '\0' ) {
+ 							LDAP_FREE(ludp);
+@@ -1429,14 +1427,19 @@ ldap_url_parsehosts(
+ 				}
+ 			}
+ 		}
+-		ldap_pvt_hex_unescape(ludp->lud_host);
+ 		ludp->lud_scheme = LDAP_STRDUP("ldap");
++		if ( ludp->lud_scheme == NULL ) {
++			LDAP_FREE(ludp);
++			ldap_charray_free(specs);
++			return LDAP_NO_MEMORY;
++		}
++		specs[i] = NULL;
++		ldap_pvt_hex_unescape(ludp->lud_host);
+ 		ludp->lud_next = *ludlist;
+ 		*ludlist = ludp;
+ 	}
+ 
+ 	/* this should be an array of NULLs now */
+-	/* except entries starting with [ */
+ 	ldap_charray_free(specs);
+ 	return LDAP_SUCCESS;
+ }
+-- 
+GitLab
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
index e4475e5069..cd29760b8c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
@@ -23,6 +23,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
     file://0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch \
     file://0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch \
+    file://CVE-2023-2953-1.patch \
+    file://CVE-2023-2953-2.patch \
 "
 
 SRC_URI[sha256sum] = "d5086cbfc49597fa7d0670a429a9054552d441b16ee8b2435412797ab0e37b96"
-- 
2.35.7


