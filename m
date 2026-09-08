Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4A8C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:31:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3188.1788859859106684873
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XBg4KYhq;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48584dc164fso4125747f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788859857; x=1789464657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UTKnzuGoal7kAjKTN8LHuYGlhoX7w4us58Zj5aNbUrc=;
        b=XBg4KYhqYb4pBspGUO/b9/78sU7JTz1Hg8FNRhmyO+D/7CkDPnukzZKhK8kpC5zGGC
         5PBMHRA4snSxGtX4g8bXSzXsvVxxuFGm7hw1QqRLNwCmnv8dzo0iD4AAgAEEQ/14haaf
         kT/pqBRxrpj92ZhGbrIlqvryYUGxN26eef8bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859857; x=1789464657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTKnzuGoal7kAjKTN8LHuYGlhoX7w4us58Zj5aNbUrc=;
        b=COenEKiNljrHa+hoDy8Epz5NUYS1cfTvfhQVqghAuvHNdya+uPY2023DH73nhzv5iX
         2Rlw4zo9Cg3xRCFU693J4aiYWDUxcxck81Dx1+6Mxrqi+4IycSK4TjB5qD3lOpYhgT0u
         lhka8ACUISnSodUgqNOo5pH1vZutCFvb/2H65gRLBmg7hOZIpxoOSd29bSxqL37IZGwA
         AxXbsiytcriqCRi0VzU99J8476BBK0/N3YJx6u+F33jNyNWye9KPXqd8rQliACnwPMHb
         /n9f3+vgye4UffK0bnXdrtKV+hn0ErxtxibuPP8ehfskBeOYe6h6xT/+WI9XfqZc/ksK
         0WnQ==
X-Gm-Message-State: AFuF++l4Xa5g75wj4GSVIgDXxyTQYhlXJ45k+B1bbhELC3OVItjLUs+K
	OJk8lt1nZpP/1EXlyv2ERBjrGt2w8jeSEGs/92jLE/Pd1wEDrVO/DL3rRRP4BtlIld/sB9r4tLV
	p0GdV
X-Gm-Gg: AYBFou2EY96MjKjQbOBCYOWggZM5nRA3nFR0HuWf59IHP9NXFUqFlZ4t7eMbY/L1kbG
	hr8YRkJpDrBpuzcLqNXLenWl1rHe5+fmYlmFFWPi9xIhs3ovpnwmimlB1PPid5Zuq0p6cOHkIOV
	dZfhH+zaZGUsvAsaeVkzRvd4Xvj7CabihTslpH6EeWVFCaJs3ceBQB6ZZJOyJHkKpATjw34dVB6
	exG5dtW0oCWynl7pwuAd1j74wCAcfC55EHtS3cj45HIkZdULhZIiNnxxGYjJtwbDnZrDlWr4W6x
	lsWWZQBv2ke+Sy13ECqsxTdt3wNQ1g7M6E43mCmMWwTYrOxNSyYckbYf+BqeLySP+fYZEYFtaYH
	iY3ve7TCQWaq9Vnaptydkhr/7XqKMqyBG7PjCYlonmh3qZqBFOKKevOBQMK5Oxyans6isUdEJb2
	VVhOSJAM0cD9PyiXqj0lpFwJFDV6uJbCoDBQn5Lvat84ESn5rH1J20ofAF+ryclKqyZE09gGvHT
	ur6xFdTiXvN1ojHs4WSm0B2eoQOKvug0M27cLg+XbZYuqydErPUCsFyIm6UCrz2HcvjfgRw/CLU
	iNTjr8KIXbEeeg==
X-Received: by 2002:a05:6000:4304:b0:484:3310:f395 with SMTP id ffacd0b85a97d-485872d2dbamr30874901f8f.24.1788859856733;
        Tue, 08 Sep 2026 02:30:56 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm33664644f8f.16.2026.09.08.02.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:30:56 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/2] valkey: Upgrade 9.1.1 -> 9.1.2
Date: Tue,  8 Sep 2026 12:30:42 +0300
Message-ID: <20260908093043.249127-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 09:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129856

Upgrade to release 9.1.2:

Security Fixes

- GHSA-jcj7-v34w-v9vv: Fix a use-after-free in RDMA connection
  handling that could allow an authenticated client to crash the
  server using CLIENT KILL. Only affects servers built with
  USE_RDMA and configured with an RDMA listener
- GHSA-fq2f-crmw-q97r: Fix an unauthenticated use-after-free of the
  Lua interpreter state, caused by a process-global script debugger
  command table that cached a raw pointer to a freed interpreter
  and was never invalidated

Bug Fixes

