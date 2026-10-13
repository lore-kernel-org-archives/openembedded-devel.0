Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3954CC6B13
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:00:08 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3526.1791885604234374801
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oRGBSmCL;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4b62d118aso1654656a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 03:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885604; x=1792490404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzDN2WXDjx/KHUzHrIsOFlDnmDHdBZPoZDvkvHLMd3o=;
        b=oRGBSmCLKyh2alNkonCmgPX/Xq9yTILUajOn0MChM2xwzBHE6H05niDZvnnftONSoa
         x85UejWzsQtMZ+LvZIibDJCfrYwPJ6QtjYwnS76G9G10yse4K1qoJyJ6ySnSqGM6J2hX
         b0oReiS44kHCmgTYDcnSuGbobBJCHb8fcFGmGClnRHMxtD1W8UxnCN1mGYCrKn8JSCid
         9CHKQL9DXVkuYNYdCedYZ59jZkSfHcUkSBSMdUizjoWwD2hAN9Rzc4B5cSHm1ARYw6it
         irGa63pnqK+QyGIHQGzLLaC0i+eTeXGtT5TgvvbQkbckmzAEeSKtX7dUKM6aJkNdhLOZ
         AJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885604; x=1792490404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YzDN2WXDjx/KHUzHrIsOFlDnmDHdBZPoZDvkvHLMd3o=;
        b=ddedBzihGCDMHxWqXzSG7sNfxbJ/ys34sPW6H5i73GYoJo/mreokUkG8ORlvXEZw4o
         GWYfYjtWLUOGrNZQE+CBA/xHka93VCsOk0XM/Qdw8yiRFMPb1uOrpJK2V9+eYdDrZ22I
         +/ZV5enrsiKZdzY7YpGCo5Ep4csdxHZE+LQfbWX+t2cNdOcthET5I+EE5cBvvQCXczlp
         m40GlfzgmuTGX3XPLYPOd64L8mROa1ZY53HEUYKnoZWQXSMzNac1gHc8bXibS38lUrJJ
         fjhJQM9pS/4nG9qSy/Yy66YqJ6iLv2PMQlwF/s8R1LDu4vjSCKyacrPG691W853ZxZmu
         f/Fw==
X-Gm-Message-State: AFq9FYKkbpq1fJQJU0mlmqrex3hCbeTFkGyVWN+88jH5kAn4NvnW9RGK
	PC4zFnT1iGAAQtaSXdgMkzns9TWbi+4PNd0jDnWAOzfVYOQEDfikeqqSRb5giA==
X-Gm-Gg: AYBFou0OsMHNKBjhk8adbNW8SQDQ+BrIgovJTc6xGdy3dwnv2KGXDll3saRPmUJ7vPQ
	Aw3YMUB1YZx7p6BBsQggMsuOIORuq92rEHQQN+i24QayY1Unl2uO48fP+9qRbQi1n8BSeI5/nvm
	zYEGKpZ7NaDtYzXC5JaQpreLkt90vFXhoCVMnsBelfpoGQIyOBzQMJrfyPB3voVUM9OrnTkv6t/
	gpT4ZiprWUh8iYibEZZ/lQYIS9zAOZAcp5/7kmfas+MrKy21WGK3ITjR/HR+CX4GhpE25sumDVN
	eHfirN8T2w9CN88QdQkSWFOu3ybzzL3NG7BHU6uis3ido0GtsZRCi/RQuGtLB+Vnu+w3rhyQzv2
	2GkNPSsdBSp4+z+vFFvd6WP++Afj72j5rILtU6v4cERB986j1JYkdu/G5499N5+RxswOzc8LxZT
	l3O6BFnpQwYtnmVB/VU48aiL47qcENiFuRTAaG+bZ1oGEbSKq0YJKZOVLpvLaqS3WuEvXz/fqL1
	hNaTjK9w7PEv5SHfQgyFb6qK8z51yn6ws0ZduU=
X-Received: by 2002:a17:90a:a8f:b0:3ab:413:49af with SMTP id 98e67ed59e1d1-3ab3a92850dmr7837326a91.49.1791885603540;
        Tue, 13 Oct 2026 03:00:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.03.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:00:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 19/28] strongswan: patch CVE-2026-78135
Date: Tue, 13 Oct 2026 22:58:54 +1300
Message-ID: <20261013095903.3544906-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 10:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130852

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78135

[1]https://download.strongswan.org/security/CVE-2026-78135/strongswan-5.9.7-6.0.7_early_create_child_sa.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78135).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 9b02fe48505f14e351e473e246d971d64eb84ad0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78135.patch           | 72 +++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |  1 +
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
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index b070ecf862..df0333b458 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78131.patch \
            file://CVE-2026-78130.patch \
            file://CVE-2026-78132.patch \
+           file://CVE-2026-78135.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

