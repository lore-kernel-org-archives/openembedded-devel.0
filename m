Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AC6CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 11:47:15 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.13801.1759924030676767910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 04:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AF6sI5Ql;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6398ff5fbd3so7005352a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759924029; x=1760528829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zrMblfapAR6LpXQbqpFHZLx1OFDCTwWEidLEF/syurg=;
        b=AF6sI5QlxCClCYR2tAqJMngnJDoYIaw9TxE/EA4hlRPOe7JUJ8DX9qcqbo88b408ep
         ypsa3bRWBA59jGzqEpt0BMzfGMv4tDTk2r3FBbRwXEAGnvUr+vIbG7vD3fOXhiHknn8j
         oSMM+r8thXgq7FFR6nFgzbtHVphBHRJi/MHyaCvTLZLlzjDIHJ0lI611UucOPifchjCf
         5C5xrnUJGufvjWYT0hXe04VYJFb8XOJ444HpDQ1ss2em0pMsik56LRslMvlOQR3KoLFB
         wpUBI/aDaXgtXYFT7qqIANP0rgZZXF2pr+qgWQ78ujg/Tvd9KriQ83g7iJXahkQDUo4m
         Nn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759924029; x=1760528829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrMblfapAR6LpXQbqpFHZLx1OFDCTwWEidLEF/syurg=;
        b=YMSwOMJCsclT59jL7zTCYGu75dDbPxnebLCPpe/XCl3LYaeGImJOSJzcatkWXY6C2n
         b4Pd5JQCCpMxzR7J1B7I922WpXEmremE152nM3sNlu0cqGumG5tzChcGQ5eVQEXlLLeO
         BdYrjnj7D9DV9b6ZTVZi7f6nVA5TX7JDAkscHCIProMBYEMtu+OadJ8GQQeDdE0Uukjr
         fUd2bSgyJwqwlLrx+8U72TduUYJJtxY3sZ67+ACsccuJL+baWNmSGcIlYHlvchb1oT7j
         SGDBPxyWAX/fI47tzWF4QuiK7V5T3x340ppzR7+bLOQawCefc6t6aAemA7TT3hDGkdgo
         3i6w==
X-Gm-Message-State: AOJu0YxQuc/OUeYRIcdn6dKvx/ALVEtgn0a8yj3iq9Pl0dutCzp0tW+D
	oj/tqd3pTI/G73I35cZZWaHOVzyVPPym5jKIxj2Cc5ulqRYEt6WWxqStPsPjUuAM
X-Gm-Gg: ASbGncvz9GdHkl243D4fZZx7D8xt4AHSA4O6SuAxGQVPlAlpCnnhc/7Ce7HQG9IkTSt
	Sd2KsjtgssxUCve4XNl8ABwxKQ1S90Nd2TXZDwYRC6O+2xC6obNzz4g/Ktoty6plhDZRkBhfO7G
	Gbjr4CnxQhcPetjHj2vDS7WkJ3YlRJnF6YMeVpVtjFgz/qwpO6ZLzltuyK9ssnMj/+esNocEA55
	5EUiCKW8ZBPIr93t4tjJUw1F8mhIG68K1pWRRfGc93GA37W6eHn0F+YwUP9Q3SQ/tx/edcDeui4
	LMOGzHIY+iIsmiRtsgWG9KdomXTUKyIKQ2EYGj4KlwdQfOSFUXfNlPPyBWDIZXQBFYxdo4SGxB/
	efq3ivIhkLinDGBUu+WFUUP37JmxabSZc9CoukpNw244c
X-Google-Smtp-Source: AGHT+IGlfc3WmXot6s8IGEoSrO6Y6QCc69mQ52V1QeI0OnysX5D1v6HOm2/sDZmxolW9oyVWqjQDSQ==
X-Received: by 2002:a05:6402:35ce:b0:637:ec31:be93 with SMTP id 4fb4d7f45d1cf-639d5b5e449mr2641677a12.2.1759924028699;
        Wed, 08 Oct 2025 04:47:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788111e1dsm14439198a12.40.2025.10.08.04.47.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 04:47:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] pgpool2: upgrade 4.5.5 -> 4.6.3
