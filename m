Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0719FC98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:54 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.733.1790224431856368436
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YLJGIR1I;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so987627a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224431; x=1790829231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MxX8GAtDzzlGDWf5Ae57+OeqOHPyvNjE6aXiIfc9OWw=;
        b=YLJGIR1IbfpfrE74RJAYpGcfOiy+RCZgqA5Cp9VZDFjSjIRtnS6CjZTpWVrwuAuW62
         RELWSVK9D6cNuYyP4q7YfLL9yCHZ9Q5Ng8aUETLrq39ERJJLJJ/Qk4hZIPgiIm9wtetS
         TG4QpuS4I6vHPjRtlVYzSdgJK11kvowEr8At+9u11H+HV58xg1br9f+eTMUzSioG87h5
         49gn68h5odobI0dTnd/hHhkmc5AiyNbS2mpV3hLfWuuywfEqIX1CjTTyTVFNipntTzhj
         GUojakaTVwhfSOkHNbByubCBsUjNLbdYcn7AvhzhUSZoD+5BUi3FxLgH9CxvINjHEaIc
         TIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224431; x=1790829231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MxX8GAtDzzlGDWf5Ae57+OeqOHPyvNjE6aXiIfc9OWw=;
        b=IkCAWD1F/idYz5C0eClOVD55ZKqtYN5avJE1RKnZlQYagr6jghuhHIMH50b1iaEash
         +uf4FqoZpMJ0hKmspp0UyW1HL10GhjRA77so42OXVwv9mdIbjll1yUxyZzqehsFFDaYq
         gxsV1QJmA/3OrR4H81UUN9JlkGJtjLWyirFuBaf8bd9pSI2p4sVZVwfUKTjUeX7p608A
         69Xc/rm3BzivuoWbrFotDs40QfA4mHSLLAwswqiEgQUS0kMpZQc4Kffn7X4KScPtCvzn
         +At5VcToJu5+3eXIJmmZ6q1VdcesCYODS2ZJj0kj5YLbrqmuqpfhncNYQIqVVDFZ8vhB
         y9EA==
X-Gm-Message-State: AFuF++kOl2Z2fl+VsP/OdDt2ecNFGotYTN+HgATe9qgT2lgEMy+zgQ2T
	dJnnNYYNkjfRL3sYcVtLzPIzsM6qyyCfdFFD1mhHYU246yuxPCZRkBkdfIoCTQ==
X-Gm-Gg: AYBFou0BFD59VCa9HwgDIyr5KvBQe2Gx6dbqfrQc+bDeXMqtkNO4W0zyBhPTdbNf+th
	t4kF41x+X+7FOmruCyoO8hDFjKInQuPHqSfdboKxdgZU2I8RKtegH1/bWGrSN0MQ0HVGtFJqOW7
	915leyfdGZVV4rFVXa4wFRsZEc6YQ4KUdT15gnEfK1RHkWIaaPvhjcoW3B7tvjIP0kY96Lq29FA
	3uiqMtLNU8oAweUHC4acdCYZOSQilgTYdrBnWJMkWCFtbpdpT/6UJJErUJXashHmYLM+ypDShq8
	yQm7gwFAJ7GmNJ4J+c0FWpGSnPbInyZ82e89Rq5v2YpX0Zk+rNe7X2aNksDSWzWaZsO+jIJwh5H
	gtfc4HWGR7Dqf+jvpIOMsmAVN+sLXbIT9R+4jXmNFC9MSj7EAlvd0zo8fibF+VIqumklIeN9XGi
	VmRyYVgHVCjtRJ5xWjNafR5XyGrmUo02aflPgDMPEHt2vkrEnFa64V1MMYtZMH7g4K4A3nrkKoA
	J2iRv8A8JR4v0PwNdfzuK2ua7Z9dDLvcg==
X-Received: by 2002:a05:6a20:9195:b0:3dd:85aa:452b with SMTP id adf61e73a8af0-3de0e76baa3mr1287736637.29.1790224431054;
        Wed, 23 Sep 2026 21:33:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 14/24] strongswan: patch CVE-2026-78135
