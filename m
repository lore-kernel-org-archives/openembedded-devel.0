Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90159CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:30 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33277.1792043125310348456
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JAz+jZp/;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e934449bb0so12233835ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043125; x=1792647925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lDzfUb7EUQSzzFg19JafujucagwpaQT3G62qx3at3mU=;
        b=JAz+jZp/G4sluSRy7ub44T0gaMYoqz/9A2E6m9iCoPdXiJKNj2c6xz6DL4P4v4WQnS
         +IXhj+D+TpYYkLuYBkpQBri9EYKO4iTLSIAsc6KNkuEPsef3HRQ+GeROBxHtOmWQHMaz
         +uqKOBOEtAEDgx4XN3raiLnMZW/lNSOBJWzBVrNSMyi3mfv/gAMcQ32ixlb+my26DUY1
         OuyZAe/TPcjdgykiM5HFdKxS3gdwUT8o/g3jJ270+D2xIbB6wEDeROHkcLh5ooXJnBhh
         EqXQGD+6sXKytjMmBzcxin2JVDxm0e8PAv6WPIjQjoDEkKSYDuL/kPurynZYU/eCOaVl
         4I/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043125; x=1792647925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lDzfUb7EUQSzzFg19JafujucagwpaQT3G62qx3at3mU=;
        b=b/LbhdZMpVaLSHkk4WoWnEKxil+jeuh2c8jeE6gdnkGUrf8u/1VuI/IwG7SJF1K0Gz
         oeo4vCQs/YZrHB+Aqq++H25EI7GfUDKyICGwhk+CwuBSnH1ZQxUxQjgZkK516N4wPLm7
         tKDTRadWb2PVm9CCjgt3Cu95jYIVkwD0iVlz9c8Lk3XSq98lxB7hR6egvEG2h0em9che
         gd1pZGExeQ6VTS/z8b6568Dic0RBbkCj0DapVDNpunYsiNd9kI1AWyHz2/L1X1jlQW+B
         6zXb+0xkxguXcHp071cJ2gUOSNeJfz1ILxnlXiKbsig/rQ6e8ROZ0IPj2IY7fiATEyp7
         PpeA==
X-Gm-Message-State: AFq9FYJ8MpzPanILQ+na0xGFW/EOE4+po/p6rptMWTXwbRBaqzhHLtZr
	kQcmODo+C+eqjckB9GqAfEpwT94tJnQRa0HuivdWNkMpoPsNd7ziK8yusFoL4A==
X-Gm-Gg: AYBFou1KvZSM50ofujeL9g4lqkex8MgGfztLe81C+MKVsicsQUOZtHWcIkG9wWk8And
	5s+HgfhxSMd7KDwmo3bLKrWk7nl+oaZL6w426d/+cGVVPIGr/1TGc2dw7p87mI7rMPy4gVUhRNC
	GQIGsGgAfQ/00akTibX4MfwWCkwJ2oDz3WcsvaXpBD+wOAQC0TYipWXWxM4SZS1s7ZFw6RBIeLp
	nDhAVXGdFRMAZQTOWePcaIq4Ynj9OYikWE1S3l1ICbqmTzgBMo1KCHqLeDvsjDKbTaZiaQVOSpo
	+/EFA/inlSeCbXwrtfcvf+9M38MSkkWzXx+F9naLEU2kPJhGuzVH88shdNU+/5Gqv7psjtPcA1B
	yhRp5XBUnXMycq0iMeDoJYlLUYrdQSYNo3m+lzRGp1DNBGaVBRZkavXveE/rvP0qo9hF7SfwU3i
	BvF1PPDJ1NvjNXserZxKgbBfBTY7su6nTbtr6QvoulmFN7PYJ9g0mbcD/TvU8rrA4sa8fg0QZ2L
	4aJ56MT5kyrd2NwwDCL+a4=
X-Received: by 2002:a17:903:b84:b0:2e9:6788:9379 with SMTP id d9443c01a7336-2e967889672mr1296165ad.32.1792043124382;
        Wed, 14 Oct 2026 22:45:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 72/82] strongswan: patch CVE-2026-78134
