Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E7CC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 07:44:05 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.3398.1744875837844469581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 00:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 17 Apr 2025 16:43:55 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.127 with ESMTP; 17 Apr 2025 16:43:55 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-networking][PATCH] strongswan: fix error with gcc-15
Date: Thu, 17 Apr 2025 16:43:54 +0900
Message-Id: <20250417074354.1302975-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 07:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116919

From: "mark.yang" <mark.yang@lge.com>

* Backport 3 Patch:
  - 0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch
  - 0002-callback-job-Replace-return_false-in-constructors-wi.patch
  - 0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch

* To fix the error with gcc-15.
  - See more details: http://errors.yoctoproject.org/Errors/Details/851801

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...e-of-help-to-match-that-of-a-callbac.patch |  25 ++++
 ...lace-return_false-in-constructors-wi.patch |  90 +++++++++++++
 ...urn_-nop-and-enumerator_create_empty.patch | 118 ++++++++++++++++++
 .../strongswan/strongswan_6.0.1.bb            |   8 +-
 4 files changed, 239 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/0002-callback-job-Replace-return_false-in-constructors-wi.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch b/meta-networking/recipes-support/strongswan/strongswan/0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch
new file mode 100644
index 0000000000..92c848f095
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch
@@ -0,0 +1,25 @@
+From a7b5de569082398a14b7e571498e55d005903aaf Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 21 Feb 2025 17:18:35 +0100
+Subject: [PATCH] pki: Fix signature of help() to match that of a callback in
+ command_t
+
+Upstream-Status: Backport [a7b5de5 pki: Fix signature of help() to match that of a callback in command_t]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/pki/command.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pki/command.c b/src/pki/command.c
+index accec5fe5..6e6bf041e 100644
+--- a/src/pki/command.c
++++ b/src/pki/command.c
+@@ -265,7 +265,7 @@ int command_usage(char *error)
+ /**
+  * Show usage information
+  */
+-static int help(int c, char *v[])
++static int help()
+ {
+ 	return command_usage(NULL);
+ }
diff --git a/meta-networking/recipes-support/strongswan/strongswan/0002-callback-job-Replace-return_false-in-constructors-wi.patch b/meta-networking/recipes-support/strongswan/strongswan/0002-callback-job-Replace-return_false-in-constructors-wi.patch
new file mode 100644
index 0000000000..09451206ca
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/0002-callback-job-Replace-return_false-in-constructors-wi.patch
@@ -0,0 +1,90 @@
+From d5d2568ff0e88d364dadf50b67bf17050763cf98 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 21 Feb 2025 16:45:57 +0100
+Subject: [PATCH] callback-job: Replace return_false() in constructors with
+ dedicated function
+
+Besides being clearer, this fixes issues with GCC 15.  The latter uses
+C23 by default, which changes the meaning of function declarations
+without parameters such as
+
+	bool return false();
+
+Instead of "this function takes an unknown number of arguments", this
+now equals (void), that is, "this function takes no arguments".  So we
+run into incompatible pointer type warnings all over when using such
+functions.  They could be cast to (void*) but this seems the cleaner
+solution for this use case.
+
+Upstream-Status: Backport [d5d2568 callback-job: Replace return_false() in constructors with dedicated function]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/libstrongswan/processing/jobs/callback_job.c      | 10 +++++++++-
+ src/libstrongswan/processing/jobs/callback_job.h      | 11 ++++++++++-
+ src/libstrongswan/processing/scheduler.c              |  3 ++-
+ 3 files changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/src/libstrongswan/processing/jobs/callback_job.c b/src/libstrongswan/processing/jobs/callback_job.c
+index cb2a0aba5..3ab40b947 100644
+--- a/src/libstrongswan/processing/jobs/callback_job.c
++++ b/src/libstrongswan/processing/jobs/callback_job.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2009-2012 Tobias Brunner
++ * Copyright (C) 2009-2025 Tobias Brunner
+  * Copyright (C) 2007-2011 Martin Willi
+  *
+  * Copyright (C) secunet Security Networks AG
+@@ -131,3 +131,11 @@ callback_job_t *callback_job_create(callback_job_cb_t cb, void *data,
+ 	return callback_job_create_with_prio(cb, data, cleanup, cancel,
+ 										 JOB_PRIO_MEDIUM);
+ }
++
++/*
++ * Described in header
++ */
++bool callback_job_cancel_thread(void *data)
++{
++	return FALSE;
++}
+diff --git a/src/libstrongswan/processing/jobs/callback_job.h b/src/libstrongswan/processing/jobs/callback_job.h
+index 0f1ae212d..fda868879 100644
+--- a/src/libstrongswan/processing/jobs/callback_job.h
++++ b/src/libstrongswan/processing/jobs/callback_job.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2012 Tobias Brunner
++ * Copyright (C) 2012-2025 Tobias Brunner
+  * Copyright (C) 2007-2011 Martin Willi
+  *
+  * Copyright (C) secunet Security Networks AG
+@@ -62,6 +62,15 @@ typedef void (*callback_job_cleanup_t)(void *data);
+  */
+ typedef bool (*callback_job_cancel_t)(void *data);
+ 
++/**
++ * Default implementation of callback_job_cancel_t that simply returns FALSE
++ * to force cancellation of the thread by the processor.
++ *
++ * @param data			ignored argument
++ * @return				always returns FALSE
++ */
++bool callback_job_cancel_thread(void *data);
++
+ /**
+  * Class representing an callback Job.
+  *
+diff --git a/src/libstrongswan/processing/scheduler.c b/src/libstrongswan/processing/scheduler.c
+index c5e5dd83e..76d98ddff 100644
+--- a/src/libstrongswan/processing/scheduler.c
++++ b/src/libstrongswan/processing/scheduler.c
+@@ -329,7 +329,8 @@ scheduler_t * scheduler_create()
+ 	this->heap = (event_t**)calloc(this->heap_size + 1, sizeof(event_t*));
+ 
+ 	job = callback_job_create_with_prio((callback_job_cb_t)schedule, this,
+-										NULL, return_false, JOB_PRIO_CRITICAL);
++										NULL, callback_job_cancel_thread,
++										JOB_PRIO_CRITICAL);
+ 	lib->processor->queue_job(lib->processor, (job_t*)job);
+ 
+ 	return &this->public;
diff --git a/meta-networking/recipes-support/strongswan/strongswan/0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch b/meta-networking/recipes-support/strongswan/strongswan/0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch
new file mode 100644
index 0000000000..6c2a77105a
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch
@@ -0,0 +1,118 @@
+From 11978ddd39e800b5f35f721d726e8a4cb7e4ec0f Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 21 Feb 2025 17:00:44 +0100
+Subject: [PATCH] Cast uses of return_*(), nop() and enumerator_create_empty()
+
+As described in the previous commit, GCC 15 uses C23 by default and that
+changes the meaning of such argument-less function declarations.  So
+whenever we assign such a function to a pointer that expects a function
+with arguments it causes an incompatible pointer type warning.  We
+could define dedicated functions/callbacks whenever necessary, but this
+seems like the simpler approach for now (especially since most uses of
+these functions have already been cast).
+
+Upstream-Status: Backport [11978dd Cast uses of return_*(), nop() and enumerator_create_empty()]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/charon-nm/nm/nm_handler.c                           | 2 +-
+ src/libcharon/encoding/payloads/encrypted_payload.c     | 2 +-
+ src/libcharon/plugins/android_dns/android_dns_handler.c | 2 +-
+ src/libcharon/plugins/ha/ha_attribute.c                 | 2 +-
+ src/libcharon/plugins/updown/updown_handler.c           | 2 +-
+ src/libstrongswan/utils/identification.c                | 6 +++---
+ 6 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/charon-nm/nm/nm_handler.c b/src/charon-nm/nm/nm_handler.c
+index d7331ad72..39d0190ac 100644
+--- a/src/charon-nm/nm/nm_handler.c
++++ b/src/charon-nm/nm/nm_handler.c
+@@ -195,7 +195,7 @@ nm_handler_t *nm_handler_create()
+ 		.public = {
+ 			.handler = {
+ 				.handle = _handle,
+-				.release = nop,
++				.release = (void*)nop,
+ 				.create_attribute_enumerator = _create_attribute_enumerator,
+ 			},
+ 			.create_enumerator = _create_enumerator,
+diff --git a/src/libcharon/encoding/payloads/encrypted_payload.c b/src/libcharon/encoding/payloads/encrypted_payload.c
+index 676d00b7a..4821c6108 100644
+--- a/src/libcharon/encoding/payloads/encrypted_payload.c
++++ b/src/libcharon/encoding/payloads/encrypted_payload.c
+@@ -1023,7 +1023,7 @@ encrypted_fragment_payload_t *encrypted_fragment_payload_create()
+ 				.get_length = _frag_get_length,
+ 				.add_payload = _frag_add_payload,
+ 				.remove_payload = (void*)return_null,
+-				.generate_payloads = nop,
++				.generate_payloads = (void*)nop,
+ 				.set_transform = _frag_set_transform,
+ 				.get_transform = _frag_get_transform,
+ 				.encrypt = _frag_encrypt,
+diff --git a/src/libcharon/plugins/android_dns/android_dns_handler.c b/src/libcharon/plugins/android_dns/android_dns_handler.c
+index 78f4f702a..14d2ff99a 100644
+--- a/src/libcharon/plugins/android_dns/android_dns_handler.c
++++ b/src/libcharon/plugins/android_dns/android_dns_handler.c
+@@ -191,7 +191,7 @@ METHOD(enumerator_t, enumerate_dns, bool,
+ 	VA_ARGS_VGET(args, type, data);
+ 	*type = INTERNAL_IP4_DNS;
+ 	*data = chunk_empty;
+-	this->venumerate = return_false;
++	this->venumerate = (void*)return_false;
+ 	return TRUE;
+ }
+ 
+diff --git a/src/libcharon/plugins/ha/ha_attribute.c b/src/libcharon/plugins/ha/ha_attribute.c
+index b865a4b82..103d1a937 100644
+--- a/src/libcharon/plugins/ha/ha_attribute.c
++++ b/src/libcharon/plugins/ha/ha_attribute.c
+@@ -381,7 +381,7 @@ ha_attribute_t *ha_attribute_create(ha_kernel_t *kernel, ha_segments_t *segments
+ 			.provider = {
+ 				.acquire_address = _acquire_address,
+ 				.release_address = _release_address,
+-				.create_attribute_enumerator = enumerator_create_empty,
++				.create_attribute_enumerator = (void*)enumerator_create_empty,
+ 			},
+ 			.reserve = _reserve,
+ 			.destroy = _destroy,
+diff --git a/src/libcharon/plugins/updown/updown_handler.c b/src/libcharon/plugins/updown/updown_handler.c
+index 36eb15615..3707e1e65 100644
+--- a/src/libcharon/plugins/updown/updown_handler.c
++++ b/src/libcharon/plugins/updown/updown_handler.c
+@@ -220,7 +220,7 @@ updown_handler_t *updown_handler_create()
+ 			.handler = {
+ 				.handle = _handle,
+ 				.release = _release,
+-				.create_attribute_enumerator = enumerator_create_empty,
++				.create_attribute_enumerator = (void*)enumerator_create_empty,
+ 			},
+ 			.create_dns_enumerator = _create_dns_enumerator,
+ 			.destroy = _destroy,
+diff --git a/src/libstrongswan/utils/identification.c b/src/libstrongswan/utils/identification.c
+index d31955b38..58a05052d 100644
+--- a/src/libstrongswan/utils/identification.c
++++ b/src/libstrongswan/utils/identification.c
+@@ -1625,7 +1625,7 @@ static private_identification_t *identification_create(id_type_t type)
+ 			this->public.hash = _hash_binary;
+ 			this->public.equals = _equals_binary;
+ 			this->public.matches = _matches_any;
+-			this->public.contains_wildcards = return_true;
++			this->public.contains_wildcards = (void*)return_true;
+ 			break;
+ 		case ID_FQDN:
+ 		case ID_RFC822_ADDR:
+@@ -1660,13 +1660,13 @@ static private_identification_t *identification_create(id_type_t type)
+ 			this->public.hash = _hash_binary;
+ 			this->public.equals = _equals_binary;
+ 			this->public.matches = _matches_range;
+-			this->public.contains_wildcards = return_false;
++			this->public.contains_wildcards = (void*)return_false;
+ 			break;
+ 		default:
+ 			this->public.hash = _hash_binary;
+ 			this->public.equals = _equals_binary;
+ 			this->public.matches = _matches_binary;
+-			this->public.contains_wildcards = return_false;
++			this->public.contains_wildcards = (void*)return_false;
+ 			break;
+ 	}
+ 	return this;
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
index 9baf219cea..771470f695 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
@@ -8,8 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
-SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-          "
+SRC_URI = " \
+    https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
+    file://0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch \
+    file://0002-callback-job-Replace-return_false-in-constructors-wi.patch \
+    file://0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch \
+    "
 
 SRC_URI[sha256sum] = "212368cbc674fed31f3292210303fff06da8b90acad2d1387375ed855e6879c4"
 

