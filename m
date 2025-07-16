Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5E5C83F27
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:34 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.15679.1752648083685573178
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SdFhbFyQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648083; x=1784184083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WuHKrVACbiPZQB2TJq0YYe6jElphKQJUWRqCFrusjwU=;
  b=SdFhbFyQ6SV4jO30PWXisaNyWe1lGz3oX9ewDtoQ5HdFZ7HKFN02EX81
   bDyDBzOweTaKKxsUJjk4B5o6z3mNp3NzSPrQkqJevW1V4PUR2nOywTC2H
   n4kd/mbRMpEdANjmjf7hhTx7HZtkJ10DbveEpJ3bbSqyyzjpDf1Aw5c8i
   XUQ3ONVO/rDn8VkGd804OFR5gYpmRp+9rg9N3ZPH7oxOrseEJaQYAHMde
   9oj93lvNIUeAMSjLhdKkA54RL3be/CR6uG4v/+2vsbQdVmzSTeHQlTd07
   TR3dgVex9PZu1SANE92uPzHFgaCOBhuQRc+g/66UZt5ut6KKT8oxkD9B2
   w==;
X-CSE-ConnectionGUID: p0RY1yFHRmWe8AM0vNqGwA==
X-CSE-MsgGUID: pfSDjUvGSW20gkfoPNBm3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="206473813"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="206473813"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:22 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0FAA5C00218
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:22 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1721E18002F3
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B8F501A0096;
	Wed, 16 Jul 2025 14:41:17 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/14] strongswan: upgrade 6.0.1 -> 6.0.2
Date: Wed, 16 Jul 2025 14:41:01 +0800
Message-ID: <20250716064102.1813-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118583

From: Wang Mingyu <wangmy@fujitsu.com>

0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch
0002-callback-job-Replace-return_false-in-constructors-wi.patch
0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch
removed since they're included in 6.0.2

Changelog:
=============
- Support for per-CPU SAs (RFC 9611) has been added (Linux 6.13+).
- Basic support for AGGFRAG mode (RFC 9347) has been added (Linux 6.14+).
- POSIX regular expressions can be used to match remote identities.
- Switching configs based on EAP-Identities is supported. Setting
  'remote.eap_id' now always initiates an EAP-Identity exchange.
- On Linux, sequence numbers from acquires are used when installing SAs. This
  allows handling narrowing properly.
- During rekeying, the narrowed traffic selectors are now proposed instead of
  the configured ones.
- The default AH/ESP proposals contain all supported key exchange methods plus
  'none' to make PFS optional and accept proposals of older peers.
- GRO for ESP in enabled for NAT-T UDP sockets, which can improve performance
  if the esp4|6_offload modules are loaded.
- charon-nm sets the VPN connection as persistent, preventing NetworkManager
  from tearing down the connection if the network connectivity changes.
- ML-KEM is supported via OpenSSL 3.5+.
- The wolfssl plugin is now compatible to wolfSSL's FIPS module.
- The libsoup plugin has been migrated to libsoup 3, libsoup 2 is not supported
  anymore.