- Fix a double-free crash when a module timer callback stops its
  own timer with ValkeyModule_StopTimer
- Fix torn RESP3 push frames when a client publishes to a channel
  it is also subscribed to, which could desync client libraries
- Listpacks are now always validated on RDB load and RESTORE,
  preventing deferred assertion crashes; sanitize-dump-payload and
  its ACL flags become no-ops
- Fix crashes, hangs, and CPU spinning when the RDMA transport is
  used together with I/O threads
- RESET now clears the CLIENT IMPORT-SOURCE flag, so reused pooled
  connections return to normal expiration semantics
- Truncate a partially written MULTI block from the AOF on short
  read, preventing loss of newer writes after a later restart
- Fix an ACL bypass where duplicate STORE/STOREDIST options let
  GEORADIUS write or delete keys outside the user's permitted patterns
- Fix command log redaction leaking between commands in a MULTI
  transaction and missing for commands executed from scripts
- Fix a use-after-free crash when a module's cluster message type
  is received after the module is unloaded
- Fix out-of-bounds access for cluster module message type 255,
  which is now a valid, dispatchable message type
- AOF loading no longer performs ACL checks on replayed commands,
  preventing silent data loss when the default user is disabled
- Fix a client memory accounting leak on replicas that inflated
  the mem_clients_normal INFO field after primary disconnections
- Fix a permanent client deadlock when a blocking command like
  BLPOP is followed by a partially delivered pipelined command
- HGETEX now requires write permission on the key, closing an
  ACL gap that let read-only users change field TTLs or delete
  fields
- Compare the whole TLS certificate CN during authentication,
  so an embedded NUL can no longer impersonate another ACL user
- Fix atomic slot migration failures with I/O threads by not
  offloading the export job's writes while snapshotting
- Reject invalid slot import ranges when loading an RDB, so
  corrupted files can no longer create bad migration jobs
- Reject RDB slot import records with an invalid job name length,
  preventing an out-of-bounds read at startup
- MOVE and COPY now check ACL access to the current database, so
  users can no longer exfiltrate keys from an unauthorized DB
- Fix a crash on COPY with a trailing DB option during slot
  migration, and block cross-DB COPY regardless of option order
- Fix a server panic when pipelined commands with invalid arity
  reach the key prefetcher with I/O threads enabled
- HPERSIST, HTTL, HPTTL, HEXPIRETIME, and HPEXPIRETIME now return a
  syntax error when the FIELDS keyword is missing
- Fix a race between TLS I/O-thread writes and reads that could
  leave slot migration export jobs stuck until timeout
- Fix a signed overflow that let very large hash field expiration
  times (e.g. via HPEXPIREAT) crash the server
- Fix a frozen monotonic clock on hosts with unsynchronized TSC
  that stopped background tasks and key expiration
- Fix a stack overflow crash when retrying a failed TLS write
  with a large reply
- Fix the --check-system clocksource check to skip hosts using a
  hardware clock and suggest only actually available clocksources
- Fix an assertion failure with I/O threads when a blocked
  client's pending command was processed again before unblocking
- Sentinel no longer loads the built-in Lua scripting engine,
  removing a spurious warning at startup
- Validate channel, message, and module payload lengths in cluster
  bus packets, preventing forged packets from crashing nodes
- Harden stream validation on RDB load and RESTORE so crafted
  payloads can no longer crash the server on later commands
- Reject stream payloads with mismatched live/deleted record
  counts, preventing XDEL from destroying unaccounted entries
- Skip unnecessary post-read processing with I/O threads on socket
  and TLS connections, restoring small-payload throughput
- Fix a use-after-free crash when serving clients blocked on the
  same key if one client is freed during processing
- Avoid an unneeded client lookup per write completion with I/O
  threads on socket and TLS connections, improving pipelined
  throughput
- Fix CLUSTER SLOT-STATS ORDERBY returning wrong ordering when slot
  counters differ by more than 2^31
- Fix slot migration failures with I/O threads and TLS by keeping
  the export job's ACK reads on the main thread while snapshotting

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../valkey/{valkey_9.1.1.bb => valkey_9.1.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.1.1.bb => valkey_9.1.2.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.1.1.bb b/meta-oe/recipes-extended/valkey/valkey_9.1.2.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_9.1.1.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.1.2.bb
index 92cb1cf2f2..187c9a046e 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.1.1.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.1.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=${@oe.utils.trim_version
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "d27f9ba65a04e80d9c417112a7621fc98a56f70d"
+SRCREV = "7f1dffedff6de73058b2c2a389422b6ecd56c8fb"
 
 RPROVIDES:${PN} = "virtual-redis"
 
-- 
2.47.3


