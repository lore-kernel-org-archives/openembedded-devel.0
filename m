Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15988.1793096967507014823
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 03:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JDFZoLK0;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so4814915e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793096965; x=1793701765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=obKDM9GSL1LQgRvybF6+WRQCr+RYuIezMjyf8Luu4ZY=;
        b=JDFZoLK0z0T+3ri03/OG8ZFg/jQGrMpS/fnpIhvgbRKCOPhiHXF7uvVQtWf3a+6Whl
         oQjnMz69GUcgGlG08GWSZWJZd5LZmTzkZ7BAQF6HixmOcW0lonB0P+rhyE4GDQ39J2O3
         383bDigcBOBpMOR8FvzpWIgMtBmPnbW03smPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793096965; x=1793701765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obKDM9GSL1LQgRvybF6+WRQCr+RYuIezMjyf8Luu4ZY=;
        b=ha6IUslAcNOjP3M2EFni9lFoJc8zANeZMNNTJqXgT+T/9ikRWYaebSyv+fFnbyV8Lj
         jgF1YAD2Ez8WvRiBGkoWJ14U8A1e043fnR9Yrra9zmrk/KbJkm30IU/5lkXTvvvhqGK9
         yBkSKoS30aSqHEqurDbYfi9LN959gKWKcpnK9GAkmdLeoRQ4QvMG1i7zhKhgZqo+r9Z+
         olwPSUbikjWlptQYNB0MYqsXHdyUyGD41BCctFk9y///Cfx8eAf2YedfnCBo0xhAXaVY
         BPIfvCfTAU4pvzICveCNzt23Tdus5QcwZ5tCWyzOXYPklhahq3wTiq/ny9Kd6b/Q1mcp
         xS9A==
X-Gm-Message-State: AFq9FYIOjeMeNKaSJYaY95pusxps2ocHNfF+uPK7mhVM0GPpAtUD11LU
	o0FSNlXs447d+59052Stpmt6oFU8sit/KzmVnJFS7tsNvctBDNFQqMgA1nNJ8iMfeJrHobzAh+c
	JvKum
X-Gm-Gg: AYBFou3aYOiqLjNW0iu2lldKy34RhLgtIxcauL2RdBwwMDMq7Pw2o+fvgWOjQtS3Jvs
	cKFhh4OupgOH2fXEBsoBtnV82XwUNgh/IrDmwHVqdo2H6Ts4WPxVbB4txScaV7YH9XAWG5K6Wsv
	esaL7mK/khvop1aabjAVMya3erOqGvc53lcdxQORUKtGEvN2+vUIqrseuLoxpe2DrbmDkKHxFPr
	Mg/VRgStqep33Bt9DMo31Bzq5j4QP1EgJLXmEq56GwqULInkgYdzfCOBv+i5UC2UdOD2q8PIS6m
	FEKPsTZqW6QP8F0OacYl18EGIP1IqSV3ui0i4odHV7IAfSPk2POpL1Fx9oed7Uldl7MzKAQ4eEC
	0c07Vs0He747Z2tBfnAM885ORONtHDImTwlt7iTEIiss9UYZG5LA7FICnyyYEwzR04Wq3DQDHMk
	0W4mh5pWUENgtZVFRhd3bN8NOMigSu0GD1yTAbBSYq/jtmLtmfr2rpLcqYHi4p1FvWIB8tVbhVE
	l+oN8UGfrB/b7Y462mgaHXLPoy/PU9gxXk6MjKpaIctrTHZDRjpJHSpVZHT1ySDg8lVWksphQGZ
	I1i6HwlvhVE7I7tAQ26/yvWuTCAKVWRVACvvJ7ugo9qKE0SoSMwSo22vFblSGXdy/BmK7VZHa+i
	esytQ
X-Received: by 2002:a05:600c:322a:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4a7c60a0174mr34397235e9.18.1793096965443;
        Tue, 27 Oct 2026 03:29:25 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm22634625f8f.38.2026.10.27.03.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:29:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] valkey: Upgrade 9.1.2 -> 9.1.3
Date: Tue, 27 Oct 2026 12:29:18 +0200
Message-ID: <20261027102918.788795-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 10:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131528
Content-Type: text/plain; charset="utf-8"

Upgrade to release 9.1.3:

Security Fixes:

