Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BDDC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 09:51:46 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.5453.1644573105097151651
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 01:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kRLton5z;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id p6so4048888plf.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Feb 2022 01:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=zQuSlItuCOFDsdM71iJe7ePMxjv8RRX+FAI2YEuSXak=;
        b=kRLton5zflpRKCnVgz99Xqy6TdMQEbCfWtN1CsNmTgKlU6z/HgxOk5hlMqPvFFGljJ
         g/OF2iHIgppU5TQzJV6appYj4Lwb7lOmMamZKD1xzbGhjAKXU9vWqBz4hi74+Ny4HZaU
         CLwJGOlJyWoPqtNQGBCu03JIn86lAq/6AbMcMe//oQFl7AjlSZXnoz37ar/sMlmsEQyQ
         RRgoeR85gB5SuLmGIUM7qDBeqUNeMbMx+vwlkxj/IOGlip+Qo2TXoYoSle3RqUQYt6nr
         DiVY2UolIKFV/lfbKXhPNWPk7IcsHu6JkZDwieXAI3nXcMtCYjMMT39teJn5PSq7P4FD
         p55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zQuSlItuCOFDsdM71iJe7ePMxjv8RRX+FAI2YEuSXak=;
        b=6ka4yOW48CHBEr/1L5EF9ABMfkj2GAf7S+l/wFiyVzdf1qOFK5dKAdVFLqJj19VOgh
         xfG4675kuiZ9o1JHH87B3NOxfOPkQcpeALM5Td+BeHSOgeUbfNnL/wEQdSR/16zlMekA
         RWxuHoThv3tanF+fj3P4tO6jYb0LRKuPV+uSaUtwbg6C/q6w4PA/GQVWGUcwLbALESf1
         ogYnpyeWghCkSOgBCD2pofBTFrq7dvdplfmG1A+Rh0yxghCFQ9TOpgiryDTWWpCqXxWK
         Ur08561N77zi/9jaxQcPbMd5YF8LU1phj2nrI1nCMloFw8jStvr/qC6iixnNkFBzKQRr
         FRwg==
X-Gm-Message-State: AOAM530IOHJ+R093grijmvGzYItuJxE9lJv1Q+sBkOnwLioxEo48Vpbx
	Kdrx72bkF5CMClEbLXxDuRheA405sig=
X-Google-Smtp-Source: 
 ABdhPJx18xs7I0LGBhwGaFKvK1S4NlzbuyUMhX2dzRXbl/C0xO5XWQP8GA7MoDjwmKtzyXPmYTymog==
X-Received: by 2002:a17:902:968a:: with SMTP id
 n10mr869685plp.58.1644573104033;
        Fri, 11 Feb 2022 01:51:44 -0800 (PST)
Received: from localhost.localdomain ([150.129.206.7])
        by smtp.gmail.com with ESMTPSA id
 m21sm27031502pfk.26.2022.02.11.01.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 01:51:43 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta-networking][dunfell][PATCH] strongswan: Add fix of
 CVE-2021-45079
Date: Fri, 11 Feb 2022 15:20:58 +0530
Message-Id: <20220211095058.19876-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Feb 2022 09:51:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95296

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add a patch to fix CVE-2021-45079

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../strongswan/files/CVE-2021-45079.patch     | 156 ++++++++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2021-45079.patch

diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2021-45079.patch b/meta-networking/recipes-support/strongswan/files/CVE-2021-45079.patch
new file mode 100644
index 000000000..97aa6a0ef
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2021-45079.patch
@@ -0,0 +1,156 @@
+From 76968cdd6b79f6ae40d674554e902ced192fd33e Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Tue, 14 Dec 2021 10:51:35 +0100
+Subject: [PATCH] eap-authenticator: Enforce failure if MSK generation fails
+
+Without this, the authentication succeeded if the server sent an early
+EAP-Success message for mutual, key-generating EAP methods like EAP-TLS,
+which may be used in EAP-only scenarios but would complete without server
+or client authentication.  For clients configured for such EAP-only
+scenarios, a rogue server could capture traffic after the tunnel is
+established or even access hosts behind the client.  For non-mutual EAP
+methods, public key server authentication has been enforced for a while.
+
+A server previously could also crash a client by sending an EAP-Success
+immediately without initiating an actual EAP method.
+
+Fixes: 0706c39cda52 ("added support for EAP methods not establishing an MSK")
+Fixes: CVE-2021-45079
+
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2021-45079/strongswan-5.5.0-5.9.4_eap_success.patch]
+CVE: CVE-2021-45079
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/libcharon/plugins/eap_gtc/eap_gtc.c       |  2 +-
+ src/libcharon/plugins/eap_md5/eap_md5.c       |  2 +-
+ src/libcharon/plugins/eap_radius/eap_radius.c |  4 ++-
+ src/libcharon/sa/eap/eap_method.h             |  8 ++++-
+ .../ikev2/authenticators/eap_authenticator.c  | 32 ++++++++++++++++---
+ 5 files changed, 40 insertions(+), 8 deletions(-)
+
+diff --git a/src/libcharon/plugins/eap_gtc/eap_gtc.c b/src/libcharon/plugins/eap_gtc/eap_gtc.c
+index 95ba090b79ce..cffb6222c2f8 100644
+--- a/src/libcharon/plugins/eap_gtc/eap_gtc.c
++++ b/src/libcharon/plugins/eap_gtc/eap_gtc.c
+@@ -195,7 +195,7 @@ METHOD(eap_method_t, get_type, eap_type_t,
+ METHOD(eap_method_t, get_msk, status_t,
+ 	private_eap_gtc_t *this, chunk_t *msk)
+ {
+-	return FAILED;
++	return NOT_SUPPORTED;
+ }
+ 
+ METHOD(eap_method_t, get_identifier, uint8_t,
+diff --git a/src/libcharon/plugins/eap_md5/eap_md5.c b/src/libcharon/plugins/eap_md5/eap_md5.c
+index ab5f7ff6a823..3a92ad7c0a04 100644
+--- a/src/libcharon/plugins/eap_md5/eap_md5.c
++++ b/src/libcharon/plugins/eap_md5/eap_md5.c
+@@ -213,7 +213,7 @@ METHOD(eap_method_t, get_type, eap_type_t,
+ METHOD(eap_method_t, get_msk, status_t,
+ 	private_eap_md5_t *this, chunk_t *msk)
+ {
+-	return FAILED;
++	return NOT_SUPPORTED;
+ }
+ 
+ METHOD(eap_method_t, is_mutual, bool,
+diff --git a/src/libcharon/plugins/eap_radius/eap_radius.c b/src/libcharon/plugins/eap_radius/eap_radius.c
+index 2dc7a423e702..5336dead13d9 100644
+--- a/src/libcharon/plugins/eap_radius/eap_radius.c
++++ b/src/libcharon/plugins/eap_radius/eap_radius.c
+@@ -733,7 +733,9 @@ METHOD(eap_method_t, get_msk, status_t,
+ 		*out = msk;
+ 		return SUCCESS;
+ 	}
+-	return FAILED;
++	/* we assume the selected method did not establish an MSK, if it failed
++	 * to establish one, process() would have failed */
++	return NOT_SUPPORTED;
+ }
+ 
+ METHOD(eap_method_t, get_identifier, uint8_t,
+diff --git a/src/libcharon/sa/eap/eap_method.h b/src/libcharon/sa/eap/eap_method.h
+index 0b5218dfec15..33564831f86e 100644
+--- a/src/libcharon/sa/eap/eap_method.h
++++ b/src/libcharon/sa/eap/eap_method.h
+@@ -114,10 +114,16 @@ struct eap_method_t {
+ 	 * Not all EAP methods establish a shared secret. For implementations of
+ 	 * the EAP-Identity method, get_msk() returns the received identity.
+ 	 *
++	 * @note Returning NOT_SUPPORTED is important for implementations of EAP
++	 * methods that don't establish an MSK.  In particular as client because
++	 * key-generating EAP methods MUST fail to process EAP-Success messages if
++	 * no MSK is established.
++	 *
+ 	 * @param msk			chunk receiving internal stored MSK
+ 	 * @return
+-	 *						- SUCCESS, or
++	 *						- SUCCESS, if MSK is established
+ 	 * 						- FAILED, if MSK not established (yet)
++	 *						- NOT_SUPPORTED, for non-MSK-establishing methods
+ 	 */
+ 	status_t (*get_msk) (eap_method_t *this, chunk_t *msk);
+ 
+diff --git a/src/libcharon/sa/ikev2/authenticators/eap_authenticator.c b/src/libcharon/sa/ikev2/authenticators/eap_authenticator.c
+index e1e6cd7ee6f3..87548fc471a6 100644
+--- a/src/libcharon/sa/ikev2/authenticators/eap_authenticator.c
++++ b/src/libcharon/sa/ikev2/authenticators/eap_authenticator.c
+@@ -305,9 +305,17 @@ static eap_payload_t* server_process_eap(private_eap_authenticator_t *this,
+ 				this->method->destroy(this->method);
+ 				return server_initiate_eap(this, FALSE);
+ 			}
+-			if (this->method->get_msk(this->method, &this->msk) == SUCCESS)
++			switch (this->method->get_msk(this->method, &this->msk))
+ 			{
+-				this->msk = chunk_clone(this->msk);
++				case SUCCESS:
++					this->msk = chunk_clone(this->msk);
++					break;
++				case NOT_SUPPORTED:
++					break;
++				case FAILED:
++				default:
++					DBG1(DBG_IKE, "failed to establish MSK");
++					goto failure;
+ 			}
+ 			if (vendor)
+ 			{
+@@ -326,6 +334,7 @@ static eap_payload_t* server_process_eap(private_eap_authenticator_t *this,
+ 			return eap_payload_create_code(EAP_SUCCESS, in->get_identifier(in));
+ 		case FAILED:
+ 		default:
++failure:
+ 			/* type might have changed for virtual methods */
+ 			type = this->method->get_type(this->method, &vendor);
+ 			if (vendor)
+@@ -661,9 +670,24 @@ METHOD(authenticator_t, process_client, status_t,
+ 				uint32_t vendor;
+ 				auth_cfg_t *cfg;
+ 
+-				if (this->method->get_msk(this->method, &this->msk) == SUCCESS)
++				if (!this->method)
+ 				{
+-					this->msk = chunk_clone(this->msk);
++					DBG1(DBG_IKE, "received unexpected %N",
++						 eap_code_names, eap_payload->get_code(eap_payload));
++					return FAILED;
++				}
++				switch (this->method->get_msk(this->method, &this->msk))
++				{
++					case SUCCESS:
++						this->msk = chunk_clone(this->msk);
++						break;
++					case NOT_SUPPORTED:
++						break;
++					case FAILED:
++					default:
++						DBG1(DBG_IKE, "received %N but failed to establish MSK",
++							 eap_code_names, eap_payload->get_code(eap_payload));
++						return FAILED;
+ 				}
+ 				type = this->method->get_type(this->method, &vendor);
+ 				if (vendor)
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index b45b8074c..8a5855fb8 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
            file://CVE-2021-41990.patch \
            file://CVE-2021-41991.patch \
+           file://CVE-2021-45079.patch \
            "
 
 SRC_URI[md5sum] = "0634e7f40591bd3f6770e583c3f27d29"
-- 
2.17.1


