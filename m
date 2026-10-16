Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F13BCCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:21:16 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15356.1792128072186642700
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KoPrwzfh;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7394; q=dns/txt;
  s=iport01; t=1792128072; x=1793337672;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WczO7E4AckD7Ub0lMaGc8zMNDaDw54OIZMO2aejoYVs=;
  b=KoPrwzfhK9lYGucAICLKa2e5ieFZY0m56SoprIM6d5rTtqi7meSByQux
   0iU+T8J+GTcl4N3pXqgO+SnUIcjQhoYsY+oFCW/N4zceH8DyUlVB2l2tL
   o4hibENvCwbmYxjzJfGaUXBxsvHDGa32QoLeyc5udpWCGV1Ff+MsNIBSR
   eWijrVRZknLOYoMCO/1vgi1xbkvxKt+MB90BF0Li8bU5AIm/NSdwoyuG9
   7pmLFDWgJZMOjPbjdfjTMWh+z/QulR9eZMgDMmXJg7vwtYOJ45z6XPol9
   SonfFJPJLExw8Gy7H3mbD6qBE+QW92kjwIHQLky51f3D7Ph4WdFLKTovl
   w==;
X-CSE-ConnectionGUID: KyRW4Cc/RuS4JBP0FOZnRQ==
X-CSE-MsgGUID: KHaaD91pQ4GQK1vpx2BILg==
X-IPAS-Result: =?us-ascii?q?A0BeAgAKs9Fq/5D/Ja1aglmCV3VgQ0mEV49SgiEDgn6IZ?=
 =?us-ascii?q?5I3gX4PAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDIwQkAT0cAwECAwImAgIrGQoIGYMCAYI6A?=
 =?us-ascii?q?zcDEbwuGzd6fzOBAYMpAT8CQ1DZSoFoAQsUAYEKLoVAgx8BhQNdGAGCAoJ6J?=
 =?us-ascii?q?xuBSUSBFYNpgQWBGkIBAQOBJCGDc4JqBIINgQ8SgVoYBmWEC5A5SIECHANZL?=
 =?us-ascii?q?AFVEw0KCwcFgWgDNRIqFW4yHYEjPhcvWBsGBYEdgSCCFiMZNnqBCV6BKylhE?=
 =?us-ascii?q?BeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMH?=
 =?us-ascii?q?QVyCAINCQcpGA1IESw3FRkEPQFuB5IUHoJlAXoTARMXAYEuXTCPVQmWCKAec?=
 =?us-ascii?q?YQojCKPRIV2GjOFW6UUC5h9jgqECZJGhGmBaDyBRwsHMxoIGxU7gmcJShkPj?=
 =?us-ascii?q?i4LC4NggX9ly3YnMgIJMgEBBwIHDgMLgWiQAAImB4FPAQE?=
IronPort-Data: A9a23:HSomvq0jrhBRb26x7fbD5YVwkn2cJEfYwER7XKvMYLTBsI5bp2AEy
 WNNXzqBO/beMGT8Ldx/btm/ox4G78KAmNZmTQRo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGL1AMAtEz8aFNHFoS1
 9YgcB4qXBa5vrfjqF67YrEEasULNsLnOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUicC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsi+a1aYuKJIXiqcN9vWaRr
 06XpnzAXj4jF4WB0Srf2FOIibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1nfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:kOqMwaF8MJ28Q0ibpLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:WOAdBWyKFRJo9Q2aXv7IBgU3C/oaLlbWi03NGBOaI14xZpqnT2WprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AYBMRhg24n8n/YhKWDSQxhkjkaTUjwISnAWxcyI0?=
 =?us-ascii?q?/5+a9FnVuIyfHphWTTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536019761"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:21:11 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 19AFE18000231
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:21:11 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id B3467CBF203; Thu, 15 Oct 2026 22:21:10 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][wrynose][PATCH 4/4] redis: fix CVE-2026-66373
Date: Thu, 15 Oct 2026 22:21:10 -0700
Message-Id: <20261016052110.184934-4-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016052110.184934-1-yurade@cisco.com>
References: <20261016052110.184934-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131048

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/redis/redis/commit/4f62a8bf15c634187d8a87d874f898803=
2f90b6c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-66373

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../redis/redis-8.0.6/CVE-2026-66373.patch    | 96 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_8.0.6.bb |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-663=
73.patch

diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-66373.patc=
h b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-66373.patch
new file mode 100644
index 0000000000..3350ad2a70
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-66373.patch
@@ -0,0 +1,96 @@
+From 4f62a8bf15c634187d8a87d874f8988032f90b6c Mon Sep 17 00:00:00 2001
+From: sggeorgiev <s_ggeorgiev@yahoo.com>
+Date: Thu, 23 Apr 2026 15:46:48 +0300
+Subject: [PATCH] Reject corrupt stream RDB with shared NACK across consume=
rs
+ (#15081)
+
+**Summary**
+
+Detects and rejects corrupt stream RDB payloads where the same NACK
+(pending entry) is referenced by more than one consumer, which violates
+a stream data-structure.
+
+**Changes**
+
+- **`rdbLoadObject` (stream consumer PEL loading)**: Added a guard that
+checks `nack->consumer !=3D NULL` before assigning the consumer pointer.
+When a second consumer's PEL references a NACK that was already claimed
+by a prior consumer, the loader now reports a corrupt RDB error and
+aborts instead of silently overwriting the pointer. Without this check,
+two consumers share the same `streamNACK`, and freeing the first
+consumer's PEL leaves the second with a dangling pointer.
+- **`corrupt-dump.tcl`**: Added a regression test that crafts a stream
+with two consumers (`consumerA`, `consumerB`) whose PELs both reference
+the same entry (`1-0`). The `RESTORE` command is expected to fail with
+`"Bad data format"`, and the server must remain responsive (`PING`
+succeeds).
+
+**Benefits**
+
+- **Fail-fast on corrupt data**: The invariant violation is caught at
+load time with a clear diagnostic message rather than manifesting as a
+crash later during normal operation.
+- **Regression coverage**: The crafted payload in the test ensures this
+class of corruption is permanently guarded against.
+
+CVE: CVE-2026-66373
+Upstream-Status: Backport [https://github.com/redis/redis/commit/4f62a8bf1=
5c634187d8a87d874f8988032f90b6c]
+
+(cherry picked from commit 4f62a8bf15c634187d8a87d874f8988032f90b6c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ src/rdb.c                          |  8 ++++++++
+ tests/integration/corrupt-dump.tcl | 18 +++++++++++++++++-
+ 2 files changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/src/rdb.c b/src/rdb.c
+index 371353c2c..277ca543c 100644
+--- a/src/rdb.c
++++ b/src/rdb.c
+@@ -3060,6 +3060,14 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds key,=
 int dbid, int *error)
+                     }
+                     streamNACK *nack =3D result;
+=20
++                    /* If the NACK already has a consumer assigned, the
++                     * payload is corrupt =E2=80=94 each global PEL entry=
 must be
++                     * claimed by exactly one consumer. */
++                    if (nack->consumer !=3D NULL) {
++                        rdbReportCorruptRDB("Stream consumer PEL entry al=
ready has a consumer assigned");
++                        decrRefCount(o);
++                        return NULL;
++                    }
+                     /* Set the NACK consumer, that was left to NULL when
+                      * loading the global PEL. Then set the same shared
+                      * NACK structure also in the consumer-specific PEL. =
*/
+diff --git a/tests/integration/corrupt-dump.tcl b/tests/integration/corrup=
t-dump.tcl
+index 6017723e0..b04812e0f 100644
+--- a/tests/integration/corrupt-dump.tcl
++++ b/tests/integration/corrupt-dump.tcl
+@@ -1020,10 +1020,26 @@ test {corrupt payload: stream - duplicated consume=
r PEL entry} {
+             r restore key 0 "\x15\x01\x10\x00\x00\x01\x9b\x0d\x56\xa9\xb7=
\x00\x00\x00\x00\x00\x00\x00\x00\xc3\x39\x40\x42\x15\x42\x00\x00\x00\x11\x0=
0\x02\x01\x00\x01\x01\x01\x86\x66\x69\x65\x6c\x64\x31\x07\x00\x01\x40\x0f\x=
0a\x00\x01\x86\x76\x61\x6c\x75\x65\x31\x07\x04\x20\x0b\x02\xcd\xd9\x02\xe0\=
x01\x22\x01\x32\x07\x80\x1a\x04\x32\x07\x06\x01\xff\x02\x81\x00\x00\x01\x9b=
\x0d\x56\xb7\x90\x00\x81\x00\x00\x01\x9b\x0d\x56\xa9\xb7\x00\x00\x00\x02\x0=
1\x07\x6d\x79\x67\x72\x6f\x75\x70\x81\x00\x00\x01\x9b\x0d\x56\xb7\x90\x00\x=
02\x02\x00\x00\x01\x9b\x0d\x56\xa9\xb7\x00\x00\x00\x00\x00\x00\x00\x00\x80\=
xd9\x56\x0d\x9b\x01\x00\x00\x01\x00\x00\x01\x9b\x0d\x56\xb7\x90\x00\x00\x00=
\x00\x00\x00\x00\x00\x80\xd9\x56\x0d\x9b\x01\x00\x00\x01\x01\x09\x63\x6f\x6=
e\x73\x75\x6d\x65\x72\x31\x80\xd9\x56\x0d\x9b\x01\x00\x00\x80\xd9\x56\x0d\x=
9b\x01\x00\x00\x02\x00\x00\x01\x9b\x0d\x56\xa9\xb7\x00\x00\x00\x00\x00\x00\=
x00\x00\x00\x00\x01\x9b\x0d\x56\xa9\xb7\x00\x00\x00\x00\x00\x00\x00\x00\x0c=
\x00\x00\x00\x00\x00\x00\x00\x00\x00\x09\x00\x4b\xe0\x99\x30\x67\x4d\xe5\x8=
7"
+         } err
+         assert_match "*Bad data format*" $err
+-        verify_log_message 0 "*Duplicated consumer PEL entry*" 0
++        verify_log_message 0 "*Stream consumer PEL entry already has a co=
nsumer assigned*" 0
+     }
+ }
+=20
+=20
++test {corrupt payload: stream with NACK shared between two consumers} {
++    start_server [list overrides [list loglevel verbose use-exit-on-panic=
 yes crash-memcheck-enabled no]] {
++        r debug set-skip-checksum-validation 1
++        # Payload: stream with entry 1-0, one consumer group (mygroup),
++        # two consumers whose PELs both reference 1-0 (shared NACK).
++        # XACK on one consumer frees the NACK, leaving a dangling
++        # pointer in the other consumer's PEL (use-after-free).
++        catch {r RESTORE mystream 0 "\x1a\x01\x10\x00\x00\x00\x00\x00\x00=
\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x1d\x1d\x00\x00\x00\x0a\x00\x01\x0=
1\x00\x01\x01\x01\x81\x6b\x02\x00\x01\x02\x01\x00\x01\x00\x01\x81\x76\x02\x=
04\x01\xff\x01\x01\x00\x01\x00\x00\x00\x01\x01\x07\x6d\x79\x67\x72\x6f\x75\=
x70\x01\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00=
\x00\x00\x01\x64\x42\xb9\x9d\x01\x00\x00\x01\x02\x09\x63\x6f\x6e\x73\x75\x6=
d\x65\x72\x41\x01\x64\x42\xb9\x9d\x01\x00\x00\x01\x64\x42\xb9\x9d\x01\x00\x=
00\x01\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x09\=
x63\x6f\x6e\x73\x75\x6d\x65\x72\x42\x01\x64\x42\xb9\x9d\x01\x00\x00\xff\xff=
\xff\xff\xff\xff\xff\xff\x01\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x0=
0\x00\x00\x00\x00\x40\x64\x40\x64\x00\x00\x00\x0d\x00\xe7\x12\xf7\xcc\x25\x=
d5\x0e\x44"} err
++        catch {r XACK mystream mygroup 1-0} _
++        catch {r XREADGROUP GROUP mygroup consumerA COUNT 10 STREAMS myst=
ream 0} _
++        catch {r DEL mystream} _
++        assert_match "*Bad data format*" $err
++        r ping
++    }
++}
++
+ } ;# tags
+=20
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipe=
s-extended/redis/redis_8.0.6.bb
index 5d4ca143d1..04641a9dab 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.tar.=
gz \
            file://CVE-2026-23479.patch \
            file://CVE-2026-23631.patch \
            file://CVE-2026-25243.patch \
+           file://CVE-2026-66373.patch \
           "
 SRC_URI[sha256sum] =3D "6d0a9913887a4972536f9da226f1575859c34d863541291632=
60a5f9c6bd4229"
=20
--=20
2.35.6