- GHSA-f4q9-j22m-xqq9: Fix a heap buffer overflow in cluster
  Pub/Sub message construction that could allow an authenticated
  client to potentially execute arbitrary code by publishing an
  oversized message

Bug Fixes:

- Fix stream commands that mutate consumer-group or PEL state
  (XGROUP, XSETID, XREADGROUP, XACK, XCLAIM, XAUTOCLAIM) not
  triggering WATCH and client-side tracking invalidation

- Reject module write commands while the server is paused for
  writes, preventing a crash from module timer callbacks during
  CLIENT PAUSE WRITE or CLUSTER FAILOVER

- Fix event loop busy-spinning on virtual machines by not using raw
  TSC for the monotonic clock when the kernel clocksource is not
  tsc

- Fix a crash in ValkeyModule_HashHasStringRef on a missing or
  expired field and correct wrong return values in the hash
  stringRef module APIs

- Fix a server abort on a RESTORE payload declaring a string length
  that overflows the allocation size; such payloads are now
  rejected as bad data

- Fix ZINTER/ZINTERSTORE returning input-order-dependent scores
  when a weighted term is 0*inf; a NaN weighted score now counts as
  0, matching ZUNION

- Clear a stale primary-failure gossip flag on replicas so later
  failovers don't incorrectly skip the election delay
  (#4533)

- Correct ValkeyModule_FreeModuleUser, ValkeyModule_ACLAddLogEntry
  and ValkeyModule_ACLAddLogEntryByUserName declarations to return
  int as implemented, fixing undefined behavior on targets with
  strict call signature checks

- valkey-check-aof now recognizes RDB base files with the VALKEY
  signature instead of misreporting a valid multipart AOF as
  invalid

- Fix module commands that access undeclared keys in other slots
  reading or writing the wrong slot in cluster mode, and aborting
  in debug builds

- Reject relative expire times in SET/GETEX, RESTORE, and
  ValkeyModule_SetExpire that overflow when added to the current
  time, preventing server aborts from negative expires

- HDEL, HGETDEL, HPERSIST, and HEXPIRE no longer propagate fields
  they treat as expired, preventing replica and AOF-reload
  divergence

- Fix a server crash when loading an ACL file containing a selector
  with an unmatched parenthesis

- Fix a segfault on Alpine/musl when Lua is built as a module,
  caused by a symbol clash on an internal clock function

- COPY of a hash now includes expired-but-unreaped fields so their
  deletion is propagated and replicas stay in sync

- Restore acceptance of hexadecimal float sorted set scores (such
  as 0x10), keeping replication and AOF replay compatible with
  Valkey 9.0

- Sorted set range commands with a negative LIMIT offset now return
  an empty result instead of a spurious element on btree-encoded
  keys

- Fix listpack encoding incompatibility that caused RDB load and
  replication failures for entries of certain lengths between 9.0
  and 9.1.x

- Fix atomic slot migration not replicating evictions on the import
  target, which let replicas grow far past maxmemory

- Redact error text in server logs when hide-user-data-from-log is
  enabled, so command arguments no longer leak into logs

- Fix HSETEX and HGETEX failing to parse their arguments when the
  key is named fields

- Fix cluster config saving to avoid publishing truncated
  nodes.conf files, losing the startup lock after the first save,
  and failing every save on SMB filesystems such as Azure Files;
  the lock now lives on a separate nodes.conf.lock file

- Fix LSET on 64-bit builds silently modifying the wrong element
  for out-of-range indexes instead of returning an index out of
  range error

- Fix atomic slot migration with cluster-databases > 1 applying
  writes made during the snapshot to the wrong database on the
  target

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../valkey/{valkey_9.1.2.bb => valkey_9.1.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.1.2.bb => valkey_9.1.3.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.1.2.bb b/meta-oe/recipes-extended/valkey/valkey_9.1.3.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_9.1.2.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.1.3.bb
index 187c9a046e..40e8a9cd75 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.1.2.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.1.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=${@oe.utils.trim_version
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "7f1dffedff6de73058b2c2a389422b6ecd56c8fb"
+SRCREV = "29173b67508b2de4c0f0ed551f3b47cf19fc3ca8"
 
 RPROVIDES:${PN} = "virtual-redis"
 
-- 
2.47.3