Date: Wed,  8 Oct 2025 13:47:06 +0200
Message-ID: <20251008114706.391135-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 11:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120363

Drop 0001-fix-compiling-on-32-bit-systems.patch, and change to another
patch that solves the same issue in OE, but is more likely to be
adapted by upstream (after discussion with upstream in
https://github.com/pgpool/pgpool2/pull/128)

Shortlog: https://github.com/pgpool/pgpool2/compare/V4_5_5...V4_6_3

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...0001-fix-compiling-on-32-bit-systems.patch |  83 -----
 ...e-time-calculations-always-long-long.patch | 336 ++++++++++++++++++
 .../{pgpool2_4.5.5.bb => pgpool2_4.6.3.bb}    |   4 +-
 3 files changed, 338 insertions(+), 85 deletions(-)
 delete mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
 create mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/v1-0001-Make-time-calculations-always-long-long.patch
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.5.bb => pgpool2_4.6.3.bb} (92%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch b/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
deleted file mode 100644
index 13db1856a6..0000000000
--- a/meta-networking/recipes-support/pgpool2/pgpool2/0001-fix-compiling-on-32-bit-systems.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 523ca5546b0178be693943f2a3a880c0bd6ea239 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Thu, 11 Sep 2025 12:36:29 +0200
-Subject: [PATCH] fix compiling on 32-bit systems
-
-The timespec struct's tv_sec size can change between architectures.
-Usually on 64 bit systems it's long, but on 32 bit systems it is frequently long long.
-
-When the watchdog is trying to get the uptime, it is trying to get the value
-as long - however on 32 bit systems this fails due to different time_t size:
-
-| wd_json_data.c:540:66: error: passing argument 3 of 'json_get_long_value_for_key' from incompatible pointer type [-Wincompatible-pointer-types]
-|   540 |         if (json_get_long_value_for_key(root, "StartupTimeSecs", &wdNode->startup_time.tv_sec))
-|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-To account for this, introduce a new helper function to get a json value as
-a time_t type.
-
-Upstream-Status: Submitted [https://github.com/pgpool/pgpool2/pull/128]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- src/include/utils/json.h    |  5 +++--
- src/utils/json.c            | 14 ++++++++++++++
- src/watchdog/wd_json_data.c |  2 +-
- 3 files changed, 18 insertions(+), 3 deletions(-)
-
-diff --git a/src/include/utils/json.h b/src/include/utils/json.h
-index 67cc0255a..93be83c3a 100644
---- a/src/include/utils/json.h
-+++ b/src/include/utils/json.h
-@@ -311,10 +311,11 @@ extern "C"
- #endif
- 
- /* pgpool-II extensions */
--json_value *json_get_value_for_key(json_value * source, const char *key);
-+json_value		*json_get_value_for_key(json_value * source, const char *key);
- int			json_get_int_value_for_key(json_value * source, const char *key, int *value);
- int			json_get_long_value_for_key(json_value * source, const char *key, long *value);
--char	   *json_get_string_value_for_key(json_value * source, const char *key);
-+char			*json_get_string_value_for_key(json_value * source, const char *key);
- int			json_get_bool_value_for_key(json_value * source, const char *key, bool *value);
-+int			json_get_time_value_for_key(json_value * source, const char *key, time_t *value);
- 
- #endif
-diff --git a/src/utils/json.c b/src/utils/json.c
-index 319c8fdbf..bce99466c 100644
---- a/src/utils/json.c
-+++ b/src/utils/json.c
-@@ -1204,6 +1204,20 @@ json_get_long_value_for_key(json_value * source, const char *key, long *value)
- 	return 0;
- }
- 
-+int
-+json_get_time_value_for_key(json_value * source, const char *key, time_t *value)
-+{
-+        json_value *jNode;
-+
-+        jNode = json_get_value_for_key(source, key);
-+        if (jNode == NULL)
-+                return -1;
-+        if (jNode->type != json_integer)
-+                return -1;
-+        *value = jNode->u.integer;
-+        return 0;
-+}
-+
- /*
-  * pgpool extension:
-  * returns string value if found for the key.
-diff --git a/src/watchdog/wd_json_data.c b/src/watchdog/wd_json_data.c
-index 474fc37a4..53053cd4b 100644
---- a/src/watchdog/wd_json_data.c
-+++ b/src/watchdog/wd_json_data.c
-@@ -537,7 +537,7 @@ get_watchdog_node_from_json(char *json_data, int data_len, char **authkey)
- 	if (root == NULL || root->type != json_object)
- 		goto ERROR_EXIT;
- 
--	if (json_get_long_value_for_key(root, "StartupTimeSecs", &wdNode->startup_time.tv_sec))
-+	if (json_get_time_value_for_key(root, "StartupTimeSecs", &wdNode->startup_time.tv_sec))
- 	{
- 		bool		escalated;
- 		long		seconds_since_node_startup;
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2/v1-0001-Make-time-calculations-always-long-long.patch b/meta-networking/recipes-support/pgpool2/pgpool2/v1-0001-Make-time-calculations-always-long-long.patch
new file mode 100644
index 0000000000..07930f4341
--- /dev/null
+++ b/meta-networking/recipes-support/pgpool2/pgpool2/v1-0001-Make-time-calculations-always-long-long.patch
@@ -0,0 +1,336 @@
+From 693208fa9f8481714040617746983741b7bf904d Mon Sep 17 00:00:00 2001
+From: Tatsuo Ishii <ishii@postgresql.org>
+Date: Fri, 3 Oct 2025 21:10:50 +0900
+Subject: [PATCH v1] Make time calculations always long long.
+
+Previously pgpool assumed that time_t to be a simple long. This causes
+a lots of compile time warnings on certain systems, for example
+OpenBSD because on the system time_t is __int64, which results in long
+long. This commit upcasts such calculations to long long to avoid the
+issue.
+
+This way times can't get truncated and for the places where time_t is
+actually used as a time and not a time diff this would allow pgpool to
+keep working correctly post Y2038 on 64 bit clean time_t systems post
+Y2038 (e.g. i386 OpenBSD).
+
+Moreover, json_get_long_value_for_key is changed to
+json_get_llong_value_for_key and changed the parameter to long long.
+This makes it more in line _json_value's integer, which is defined as
+int64. This should also give 32 bit platforms proper retrieval of the
+max value of an integer and may or may not solve some weird integer
+overflow issues.
+
+Author: Martijn van Duren <pgpool@list.imperialat.at>
+Reviewed-by: Tatsuo Ishii <ishii@postgresql.org>
+Discussion: https://www.pgpool.net/pipermail/pgpool-hackers/2025-May/004584.html
+
+From Yocto's perspective this patch also allows this application to
+compile for 32-bit targets.
+
+Upstream-Status: Submitted [https://www.postgresql.org/message-id/20251003.211957.2067537305399895611.ishii@postgresql.org]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ src/include/utils/json.h            |  2 +-
+ src/include/watchdog/wd_commands.h  |  2 +-
+ src/include/watchdog/wd_json_data.h |  4 ++--
+ src/main/pgpool_logger.c            |  2 +-
+ src/pcp_con/pcp_worker.c            |  4 ++--
+ src/protocol/pool_connection_pool.c | 12 ++++++------
+ src/query_cache/pool_memqcache.c    |  6 +++---
+ src/utils/json.c                    |  2 +-
+ src/utils/pool_process_reporting.c  |  2 +-
+ src/utils/pool_relcache.c           |  2 +-
+ src/watchdog/watchdog.c             |  4 ++--
+ src/watchdog/wd_commands.c          |  4 ++--
+ src/watchdog/wd_heartbeat.c         |  4 ++--
+ src/watchdog/wd_json_data.c         | 20 +++++++++++---------
+ 14 files changed, 36 insertions(+), 34 deletions(-)
+
+diff --git a/src/include/utils/json.h b/src/include/utils/json.h
+index 67cc025..7e24382 100644
+--- a/src/include/utils/json.h
++++ b/src/include/utils/json.h
+@@ -313,7 +313,7 @@ extern "C"
+ /* pgpool-II extensions */
+ json_value *json_get_value_for_key(json_value * source, const char *key);
+ int			json_get_int_value_for_key(json_value * source, const char *key, int *value);
+-int			json_get_long_value_for_key(json_value * source, const char *key, long *value);
++int			json_get_llong_value_for_key(json_value * source, const char *key, long long *value);
+ char	   *json_get_string_value_for_key(json_value * source, const char *key);
+ int			json_get_bool_value_for_key(json_value * source, const char *key, bool *value);
+ 
+diff --git a/src/include/watchdog/wd_commands.h b/src/include/watchdog/wd_commands.h
+index 34c5b9a..dd788da 100644
+--- a/src/include/watchdog/wd_commands.h
++++ b/src/include/watchdog/wd_commands.h
+@@ -52,7 +52,7 @@ typedef struct WDGenericData
+ 		char	   *stringVal;
+ 		int			intVal;
+ 		bool		boolVal;
+-		long		longVal;
++		long long	longVal;
+ 	}			data;
+ }			WDGenericData;
+ 
+diff --git a/src/include/watchdog/wd_json_data.h b/src/include/watchdog/wd_json_data.h
+index 7b53999..4ad4910 100644
+--- a/src/include/watchdog/wd_json_data.h
++++ b/src/include/watchdog/wd_json_data.h
+@@ -51,8 +51,8 @@ extern bool parse_node_status_json(char *json_data, int data_len, int *nodeID, i
+ 
+ 
+ extern bool parse_beacon_message_json(char *json_data, int data_len, int *state,
+-						  long *seconds_since_node_startup,
+-						  long *seconds_since_current_state,
++						  long long *seconds_since_node_startup,
++						  long long *seconds_since_current_state,
+ 						  int *quorumStatus,
+ 						  int *standbyNodesCount,
+ 						  bool *escalated);
+diff --git a/src/main/pgpool_logger.c b/src/main/pgpool_logger.c
+index 2060867..21c67a8 100644
+--- a/src/main/pgpool_logger.c
++++ b/src/main/pgpool_logger.c
+@@ -50,7 +50,7 @@
+ #include "main/pgpool_logger.h"
+ 
+ #define DEVNULL "/dev/null"
+-typedef int64 pg_time_t;
++typedef time_t pg_time_t;
+ /*
+  * We read() into a temp buffer twice as big as a chunk, so that any fragment
+  * left after processing can be moved down to the front and we'll still have
+diff --git a/src/pcp_con/pcp_worker.c b/src/pcp_con/pcp_worker.c
+index de2658d..ddd892a 100644
+--- a/src/pcp_con/pcp_worker.c
++++ b/src/pcp_con/pcp_worker.c
+@@ -933,9 +933,9 @@ inform_node_info(PCP_CONNECTION * frontend, char *buf)
+ 
+ 			snprintf(standby_delay_by_time_str, sizeof(standby_delay_by_time_str), "%d", bi->standby_delay_by_time);
+ 
+-			snprintf(standby_delay_str, sizeof(standby_delay_str), UINT64_FORMAT, bi->standby_delay);
++			snprintf(standby_delay_str, sizeof(standby_delay_str), "%lld", (long long)bi->standby_delay);
+ 
+-			snprintf(status_changed_time_str, sizeof(status_changed_time_str), UINT64_FORMAT, bi->status_changed_time);
++			snprintf(status_changed_time_str, sizeof(status_changed_time_str), "%lld", (long long)bi->status_changed_time);
+ 
+ 			pcp_write(frontend, "i", 1);
+ 			wsize = htonl(sizeof(code) +
+diff --git a/src/protocol/pool_connection_pool.c b/src/protocol/pool_connection_pool.c
+index 225294a..03e9a85 100644
+--- a/src/protocol/pool_connection_pool.c
++++ b/src/protocol/pool_connection_pool.c
+@@ -299,10 +299,10 @@ pool_create_cp(void)
+ 
+ 		ereport(DEBUG1,
+ 				(errmsg("creating connection pool"),
+-				 errdetail("user: %s database: %s closetime: %ld",
++				 errdetail("user: %s database: %s closetime: %lld",
+ 						   CONNECTION_SLOT(p, main_node_id)->sp->user,
+ 						   CONNECTION_SLOT(p, main_node_id)->sp->database,
+-						   CONNECTION_SLOT(p, main_node_id)->closetime)));
++						   (long long)CONNECTION_SLOT(p, main_node_id)->closetime)));
+ 
+ 		if (CONNECTION_SLOT(p, main_node_id)->closetime < closetime)
+ 		{
+@@ -363,7 +363,7 @@ pool_connection_pool_timer(POOL_CONNECTION_POOL * backend)
+ 
+ 	ereport(DEBUG1,
+ 			(errmsg("setting backend connection close timer"),
+-			 errdetail("close time %ld", time(NULL))));
++			 errdetail("close time %lld", (long long)time(NULL))));
+ 
+ 	/* Set connection close time */
+ 	for (i = 0; i < NUM_BACKENDS; i++)
+@@ -421,7 +421,7 @@ pool_backend_timer(void)
+ 	now = time(NULL);
+ 
+ 	ereport(DEBUG1,
+-			(errmsg("backend timer handler called at %ld", now)));
++			(errmsg("backend timer handler called at %lld", (long long)now)));
+ 
+ 	for (i = 0; i < pool_config->max_pool; i++, p++)
+ 	{
+@@ -439,8 +439,8 @@ pool_backend_timer(void)
+ 
+ 			ereport(DEBUG1,
+ 					(errmsg("backend timer handler called"),
+-					 errdetail("expire time: %ld",
+-							   MAIN_CONNECTION(p)->closetime + pool_config->connection_life_time)));
++					 errdetail("expire time: %lld",
++							   (long long)(MAIN_CONNECTION(p)->closetime + pool_config->connection_life_time))));
+ 
+ 			if (now >= (MAIN_CONNECTION(p)->closetime + pool_config->connection_life_time))
+ 			{
+diff --git a/src/query_cache/pool_memqcache.c b/src/query_cache/pool_memqcache.c
+index cc70207..03a77b7 100644
+--- a/src/query_cache/pool_memqcache.c
++++ b/src/query_cache/pool_memqcache.c
+@@ -280,7 +280,7 @@ pool_commit_cache(POOL_CONNECTION_POOL * backend, char *query, char *data, size_
+ 	memqcache_expire = pool_config->memqcache_expire;
+ 	ereport(DEBUG1,
+ 			(errmsg("committing SELECT results to cache storage"),
+-			 errdetail("memqcache_expire = %ld", memqcache_expire)));
++			 errdetail("memqcache_expire = %lld", (long long)memqcache_expire)));
+ 
+ 	if (pool_is_shmem_cache())
+ 	{
+@@ -2887,8 +2887,8 @@ static POOL_CACHEID * pool_find_item_on_shmem_cache(POOL_QUERY_HASH * query_hash
+ 			{
+ 				ereport(DEBUG1,
+ 						(errmsg("memcache finding item"),
+-						 errdetail("cache expired: now: %ld timestamp: %ld",
+-								   now, cih->timestamp + cih->expire)));
++						 errdetail("cache expired: now: %lld timestamp: %lld",
++								   (long long)now, (long long)(cih->timestamp + cih->expire))));
+ 				pool_delete_item_shmem_cache(c);
+ 				return NULL;
+ 			}
+diff --git a/src/utils/json.c b/src/utils/json.c
+index 319c8fd..9336fde 100644
+--- a/src/utils/json.c
++++ b/src/utils/json.c
+@@ -1191,7 +1191,7 @@ json_get_int_value_for_key(json_value * source, const char *key, int *value)
+ }
+ 
+ int
+-json_get_long_value_for_key(json_value * source, const char *key, long *value)
++json_get_llong_value_for_key(json_value * source, const char *key, long long *value)
+ {
+ 	json_value *jNode;
+ 
+diff --git a/src/utils/pool_process_reporting.c b/src/utils/pool_process_reporting.c
+index 71f871b..5910999 100644
+--- a/src/utils/pool_process_reporting.c
++++ b/src/utils/pool_process_reporting.c
+@@ -2052,7 +2052,7 @@ get_health_check_stats(int *nrows)
+ 
+ 		/* status last changed */
+ 		t = bi->status_changed_time;
+-		ereport(LOG,(errmsg("status_changed_time %ld", t)));
++		ereport(LOG,(errmsg("status_changed_time %lld", (long long)t)));
+ 		strftime(stats[i].last_status_change, POOLCONFIG_MAXDATELEN, "%F %T", localtime(&t));
+ 
+ 		snprintf(stats[i].total_count, POOLCONFIG_MAXLONGCOUNTLEN, UINT64_FORMAT, health_check_stats[i].total_count);
+diff --git a/src/utils/pool_relcache.c b/src/utils/pool_relcache.c
+index 32362fc..1701cb5 100644
+--- a/src/utils/pool_relcache.c
++++ b/src/utils/pool_relcache.c
+@@ -187,7 +187,7 @@ pool_search_relcache(POOL_RELCACHE * relcache, POOL_CONNECTION_POOL * backend, c
+ 				{
+ 					ereport(DEBUG1,
+ 							(errmsg("searching relcache"),
+-							 errdetail("relcache for database:%s table:%s expired. now:%ld expiration time:%ld", dbname, table, now, relcache->cache[i].expire)));
++							 errdetail("relcache for database:%s table:%s expired. now:%lld expiration time:%lld", dbname, table, (long long)now, (long long)relcache->cache[i].expire)));
+ 
+ 					relcache->cache[i].refcnt = 0;
+ 					break;
+diff --git a/src/watchdog/watchdog.c b/src/watchdog/watchdog.c
+index beb5a15..a78cc25 100644
+--- a/src/watchdog/watchdog.c
++++ b/src/watchdog/watchdog.c
+@@ -6656,8 +6656,8 @@ watchdog_state_machine_nw_isolation(WD_EVENTS event, WatchdogNode * wdNode, WDPa
+ static bool
+ beacon_message_received_from_node(WatchdogNode * wdNode, WDPacketData * pkt)
+ {
+-	long		seconds_since_node_startup;
+-	long		seconds_since_current_state;
++	long long	seconds_since_node_startup;
++	long long	seconds_since_current_state;
+ 	int			quorum_status;
+ 	int			standby_nodes_count;
+ 	bool		escalated;
+diff --git a/src/watchdog/wd_commands.c b/src/watchdog/wd_commands.c
+index 1459558..c5cd1dc 100644
+--- a/src/watchdog/wd_commands.c
++++ b/src/watchdog/wd_commands.c
+@@ -193,9 +193,9 @@ get_wd_runtime_variable_value(char* wd_authkey, char *varName)
+ 
+ 			case VALUE_DATA_TYPE_LONG:
+ 				{
+-					long		longVal;
++					long long	longVal;
+ 
+-					if (json_get_long_value_for_key(root, WD_JSON_KEY_VALUE_DATA, &longVal))
++					if (json_get_llong_value_for_key(root, WD_JSON_KEY_VALUE_DATA, &longVal))
+ 					{
+ 						ereport(WARNING,
+ 								(errmsg("get runtime variable value from watchdog failed"),
+diff --git a/src/watchdog/wd_heartbeat.c b/src/watchdog/wd_heartbeat.c
+index 09b1ef5..e42cff5 100644
+--- a/src/watchdog/wd_heartbeat.c
++++ b/src/watchdog/wd_heartbeat.c
+@@ -850,8 +850,8 @@ packet_to_string_hb(WdHbPacket * pkt, char *str, int maxlen)
+ {
+ 	int			len;
+ 
+-	len = snprintf(str, maxlen, "tv_sec=%ld tv_usec=%ld from=%s",
+-				   pkt->send_time.tv_sec, pkt->send_time.tv_usec, pkt->from);
++	len = snprintf(str, maxlen, "tv_sec=%lld tv_usec=%lld from=%s",
++				   (long long)pkt->send_time.tv_sec, (long long)pkt->send_time.tv_usec, pkt->from);
+ 
+ 	return len;
+ }
+diff --git a/src/watchdog/wd_json_data.c b/src/watchdog/wd_json_data.c
+index 474fc37..602e3bf 100644
+--- a/src/watchdog/wd_json_data.c
++++ b/src/watchdog/wd_json_data.c
+@@ -530,6 +530,7 @@ get_watchdog_node_from_json(char *json_data, int data_len, char **authkey)
+ {
+ 	json_value *root = NULL;
+ 	char	   *ptr;
++	long long	longVal;
+ 	WatchdogNode *wdNode = palloc0(sizeof(WatchdogNode));
+ 
+ 	root = json_parse(json_data, data_len);
+@@ -537,19 +538,20 @@ get_watchdog_node_from_json(char *json_data, int data_len, char **authkey)
+ 	if (root == NULL || root->type != json_object)
+ 		goto ERROR_EXIT;
+ 
+-	if (json_get_long_value_for_key(root, "StartupTimeSecs", &wdNode->startup_time.tv_sec))
++	if (json_get_llong_value_for_key(root, "StartupTimeSecs", &longVal))
+ 	{
+ 		bool		escalated;
+-		long		seconds_since_node_startup;
+-		long		seconds_since_current_state;
++		long long	seconds_since_node_startup;
++		long long	seconds_since_current_state;
+ 		struct timeval current_time;
+ 
++		wdNode->startup_time.tv_sec = longVal;
+ 		gettimeofday(&current_time, NULL);
+ 
+ 		/* The new version does not have StartupTimeSecs Key */
+-		if (json_get_long_value_for_key(root, "SecondsSinceStartup", &seconds_since_node_startup))
++		if (json_get_llong_value_for_key(root, "SecondsSinceStartup", &seconds_since_node_startup))
+ 			goto ERROR_EXIT;
+-		if (json_get_long_value_for_key(root, "SecondsSinceCurrentState", &seconds_since_current_state))
++		if (json_get_llong_value_for_key(root, "SecondsSinceCurrentState", &seconds_since_current_state))
+ 			goto ERROR_EXIT;
+ 		if (json_get_bool_value_for_key(root, "Escalated", &escalated))
+ 			goto ERROR_EXIT;
+@@ -640,8 +642,8 @@ ERROR_EXIT:
+ bool
+ parse_beacon_message_json(char *json_data, int data_len,
+ 						  int *state,
+-						  long *seconds_since_node_startup,
+-						  long *seconds_since_current_state,
++						  long long *seconds_since_node_startup,
++						  long long *seconds_since_current_state,
+ 						  int *quorumStatus,
+ 						  int *standbyNodesCount,
+ 						  bool *escalated)
+@@ -655,9 +657,9 @@ parse_beacon_message_json(char *json_data, int data_len,
+ 
+ 	if (json_get_int_value_for_key(root, "State", state))
+ 		goto ERROR_EXIT;
+-	if (json_get_long_value_for_key(root, "SecondsSinceStartup", seconds_since_node_startup))
++	if (json_get_llong_value_for_key(root, "SecondsSinceStartup", seconds_since_node_startup))
+ 		goto ERROR_EXIT;
+-	if (json_get_long_value_for_key(root, "SecondsSinceCurrentState", seconds_since_current_state))
++	if (json_get_llong_value_for_key(root, "SecondsSinceCurrentState", seconds_since_current_state))
+ 		goto ERROR_EXIT;
+ 	if (json_get_bool_value_for_key(root, "Escalated", escalated))
+ 		goto ERROR_EXIT;
diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.5.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.6.3.bb
similarity index 92%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.5.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.6.3.bb
index 5adb8a7bf0..6d83ce9bc4 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.5.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.6.3.bb
@@ -13,12 +13,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
 SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://0001-Fix-build-error-when-build-this-file.patch \
            file://0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch \
-           file://0001-fix-compiling-on-32-bit-systems.patch \
+           file://v1-0001-Make-time-calculations-always-long-long.patch \
 	   file://define_SIGNAL_ARGS.patch \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "95ffeeaeb6b0cebea8034e30fc1933fec7384b227ad511305eaccc5d090ff998"
+SRC_URI[sha256sum] = "46688668b2ace67d8161a320256252d98698bc7d9788cc6727269d5720299f2c"
 
 S = "${UNPACKDIR}/pgpool-II-${PV}"
 