Date: Thu, 24 Sep 2026 16:33:04 +1200
Message-ID: <20260924043315.1663186-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130262

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78135

[1]https://download.strongswan.org/security/CVE-2026-78135/strongswan-5.9.7-6.0.7_early_create_child_sa.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78135).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78135.patch           | 72 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch
new file mode 100644
index 0000000000..1b6c472b30
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch
@@ -0,0 +1,72 @@
+From 2c3d63bd7a05f88d25354dfe7805a5a6e474a699 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 27 Jul 2026 08:53:50 +0200
+Subject: [PATCH] ikev2: Properly reject CREATE_CHILD_SA requests on
+ unestablished IKE_SAs
+
+The previous check was not actually enforced as long as there were still
+tasks in the passive queue (it was originally added to fix an issue on
+initiators, so the passive queue was expected to be empty).  This allowed
+an unauthenticated attacker to potentially establish a usable Child SA
+if certain preconditions were met.
+
+First, it required that the initiator is authenticated with EAP so the
+authentication and the creation of the first Child SA is deferred.
+Second, the responder must either not configure an IP address pool or
+an explicit remote TS, otherwise, traffic selector negotiation fails.
+
+Note that the half-open IKE SA and the installed IPsec SA will be removed
+after the default timeout of 30 seconds.
+
+Fixes: 8503077175cd ("ikev2: Reject CREATE_CHILD_SA exchange on unestablished IKE_SAs")
+Fixes: c60c7694d2d8 ("merged tasking branch into trunk")
+Fixes: CVE-2026-78135
+
+CVE: CVE-2026-78135
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/4dcb132266a954202509a3b4b3be99378f3e3b4d]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libcharon/sa/ikev2/task_manager_v2.c | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/src/libcharon/sa/ikev2/task_manager_v2.c b/src/libcharon/sa/ikev2/task_manager_v2.c
+index 5a19ce8..f9e9ab9 100644
+--- a/src/libcharon/sa/ikev2/task_manager_v2.c
++++ b/src/libcharon/sa/ikev2/task_manager_v2.c
+@@ -1134,9 +1134,18 @@ static status_t process_request(private_task_manager_t *this,
+ 	delete_payload_t *delete;
+ 	ike_sa_state_t state;
+ 
++	state = this->ike_sa->get_state(this->ike_sa);
++	if (message->get_exchange_type(message) == CREATE_CHILD_SA &&
++		(state == IKE_CREATED || state == IKE_CONNECTING))
++	{
++		DBG1(DBG_IKE, "received CREATE_CHILD_SA request for "
++			 "unestablished IKE_SA, rejected");
++		return FAILED;
++	}
++
++	/* create tasks depending on request type, if not already some queued */
+ 	if (array_count(this->passive_tasks) == 0)
+-	{	/* create tasks depending on request type, if not already some queued */
+-		state = this->ike_sa->get_state(this->ike_sa);
++	{
+ 		switch (message->get_exchange_type(message))
+ 		{
+ 			case IKE_SA_INIT:
+@@ -1177,14 +1186,6 @@ static status_t process_request(private_task_manager_t *this,
+ 			{	/* FIXME: we should prevent this on mediation connections */
+ 				bool notify_found = FALSE, ts_found = FALSE;
+ 
+-				if (state == IKE_CREATED ||
+-					state == IKE_CONNECTING)
+-				{
+-					DBG1(DBG_IKE, "received CREATE_CHILD_SA request for "
+-						 "unestablished IKE_SA, rejected");
+-					return FAILED;
+-				}
+-
+ 				enumerator = message->create_payload_enumerator(message);
+ 				while (enumerator->enumerate(enumerator, &payload))
+ 				{
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 1597455d15..5ddc3c32b9 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78131.patch \
            file://CVE-2026-78130.patch \
            file://CVE-2026-78132.patch \
+           file://CVE-2026-78135.patch \
 "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"

