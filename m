Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1889.1795113373629491506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gcH5Z1bc;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so66756b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113373; x=1795718173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6Y55QBfb/It/5V0+Qlk2RVmhjjwNtlePfcc4nVcCow=;
        b=gcH5Z1bcfVGSVJ2ane52fhK8DK21Fi8LzPbFmY5bQaMk7tUl9/A9azoIxruQWOONyA
         3oZdaq6cfzSWy0ZsLBX1fC8SratBpiWf+3A3BUoV2Fsm3itA1rwFpxlkUAcpwoLegUhS
         S6XkP6qp2XvKNqrtiGafntW5QW7U4SB5zOCrW/ex08NrfnLHXMOxXZHZ2/F5VhJBqB3e
         WN5Vj4K24RDcmsvi9I9X56ztV/2FwBsLK5Mi85R8tu7NOL4rY9EF3MTyozKeZKJr7moI
         TnLdGsieTO6u2jV+i0Sqmy/F3EdundwTOZDE4lXpnPcm+twC4jk4DshaGM0oJBPTUIlD
         XXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113373; x=1795718173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6Y55QBfb/It/5V0+Qlk2RVmhjjwNtlePfcc4nVcCow=;
        b=CZERvdzBKZ4+BwzXpdFAeEHfHhXnKVmqgd4oeJb2AJwDlvIyGdgguQtEX4fVHWG6rM
         QaB38i4GOdt7Sx+SjA54wfQT7edcMF10WNpw/JgH39FRzDofmf2PgHgzAxXR+GcTVC4P
         w78yYv9xK9yNi5AlH3IJZS8Qn1DtIxUbqMdrsLieaKs7nqeLJ2bbSp3Pp5FpsPLck03c
         7QZ0C05K1ptCfAB7bJStapCqsQGF9U50yoxOdGwhM8NndWdqW7ofqV2NFQ360Bdw45LX
         u/95dXK9ERVCGDLoNJ2dB1PS4bNjFUWHhPFcc18wrJat9yhzjfQnSbP7s8blIQpoToGq
         DIIA==
X-Gm-Message-State: APuU4Z8nd8VAohpRNW9rv5K01NxqLqT/in6JQduDmeFW7qDY4Lvk/AKG
	5P5Rq4x+J2Zpl4M4Xb3a47IIYChdNh4Y8Nb/Os2SoJFkxfxPbah1igbgF06QGQ==
X-Gm-Gg: AYBFou1bxWTgqM1WQzIveMADwYYvGWQLq0GJw5VF5WL9US6wUsmz9B4ZSM6fl65dO8m
	hNNWyrycNaE+iCbVKx0Li4/4B4Aju1qIgmspvIpJC/2GAip/AuE86F/bpVrIa9xJU4CqbI9zvqk
	4Rf0NqUfRKW7pzQuf82rDscaOmMR/2/kcChgAi7OJ4idKknISWrZBQdrnHVYqYL15ewLVvxQuMx
	dfX96e46stOCN6XqY2/t6Xn4r5neZ1HruF2Zv4oMP1nFtq693+4t3EjG0vIiDWCGe2xV+Yb020x
	DRSOgLIpZYKBGzm4DR5qDp4whMamQdV+4xjPz1IpBszmIXjt+z4cVpG7sblHL2gBsMIxu+7KQ00
	MpPLakzIaBO712EQaBhJ4/BJHoPrpA9XG8uMfI0/Fnq22+H0S9iYzeDx9rS5jnY0vvCErDoltqc
	l93vZoPCeofb1C4wLaz/9UlsFxwM4JDmZo7PogMgDr7xaHJ/HNPLA8XE4+ccqvTJSLQkxdw5fwW
	osebexRJiV82g83KWk+9xaqwm4cWrh1CNtTjR2+nsQfYhm9UUGe7AMM5WaFK+Ystp3hvzxg4sjs
	J9/9qrbqQWYbW9dwj9Ek08KiQHfel8OD00PhQopPk81AX7pDrvPEvw/ZvXqm7A==
X-Received: by 2002:a05:6a00:44c5:b0:8b5:9654:d340 with SMTP id d2e1a72fcca58-8c87ca520f8mr373559b3a.33.1795113372907;
        Thu, 19 Nov 2026 10:36:12 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 07/64] valkey: Upgrade 9.1.2 -> 9.1.3
Date: Fri, 20 Nov 2026 07:32:35 +1300
Message-ID: <0580445b95507c7b06c9d2df92c5149286381b96.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132697
Content-Type: text/plain; charset="utf-8"

From: Leon Anavi <leon.anavi@konsulko.com>

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
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 76fbf5e4c6c4d88af5ff511ab298c7d9cb08bfa6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
 
