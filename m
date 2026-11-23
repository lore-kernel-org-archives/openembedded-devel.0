Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53676.1795440984556001341
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:36:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=r72JSuHr;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3223231f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795440983; x=1796045783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwxsE1YXYQb+FOWuj4E6gSgDpSqnm9PxH2LuZfTWWIg=;
        b=r72JSuHrYb1FPOlr5Z5J1lfRLAljivca3JbGGMgciJYaW2YqUc5PdVWlxIP2YekA/e
         H8KLPtHlV8yR6hYiPiKltc8C/zEndbcVyUeZXtDSk2otUCuuOSGipP+0ATZUpTV3rnOA
         OtiwY28MCmP6LpqgGWaYWd7BQzHqL8XbiK/wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440983; x=1796045783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iwxsE1YXYQb+FOWuj4E6gSgDpSqnm9PxH2LuZfTWWIg=;
        b=f/oiBeHnL4ZsgqE4YkMPbGfOloW3UfawXrHrk+pSa1AClOU4E75z2YROGovW9fmRJC
         lq/d46+n7NMAY0GcLeRB1Xm906tJlk7n9yaxag8VlB6o0jq46QPZ1QKdL3cnDgu1LdpL
         NXKVsJ+wgKcePIPe+I1fLEwTIMHOkcy7VZysfi8R/WadQu+gkLYVyNShspLztjRRclBK
         5D09XYwCxW2dT7zEPc3KapAmk4vQEAUmtMr/8UwHvJ8ZAZqdQJEyRXDU9JOoVamx4QaF
         3LlHZ1wluQrzfZslOAiteYp/QqgPS6vwWfTkwwbC8TQZ9A0tZ1nf88gkVdC7mRy+OemF
         5r9w==
X-Gm-Message-State: APuU4Z/tDWJQBp7geTCSPLwBSlR+2QF8bamojZguLInLZ9oVld3SdfFX
	W+YB9ncpOchdBD3dI7FCydzf3UxZlKmpOf/4GdzRsFjr4OLg/w5vNudEONc+DdQvjPMqJ0ewGTH
	mexTh
X-Gm-Gg: AZFdTZcB0jM55S3pFoPwlSGL32gvr+ZqKeQ8R+qGyxPFLA+2o6NADpe+VOxmQVdyiO8
	8PsgRjaHouLI6XtW9PWYQmA0H5cOmyEfxFNY3JgW4FD2/bwxjI1zh/ak1X2y2Zh3rPACdEyo5Ed
	eY5D5SKlJ+utPiBDnSfv8zdAF/30Pcb9tziZW8C9xSnvnT0xAbf8eYb6LsPO4p9JsdEk8cdWEgx
	3wlLkVpfltZ/kdsJTyySzEh9WeI9kAe58q+WE4Kw7lQDK0DxUgHR3y9Rq5Fci8dz2jiH0HEvIHI
	EpXH7eEp7q6Hbn5ragllXzdomJQKR2vK+w7SRP/3TAWrhqhzfZU+6H8ClKe+WQrKQHvSQBTVDl3
	SSg/HHCJ4ocIy47FsF6xiqkLx9F45vHKsyTr37bMyJCJKgnbjmN2ySogRiHAWxCrcO1o/BFxsXK
	AIlmj4bzuwCxxvi+KmjNN9xHcB5oFb6HA+Z8ATL0el0Yi8Io1UzTwb/nyg29324FDmHeh+zore7
	TOYQPe4D3HTI2sWmkn/0PVEHlxNwXlRZnVMC5wIPKv/BRPNE3SjRH8YYxv4+MfZtFzb5O33kaCe
	RSUzePEzSCNPyV4G9XfUPNJ76skbx88bs+6NKm7wAf79G1WDJLBw6GKh3BMvJtY9wSFQd9Xnsqx
	wMJMj9nXo2ydjCmshLDXiI7GHCmL5NDjVA0q/uqTNMKhA5zR5WBetrg==
