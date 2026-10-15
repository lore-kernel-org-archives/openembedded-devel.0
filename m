Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D311CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:20 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32860.1792043114245997331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QjEASTbR;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2df8c28a0b1so22821685ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043114; x=1792647914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tpx6wHmaqrgpjQKmI4jUXEEKGskH2a6/Ik7uFEpL7oE=;
        b=QjEASTbRqN2keDOHDJDqrSoGlWX9t+aN/59W7pdnixNHXhJYCfTLFHX1nHzDc44ygl
         n8BgdhZ6gFLPtmV0TetZCQ9Pg9py6sjNM6O9N3RZLY/W/RbZs3B9Qe9VsvU4Ex+cKXGH
         e8HtfF1w9Bw+GQXvgrrKK/Ti+wO5ECvJNSZnmsFUvv1CiLcoQTttwDzpcG/osWyLXoVf
         lrwLTnDMDrq+8R/TVNBhPm2hUE3Dl8FaMVipExMrnaCyQSJHA8lTCRmvkXhA9wDPueMN
         36IVMT5MfxGJClfroqbYn/FNJ08Dqd/nEERH62XjwRfutJsTlr/C6WDsDaNX3en1y3GK
         oJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043114; x=1792647914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tpx6wHmaqrgpjQKmI4jUXEEKGskH2a6/Ik7uFEpL7oE=;
        b=BKkBEdB9SMPdvVkWA3MzYT58ExWzeXIuRXrMCXNXgMpIKgzl0qOVrP0UPzysIfkCGL
         MGv8s5Hg97TlPyIvnP98DdRExdFVe1CpViUybIycGTy1L7h/FbbQs/0USa5L29OyXzHh
         If+vCZG9+Qv9pOVzaZeEUYGlkYoetewmgTbY0DXvyyAO+xA6so8HMvsOqszJFxlwl54t
         qACutE0Hb4PDfLYOXeRfCjPAn12XUm7Ih5LOw0MfXGZUvYP1PCTl9r0l0xmmVNQa03yr
         bUtKpOqeRceFYo8l5r1UVj7At0jeONVSoK+9ZvhJ3iuyx26MAMNwIMC2s7/7o7djan6t
         qRtQ==
X-Gm-Message-State: AFq9FYLtuHAO3W9AoO/qtrkHQ+LgZwC3wRapdy60l9lBD+4PDiMgOynB
	Qfc+orgKeUullgEJxcpqA6PqQZjW3ePFa/C7ovrFbe3ei6Ztm2Ctb+UTj9YjuQ==
X-Gm-Gg: AYBFou0hkobALXZFouZbx4vQ8GWNY9Ytfm15ElFCOhuhCsNeScH8+cK4GcuKdTD5yty
	ueLlg4CYkOywafNDGLmwtgL+YEvQu1har7RHYXtsdDD9Cc749mj3fSeMNydfR2vhqb3GPCyltIF
	YmmljP51eHbJuZiGoK299hdViCNkifYTpPDATyD1RrrUat189RSuDj/sjArsNN/az1UCeda+S1A
	4WwCIIElbrS+nYAKyTeJPzNRVeCsRczIxTib91fSkV9FUlAJ0I5GJlNsmK6iks1azO8am/N2qxH
	lsAWEtrtLHLPzx6aIs0weTWKl6uZ0s4NNJL56boiV1IdLlEjHLwyzclQnalN/dgFOxCv59dnDYK
	kMJkoPYBilFgDDc9hubc3+vz9h4I3kSMe8DTegrbS2qRWaCtXue6i0aQnUPWxtBN4HXOJ8XH9yk
	IB9Ftl+oXGvjVbsKL3Jht0qrQP9ugvEuUJoTw20x2sPQws/AnhCczxIHuhF0kLDmxCQA3Tf45HM
	tMBQtsOyE7jAiPqhkAt1sQ=
X-Received: by 2002:a17:902:f786:b0:2e2:c28d:ab6b with SMTP id d9443c01a7336-2e84270882amr146562355ad.0.1792043113171;
        Wed, 14 Oct 2026 22:45:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 67/82] strongswan: patch CVE-2026-78133
Date: Thu, 15 Oct 2026 18:41:55 +1300
Message-ID: <036fde2bb0b3bd4f7df18bfd39b90f6e11ef9354.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130987

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78133

