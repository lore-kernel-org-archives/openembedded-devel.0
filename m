Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700C5CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:21:16 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15355.1792128072118186622
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hraADFrD;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5656; q=dns/txt;
  s=iport01; t=1792128072; x=1793337672;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jCh4TJRDPXBLk78krjdi2HeJ/JhmCWqlLI/PK2sg4ro=;
  b=hraADFrDZx9o01NTpws2oG6UJ/N3BCFDua+e6NoH7MlJmuhmqfPG5pJD
   IWRJQO8sjdUx3AA/mgNbqOOjAYciYqxydNWHIP7xY/ur4fwvLGnshacGH
   RLeBtISLynTxHHGpZd6yxFZpSki8ECiZBh0kKoNgLbHxY6zOC4HB2BgdI
   00OTO+ReYliTHjKjaUhj/S/TL9SQO6BBjYW72jze8NvOFsnfbToViz12Y
   eHZV5TSxB91Iup88hObqd03gbqicMY0gYol7BTrWBExNl1oGMNKdy/x/j
   9X35vD/mFjlwrygBiqqmlhJdBJLBN0o5KqIflNc4Vh5KZG4heXeJqa1nh
   g==;
X-CSE-ConnectionGUID: phVUkw4CRCi0eqrz4Ci3Wg==
X-CSE-MsgGUID: GQcXNXVZQaqVHkIKCn7hxQ==
X-IPAS-Result: =?us-ascii?q?A0BcAgAKs9Fq/5H/Ja1aglmCGD91YENJlCmCIQOLZZI3g?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDMgEYAT0cAwECLyALIwgZgwIBgjoDNwMRvC4bN?=
 =?us-ascii?q?4IsgQGDKQE/AkNQ2EsNcoFoAQsUAYE4hUCCf4UkXRgBhHwnG4FJRIEVg2mBB?=
 =?us-ascii?q?YEaQgEBA4E1hm0EgxwSgVoYBpUpSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+b?=
 =?us-ascii?q?geSFB6CZYEOARMXAYFoGmSSV5BDgiGgHnGEKIwijz6FfBozhASBV5JAklQLm?=
 =?us-ascii?q?H2OCoQJkkaEaYFoPIFHCwczGggbFYMiCUoZD44uCwuBFAEJgkKBf2XLdicyA?=
 =?us-ascii?q?gkyAQEHAgcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:hS+UiartKI9MGrz/4b/hPBL7nU1eBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnTM66JazH9ftB+bt6+9ksH7JOGnNJjQAFurns3QX8QpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0v53P1xN6
 qAzEhsMNh2anfDq67PgdeY506zPLOGzVG8ekmtrwTecCbMtRorOBv2ao9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LVfrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4bTFJQFxBfCz
 o7A10vACSE8BOKt8DOczFKvp8zkm3z7SLtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YRLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:RCmFm66pN2l2UtLsHgPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:glmUI27yOqLv36bhn9ss7E4qJ8M6Llbn53aILlaiGzpCSeaqRgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AbiPBTw3kM4yyAr9Pkl/WTU2nHjUjzJ2lOGY9r6c?=
 =?us-ascii?q?/stC6FS9RGByb0zSne9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521998292"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:21:11 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 1238818000443
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:21:11 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id AB3DCCBF201; Thu, 15 Oct 2026 22:21:10 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 2/4] redis: fix CVE-2026-23631
Date: Thu, 15 Oct 2026 22:21:08 -0700
Message-Id: <20261016052110.184934-2-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016052110.184934-1-yurade@cisco.com>
References: <20261016052110.184934-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131047

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/redis/redis/commit/0cca172a174642bdae03b871615227896274d9bb
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-23631

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../redis/redis-8.0.6/CVE-2026-23631.patch    | 119 ++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_8.0.6.bb |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23631.patch

diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23631.patch b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23631.patch
new file mode 100644
index 0000000000..abb3098820
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23631.patch
@@ -0,0 +1,119 @@
+From 0cca172a174642bdae03b871615227896274d9bb Mon Sep 17 00:00:00 2001
+From: Ozan Tezcan <ozantezcan@gmail.com>
+Date: Tue, 14 Apr 2026 08:47:04 +0300
+Subject: [PATCH] Fix use-after-free when fullsync happens while replica is
+ running a timed out script (CVE-2026-23631)
+
+Fullsync triggers emptyData and scriptingReset which free the scripting/function engine. If a timed out script is still running on the replica, this causes a use-after-free. Delay fullsync processing in readSyncBulkPayload until the script finishes.
+
+CVE: CVE-2026-23631
+Upstream-Status: Backport [https://github.com/redis/redis/commit/0cca172a174642bdae03b871615227896274d9bb]
+
+(cherry picked from commit 0cca172a174642bdae03b871615227896274d9bb)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/replication.c                 |  5 ++
+ tests/integration/replication.tcl | 77 +++++++++++++++++++++++++++++++
+ 2 files changed, 82 insertions(+)
+
+diff --git a/src/replication.c b/src/replication.c
+index 5fab23b1c..489032aed 100644
+--- a/src/replication.c
++++ b/src/replication.c
+@@ -2022,6 +2022,11 @@ void replicationAttachToNewMaster(void) {
+ /* Asynchronously read the SYNC payload we receive from a master */
+ #define REPL_MAX_WRITTEN_BEFORE_FSYNC (1024*1024*8) /* 8 MB */
+ void readSyncBulkPayload(connection *conn) {
++    /* During full sync, the functions engine is freed right before loading
++     * the RDB. To avoid this happening while a function is still running,
++     * delay full sync processing until it finishes. */
++    if (isInsideYieldingLongCommand()) return;
++
+     char buf[PROTO_IOBUF_LEN];
+     ssize_t nread, readlen, nwritten;
+     int use_diskless_load = useDisklessLoad();
+diff --git a/tests/integration/replication.tcl b/tests/integration/replication.tcl
+index 65494f427..412a00740 100644
+--- a/tests/integration/replication.tcl
++++ b/tests/integration/replication.tcl
+@@ -1661,3 +1661,80 @@ start_server {tags {"repl external:skip"}} {
+         }
+     }
+ }
++
++# Fullsync should not free the functions lib ctx while the replica has 
++# a timed out function that is still running.
++foreach type {script function} {
++    start_server {tags {"repl external:skip"}} {
++        start_server {} {
++            set master [srv -1 client]
++            set master_host [srv -1 host]
++            set master_port [srv -1 port]
++            set replica [srv 0 client]
++
++            test "Fullsync should not free scripting engine on a replica while a $type is running" {
++                $master config set repl-diskless-sync yes
++                $master config set repl-diskless-sync-delay 0
++                # Set small client output buffer limit to trigger fullsync quickly
++                $master config set client-output-buffer-limit "replica 1k 1k 0"
++                $replica config set repl-diskless-load yes
++                $replica config set busy-reply-threshold 1 ;# script timeout in 1 ms
++
++                # Load function
++                if {$type eq "function"} {
++                    $master function load replace {#!lua name=blocklib
++                        redis.register_function{
++                            function_name='blockfunc',
++                            callback=function() while true do end end,
++                            flags={'no-writes'}
++                        }
++                    }
++                }
++
++                # Start replication
++                $replica replicaof $master_host $master_port
++                wait_for_sync $replica
++
++                # Run the blocking script on replica
++                set rd [redis_deferring_client]
++                if {$type eq "script"} {
++                    $rd eval {while true do end} 0
++                } else {
++                    $rd fcall_ro blockfunc 0
++                }
++
++                # Verify replica replies with BUSY
++                wait_for_condition 50 100 {
++                    [catch {$replica ping} e] == 1 && [string match {*BUSY*} $e]
++                } else {
++                    fail "$type didn't become busy"
++                }
++
++                # Fills client output buffer and triggers fullsync
++                populate 5 bigkey 1000000 -1
++                wait_for_condition 50 100 {
++                    [s -1 sync_full] >= 2
++                } else {
++                    fail "Fullsync was not triggered"
++                }
++                
++                # Verify replica is still running the function
++                after 1000
++                catch {$replica ping} e
++                assert_match {*BUSY*} $e "replica should still reply with BUSY"
++
++                if {$type eq "script"} {
++                    $replica script kill
++                } else {
++                    $replica function kill
++                }
++
++                # Verify replica is responsive again
++                catch {$rd read} result
++                $rd close
++                wait_for_sync $replica
++                assert_equal [$replica ping] "PONG"
++            }
++        }
++    }
++}
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
index f09bb8aba2..a83ffbae48 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://CVE-2026-81934.patch \
            file://CVE-2026-23479.patch \
+           file://CVE-2026-23631.patch \
           "
 SRC_URI[sha256sum] = "6d0a9913887a4972536f9da226f1575859c34d86354129163260a5f9c6bd4229"
 
-- 
2.35.6