Date: Thu, 15 Oct 2026 18:42:00 +1300
Message-ID: <f12cb02421808001add080bae2e7eaeebe68ca8a.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130992

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78134

[1]https://download.strongswan.org/security/CVE-2026-78134/strongswan-5.9.10-6.0.7_eap_inner_auth_cfg.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78134).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 2352f801006e75c74ac8892d88a38d4a2e3d2f32)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78134.patch           | 712 ++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |   1 +
 2 files changed, 713 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch
new file mode 100644
index 0000000000..86646e5e96
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch
@@ -0,0 +1,712 @@
+From d95e9d363b0e23d0ba3080bb518695e05a453748 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 27 Jul 2026 15:05:45 +0200
+Subject: [PATCH] eap-ttls/peap: Return auth-cfg with details on TLS and inner
+ EAP method
+
+This fixes several issues with binding identities to the IKE SA.
+
+If the client is authenticated with a certificate, the previous code still
+used the client's proclaimed inner EAP-Identity when starting the EAP-TNC
+method.  So that method would potentially operate on an unverified
+identity.
+
+Second, if the inner EAP method overrides the client identity (the only
+one is currently EAP-MSCHAPV2), the missing merge meant that the outer
+IKE/EAP identity could potentially be unconfirmed.
+
+For inner methods that don't override the identity (e.g. EAP-MD5), not
+propagating the inner EAP-Identity could potentially have the same
+effect.
+
+While the EAP-TTLS implementation returned the auth-cfg of the TLS
+exchange since the first referenced commit, this was mainly intended to
+enforce public key constraints.  So it didn't cover the phase 2 EAP
+methods.  For some reason EAP-PEAP did not get that method at all in that
+changeset, so we'll add that now.
+
+Additionally, the EAP-PEAP implementation now forwards the phase 2 EAP
+method type to EAP-TNC like the EAP-TTLS implementation already did,
+which allows a more informed decision on the client's identity.
+
+Fixes: 0864a31d13ff ("eap-ttls: Support EAP auth information getter in EAP-TTLS")
+Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
+Fixes: 2a421163bf4f ("make TNC client authentication type available to IMVs")
+Fixes: 1be296dfb2af ("implemented the PEAP tunneling protocol as an EAP plugin")
+Fixes: CVE-2026-78134
+
+CVE: CVE-2026-78134
+Upstream-Status: Backport [1][2]
+
+[1]https://github.com/strongswan/strongswan/commit/e059077d3f3e307e78be7f91e5648aa5f94916a8
+[2]https://github.com/strongswan/strongswan/commit/6a7210731f6dd2889d22bf20310ab0ed7274d0d8
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libcharon/plugins/eap_peap/eap_peap.c     | 49 ++++++++++-
+ .../plugins/eap_peap/eap_peap_peer.c          | 20 +++++
+ .../plugins/eap_peap/eap_peap_peer.h          |  7 ++
+ .../plugins/eap_peap/eap_peap_server.c        | 81 ++++++++++++++++---
+ .../plugins/eap_peap/eap_peap_server.h        |  7 ++
+ src/libcharon/plugins/eap_ttls/eap_ttls.c     | 43 +++++++++-
+ .../plugins/eap_ttls/eap_ttls_peer.c          | 19 +++++
+ .../plugins/eap_ttls/eap_ttls_peer.h          |  7 ++
+ .../plugins/eap_ttls/eap_ttls_server.c        | 56 +++++++++++--
+ .../plugins/eap_ttls/eap_ttls_server.h        |  7 ++
+ 10 files changed, 278 insertions(+), 18 deletions(-)
+
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap.c b/src/libcharon/plugins/eap_peap/eap_peap.c
+index 3573cba..cd942f1 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap.c
++++ b/src/libcharon/plugins/eap_peap/eap_peap.c
+@@ -40,6 +40,25 @@ struct private_eap_peap_t {
+ 	 * TLS stack, wrapped by EAP helper
+ 	 */
+ 	tls_eap_t *tls_eap;
++
++	/**
++	 * Role
++	 */
++	bool is_server;
++
++	/**
++	 * Actual server/client implementation
++	 */
++	union {
++		tls_application_t *application;
++		eap_peap_server_t *server;
++		eap_peap_peer_t *client;
++	} impl;
++
++	/**
++	 * Cached auth data for TLS and inner EAP methods
++	 */
++	auth_cfg_t *auth;
+ };
+ 
+ /** Maximum number of EAP-PEAP messages/fragments allowed */
+@@ -113,10 +132,34 @@ METHOD(eap_method_t, is_mutual, bool,
+ 	return TRUE;
+ }
+ 
++METHOD(eap_method_t, get_auth, auth_cfg_t*,
++	private_eap_peap_t *this)
++{
++	if (!this->auth)
++	{
++		auth_cfg_t *inner;
++
++		this->auth = auth_cfg_create();
++		this->auth->merge(this->auth,
++						  this->tls_eap->get_auth(this->tls_eap), FALSE);
++		if (this->is_server)
++		{
++			inner = this->impl.server->get_auth(this->impl.server);
++		}
++		else
++		{
++			inner = this->impl.client->get_auth(this->impl.client);
++		}
++		this->auth->merge(this->auth, inner, FALSE);
++	}
++	return this->auth;
++}
++
+ METHOD(eap_method_t, destroy, void,
+ 	private_eap_peap_t *this)
+ {
+ 	this->tls_eap->destroy(this->tls_eap);
++	DESTROY_IF(this->auth);
+ 	free(this);
+ }
+ 
+@@ -135,6 +178,7 @@ static private_eap_peap_t *eap_peap_create_empty(void)
+ 				.get_type = _get_type,
+ 				.is_mutual = _is_mutual,
+ 				.get_msk = _get_msk,
++				.get_auth = _get_auth,
+ 				.get_identifier = _get_identifier,
+ 				.set_identifier = _set_identifier,
+ 				.destroy = _destroy,
+@@ -147,7 +191,7 @@ static private_eap_peap_t *eap_peap_create_empty(void)
+ /**
+  * Generic private constructor
+  */
+-static eap_peap_t *eap_peap_create(private_eap_peap_t * this,
++static eap_peap_t *eap_peap_create(private_eap_peap_t *this,
+ 								   identification_t *server,
+ 								   identification_t *peer, bool is_server,
+ 								   tls_application_t *application)
+@@ -157,6 +201,9 @@ static eap_peap_t *eap_peap_create(private_eap_peap_t * this,
+ 	bool include_length;
+ 	tls_t *tls;
+ 
++	this->is_server = is_server;
++	this->impl.application = application;
++
+ 	if (is_server && !lib->settings->get_bool(lib->settings,
+ 								"%s.plugins.eap-peap.request_peer_auth", FALSE,
+ 								lib->ns))
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap_peer.c b/src/libcharon/plugins/eap_peap/eap_peap_peer.c
+index 95213a3..f6c087a 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap_peer.c
++++ b/src/libcharon/plugins/eap_peap/eap_peap_peer.c
+@@ -52,6 +52,11 @@ struct private_eap_peap_peer_t {
+ 	 */
+ 	eap_method_t *ph2_method;
+ 
++	/**
++	 * Auth data for phase 2 methods
++	 */
++	auth_cfg_t *auth;
++
+ 	/**
+      * Pending outbound EAP message
+ 	 */
+@@ -166,6 +171,12 @@ METHOD(tls_application_t, process, status_t,
+ 	switch (status)
+ 	{
+ 		case SUCCESS:
++			if (this->ph2_method->get_auth)
++			{
++				this->auth->merge(this->auth,
++								  this->ph2_method->get_auth(this->ph2_method),
++								  FALSE);
++			}
+ 			this->ph2_method->destroy(this->ph2_method);
+ 			this->ph2_method = NULL;
+ 			/* fall through to NEED_MORE */
+@@ -220,11 +231,18 @@ METHOD(tls_application_t, build, status_t,
+ 	return INVALID_STATE;
+ }
+ 
++METHOD(eap_peap_peer_t, get_auth, auth_cfg_t*,
++	private_eap_peap_peer_t *this)
++{
++	return this->auth;
++}
++
+ METHOD(tls_application_t, destroy, void,
+ 	private_eap_peap_peer_t *this)
+ {
+ 	this->server->destroy(this->server);
+ 	this->peer->destroy(this->peer);
++	this->auth->destroy(this->auth);
+ 	DESTROY_IF(this->ph2_method);
+ 	DESTROY_IF(this->out);
+ 	this->avp->destroy(this->avp);
+@@ -247,10 +265,12 @@ eap_peap_peer_t *eap_peap_peer_create(identification_t *server,
+ 				.build = _build,
+ 				.destroy = _destroy,
+ 			},
++			.get_auth = _get_auth,
+ 		},
+ 		.server = server->clone(server),
+ 		.peer = peer->clone(peer),
+ 		.ph1_method = eap_method,
++		.auth = auth_cfg_create(),
+ 		.avp = eap_peap_avp_create(FALSE),
+ 	);
+ 
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap_peer.h b/src/libcharon/plugins/eap_peap/eap_peap_peer.h
+index 53c25cd..7d16957 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap_peer.h
++++ b/src/libcharon/plugins/eap_peap/eap_peap_peer.h
+@@ -38,6 +38,13 @@ struct eap_peap_peer_t {
+ 	 * Implements the TLS application data handler.
+ 	 */
+ 	tls_application_t application;
++
++	/**
++	 * Get authentication details of this EAP method and its inner method(s).
++	 *
++	 * @return				auth method, internal data
++	 */
++	auth_cfg_t *(*get_auth)(eap_peap_peer_t *this);
+ };
+ 
+ /**
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap_server.c b/src/libcharon/plugins/eap_peap/eap_peap_server.c
+index 29ab9b4..388c3c6 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap_server.c
++++ b/src/libcharon/plugins/eap_peap/eap_peap_server.c
+@@ -20,6 +20,8 @@
+ #include <utils/debug.h>
+ #include <daemon.h>
+ 
++#include <sa/eap/eap_inner_method.h>
++
+ typedef struct private_eap_peap_server_t private_eap_peap_server_t;
+ 
+ /**
+@@ -77,6 +79,16 @@ struct private_eap_peap_server_t {
+ 	 */
+ 	eap_method_t *ph2_method;
+ 
++	/**
++	 * Type of the completed phase 2 EAP method
++	 */
++	eap_type_t phase2_type;
++
++	/**
++	 * Auth data for phase 2 method
++	 */
++	auth_cfg_t *auth;
++
+ 	/**
+      * Pending outbound EAP message
+ 	 */
+@@ -132,8 +144,11 @@ static status_t start_phase2_auth(private_eap_peap_server_t *this)
+ /**
+  * If configured, start EAP-TNC protocol
+  */
+-static status_t start_phase2_tnc(private_eap_peap_server_t *this)
++static status_t start_phase2_tnc(private_eap_peap_server_t *this,
++								 eap_type_t auth_type)
+ {
++	eap_inner_method_t *inner_method;
++
+ 	if (this->start_phase2_tnc && lib->settings->get_bool(lib->settings,
+ 						"%s.plugins.eap-peap.phase2_tnc", FALSE, lib->ns))
+ 	{
+@@ -145,6 +160,8 @@ static status_t start_phase2_tnc(private_eap_peap_server_t *this)
+ 			DBG1(DBG_IKE, "%N method not available", eap_type_names, EAP_TNC);
+ 			return FAILED;
+ 		}
++		inner_method = (eap_inner_method_t *)this->ph2_method;
++		inner_method->set_auth_type(inner_method, auth_type);
+ 		this->start_phase2_tnc = FALSE;
+ 
+ 		/* synchronize EAP message identifiers of inner protocol with outer */
+@@ -218,9 +235,13 @@ METHOD(tls_application_t, process, status_t,
+ 		DBG1(DBG_IKE, "received tunneled EAP-PEAP AVP [EAP/%N]",
+ 								eap_code_short_names, code);
+ 		in->destroy(in);
+-		/* if EAP_SUCCESS check if to continue phase2 with EAP-TNC */
+-		return (this->phase2_result == EAP_SUCCESS && code == EAP_SUCCESS) ?
+-			   start_phase2_tnc(this) : FAILED;
++		if (this->phase2_result == EAP_SUCCESS && code == EAP_SUCCESS)
++		{
++			/* only accept SUCCESS once after a successful inner method */
++			this->phase2_result = EAP_FAILURE;
++			return start_phase2_tnc(this, this->phase2_type);
++		}
++		return FAILED;
+ 	}
+ 
+ 	if (this->ph2_method)
+@@ -245,6 +266,10 @@ METHOD(tls_application_t, process, status_t,
+ 	if (!received_vendor && received_type == EAP_IDENTITY)
+ 	{
+ 		chunk_t eap_id;
++		bool peer_auth;
++
++		peer_auth = lib->settings->get_bool(lib->settings,
++					"%s.plugins.eap-peap.request_peer_auth", FALSE, lib->ns);
+ 
+ 		if (this->ph2_method == NULL)
+ 		{
+@@ -271,9 +296,22 @@ METHOD(tls_application_t, process, status_t,
+ 
+ 		if (this->ph2_method->get_msk(this->ph2_method, &eap_id) == SUCCESS)
+ 		{
+-			this->peer->destroy(this->peer);
+-			this->peer = identification_create_from_data(eap_id);
+-			DBG1(DBG_IKE, "received EAP identity '%Y'", this->peer);
++			identification_t *id;
++
++			id = identification_create_from_data(eap_id);
++			if (peer_auth && !id->equals(id, this->peer))
++			{
++				DBG1(DBG_IKE, "received tunneled EAP identity '%Y', keeping "
++					 "certificate-authenticated identity '%Y'", id, this->peer);
++				id->destroy(id);
++			}
++			else
++			{
++				DBG1(DBG_IKE, "received EAP identity '%Y'", id);
++				this->auth->add(this->auth, AUTH_RULE_EAP_IDENTITY, id);
++				this->peer->destroy(this->peer);
++				this->peer = id->clone(id);
++			}
+ 		}
+ 
+ 		in->destroy(in);
+@@ -281,10 +319,9 @@ METHOD(tls_application_t, process, status_t,
+ 		this->ph2_method = NULL;
+ 
+ 		/* Start Phase 2 of EAP-PEAP authentication */
+-		if (lib->settings->get_bool(lib->settings,
+-					"%s.plugins.eap-peap.request_peer_auth", FALSE, lib->ns))
++		if (peer_auth)
+ 		{
+-			return start_phase2_tnc(this);
++			return start_phase2_tnc(this, EAP_TLS);
+ 		}
+ 		else
+ 		{
+@@ -305,11 +342,26 @@ METHOD(tls_application_t, process, status_t,
+ 	switch (status)
+ 	{
+ 		case SUCCESS:
++			if (this->ph2_method->get_auth)
++			{
++				identification_t *id;
++				auth_cfg_t *auth;
++
++				auth = this->ph2_method->get_auth(this->ph2_method);
++				id = auth->get(auth, AUTH_RULE_EAP_IDENTITY);
++				if (id)
++				{
++					this->peer->destroy(this->peer);
++					this->peer = id->clone(id);
++				}
++				this->auth->merge(this->auth, auth, FALSE);
++			}
+ 			DBG1(DBG_IKE, "%N phase2 authentication of '%Y' with %N successful",
+ 							eap_type_names, EAP_PEAP, this->peer,
+ 							eap_type_names, type);
+ 			this->ph2_method->destroy(this->ph2_method);
+ 			this->ph2_method = NULL;
++			this->phase2_type = type;
+ 
+ 			/* EAP-PEAP requires the sending of an inner EAP_SUCCESS message */
+ 			this->phase2_result = EAP_SUCCESS;
+@@ -407,11 +459,18 @@ METHOD(eap_peap_server_t, set_tls, void,
+ 	this->tls = tls;
+ }
+ 
++METHOD(eap_peap_server_t, get_auth, auth_cfg_t*,
++	private_eap_peap_server_t *this)
++{
++	return this->auth;
++}
++
+ METHOD(tls_application_t, destroy, void,
+ 	private_eap_peap_server_t *this)
+ {
+ 	this->server->destroy(this->server);
+ 	this->peer->destroy(this->peer);
++	this->auth->destroy(this->auth);
+ 	DESTROY_IF(this->ph2_method);
+ 	DESTROY_IF(this->out);
+ 	this->avp->destroy(this->avp);
+@@ -435,10 +494,12 @@ eap_peap_server_t *eap_peap_server_create(identification_t *server,
+ 				.destroy = _destroy,
+ 			},
+ 			.set_tls = _set_tls,
++			.get_auth = _get_auth,
+ 		},
+ 		.server = server->clone(server),
+ 		.peer = peer->clone(peer),
+ 		.ph1_method = eap_method,
++		.auth = auth_cfg_create(),
+ 		.start_phase2 = TRUE,
+ 		.start_phase2_tnc = TRUE,
+ 		.start_phase2_id = lib->settings->get_bool(lib->settings,
+diff --git a/src/libcharon/plugins/eap_peap/eap_peap_server.h b/src/libcharon/plugins/eap_peap/eap_peap_server.h
+index 3abe88b..8080e9f 100644
+--- a/src/libcharon/plugins/eap_peap/eap_peap_server.h
++++ b/src/libcharon/plugins/eap_peap/eap_peap_server.h
+@@ -47,6 +47,13 @@ struct eap_peap_server_t {
+ 	 * @param tls		TLS connection
+ 	 */
+ 	void (*set_tls)(eap_peap_server_t *this, tls_t *tls);
++
++	/**
++	 * Get authentication details of this EAP method and its inner method(s).
++	 *
++	 * @return				auth method, internal data
++	 */
++	auth_cfg_t *(*get_auth)(eap_peap_server_t *this);
+ };
+ 
+ /**
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls.c b/src/libcharon/plugins/eap_ttls/eap_ttls.c
+index d8ad781..3df78bb 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls.c
+@@ -40,6 +40,25 @@ struct private_eap_ttls_t {
+ 	 * TLS stack, wrapped by EAP helper
+ 	 */
+ 	tls_eap_t *tls_eap;
++
++	/**
++	 * Role
++	 */
++	bool is_server;
++
++	/**
++	 * Actual server/client implementation
++	 */
++	union {
++		tls_application_t *application;
++		eap_ttls_server_t *server;
++		eap_ttls_peer_t *client;
++	} impl;
++
++	/**
++	 * Cached auth data for TLS and inner EAP methods
++	 */
++	auth_cfg_t *auth;
+ };
+ 
+ /** Maximum number of EAP-TTLS messages/fragments allowed */
+@@ -116,13 +135,31 @@ METHOD(eap_method_t, is_mutual, bool,
+ METHOD(eap_method_t, get_auth, auth_cfg_t*,
+ 	private_eap_ttls_t *this)
+ {
+-	return this->tls_eap->get_auth(this->tls_eap);
++	if (!this->auth)
++	{
++		auth_cfg_t *inner;
++
++		this->auth = auth_cfg_create();
++		this->auth->merge(this->auth,
++						  this->tls_eap->get_auth(this->tls_eap), FALSE);
++		if (this->is_server)
++		{
++			inner = this->impl.server->get_auth(this->impl.server);
++		}
++		else
++		{
++			inner = this->impl.client->get_auth(this->impl.client);
++		}
++		this->auth->merge(this->auth, inner, FALSE);
++	}
++	return this->auth;
+ }
+ 
+ METHOD(eap_method_t, destroy, void,
+ 	private_eap_ttls_t *this)
+ {
+ 	this->tls_eap->destroy(this->tls_eap);
++	DESTROY_IF(this->auth);
+ 	free(this);
+ }
+ 
+@@ -153,6 +190,10 @@ static eap_ttls_t *eap_ttls_create(identification_t *server,
+ 				.destroy = _destroy,
+ 			},
+ 		},
++		.is_server = is_server,
++		.impl = {
++			.application = application,
++		},
+ 	);
+ 	if (is_server && !lib->settings->get_bool(lib->settings,
+ 								"%s.plugins.eap-ttls.request_peer_auth", FALSE,
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_peer.c b/src/libcharon/plugins/eap_ttls/eap_ttls_peer.c
+index 63126a5..f8229f5 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_peer.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_peer.c
+@@ -54,6 +54,11 @@ struct private_eap_ttls_peer_t {
+ 	 */
+ 	eap_method_t *method;
+ 
++	/**
++	 * Auth data for phase 2 method
++	 */
++	auth_cfg_t *auth;
++
+ 	/**
+      * Pending outbound EAP message
+ 	 */
+@@ -215,6 +220,11 @@ METHOD(tls_application_t, process, status_t,
+ 	switch (status)
+ 	{
+ 		case SUCCESS:
++			if (this->method->get_auth)
++			{
++				this->auth->merge(this->auth,
++								  this->method->get_auth(this->method), FALSE);
++			}
+ 			this->method->destroy(this->method);
+ 			this->method = NULL;
+ 			/* fall through to NEED_MORE */
+@@ -275,11 +285,18 @@ METHOD(tls_application_t, build, status_t,
+ 	return INVALID_STATE;
+ }
+ 
++METHOD(eap_ttls_peer_t, get_auth, auth_cfg_t*,
++	private_eap_ttls_peer_t *this)
++{
++	return this->auth;
++}
++
+ METHOD(tls_application_t, destroy, void,
+ 	private_eap_ttls_peer_t *this)
+ {
+ 	this->server->destroy(this->server);
+ 	this->peer->destroy(this->peer);
++	this->auth->destroy(this->auth);
+ 	DESTROY_IF(this->method);
+ 	DESTROY_IF(this->out);
+ 	this->avp->destroy(this->avp);
+@@ -301,10 +318,12 @@ eap_ttls_peer_t *eap_ttls_peer_create(identification_t *server,
+ 				.build = _build,
+ 				.destroy = _destroy,
+ 			},
++			.get_auth = _get_auth,
+ 		},
+ 		.server = server->clone(server),
+ 		.peer = peer->clone(peer),
+ 		.start_phase2 = TRUE,
++		.auth = auth_cfg_create(),
+ 		.avp = eap_ttls_avp_create(),
+ 	);
+ 
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_peer.h b/src/libcharon/plugins/eap_ttls/eap_ttls_peer.h
+index 0c3d90a..69a8435 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_peer.h
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_peer.h
+@@ -37,6 +37,13 @@ struct eap_ttls_peer_t {
+ 	 * Implements the TLS application data handler.
+ 	 */
+ 	tls_application_t application;
++
++	/**
++	 * Get authentication details of this EAP method and its inner method(s).
++	 *
++	 * @return				auth method, internal data
++	 */
++	auth_cfg_t *(*get_auth)(eap_ttls_peer_t *this);
+ };
+ 
+ /**
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_server.c b/src/libcharon/plugins/eap_ttls/eap_ttls_server.c
+index fc97f81..e1de1bf 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_server.c
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_server.c
+@@ -60,6 +60,11 @@ struct private_eap_ttls_server_t {
+ 	 */
+ 	eap_method_t *method;
+ 
++	/**
++	 * Auth data for phase 2 method
++	 */
++	auth_cfg_t *auth;
++
+ 	/**
+      * Pending outbound EAP message
+ 	 */
+@@ -220,6 +225,10 @@ METHOD(tls_application_t, process, status_t,
+ 	if (!received_vendor && received_type == EAP_IDENTITY)
+ 	{
+ 		chunk_t eap_id;
++		bool peer_auth;
++
++		peer_auth = lib->settings->get_bool(lib->settings,
++					"%s.plugins.eap-ttls.request_peer_auth", FALSE, lib->ns);
+ 
+ 		if (this->method == NULL)
+ 		{
+@@ -244,9 +253,22 @@ METHOD(tls_application_t, process, status_t,
+ 
+ 		if (this->method->get_msk(this->method, &eap_id) == SUCCESS)
+ 		{
+-			this->peer->destroy(this->peer);
+-			this->peer = identification_create_from_data(eap_id);
+-			DBG1(DBG_IKE, "received EAP identity '%Y'", this->peer);
++			identification_t *id;
++
++			id = identification_create_from_data(eap_id);
++			if (peer_auth && !id->equals(id, this->peer))
++			{
++				DBG1(DBG_IKE, "received tunneled EAP identity '%Y', keeping "
++					 "certificate-authenticated identity '%Y'", id, this->peer);
++				id->destroy(id);
++			}
++			else
++			{
++				DBG1(DBG_IKE, "received EAP identity '%Y'", id);
++				this->auth->add(this->auth, AUTH_RULE_EAP_IDENTITY, id);
++				this->peer->destroy(this->peer);
++				this->peer = id->clone(id);
++			}
+ 		}
+ 
+ 		in->destroy(in);
+@@ -254,8 +276,7 @@ METHOD(tls_application_t, process, status_t,
+ 		this->method = NULL;
+ 
+ 		/* Start Phase 2 of EAP-TTLS authentication */
+-		if (lib->settings->get_bool(lib->settings,
+-					"%s.plugins.eap-ttls.request_peer_auth", FALSE, lib->ns))
++		if (peer_auth)
+ 		{
+ 			return start_phase2_tnc(this, EAP_TLS);
+ 		}
+@@ -278,6 +299,20 @@ METHOD(tls_application_t, process, status_t,
+ 	switch (status)
+ 	{
+ 		case SUCCESS:
++			if (this->method->get_auth)
++			{
++				identification_t *id;
++				auth_cfg_t *auth;
++
++				auth = this->method->get_auth(this->method);
++				id = auth->get(auth, AUTH_RULE_EAP_IDENTITY);
++				if (id)
++				{
++					this->peer->destroy(this->peer);
++					this->peer = id->clone(id);
++				}
++				this->auth->merge(this->auth, auth, FALSE);
++			}
+ 			DBG1(DBG_IKE, "%N phase2 authentication of '%Y' with %N successful",
+ 							eap_type_names, EAP_TTLS, this->peer,
+ 							eap_type_names, type);
+@@ -348,11 +383,18 @@ METHOD(tls_application_t, build, status_t,
+ 	return INVALID_STATE;
+ }
+ 
++METHOD(eap_ttls_server_t, get_auth, auth_cfg_t*,
++	private_eap_ttls_server_t *this)
++{
++	return this->auth;
++}
++
+ METHOD(tls_application_t, destroy, void,
+ 	private_eap_ttls_server_t *this)
+ {
+ 	this->server->destroy(this->server);
+ 	this->peer->destroy(this->peer);
++	this->auth->destroy(this->auth);
+ 	DESTROY_IF(this->method);
+ 	DESTROY_IF(this->out);
+ 	this->avp->destroy(this->avp);
+@@ -374,11 +416,13 @@ eap_ttls_server_t *eap_ttls_server_create(identification_t *server,
+ 				.build = _build,
+ 				.destroy = _destroy,
+ 			},
++			.get_auth = _get_auth,
+ 		},
+ 		.server = server->clone(server),
+-		.peer = peer->clone(peer),
++		.auth = auth_cfg_create(),
+ 		.start_phase2 = TRUE,
+ 		.start_phase2_tnc = TRUE,
++		.peer = peer->clone(peer),
+ 		.avp = eap_ttls_avp_create(),
+ 	);
+ 
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_server.h b/src/libcharon/plugins/eap_ttls/eap_ttls_server.h
+index 1e13f55..3348706 100644
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_server.h
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_server.h
+@@ -37,6 +37,13 @@ struct eap_ttls_server_t {
+ 	 * Implements the TLS application data handler.
+ 	 */
+ 	tls_application_t application;
++
++	/**
++	 * Get authentication details of this EAP method and its inner method(s).
++	 *
++	 * @return				auth method, internal data
++	 */
++	auth_cfg_t *(*get_auth)(eap_ttls_server_t *this);
+ };
+ 
+ /**
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index df0333b458..bb6c6bf2a3 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78130.patch \
            file://CVE-2026-78132.patch \
            file://CVE-2026-78135.patch \
+           file://CVE-2026-78134.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