[1]https://download.strongswan.org/security/CVE-2026-78133/strongswan-6.0.0-6.0.7_ikev2_rekey_collision.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78133).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 7a5589163324a26c8c3569d8e5ec11f078df0ef5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78133.patch           | 620 ++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |   1 +
 2 files changed, 621 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch
new file mode 100644
index 0000000000..f009168a9a
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch
@@ -0,0 +1,620 @@
+From 3f5768c48bc9dff62511c91157e0a9bd12b2159b Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 5 Jun 2026 08:15:46 +0200
+Subject: [PATCH] ikev2: Prevent use-after-free during collision after passive
+ multi-KE rekeying failed
+
+During a multi-KE rekey collision, where the initial response to the
+active rekeying is delayed (or withheld), the active task already keeps
+track of the passive task to eventually resolve the collision (it can
+only do so once all nonces are known).
+
+If the passive task then fails, e.g. due to a missing or invalid KE
+payload, and completes with SUCCESS, `collide()` previously recognized
+that the passive task is not yet complete returned FALSE, which caused
+the task manager to destroy the task.  However, the reference in the
+active task would remain.  So once the active rekeying progresses and
+the collision is resolved, that dangling pointer would get dereferenced
+for an indirect method call.  This happens via the `get_lower_nonce`
+function pointer of the `child_create_t` instance in the private task
+struct.  So besides having to be authenticated, an attacker has to get
+two indirections right to exploit this flaw for a potential RCE.
+Otherwise, the effects are a crash or basically undefined behavior
+triggered by the method call.
+
+By passing whether the passive task is done (and would get destroyed),
+the active tasks can properly clear the held reference.
+
+Note that this patch includes another fix for a state change during
+Child SA rekeying that's included in 6.1.0 (4611f41b1e14 ("child-rekey:
+Only reset state of SAs not actively rekeyed if passive rekeying
+fails")).
+
+Fixes: d2b2e1b3fae8 ("ikev2: Make CHILD_SAs properly trackable during rekey collisions")
+Fixes: ca3e6d2d144e ("ike-rekey: Support IKE_SA rekeying with multiple key exchanges")
+Fixes: CVE-2026-78133
+
+CVE: CVE-2026-78133
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/eb615b452539461d57503f50041f01773c1ccf86]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libcharon/sa/ikev2/task_manager_v2.c      |  13 +-
+ src/libcharon/sa/ikev2/tasks/child_rekey.c    |  47 ++++--
+ src/libcharon/sa/ikev2/tasks/child_rekey.h    |   3 +-
+ src/libcharon/sa/ikev2/tasks/ike_rekey.c      |  40 +++--
+ src/libcharon/sa/ikev2/tasks/ike_rekey.h      |   3 +-
+ src/libcharon/tests/suites/test_child_rekey.c | 136 ++++++++++++++++
+ src/libcharon/tests/suites/test_ike_rekey.c   | 147 ++++++++++++++++++
+ 7 files changed, 361 insertions(+), 28 deletions(-)
+
+diff --git a/src/libcharon/sa/ikev2/task_manager_v2.c b/src/libcharon/sa/ikev2/task_manager_v2.c
+index 0f3b937..5a19ce8 100644
+--- a/src/libcharon/sa/ikev2/task_manager_v2.c
++++ b/src/libcharon/sa/ikev2/task_manager_v2.c
+@@ -927,7 +927,8 @@ static status_t process_response(private_task_manager_t *this,
+  * Handle exchange collisions, returns TRUE if the given passive task was
+  * adopted by the active task and the task manager lost control over it.
+  */
+-static bool handle_collisions(private_task_manager_t *this, task_t *task)
++static bool handle_collisions(private_task_manager_t *this, task_t *task,
++							  bool done)
+ {
+ 	enumerator_t *enumerator;
+ 	task_t *active;
+@@ -951,7 +952,7 @@ static bool handle_collisions(private_task_manager_t *this, task_t *task)
+ 					if (type == TASK_IKE_REKEY || type == TASK_IKE_DELETE)
+ 					{
+ 						ike_rekey_t *rekey = (ike_rekey_t*)active;
+-						adopted = rekey->collide(rekey, task);
++						adopted = rekey->collide(rekey, task, done);
+ 						break;
+ 					}
+ 					continue;
+@@ -959,7 +960,7 @@ static bool handle_collisions(private_task_manager_t *this, task_t *task)
+ 					if (type == TASK_CHILD_REKEY)
+ 					{
+ 						child_rekey_t *rekey = (child_rekey_t*)active;
+-						adopted = rekey->collide(rekey, task);
++						adopted = rekey->collide(rekey, task, done);
+ 						break;
+ 					}
+ 					continue;
+@@ -1011,14 +1012,14 @@ static status_t build_response(private_task_manager_t *this, message_t *request)
+ 			case SUCCESS:
+ 				/* task completed, remove it */
+ 				array_remove_at(this->passive_tasks, enumerator);
+-				if (!handle_collisions(this, task))
++				if (!handle_collisions(this, task, TRUE))
+ 				{
+ 					task->destroy(task);
+ 				}
+ 				break;
+ 			case NEED_MORE:
+ 				/* processed, but task needs another exchange */
+-				if (handle_collisions(this, task))
++				if (handle_collisions(this, task, FALSE))
+ 				{
+ 					array_remove_at(this->passive_tasks, enumerator);
+ 				}
+@@ -1029,7 +1030,7 @@ static status_t build_response(private_task_manager_t *this, message_t *request)
+ 				/* FALL */
+ 			case DESTROY_ME:
+ 				/* destroy IKE_SA, but SEND response first */
+-				if (handle_collisions(this, task))
++				if (handle_collisions(this, task, FALSE))
+ 				{
+ 					array_remove_at(this->passive_tasks, enumerator);
+ 				}
+diff --git a/src/libcharon/sa/ikev2/tasks/child_rekey.c b/src/libcharon/sa/ikev2/tasks/child_rekey.c
+index fb3ba2a..e984668 100644
+--- a/src/libcharon/sa/ikev2/tasks/child_rekey.c
++++ b/src/libcharon/sa/ikev2/tasks/child_rekey.c
+@@ -403,7 +403,7 @@ METHOD(task_t, build_r, status_t,
+ 	child_sa_t *child_sa, *old_replacement;
+ 	child_sa_state_t state = CHILD_INSTALLED;
+ 	uint32_t reqid;
+-	bool followup_sent = FALSE;
++	bool active, followup_sent = FALSE;
+ 
+ 	if (!this->child_sa)
+ 	{
+@@ -423,7 +423,8 @@ METHOD(task_t, build_r, status_t,
+ 		message->add_notify(message, TRUE, TEMPORARY_FAILURE, chunk_empty);
+ 		return SUCCESS;
+ 	}
+-	if (actively_rekeying(this, &followup_sent) && followup_sent)
++	active = actively_rekeying(this, &followup_sent);
++	if (active && followup_sent)
+ 	{
+ 		DBG1(DBG_IKE, "peer initiated rekeying, but we did too and already "
+ 			 "sent IKE_FOLLOWUP_KE");
+@@ -483,8 +484,9 @@ METHOD(task_t, build_r, status_t,
+ 		/* like installing the outbound SA, we only trigger the child-rekey
+ 		 * event once the old SA is deleted */
+ 	}
+-	else if (this->child_sa->get_state(this->child_sa) == CHILD_REKEYING)
+-	{	/* rekeying failed, reuse old child */
++	else if (!active &&
++			 this->child_sa->get_state(this->child_sa) == CHILD_REKEYING)
++	{	/* rekeying failed, reuse old child, unless we are actively rekeying */
+ 		this->child_sa->set_state(this->child_sa, state);
+ 	}
+ 	return SUCCESS;
+@@ -1127,8 +1129,22 @@ METHOD(child_rekey_t, handle_delete, child_rekey_collision_t,
+ 	return CHILD_REKEY_COLLISION_NONE;
+ }
+ 
++/**
++ * Clear the colliding passive task if it did not complete successfully.
++ */
++static void clear_collision(private_child_rekey_t *this, task_t *other)
++{
++	if (this->collision == other)
++	{
++		DBG1(DBG_IKE, "colliding passive rekeying for CHILD_SA %s{%u} "
++			 "failed", this->child_sa->get_name(this->child_sa),
++			 this->child_sa->get_unique_id(this->child_sa));
++		this->collision = NULL;
++	}
++}
++
+ METHOD(child_rekey_t, collide, bool,
+-	private_child_rekey_t *this, task_t *other)
++	private_child_rekey_t *this, task_t *other, bool done)
+ {
+ 	private_child_rekey_t *rekey = (private_child_rekey_t*)other;
+ 	child_sa_t *other_child;
+@@ -1142,16 +1158,25 @@ METHOD(child_rekey_t, collide, bool,
+ 	other_child = rekey->child_create->get_child(rekey->child_create);
+ 	if (!other_child)
+ 	{
+-		/* ignore passive tasks that did not successfully create a CHILD_SA */
++		/* ignore passive tasks that did not successfully create a CHILD_SA,
++		 * if we are already tracking it in the multi-KE case, clear it */
++		clear_collision(this, other);
+ 		return FALSE;
+ 	}
+ 	if (other_child->get_state(other_child) != CHILD_INSTALLED)
+ 	{
+-		DBG1(DBG_IKE, "colliding passive rekeying for CHILD_SA %s{%u} is not "
+-			 "yet complete", this->child_sa->get_name(this->child_sa),
+-			 this->child_sa->get_unique_id(this->child_sa));
+-		/* we do reference the task to check its state later */
+-		this->collision = other;
++		if (done)
++		{	/* passive task failed, clear it if necessary */
++			clear_collision(this, other);
++		}
++		else
++		{
++			DBG1(DBG_IKE, "colliding passive rekeying for CHILD_SA %s{%u} is "
++				 "not yet complete", this->child_sa->get_name(this->child_sa),
++				 this->child_sa->get_unique_id(this->child_sa));
++			/* we do reference the task to check its state later */
++			this->collision = other;
++		}
+ 		return FALSE;
+ 	}
+ 	if (this->collision && this->collision != other)
+diff --git a/src/libcharon/sa/ikev2/tasks/child_rekey.h b/src/libcharon/sa/ikev2/tasks/child_rekey.h
+index a8daed7..fef0bba 100644
+--- a/src/libcharon/sa/ikev2/tasks/child_rekey.h
++++ b/src/libcharon/sa/ikev2/tasks/child_rekey.h
+@@ -79,10 +79,11 @@ struct child_rekey_t {
+ 	 * are going on and notifies the active task by passing the passive.
+ 	 *
+ 	 * @param other		passive task
++	 * @param done		passive task is done and gets destroyed if not adopted
+ 	 * @return			whether the task was adopted and should be removed from
+ 	 *					the task manager's control
+ 	 */
+-	bool (*collide)(child_rekey_t* this, task_t *other);
++	bool (*collide)(child_rekey_t* this, task_t *other, bool done);
+ };
+ 
+ /**
+diff --git a/src/libcharon/sa/ikev2/tasks/ike_rekey.c b/src/libcharon/sa/ikev2/tasks/ike_rekey.c
+index c7e8ffb..f275d2d 100644
+--- a/src/libcharon/sa/ikev2/tasks/ike_rekey.c
++++ b/src/libcharon/sa/ikev2/tasks/ike_rekey.c
+@@ -743,8 +743,23 @@ METHOD(ike_rekey_t, did_collide, bool,
+ 	return this->collision != NULL;
+ }
+ 
++/**
++ * Clear the colliding passive task if it did not complete successfully.
++ */
++static bool clear_collision(private_ike_rekey_t *this,
++							private_ike_rekey_t *other)
++{
++	if (this->collision == other)
++	{
++		DBG1(DBG_IKE, "colliding passive rekeying failed, ignore");
++		this->collision = NULL;
++		return TRUE;
++	}
++	return FALSE;
++}
++
+ METHOD(ike_rekey_t, collide, bool,
+-	private_ike_rekey_t* this, task_t *other)
++	private_ike_rekey_t* this, task_t *other, bool done)
+ {
+ 	DBG1(DBG_IKE, "detected %N collision with %N", task_type_names,
+ 		 TASK_IKE_REKEY, task_type_names, other->get_type(other));
+@@ -760,23 +775,30 @@ METHOD(ike_rekey_t, collide, bool,
+ 
+ 			if (!rekey->ike_init)
+ 			{
+-				DBG1(DBG_IKE, "colliding exchange did not result in an IKE_SA, "
+-					 "ignore");
+-				if (this->collision == rekey)
++				if (!clear_collision(this, rekey))
+ 				{
+-					this->collision = NULL;
++					DBG1(DBG_IKE, "colliding exchange did not result in an "
++						 "IKE_SA, ignore");
+ 				}
+ 				break;
+ 			}
+-			/* we keep track of the passive exchange in any case, if not
+-			 * complete yet, this method might be called again later */
+-			this->collision = rekey;
++			/* we keep track of the passive exchange, if not complete yet, this
++			 * method might be called again later */
+ 			if (rekey->flags & IKE_REKEY_DONE)
+ 			{
++				this->collision = rekey;
+ 				this->flags |= IKE_REKEY_ADOPTED_PASSIVE;
+ 				return TRUE;
+ 			}
+-			DBG1(DBG_IKE, "colliding passive exchange is not yet complete");
++			else if (done)
++			{	/* passive task failed, clear it if necessary */
++				clear_collision(this, rekey);
++			}
++			else
++			{
++				DBG1(DBG_IKE, "colliding passive exchange is not yet complete");
++				this->collision = rekey;
++			}
+ 			break;
+ 		}
+ 		default:
+diff --git a/src/libcharon/sa/ikev2/tasks/ike_rekey.h b/src/libcharon/sa/ikev2/tasks/ike_rekey.h
+index 5fab349..e68fa62 100644
+--- a/src/libcharon/sa/ikev2/tasks/ike_rekey.h
++++ b/src/libcharon/sa/ikev2/tasks/ike_rekey.h
+@@ -54,10 +54,11 @@ struct ike_rekey_t {
+ 	 * are going on and notifies the active task by passing the passive.
+ 	 *
+ 	 * @param other		passive task
++	 * @param done		passive task is done and gets destroyed if not adopted
+ 	 * @return			whether the task was adopted and should be removed from
+ 	 *					the task manager's control
+ 	 */
+-	bool (*collide)(ike_rekey_t* this, task_t *other);
++	bool (*collide)(ike_rekey_t* this, task_t *other, bool done);
+ };
+ 
+ /**
+diff --git a/src/libcharon/tests/suites/test_child_rekey.c b/src/libcharon/tests/suites/test_child_rekey.c
+index 1c81e75..4ef081a 100644
+--- a/src/libcharon/tests/suites/test_child_rekey.c
++++ b/src/libcharon/tests/suites/test_child_rekey.c
+@@ -2546,6 +2546,141 @@ START_TEST(test_collision_delayed_response_multi_ke)
+ }
+ END_TEST
+ 
++/**
++ * Remove the KE payload from the IKE_FOLLOWUP_KE request
++ */
++static bool remove_ke(listener_t *listener, ike_sa_t *ike_sa,
++					  message_t *message, bool incoming, bool plain)
++{
++	if (plain && incoming &&
++		message->get_exchange_type(message) == IKE_FOLLOWUP_KE &&
++		message->get_request(message))
++	{
++		enumerator_t *enumerator = message->create_payload_enumerator(message);
++		payload_t *pld;
++
++		while (enumerator->enumerate(enumerator, &pld))
++		{
++			if (pld->get_type(pld) == PLV2_KEY_EXCHANGE)
++			{
++				message->remove_payload_at(message, enumerator);
++				pld->destroy(pld);
++				break;
++			}
++		}
++		enumerator->destroy(enumerator);
++		free(listener);
++		return FALSE;
++	}
++	return TRUE;
++}
++
++#define remove_ke_from_ike_followup_ke() ({ \
++	listener_t *_ke_listener; \
++	INIT(_ke_listener, \
++		.message = remove_ke, \
++	); \
++	exchange_test_helper->add_listener(exchange_test_helper, _ke_listener); \
++})
++
++/**
++ * This simulates an incorrect behavior by the peer.  It triggers a collision by
++ * not responding to the initial CREATE_CHILD_SA and then sends an invalid
++ * IKE_FOLLOWUP_KE (in this case the KE payload is missing).  The initiator
++ * has to correctly track and then untrack the passive rekey task.
++ *
++ *           Peer A                   Peer B
++ *            rekey ----\       /---- rekey
++ *                       \-----/----> detect collision and withhold response
++ * detect collision <---------/
++ *                  ---------------->
++ *   handle failure <---------------- send invalid additional KE
++ *     handle rekey <---------------- send withheld response
++ */
++START_TEST(test_collision_delayed_response_multi_ke_failure)
++{
++	ike_sa_t *a, *b;
++	message_t *msg;
++
++	assert_track_sas_start();
++
++	exchange_test_helper->establish_sa(exchange_test_helper,
++									   &a, &b, &multi_ke_conf);
++
++	/* make sure the responder wins the collision so it continues */
++	exchange_test_helper->nonce_first_byte = 0x00;
++	initiate_rekey(a, 1);
++	assert_ipsec_sas_installed(a, 1, 2);
++	exchange_test_helper->nonce_first_byte = 0xff;
++	initiate_rekey(b, 2);
++	assert_ipsec_sas_installed(b, 1, 2);
++
++	/* these should not get called as no SA goes down or gets rekeyed */
++	assert_hook_not_called(child_updown);
++	assert_hook_not_called(child_rekey);
++
++	/* CREATE_CHILD_SA { N(REKEY_SA), SA, Ni, [KEi,] TSi, TSr } --> */
++	exchange_test_helper->nonce_first_byte = 0xff;
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++	assert_child_sa_state(b, 2, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(b, 1, 2);
++
++	/* <-- CREATE_CHILD_SA { N(REKEY_SA), SA, Ni, [KEi,] TSi, TSr } */
++	exchange_test_helper->nonce_first_byte = 0xff;
++	exchange_test_helper->process_message(exchange_test_helper, a, NULL);
++	assert_child_sa_state(a, 1, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(a, 1, 2);
++
++	/* the responder is not responding */
++	msg = exchange_test_helper->sender->dequeue(exchange_test_helper->sender);
++
++	/* CREATE_CHILD_SA { SA, Nr, [KEr,] TSi, TSr } --> */
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++	assert_num_tasks(b, 0, TASK_QUEUE_PASSIVE);
++	assert_num_tasks(b, 1, TASK_QUEUE_ACTIVE);
++	assert_child_sa_state(b, 2, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(b, 1, 2);
++
++	/* remove the KE payload in the IKE_FOLLOWUP_KE request */
++	remove_ke_from_ike_followup_ke();
++
++	/* <-- IKE_FOLLOWUP_KE { N(ADD_KE) } */
++	assert_no_payload(IN, PLV2_KEY_EXCHANGE);
++	assert_single_notify(OUT, INVALID_SYNTAX);
++	exchange_test_helper->process_message(exchange_test_helper, a, NULL);
++	assert_child_sa_state(a, 1, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(a, 1, 2);
++	assert_num_tasks(a, 0, TASK_QUEUE_PASSIVE);
++
++	/* <-- CREATE_CHILD_SA { SA, Nr, [KEr,] TSi, TSr } (delayed) */
++	exchange_test_helper->process_message(exchange_test_helper, a, msg);
++	assert_num_tasks(a, 0, TASK_QUEUE_PASSIVE);
++	assert_num_tasks(a, 1, TASK_QUEUE_ACTIVE);
++	assert_child_sa_state(a, 1, CHILD_REKEYING, CHILD_OUTBOUND_INSTALLED);
++	assert_ipsec_sas_installed(a, 1, 2);
++
++	/* drop the STATE_NOT_FOUND error message from the initiator */
++	msg = exchange_test_helper->sender->dequeue(exchange_test_helper->sender);
++	msg->destroy(msg);
++
++	/* since we explicitly forced the responder to win, it already removed
++	 * the passive task it won't accept the request */
++
++	/* IKE_FOLLOWUP_KE { KEi, N(ADD_KE) } --> */
++	assert_payload(IN, PLV2_KEY_EXCHANGE);
++	assert_notify(IN, ADDITIONAL_KEY_EXCHANGE);
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++
++	/* child_rekey/child_updown */
++	assert_hook();
++	assert_hook();
++	assert_track_sas(2, 2);
++
++	call_ikesa(a, destroy);
++	call_ikesa(b, destroy);
++}
++END_TEST
++
+ /**
+  * In this scenario one of the peers does not notice that there is a
+  * rekey collision:
+@@ -4436,6 +4571,7 @@ Suite *child_rekey_suite_create()
+ 	tcase_add_loop_test(tc, test_collision_delayed_response, 0, 4);
+ 	tcase_add_loop_test(tc, test_collision_delayed_response_delete, 0, 4);
+ 	tcase_add_loop_test(tc, test_collision_delayed_response_multi_ke, 0, 4);
++	tcase_add_test(tc, test_collision_delayed_response_multi_ke_failure);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request, 0, 6);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request_more, 0, 3);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request_more_delete, 0, 3);
+diff --git a/src/libcharon/tests/suites/test_ike_rekey.c b/src/libcharon/tests/suites/test_ike_rekey.c
+index c6691ac..2c41022 100644
+--- a/src/libcharon/tests/suites/test_ike_rekey.c
++++ b/src/libcharon/tests/suites/test_ike_rekey.c
+@@ -1784,6 +1784,152 @@ START_TEST(test_collision_delayed_response_multi_ke)
+ }
+ END_TEST
+ 
++/**
++ * Remove the ADDITIONAL_KEY_EXCHANGE notify payload from the IKE_FOLLOWUP_KE
++ * request
++ */
++static bool remove_notify(listener_t *listener, ike_sa_t *ike_sa,
++						  message_t *message, bool incoming, bool plain)
++{
++	if (plain && incoming &&
++		message->get_exchange_type(message) == IKE_FOLLOWUP_KE &&
++		message->get_request(message))
++	{
++		enumerator_t *enumerator = message->create_payload_enumerator(message);
++		payload_t *pld;
++
++		while (enumerator->enumerate(enumerator, &pld))
++		{	/* we only expect one notify, so just remove the first */
++			if (pld->get_type(pld) == PLV2_NOTIFY)
++			{
++				message->remove_payload_at(message, enumerator);
++				pld->destroy(pld);
++				break;
++			}
++		}
++		enumerator->destroy(enumerator);
++		free(listener);
++		return FALSE;
++	}
++	return TRUE;
++}
++
++#define remove_notify_from_ike_followup_ke() ({ \
++	listener_t *_ke_listener; \
++	INIT(_ke_listener, \
++		.message = remove_notify, \
++	); \
++	exchange_test_helper->add_listener(exchange_test_helper, _ke_listener); \
++})
++
++/**
++ * This simulates an incorrect behavior by the peer.  It triggers a collision by
++ * not responding to the initial CREATE_CHILD_SA and then sends an invalid
++ * IKE_FOLLOWUP_KE (in this case by removing the ADDITIONAL_KEY_EXCHANGE
++ * notify).  The initiator has to correctly track and then untrack the passive
++ * rekey task.
++ *
++ *           Peer A                   Peer B
++ *            rekey ----\       /---- rekey
++ *                       \-----/----> detect collision and withhold response
++ * detect collision <---------/
++ *                  ---------------->
++ *   handle failure <---------------- send invalid additional KE
++ *     handle rekey <---------------- send withheld response
++ */
++START_TEST(test_collision_delayed_response_multi_ke_failure)
++{
++	ike_sa_t *a, *b;
++	message_t *msg;
++
++	assert_track_sas_start();
++
++	exchange_test_helper->establish_sa(exchange_test_helper,
++									   &a, &b, &multi_ke_conf);
++
++	/* these should not get called as no SA goes down or gets rekeyed */
++	assert_hook_not_called(ike_updown);
++	assert_hook_not_called(ike_rekey);
++	assert_hook_not_called(child_updown);
++
++	/* make sure the responder wins the collision so it continues */
++	exchange_test_helper->nonce_first_byte = 0x00;
++	initiate_rekey(a);
++	exchange_test_helper->nonce_first_byte = 0xff;
++	initiate_rekey(b);
++
++	/* CREATE_CHILD_SA { SA, Ni, KEi } --> */
++	exchange_test_helper->nonce_first_byte = 0xff;
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++	assert_ike_sa_state(b, IKE_REKEYING);
++	assert_child_sa_count(b, 1);
++	assert_ike_sa_count(0);
++
++	/* <-- CREATE_CHILD_SA { SA, Ni, KEi } */
++	exchange_test_helper->nonce_first_byte = 0xff;
++	exchange_test_helper->process_message(exchange_test_helper, a, NULL);
++	assert_ike_sa_state(a, IKE_REKEYING);
++	assert_child_sa_count(a, 1);
++	assert_ike_sa_count(0);
++
++	/* the responder is not responding */
++	msg = exchange_test_helper->sender->dequeue(exchange_test_helper->sender);
++
++	/* simplify next steps by checking in original IKE_SAs */
++	charon->ike_sa_manager->checkin(charon->ike_sa_manager, a);
++	charon->ike_sa_manager->checkin(charon->ike_sa_manager, b);
++	assert_ike_sa_count(2);
++
++	/* CREATE_CHILD_SA { SA, Nr, KEr, N(ADD_KE) } --> */
++	assert_notify(IN, ADDITIONAL_KEY_EXCHANGE);
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++	assert_num_tasks(b, 0, TASK_QUEUE_PASSIVE);
++	assert_num_tasks(b, 1, TASK_QUEUE_ACTIVE);
++	assert_ike_sa_state(b, IKE_REKEYING);
++	assert_ike_sa_count(2);
++
++	/* remove the ADD_KE notify from the IKE_FOLLOWUP_KE request */
++	remove_notify_from_ike_followup_ke();
++
++	/* <-- IKE_FOLLOWUP_KE { KEi } */
++	assert_payload(IN, PLV2_KEY_EXCHANGE);
++	assert_no_notify(IN, ADDITIONAL_KEY_EXCHANGE);
++	assert_single_notify(OUT, STATE_NOT_FOUND);
++	exchange_test_helper->process_message(exchange_test_helper, a, NULL);
++	assert_ike_sa_state(a, IKE_REKEYING);
++	assert_child_sa_count(a, 1);
++	assert_ike_sa_count(2);
++
++	/* <-- CREATE_CHILD_SA { SA, Nr, KEr } (delayed) */
++	exchange_test_helper->process_message(exchange_test_helper, a, msg);
++	assert_num_tasks(a, 0, TASK_QUEUE_PASSIVE);
++	assert_num_tasks(a, 1, TASK_QUEUE_ACTIVE);
++	assert_ike_sa_state(a, IKE_REKEYING);
++	assert_child_sa_count(a, 1);
++	assert_ike_sa_count(2);
++
++	/* drop the STATE_NOT_FOUND error message from the initiator */
++	msg = exchange_test_helper->sender->dequeue(exchange_test_helper->sender);
++	msg->destroy(msg);
++
++	/* since we explicitly forced the responder to win, it already removed
++	 * the passive task it won't accept the request */
++
++	/* IKE_FOLLOWUP_KE { KEi, N(ADD_KE) } --> */
++	assert_payload(IN, PLV2_KEY_EXCHANGE);
++	assert_notify(IN, ADDITIONAL_KEY_EXCHANGE);
++	exchange_test_helper->process_message(exchange_test_helper, b, NULL);
++
++	/* ike_updown/rekey/child_updown */
++	assert_hook();
++	assert_hook();
++	assert_hook();
++	assert_track_sas(2, 2);
++
++	charon->ike_sa_manager->flush(charon->ike_sa_manager);
++}
++END_TEST
++
+ /**
+  * In this scenario one of the peers does not notice that there is a rekey
+  * collision because the other request is dropped:
+@@ -2590,6 +2736,7 @@ Suite *ike_rekey_suite_create()
+ 	tcase_add_loop_test(tc, test_collision_ke_invalid_delayed_retry, 0, 3);
+ 	tcase_add_loop_test(tc, test_collision_delayed_response, 0, 4);
+ 	tcase_add_loop_test(tc, test_collision_delayed_response_multi_ke, 0, 4);
++	tcase_add_test(tc, test_collision_delayed_response_multi_ke_failure);
+ 	tcase_add_loop_test(tc, test_collision_dropped_request, 0, 3);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request, 0, 3);
+ 	tcase_add_loop_test(tc, test_collision_delayed_request_and_delete, 0, 3);
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index 5a7a12d903..bd3191d35d 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78126.patch \
            file://CVE-2026-78127.patch \
            file://CVE-2026-78129.patch \
+           file://CVE-2026-78133.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

