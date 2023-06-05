Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263F1C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:20:01 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1813.1685949592917596869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BvklUJXs;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64d44b198baso3196905b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1685949592; x=1688541592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0rcO9ocfX58dCkIBDALQz2ZDad59pAtIwdFEGhGgfg=;
        b=BvklUJXsBZrUqeBmCSuSO17WuQGph8lPuAKzw26PtXwdlpjoE6aINetKJ2AMGYmQBT
         D8wB+Nvr0kQOzlZYzvY6r9nspwpzOiepcofw6ABKUTnQfT3Mhw+MGWPu4cUhmL81sJmG
         AJD2gXSjNUgAE6PxmcwC767aAWwKuoS72eje4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685949592; x=1688541592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0rcO9ocfX58dCkIBDALQz2ZDad59pAtIwdFEGhGgfg=;
        b=iaJz0tDn7vBDYK0umd6V0eifDmk7NBULFjxZNAXqpWDAe3EcJGQ7u810ngKDRZImDU
         NJXhLpjQdnQR2UiccoclngyDmPjW5CmNEC6hS/4k0GwG5GIr3juIAF1qrhNFu++bzlnd
         9mjqZmUPH0AOPff05s0tDZtRV7/oRItUXgr52kGNkeyC7TSc9blg0Yjjr44CmSOFPwC5
         HkUJxey05w2uI93WK+FGFmCwNUbd8rmbta7Tvi0OPLthMdnymtfLT4rJYUS9dW/wH+Xv
         rZxXZ8cGoV6n+XCWtEj5vnbauQ2As6om3rjpzXROxz7bCCLKrxcLeblNEzARP6mPyJt0
         NM8Q==
X-Gm-Message-State: AC+VfDzhV/p31URY8oaIVGt24RqczzQO6vaSrSirjb3vkj3f5E6NVBfh
	FjPQJmDO+ZRawCVoUl9G7hzgZGlJE9X3QWvj2hY=
X-Google-Smtp-Source: ACHHUZ4Gt6gwpAm7i+v5wjX30Bp9vFyaeh1koyuHBQzQgKLp/meTCJEquwi68ClEbEEfIzh5hvCIVQ==
X-Received: by 2002:a05:6a00:3016:b0:657:622b:21b5 with SMTP id ay22-20020a056a00301600b00657622b21b5mr4018659pfb.12.1685949591747;
        Mon, 05 Jun 2023 00:19:51 -0700 (PDT)
Received: from MVIN00020.mvista.com ([27.59.199.11])
        by smtp.gmail.com with ESMTPSA id s11-20020a62e70b000000b0065440a07294sm3359184pfh.95.2023.06.05.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 00:19:51 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][dunfell][PATCH] openldap: Fix CVE-2023-2953
Date: Mon,  5 Jun 2023 12:47:40 +0530
Message-Id: <20230605071740.105422-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103107

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce
&
https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d0398e78571d09fb808b]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../openldap/openldap/CVE-2023-2953-1.patch   | 30 ++++++++
 .../openldap/openldap/CVE-2023-2953-2.patch   | 76 +++++++++++++++++++
 .../openldap/openldap_2.4.57.bb               |  2 +
 3 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
 create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
new file mode 100644
index 000000000..f4b4eb95d
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
@@ -0,0 +1,30 @@
+From 752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce Mon Sep 17 00:00:00 2001
+From: Howard Chu <hyc@openldap.org>
+Date: Wed, 24 Aug 2022 14:40:51 +0100
+Subject: [PATCH] ITS#9904 ldif_open_url: check for ber_strdup failure
+
+Code present since 1999, df8f7cbb9b79be3be9205d116d1dd0b263d6861a
+
+Upstream-Status: Backport [https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce]
+CVE: CVE-2023-2953
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
index 000000000..02c43bc44
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
@@ -0,0 +1,76 @@
+From 6563fab9e2feccb0a684d0398e78571d09fb808b Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libraries/libldap/url.c | 21 ++++++++++++---------
+ 1 file changed, 12 insertions(+), 9 deletions(-)
+
+diff --git a/libraries/libldap/url.c b/libraries/libldap/url.c
+index dcf2aac9e8..493fd7ce47 100644
+--- a/libraries/libldap/url.c
++++ b/libraries/libldap/url.c
+@@ -1385,24 +1385,22 @@ ldap_url_parsehosts(
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
+@@ -1428,14 +1426,19 @@ ldap_url_parsehosts(
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
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
index e3e9caa1b..1e7e6b3d7 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
@@ -24,6 +24,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://openldap-CVE-2015-3276.patch \
     file://remove-user-host-pwd-from-version.patch \
     file://CVE-2022-29155.patch \
+    file://CVE-2023-2953-1.patch \
+    file://CVE-2023-2953-2.patch \
 "
 SRC_URI[md5sum] = "e3349456c3a66e5e6155be7ddc3f042c"
 SRC_URI[sha256sum] = "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
-- 
2.25.1


