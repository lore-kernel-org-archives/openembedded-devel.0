Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F2DCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:21:16 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15073.1792128072206292822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LMqCTC7w;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4136; q=dns/txt;
  s=iport01; t=1792128072; x=1793337672;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Rp+2LyYREbqgkm9EovpLECMupBpo0PDdazXn6dOKFBc=;
  b=LMqCTC7welqi4Ek17YY2hQpVZZGvwb0Bd0cmw1vTLvZZ5ONjlKalp/Nu
   tO8+0NEPpqFCTQ9JN1aqCdqni0b/5rg558w/ikpNlEnoGhLOeWO5hXvtU
   kHt4Q7F1b6H+DC9v6K7qejWrKYmCpvlNv9plmTsqnK+hJC2np9GSNBMzh
   bnrIMWdhrecL5QuDD5eou5fSIEHTXOTyXBnLTYbvWK8MY1SIDmD0tIgHi
   PxNIunun3p+SIcvI9xvfc4XocQ4QSrBrvDqqpi62uQzz64uAzfWwhZe3t
   r0OYSak0cRhc4LUA4TWAcTUhl5dCYBm/qzUgQsGajMjPOlfJWWNDrSlFv
   A==;
X-CSE-ConnectionGUID: E9NMI2UfQ+62Lmuh/DtbvA==
X-CSE-MsgGUID: RCly8gLsTTGBfLtlwh32KA==
X-IPAS-Result: =?us-ascii?q?A0AmAAAKs9Fq/5X/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKHN4Ihnh8UgWoPAQEBD0QNBAEBhQWOFwImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgEtCwEYAVkDAQJaIyGDAgGCd?=
 =?us-ascii?q?AMRvC4bN4F5M4EBgykBPwJDUNlKgWgBCxQBgTgBhT+II10YAYR8JxuBSUSBF?=
 =?us-ascii?q?AGDaYEFgVwBAQOBJCABPoYfBIMcEoFaGAaVKUiBHgNZLAFVEw0KCwcFgWgDN?=
 =?us-ascii?q?RIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4HkhQegkUgAYENARMXAYJmoxqCIaEPhCiMIpU6GjOFW6UUC5h9j?=
 =?us-ascii?q?gqVOoEVhGmBaDyBRwsHMxoIGxWDIglKGQ+OKwMLC4NggX9ly3YnMgIJMgEBB?=
 =?us-ascii?q?wIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:IgCmy6xC5W07IZkWDCF6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVVx
 2IYDW+Gb66CMGH1KNx0bIrgpBwA7cPRm4RjGgFl+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGxnG6g5oNt5OCIQr
 9gdNTBKQgyJmcvjldpXSsE07igiBNPgMIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cMnWjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeOzbISJK4fQLSlTtnyzo
 nOW8EDiPi01HtK71T6a8in2pcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:qVMgu6AscgMFHgblHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AwTKIx2r4ZzPfXypu04KCEBTmUe10VFj8lkreGgz?=
 =?us-ascii?q?mU0JsVb3SZUOa5ooxxg=3D=3D?=
X-Talos-MUID: 9a23:uJAfawkLC0t7NYwds7WLdnpYH8N5s6uKE3wxvr8In9WAKiwrYRS02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536464932"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:21:11 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 0DC12180001CB
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:21:11 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id A7B11CC1611; Thu, 15 Oct 2026 22:21:10 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 1/4] redis: fix CVE-2026-23479
Date: Thu, 15 Oct 2026 22:21:07 -0700
Message-Id: <20261016052110.184934-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131049

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/redis/redis/commit/c14e9925e571c3c8ecbeb8632fe834faa32175ea
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-23479

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../redis/redis-8.0.6/CVE-2026-23479.patch    | 77 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_8.0.6.bb |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23479.patch

diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23479.patch b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23479.patch
new file mode 100644
index 0000000000..756d6dd746
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23479.patch
@@ -0,0 +1,77 @@
+From 0fa208a25f95603e255211254097dd34a165fed0 Mon Sep 17 00:00:00 2001
+From: "debing.sun" <debing.sun@redis.com>
+Date: Mon, 29 Dec 2025 16:20:41 +0800
+Subject: [PATCH] Fix use-after-free when evicting blocked client during
+ unblock (CVE-2026-23479)
+
+When re-executing a pending command after unblocking, check the return value
+of `processCommandAndResetClient` and exit if needed.
+
+CVE: CVE-2026-23479
+Upstream-Status: Backport [https://github.com/redis/redis/commit/c14e9925e571c3c8ecbeb8632fe834faa32175ea]
+
+(cherry picked from commit c14e9925e571c3c8ecbeb8632fe834faa32175ea)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/blocked.c                  |  8 +++++++-
+ tests/unit/client-eviction.tcl | 29 +++++++++++++++++++++++++++++
+ 2 files changed, 36 insertions(+), 1 deletion(-)
+
+diff --git a/src/blocked.c b/src/blocked.c
+index 86cff0b7f..a35ffb569 100644
+--- a/src/blocked.c
++++ b/src/blocked.c
+@@ -676,7 +676,13 @@ static void unblockClientOnKey(client *c, robj *key) {
+         client *old_client = server.current_client;
+         server.current_client = c;
+         enterExecutionUnit(1, 0);
+-        processCommandAndResetClient(c);
++        if (processCommandAndResetClient(c) == C_ERR) {
++            /* Client was freed during command processing, exit immediately */
++            exitExecutionUnit();
++            server.current_client = old_client;
++            return;
++        }
++
+         if (!(c->flags & CLIENT_BLOCKED)) {
+             if (c->flags & CLIENT_MODULE) {
+                 moduleCallCommandUnblockedHandler(c);
+diff --git a/tests/unit/client-eviction.tcl b/tests/unit/client-eviction.tcl
+index 3caaf9bd4..62e42580c 100644
+--- a/tests/unit/client-eviction.tcl
++++ b/tests/unit/client-eviction.tcl
+@@ -607,5 +607,34 @@ start_server {} {
+     }
+ }
+ 
++start_server {} {
++    r flushall
++    r client no-evict on
++    r config set maxmemory-clients 0
++
++    test "Verify blocked client eviction during unblock does not cause use-after-free" {
++        # Create a deferring client that will be blocked on stream
++        # Use a long stream name to make client memory usage exceed 200000 bytes
++        set rd [redis_deferring_client]
++        $rd XREAD BLOCK 0 STREAMS mystream stream_[string repeat x 200000] $ $
++
++        # Wait for the client to be blocked
++        wait_for_condition 50 100 {
++            [s blocked_clients] eq {1}
++        } else {
++            fail "Client was not blocked"
++        }
++
++        # Now lower MAXMEMORY-CLIENTS to a low value and use
++        # XADD to unblock the blocked client, triggering eviction.
++        r MULTI
++        r CONFIG SET MAXMEMORY-CLIENTS 100000 ;# Put in MULTI to defer blocked client eviction until after EXEC
++        r XADD mystream * field val
++        r EXEC
++        r PING
++        $rd close
++    }
++}
++
+ } ;# tags
+ 
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
index 67126c9fcf..f09bb8aba2 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://CVE-2026-81934.patch \
+           file://CVE-2026-23479.patch \
           "
 SRC_URI[sha256sum] = "6d0a9913887a4972536f9da226f1575859c34d86354129163260a5f9c6bd4229"
 
-- 
2.35.6