- The long defunct uci plugin has been removed.
- Log messages by watcher_t are now logged in a separate log group ('wch').

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-of-help-to-match-that-of-a-callbac.patch |  25 ----
 ...lace-return_false-in-constructors-wi.patch |  90 -------------
 ...urn_-nop-and-enumerator_create_empty.patch | 118 ------------------
 ...trongswan_6.0.1.bb => strongswan_6.0.2.bb} |   9 +-
 4 files changed, 2 insertions(+), 240 deletions(-)
 delete mode 100644 meta-networking/recipes-support/strongswan/strongswan/0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch
 delete mode 100644 meta-networking/recipes-support/strongswan/strongswan/0002-callback-job-Replace-return_false-in-constructors-wi.patch
 delete mode 100644 meta-networking/recipes-support/strongswan/strongswan/0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.1.bb => strongswan_6.0.2.bb} (95%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan/0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch b/meta-networking/recipes-support/strongswan/strongswan/0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch
deleted file mode 100644
index 92c848f095..0000000000
--- a/meta-networking/recipes-support/strongswan/strongswan/0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a7b5de569082398a14b7e571498e55d005903aaf Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Fri, 21 Feb 2025 17:18:35 +0100
-Subject: [PATCH] pki: Fix signature of help() to match that of a callback in
- command_t
-
-Upstream-Status: Backport [a7b5de5 pki: Fix signature of help() to match that of a callback in command_t]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- src/pki/command.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/pki/command.c b/src/pki/command.c
-index accec5fe5..6e6bf041e 100644
---- a/src/pki/command.c
-+++ b/src/pki/command.c
-@@ -265,7 +265,7 @@ int command_usage(char *error)
- /**
-  * Show usage information
-  */
--static int help(int c, char *v[])
-+static int help()
- {
- 	return command_usage(NULL);
- }
diff --git a/meta-networking/recipes-support/strongswan/strongswan/0002-callback-job-Replace-return_false-in-constructors-wi.patch b/meta-networking/recipes-support/strongswan/strongswan/0002-callback-job-Replace-return_false-in-constructors-wi.patch
deleted file mode 100644
index 09451206ca..0000000000
--- a/meta-networking/recipes-support/strongswan/strongswan/0002-callback-job-Replace-return_false-in-constructors-wi.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From d5d2568ff0e88d364dadf50b67bf17050763cf98 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Fri, 21 Feb 2025 16:45:57 +0100
-Subject: [PATCH] callback-job: Replace return_false() in constructors with
- dedicated function
-
-Besides being clearer, this fixes issues with GCC 15.  The latter uses
-C23 by default, which changes the meaning of function declarations
-without parameters such as
-
-	bool return false();
-
-Instead of "this function takes an unknown number of arguments", this
-now equals (void), that is, "this function takes no arguments".  So we
-run into incompatible pointer type warnings all over when using such
-functions.  They could be cast to (void*) but this seems the cleaner
-solution for this use case.
-
-Upstream-Status: Backport [d5d2568 callback-job: Replace return_false() in constructors with dedicated function]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- src/libstrongswan/processing/jobs/callback_job.c      | 10 +++++++++-
- src/libstrongswan/processing/jobs/callback_job.h      | 11 ++++++++++-
- src/libstrongswan/processing/scheduler.c              |  3 ++-
- 3 files changed, 21 insertions(+), 3 deletions(-)
-
-diff --git a/src/libstrongswan/processing/jobs/callback_job.c b/src/libstrongswan/processing/jobs/callback_job.c
-index cb2a0aba5..3ab40b947 100644
---- a/src/libstrongswan/processing/jobs/callback_job.c
-+++ b/src/libstrongswan/processing/jobs/callback_job.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C) 2009-2012 Tobias Brunner
-+ * Copyright (C) 2009-2025 Tobias Brunner
-  * Copyright (C) 2007-2011 Martin Willi
-  *
-  * Copyright (C) secunet Security Networks AG
-@@ -131,3 +131,11 @@ callback_job_t *callback_job_create(callback_job_cb_t cb, void *data,
- 	return callback_job_create_with_prio(cb, data, cleanup, cancel,
- 										 JOB_PRIO_MEDIUM);
- }
-+
-+/*
-+ * Described in header
-+ */
-+bool callback_job_cancel_thread(void *data)
-+{
-+	return FALSE;
-+}
-diff --git a/src/libstrongswan/processing/jobs/callback_job.h b/src/libstrongswan/processing/jobs/callback_job.h
-index 0f1ae212d..fda868879 100644
---- a/src/libstrongswan/processing/jobs/callback_job.h
-+++ b/src/libstrongswan/processing/jobs/callback_job.h
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C) 2012 Tobias Brunner
-+ * Copyright (C) 2012-2025 Tobias Brunner
-  * Copyright (C) 2007-2011 Martin Willi
-  *
-  * Copyright (C) secunet Security Networks AG
-@@ -62,6 +62,15 @@ typedef void (*callback_job_cleanup_t)(void *data);
-  */
- typedef bool (*callback_job_cancel_t)(void *data);
- 
-+/**
-+ * Default implementation of callback_job_cancel_t that simply returns FALSE
-+ * to force cancellation of the thread by the processor.
-+ *
-+ * @param data			ignored argument
-+ * @return				always returns FALSE
-+ */
-+bool callback_job_cancel_thread(void *data);
-+
- /**
-  * Class representing an callback Job.
-  *
-diff --git a/src/libstrongswan/processing/scheduler.c b/src/libstrongswan/processing/scheduler.c
-index c5e5dd83e..76d98ddff 100644
---- a/src/libstrongswan/processing/scheduler.c
-+++ b/src/libstrongswan/processing/scheduler.c
-@@ -329,7 +329,8 @@ scheduler_t * scheduler_create()
- 	this->heap = (event_t**)calloc(this->heap_size + 1, sizeof(event_t*));
- 
- 	job = callback_job_create_with_prio((callback_job_cb_t)schedule, this,
--										NULL, return_false, JOB_PRIO_CRITICAL);
-+										NULL, callback_job_cancel_thread,
-+										JOB_PRIO_CRITICAL);
- 	lib->processor->queue_job(lib->processor, (job_t*)job);
- 
- 	return &this->public;
diff --git a/meta-networking/recipes-support/strongswan/strongswan/0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch b/meta-networking/recipes-support/strongswan/strongswan/0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch
deleted file mode 100644
index 6c2a77105a..0000000000
--- a/meta-networking/recipes-support/strongswan/strongswan/0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 11978ddd39e800b5f35f721d726e8a4cb7e4ec0f Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Fri, 21 Feb 2025 17:00:44 +0100
-Subject: [PATCH] Cast uses of return_*(), nop() and enumerator_create_empty()
-
-As described in the previous commit, GCC 15 uses C23 by default and that
-changes the meaning of such argument-less function declarations.  So
-whenever we assign such a function to a pointer that expects a function
-with arguments it causes an incompatible pointer type warning.  We
-could define dedicated functions/callbacks whenever necessary, but this
-seems like the simpler approach for now (especially since most uses of
-these functions have already been cast).
-
-Upstream-Status: Backport [11978dd Cast uses of return_*(), nop() and enumerator_create_empty()]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- src/charon-nm/nm/nm_handler.c                           | 2 +-
- src/libcharon/encoding/payloads/encrypted_payload.c     | 2 +-
- src/libcharon/plugins/android_dns/android_dns_handler.c | 2 +-
- src/libcharon/plugins/ha/ha_attribute.c                 | 2 +-
- src/libcharon/plugins/updown/updown_handler.c           | 2 +-
- src/libstrongswan/utils/identification.c                | 6 +++---
- 6 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/charon-nm/nm/nm_handler.c b/src/charon-nm/nm/nm_handler.c
-index d7331ad72..39d0190ac 100644
---- a/src/charon-nm/nm/nm_handler.c
-+++ b/src/charon-nm/nm/nm_handler.c
-@@ -195,7 +195,7 @@ nm_handler_t *nm_handler_create()
- 		.public = {
- 			.handler = {
- 				.handle = _handle,
--				.release = nop,
-+				.release = (void*)nop,
- 				.create_attribute_enumerator = _create_attribute_enumerator,
- 			},
- 			.create_enumerator = _create_enumerator,
-diff --git a/src/libcharon/encoding/payloads/encrypted_payload.c b/src/libcharon/encoding/payloads/encrypted_payload.c
-index 676d00b7a..4821c6108 100644
---- a/src/libcharon/encoding/payloads/encrypted_payload.c
-+++ b/src/libcharon/encoding/payloads/encrypted_payload.c
-@@ -1023,7 +1023,7 @@ encrypted_fragment_payload_t *encrypted_fragment_payload_create()
- 				.get_length = _frag_get_length,
- 				.add_payload = _frag_add_payload,
- 				.remove_payload = (void*)return_null,
--				.generate_payloads = nop,
-+				.generate_payloads = (void*)nop,
- 				.set_transform = _frag_set_transform,
- 				.get_transform = _frag_get_transform,
- 				.encrypt = _frag_encrypt,
-diff --git a/src/libcharon/plugins/android_dns/android_dns_handler.c b/src/libcharon/plugins/android_dns/android_dns_handler.c
-index 78f4f702a..14d2ff99a 100644
---- a/src/libcharon/plugins/android_dns/android_dns_handler.c
-+++ b/src/libcharon/plugins/android_dns/android_dns_handler.c
-@@ -191,7 +191,7 @@ METHOD(enumerator_t, enumerate_dns, bool,
- 	VA_ARGS_VGET(args, type, data);
- 	*type = INTERNAL_IP4_DNS;
- 	*data = chunk_empty;
--	this->venumerate = return_false;
-+	this->venumerate = (void*)return_false;
- 	return TRUE;
- }
- 
-diff --git a/src/libcharon/plugins/ha/ha_attribute.c b/src/libcharon/plugins/ha/ha_attribute.c
-index b865a4b82..103d1a937 100644
---- a/src/libcharon/plugins/ha/ha_attribute.c
-+++ b/src/libcharon/plugins/ha/ha_attribute.c
-@@ -381,7 +381,7 @@ ha_attribute_t *ha_attribute_create(ha_kernel_t *kernel, ha_segments_t *segments
- 			.provider = {
- 				.acquire_address = _acquire_address,
- 				.release_address = _release_address,
--				.create_attribute_enumerator = enumerator_create_empty,
-+				.create_attribute_enumerator = (void*)enumerator_create_empty,
- 			},
- 			.reserve = _reserve,
- 			.destroy = _destroy,
-diff --git a/src/libcharon/plugins/updown/updown_handler.c b/src/libcharon/plugins/updown/updown_handler.c
-index 36eb15615..3707e1e65 100644
---- a/src/libcharon/plugins/updown/updown_handler.c
-+++ b/src/libcharon/plugins/updown/updown_handler.c
-@@ -220,7 +220,7 @@ updown_handler_t *updown_handler_create()
- 			.handler = {
- 				.handle = _handle,
- 				.release = _release,
--				.create_attribute_enumerator = enumerator_create_empty,
-+				.create_attribute_enumerator = (void*)enumerator_create_empty,
- 			},
- 			.create_dns_enumerator = _create_dns_enumerator,
- 			.destroy = _destroy,
-diff --git a/src/libstrongswan/utils/identification.c b/src/libstrongswan/utils/identification.c
-index d31955b38..58a05052d 100644
---- a/src/libstrongswan/utils/identification.c
-+++ b/src/libstrongswan/utils/identification.c
-@@ -1625,7 +1625,7 @@ static private_identification_t *identification_create(id_type_t type)
- 			this->public.hash = _hash_binary;
- 			this->public.equals = _equals_binary;
- 			this->public.matches = _matches_any;
--			this->public.contains_wildcards = return_true;
-+			this->public.contains_wildcards = (void*)return_true;
- 			break;
- 		case ID_FQDN:
- 		case ID_RFC822_ADDR:
-@@ -1660,13 +1660,13 @@ static private_identification_t *identification_create(id_type_t type)
- 			this->public.hash = _hash_binary;
- 			this->public.equals = _equals_binary;
- 			this->public.matches = _matches_range;
--			this->public.contains_wildcards = return_false;
-+			this->public.contains_wildcards = (void*)return_false;
- 			break;
- 		default:
- 			this->public.hash = _hash_binary;
- 			this->public.equals = _equals_binary;
- 			this->public.matches = _matches_binary;
--			this->public.contains_wildcards = return_false;
-+			this->public.contains_wildcards = (void*)return_false;
- 			break;
- 	}
- 	return this;
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.2.bb
similarity index 95%
rename from meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.0.2.bb
index 771470f695..aa4524ab3e 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.2.bb
@@ -8,14 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
-SRC_URI = " \
-    https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-    file://0001-pki-Fix-signature-of-help-to-match-that-of-a-callbac.patch \
-    file://0002-callback-job-Replace-return_false-in-constructors-wi.patch \
-    file://0003-Cast-uses-of-return_-nop-and-enumerator_create_empty.patch \
-    "
+SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "212368cbc674fed31f3292210303fff06da8b90acad2d1387375ed855e6879c4"
+SRC_URI[sha256sum] = "b8bfc897b84001fd810a281918d6c9ce37503cae0f41b39c43d4aba0201277cf"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


