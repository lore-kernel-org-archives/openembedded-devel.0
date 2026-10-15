Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C012CC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:30 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32865.1792043122760457089
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aINAlmW3;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6e954afbdso8093705ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043122; x=1792647922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YzDN2WXDjx/KHUzHrIsOFlDnmDHdBZPoZDvkvHLMd3o=;
        b=aINAlmW3h3Xqzh3UV46//hmZ+faERx8Bd/bZw03HjgUOo1T+4Zeecz3fSmWj+Y+o8L
         j8ZrM7Xh0cJBL9Blu15dtvwbPh2WoTkZfsSHQKomOwl3xr9PvHQJXyTRQ0cDfQCFeFvj
         oJCHrdKprMo6/hclWXBV7IKyhHfZ3T6HjrsDSqCRWzKxGElY4pAmoPlzSPTa/vJIx+mP
         /lD49DAnCA52aMzSw0HQC+XLYoC54m+0ztQl69W0+A/wIIYJ+DiYbUe6p4m7Z48Umk8V
         OEpsSXpF8BPK9xF0E0g8wqmrMfrPPc5WsEK3IKBcfqgQzBrFLn8Z6UMn83ppLYjyuzBq
         /EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043122; x=1792647922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YzDN2WXDjx/KHUzHrIsOFlDnmDHdBZPoZDvkvHLMd3o=;
        b=j/ucooSa0d+3HbdhqW+hc3ZSN1aXjR7Myrao3rU+yYmuO+ju+1SG+35XPVYwk6DuOb
         Zx99tjnY+36OZ+UX0zvhBhu1XqkcE07ArYAWifltBF98oXmN5wzrDn8IISfrQmXHyYc8
         VAeu+wQTG74PzZJIDEmQjYhGjVcLWT4bpAF0gAnVRhoiAGzax4+Ia6rSX1CGLJbjGYJY
         s8AS7BDm+Lid8gDmFmQL9oIyJSJaiCCcWv/ouovKZ4rlHIC8Q30tPHitrZ9gsWUZ+QbY
         4+VMF51zgoiaf8QDEcR/rYYZ3WNCYoku83fEjqeHSOfN/k6yukxGaJCbjyG9XvXuKJD6
         Tr/Q==
X-Gm-Message-State: AFq9FYKDHgl+FIGwr2o7j8DENJjzVwy6/BPU8HDpxiSHonZnaB8bUUk+
	euVBP6TAE7RY4fTPMlh7DrfVyU/4lnXqiUp3FKkhaJ+MURCf7d3agq95uHk+Og==
X-Gm-Gg: AYBFou0yjoKvAKht3F9aHiS3ePD3gUCwRR6rjF/v6HcqSLWP+UkOb9oowGwMx2bPaE+
	MR351xLSOps9JMUn/1Qwy4GBOmtUkQb+dRdO3XaLREIgJ4ZVHFa1DsH7M+KQ7uYVwMv2r2aTmsv
	PdJa9pmhhswYpSsWp6MVRIsivRaNqwh5wXWSg0We3jIcW3sZ0sp8uz3h7i5PYBN3SZur2JqhTgH
	LCo5TLbjWu0HvVYw5jh8/i4rh3d06Dck3nbF05jCGgvEB8Vywdny8MpQdsDvoyL+/4GV1wLizXL
	r2un27z1TiLmVT2aeTeXWixps8K/J5DUKnqy5ohQeJxX/2L/DPX5x6auV1dF1fdBVI1+zxydhT4
	+d5O02yPdlIk4IMXRR2UJJJl9cJlCPhut9u1jYYrH/ipWhJ/5yorSJDuQdd8Uq4MzaZjVGjCZBE
	nl+1r0Oi5Fowx9KSifb2QvAak3TtQBsJiTNcdKv2VjunouaInBQWW06yWWEIOIggqUUOYCfqLFo
	S4bASh0JQiXNdq4ZD6Ms+gVNg==
X-Received: by 2002:a17:903:3243:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2e842bc61a1mr157370745ad.27.1792043122052;
        Wed, 14 Oct 2026 22:45:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 71/82] strongswan: patch CVE-2026-78135
Date: Thu, 15 Oct 2026 18:41:59 +1300
Message-ID: <991006d982c557ef61f4a3f49c61d94671b1bc4d.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130991

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