X-Received: by 2002:a05:6000:428a:b0:4a9:dcdb:2e11 with SMTP id ffacd0b85a97d-4abb8406ea4mr23430775f8f.41.1795440982812;
        Mon, 23 Nov 2026 05:36:22 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm25192365f8f.24.2026.11.23.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:36:22 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-redis: Upgrade 8.1.0 -> 8.2.0
Date: Mon, 23 Nov 2026 15:36:15 +0200
Message-ID: <20261123133617.3614096-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123133617.3614096-1-leon.anavi@konsulko.com>
References: <20261123133617.3614096-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 13:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132892
Content-Type: text/plain; charset="utf-8"

Upgrade to release 8.2.0:

Client-side caching: tracking modes and metadata-driven eligibility:

CacheConfig takes a new tracking_mode option: TrackingMode.PLAIN, OPTIN
or OPTOUT. With OPTIN or OPTOUT, the server tracks only the keys that
the client caches. PLAIN is the default and keeps the current behavior.
An optional cache_predicate(command, keys) decides which eligible
replies are stored.

Cache eligibility and cluster replica routing now come from one source:
the command metadata in redis.commands.metadata. You can pass a
MetadataResolver with metadata_resolver= to Redis, ConnectionPool,
RedisCluster and redis.asyncio.RedisCluster. This lets module commands,
for example from FalkorDB, use replica reads through custom metadata.
CacheConfig.DEFAULT_ALLOW_LIST and READ_COMMANDS are deprecated and are
no longer read.

Cluster routing and topology refresh:

The cluster clients now route MULTI_SHARD and ALL_SHARDS commands, and
commands with movable keys, by the request and response tips that the
server publishes. A multi-shard command is split per slot and sent in
one pipeline per node, and a retry resends only the parts that got no
reply.

Topology refreshes are paced. Error paths only request a refresh, the
requests are merged, and the refresh runs once when it is due. A refresh
keeps the connections of the nodes that stay in the cluster. The new
topology_refresh_min_interval argument sets the minimum time between
error-triggered refreshes. The default is 1 second.

New commands:

- Set member expiration: sexpire, spexpire, sexpireat, spexpireat,
  sttl, spttl, sexpiretime, spexpiretime, spersist and saddex.
- Sorted sets: zmove, bzmove and zmovemember.
- BACKUP (Redis 8.10): backup_start, backup_status, backup_list,
  backup_seal, backup_abort and backup_cleanup.
- bitrangeintarray, the BLESS family (bless_get, bless_set,
  bless_clear, bless_scan) and a CLIENT LIST iterator.
- hybrid_search(explain_score=True) for FT.HYBRID, and CELL_SIZE
  for CMS.INITBYDIM and CMS.INITBYPROB.

Connection resilience:

When the protocol is not set explicitly and a server or proxy rejects
HELLO, the client now falls back to RESP2 instead of raising.

Retry takes a new optional is_retryable checker. Pass
redis.retry.is_retryable_connect_error to fail fast when a Unix socket
path does not exist, instead of retrying with backoff.

Security hardening:

OCSP validation is stricter. The response must be bound to the
certificate being validated and signed by a signer that chains to the
issuer. A delegated responder must not be expired, validity times are
compared in UTC, and an unauthorized response fails closed. Credentials
are redacted from pipeline and cluster routing error messages, and lock
tokens use uuid4.

Python support:

This release drops Python 3.10, which has reached end of life, and adds
Python 3.15.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-redis_8.1.0.bb => python3-redis_8.2.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_8.1.0.bb => python3-redis_8.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_8.1.0.bb b/meta-python/recipes-devtools/python/python3-redis_8.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_8.1.0.bb
rename to meta-python/recipes-devtools/python/python3-redis_8.2.0.bb
index 286c4b6f4a..cd8b6d17dd 100644
--- a/meta-python/recipes-devtools/python/python3-redis_8.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_8.2.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
-SRC_URI[sha256sum] = "6e1a19beef9225c83efd689c7e6b7da2d5215b1f42cd13b7fc3714d0a09c7b25"
+SRC_URI[sha256sum] = "58b1493d83ba8f0e3ffe6bd781194ca5c01c91267ae03d29c1087b0b3c7d79c9"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

