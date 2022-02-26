Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2375DC433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 15:41:26 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.6844.1645890085290839891
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fMJKHCHR;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id e13so7233144plh.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0bD/k+pOQJQFZECfA97U0RxNmzfN7YWH+s+aIwPgf3g=;
        b=fMJKHCHRozzVDRhYmlXjkPVOfUAquvgFu5iFWd2boNeBMaoinaCVHqiMzLvtXUcBC1
         zPvoWbBXxg5/WwNYEuM6hoJqeRukdq0adyCeZzi/8LHCvpEzemkkHCjnfWvrFPsREpQ7
         Zxi+0VPfaH9tUDP1+ujUxcdwy81OmQH734+80s7llgyL+CPuM5QtAFAeZymzolwFnLFS
         ea4lcWCqlJBP/GStq5bG4XGesewvTm1TNKio97xp3+CKAQPAIpqlGZdVXW9IxftFnLZc
         fOrZuCr9OINoclWPxsuWB59XgIX6w1m+MaOqcW6ezbhsXE48vyWWtKGgagcPGk0RYQtp
         incA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0bD/k+pOQJQFZECfA97U0RxNmzfN7YWH+s+aIwPgf3g=;
        b=NToOPEtbdjMkie85ZM1tGlgCAitWgbDj7AWf0gHOde7b/oOJzDsNgR/4RYpXY6ydmv
         03ac0N7U8c5JDfSLKQ9XC4xrPGpD5ghfalQ/M3k8GZ/VUk4MK3AGm5w84kPsdZKIZ2FY
         GosXxRzUzIZWRPtvHV3fsDfOxgLBvNeC8J6rR2R6sozLNGKeSyNBORf9FTzlDvUUJVpW
         dRiudH8Q/wDve08IBsEeOSFZljUKkPWtUcmGjTeBYcovkF7OYuz7t/Cmp6Cj2jJ1Zfo4
         ZSgaMX8iXSQgJGQiPNqeupaGFCoFCHs6/8SwDD4whNg4s1ffY5ZvcJZ3F4410q+CftgR
         Xl5g==
X-Gm-Message-State: AOAM533oon8kgUa+QnKUcwLDekvHlXyc5C8wrxln329cPXq9yvltVzJL
	lqi643ESioB3FXg0umymL/C2vcZHLmY=
X-Google-Smtp-Source: 
 ABdhPJy03RPBUYzSu2ugL+MhNybimPIzTGiQbWGiLzQ09rI+1tjIxQ7QarwdCl9COokoGLO0+XZ9xQ==
X-Received: by 2002:a17:90b:23c8:b0:1bc:6d87:2eae with SMTP id
 md8-20020a17090b23c800b001bc6d872eaemr8332202pjb.189.1645890084572;
        Sat, 26 Feb 2022 07:41:24 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:5954:439:c7aa:7238])
        by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004e136d54a15sm7676075pfv.105.2022.02.26.07.41.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 07:41:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 1/5] strongswan: Add fix of CVE-2021-45079
Date: Sat, 26 Feb 2022 07:41:15 -0800
Message-Id: 
 <93a315f96f90915382532717cb2c356f995d66b2.1645890015.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645890015.git.akuster808@gmail.com>
References: <cover.1645890015.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 15:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95545

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add a patch to fix CVE-2021-45079

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/files/CVE-2021-45079.patch     | 156 ++++++++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2021-45079.patch

diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2021-45079.patch b/meta-networking/recipes-support/strongswan/files/CVE-2021-45079.patch
new file mode 100644
index 0000000000..97aa6a0efc
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
index b45b8074c4..8a5855fb87 100644
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
2.25.1


