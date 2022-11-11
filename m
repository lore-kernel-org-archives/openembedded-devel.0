Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D3EC43217
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 05:16:21 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.2230.1668143772515830760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 21:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RZ8e3ws7;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id b62so3597171pgc.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 21:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvM9rdSIWlEBmH4meDgz5VtY5OEyJ+tmqGDTfIvP+nQ=;
        b=RZ8e3ws7J+R8FU29GV/peXt88jzJUSSjf5FmQjY+udCH5RJAra9K13nDAhl+u8Jxiv
         AZJ89VkIXZG40CwiuN4uOl8NQDnnnONFZMtoI4WhDa0RAeqefKMupkj8S85nUXHZAw58
         K5jC0F/SlVYCVKa3kxW0qEzNjZievcBe29z/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvM9rdSIWlEBmH4meDgz5VtY5OEyJ+tmqGDTfIvP+nQ=;
        b=XWp4Ln2KCjncYmWxjVQW/0mIE4a0xhMgPB1JieR/io0nMSqCxo6oAotcenVZEkczAF
         gemL/Ux3uIlo3/Muj97yCiqrR3UMXxZaqpcxLI7qnTesJ9Mpp8UvrYPb/a9vYqa/GNyj
         fE6XQnmGD2RVY7IygHwGHeeh2KUpyX18vlmzbkgNjN4Ogtasw/wJZyj/gxhnwCcWPRFs
         upbTTztyIMLukWmZg94XkQB7wxJ8ctcXohJNbgHU5EdsofJ8JJMZIZB6ffyT2E1PTbz/
         6h7qIhtyhLDtmXUnEkQJ4xUkhr+SBjLYrMMXvU9g070E3F/k8Vvxp9TvFPfpXc6UUquD
         CSGw==
X-Gm-Message-State: ANoB5pna9WE/dvjZ8e/sw+PXrpapLwcYU9nC8DwDbkXXm0tWMegEIFX3
	+jEKsCbNzaXRiFOXpev9vjw1OqMumxN/Vg==
X-Google-Smtp-Source: AA0mqf7jCp2gxSqEWWkS33VC2dMvDdw6JExuBGO75S2yEB3KFghPDy2fzMHL7IbRI+a463amfgCz0Q==
X-Received: by 2002:a63:fa18:0:b0:464:3f16:e2b0 with SMTP id y24-20020a63fa18000000b004643f16e2b0mr170030pgh.566.1668143771524;
        Thu, 10 Nov 2022 21:16:11 -0800 (PST)
Received: from MVIN00024 ([49.34.234.22])
        by smtp.gmail.com with ESMTPSA id 135-20020a62178d000000b0056da073b2b7sm561918pfx.210.2022.11.10.21.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 21:16:11 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Fri, 11 Nov 2022 10:43:54 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] strongswan: CVE-2022-40617 A possible DoS in Using Untrusted URIs for Revocation Checking
Date: Fri, 11 Nov 2022 10:43:52 +0530
Message-Id: <20221111051352.44135-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 05:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99552

Upstream-Status: Backport from https://download.strongswan.org/security/CVE-2022-40617

Affects "strongswan < 5.9.8"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../strongswan/files/CVE-2022-40617.patch     | 157 ++++++++++++++++++
 .../strongswan/strongswan_5.9.6.bb            |   1 +
 2 files changed, 158 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2022-40617.patch

diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2022-40617.patch b/meta-networking/recipes-support/strongswan/files/CVE-2022-40617.patch
new file mode 100644
index 000000000..ffef6800e
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2022-40617.patch
@@ -0,0 +1,157 @@
+From 6a6c275534e31b41f6d203cfd92685b7526a45e8 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 11 Nov 2022 10:15:38 +0530
+Subject: [PATCH] CVE-2022-40617
+
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2022-40617]
+CVE: CVE-2022-40617
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+credential-manager: Do online revocation checks only after
+ basic trust chain validation
+
+This avoids querying URLs of potentially untrusted certificates, e.g. if
+an attacker sends a specially crafted end-entity and intermediate CA
+certificate with a CDP that points to a server that completes the
+TCP handshake but then does not send any further data, which will block
+the fetcher thread (depending on the plugin) for as long as the default
+timeout for TCP.  Doing that multiple times will block all worker threads,
+leading to a DoS attack.
+
+The logging during the certificate verification obviously changes.
+---
+ .../credentials/credential_manager.c          | 54 +++++++++++++++----
+ 1 file changed, 45 insertions(+), 9 deletions(-)
+
+diff --git a/src/libstrongswan/credentials/credential_manager.c b/src/libstrongswan/credentials/credential_manager.c
+index 3be0190..f65372b 100644
+--- a/src/libstrongswan/credentials/credential_manager.c
++++ b/src/libstrongswan/credentials/credential_manager.c
+@@ -555,7 +555,7 @@ static void cache_queue(private_credential_manager_t *this)
+  */
+ static bool check_lifetime(private_credential_manager_t *this,
+ 						   certificate_t *cert, char *label,
+-						   int pathlen, bool trusted, auth_cfg_t *auth)
++						   int pathlen, bool anchor, auth_cfg_t *auth)
+ {
+ 	time_t not_before, not_after;
+ 	cert_validator_t *validator;
+@@ -570,7 +570,7 @@ static bool check_lifetime(private_credential_manager_t *this,
+ 			continue;
+ 		}
+ 		status = validator->check_lifetime(validator, cert,
+-										   pathlen, trusted, auth);
++										   pathlen, anchor, auth);
+ 		if (status != NEED_MORE)
+ 		{
+ 			break;
+@@ -603,13 +603,13 @@ static bool check_lifetime(private_credential_manager_t *this,
+  */
+ static bool check_certificate(private_credential_manager_t *this,
+ 				certificate_t *subject, certificate_t *issuer, bool online,
+-				int pathlen, bool trusted, auth_cfg_t *auth)
++				int pathlen, bool anchor, auth_cfg_t *auth)
+ {
+ 	cert_validator_t *validator;
+ 	enumerator_t *enumerator;
+ 
+ 	if (!check_lifetime(this, subject, "subject", pathlen, FALSE, auth) ||
+-		!check_lifetime(this, issuer, "issuer", pathlen + 1, trusted, auth))
++		!check_lifetime(this, issuer, "issuer", pathlen + 1, anchor, auth))
+ 	{
+ 		return FALSE;
+ 	}
+@@ -622,7 +622,7 @@ static bool check_certificate(private_credential_manager_t *this,
+ 			continue;
+ 		}
+ 		if (!validator->validate(validator, subject, issuer,
+-								 online, pathlen, trusted, auth))
++								 online, pathlen, anchor, auth))
+ 		{
+ 			enumerator->destroy(enumerator);
+ 			return FALSE;
+@@ -725,6 +725,7 @@ static bool verify_trust_chain(private_credential_manager_t *this,
+ 	auth_cfg_t *auth;
+ 	signature_params_t *scheme;
+ 	int pathlen;
++	bool is_anchor = FALSE;
+ 
+ 	auth = auth_cfg_create();
+ 	get_key_strength(subject, auth);
+@@ -742,7 +743,7 @@ static bool verify_trust_chain(private_credential_manager_t *this,
+ 				auth->add(auth, AUTH_RULE_CA_CERT, issuer->get_ref(issuer));
+ 				DBG1(DBG_CFG, "  using trusted ca certificate \"%Y\"",
+ 							  issuer->get_subject(issuer));
+-				trusted = TRUE;
++				trusted = is_anchor = TRUE;
+ 			}
+ 			else
+ 			{
+@@ -777,11 +778,18 @@ static bool verify_trust_chain(private_credential_manager_t *this,
+ 				DBG1(DBG_CFG, "  issuer is \"%Y\"",
+ 					 current->get_issuer(current));
+ 				call_hook(this, CRED_HOOK_NO_ISSUER, current);
++				if (trusted)
++				{
++					DBG1(DBG_CFG, "  reached end of incomplete trust chain for "
++						 "trusted certificate \"%Y\"",
++						 subject->get_subject(subject));
++				}
+ 				break;
+ 			}
+ 		}
+-		if (!check_certificate(this, current, issuer, online,
+-							   pathlen, trusted, auth))
++		/* don't do online verification here */
++		if (!check_certificate(this, current, issuer, FALSE,
++							   pathlen, is_anchor, auth))
+ 		{
+ 			trusted = FALSE;
+ 			issuer->destroy(issuer);
+@@ -793,7 +801,7 @@ static bool verify_trust_chain(private_credential_manager_t *this,
+ 		}
+ 		current->destroy(current);
+ 		current = issuer;
+-		if (trusted)
++		if (is_anchor)
+ 		{
+ 			DBG1(DBG_CFG, "  reached self-signed root ca with a "
+ 				 "path length of %d", pathlen);
+@@ -806,6 +814,34 @@ static bool verify_trust_chain(private_credential_manager_t *this,
+ 		DBG1(DBG_CFG, "maximum path length of %d exceeded", MAX_TRUST_PATH_LEN);
+ 		call_hook(this, CRED_HOOK_EXCEEDED_PATH_LEN, subject);
+ 	}
++	else if (trusted && online)
++	{
++		enumerator_t *enumerator;
++		auth_rule_t rule;
++
++		/* do online revocation checks after basic validation of the chain */
++		pathlen = 0;
++		current = subject;
++		enumerator = auth->create_enumerator(auth);
++		while (enumerator->enumerate(enumerator, &rule, &issuer))
++		{
++			if (rule == AUTH_RULE_CA_CERT || rule == AUTH_RULE_IM_CERT)
++			{
++				if (!check_certificate(this, current, issuer, TRUE, pathlen++,
++									   rule == AUTH_RULE_CA_CERT, auth))
++				{
++					trusted = FALSE;
++					break;
++				}
++				else if (rule == AUTH_RULE_CA_CERT)
++				{
++					break;
++				}
++				current = issuer;
++			}
++		}
++		enumerator->destroy(enumerator);
++	}
+ 	if (trusted)
+ 	{
+ 		result->merge(result, auth, FALSE);
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
index 1b82dceac..b8d44db26 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.6.bb
@@ -10,6 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-enum-Fix-compiler-warning.patch \
+           file://CVE-2022-40617.patch \
            "
 
 SRC_URI[sha256sum] = "91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7"
-- 
2.25.1


