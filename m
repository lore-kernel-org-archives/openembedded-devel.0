Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A58C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 23:50:12 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web10.1118.1634082610826420107
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 16:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SA8bTW8E;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634082608; i=@fujitsu.com;
	bh=t7c7YPN9V1XrtutlAWveza+w5/Vn9qReE0VXr/SLp9Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SA8bTW8Eu5eqsZ1oNe69lYgTNPbQHZw3CTEF/o8fWOP/M4+kFw9nGLOzMh02IaQeA
	 +B/CmRDF7wzEhVTggZz11PJf2feOO8y/naIxZURhP3rjwshM6cGC3wGn1q/V64UZ1E
	 wUcI1MtBs9PghqI3WNnK9DgUguIZKya8ak9plwbg2isqoTF6yVeoMqk3gNA8k17ymd
	 mJ0btNyOHpHiYpqe9UsUhStrC4UfOIto1nQ4px63Nr652odg+q9FgDJwGBvLYhAUgb
	 kDvbPMCiBTcEBNpix01tG4ZKvCNizmDR18GEtxOU5bq1BKN2eFyvykQjpB04vYLWn/
	 e1Mh5LScA5Txw==
Received: from [100.113.2.26] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 15/1D-09980-03F16616;
 Tue, 12 Oct 2021 23:50:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8ORqGsgn5Z
  o0NzMYXHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZizbe4K14KBsxbT3s1kaGC9LdjFycQgJPGGU
  2Pp8BiuEc4FJovXcTijnBKNE/5xFLF2MnBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3D3
  sXIwSEsYCvx5GIpSJhFQFViwvt57CA2r4CzxN3Hb8FsCQEFiSkP34O1cgq4SHx7OIUNxBYCqj
  l+6RALRL2gxMmZT1ggxktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0NjXUNdU0O9xCrdRL3UUt3k1LySokSgpF5iebFecWVu
  ck6KXl5qySZGYACnFDIa72A8+PqD3iFGSQ4mJVFeu4WpiUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeK9IpyUKCRalpqdWpGXmAKMJJi3BwaMkwlsvA5TmLS5IzC3OTIdInWI05rh4cMkiZo7mSc
  u3Mwux5OXnpUqJ80bKApUKgJRmlObBDYJF+SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrx
  OAkBTeDLzSuD2vQI6hQnolMCoFJBTShIRUlINTJ3/z0R+kZHsjnQR8PSPCDgldPywZ1WKoLDH
  htp1/5ucVvMZ/kyPiw+ZkLnsyblE03kaqYfWXVhy3jU1Zeec1GORv03E+l9sWdH9T5BJap/Ow
  jbzzcz8Dmbav+OtlVm+ue05t2ph2/b/r85+vBO4s9VQ9GfjbpGCTZtff2mdVq7XGX34QkJNza
  bY0EXmoqsPnZ96wjdA916ja/+fmT0nlse32Ak680sttDMRSbkguiqy8HEp65lQxar04tyjh2T
  fXjK5KrlUk6+/5UuLf938Y6fOKggLsCdz7JgRePf/7bN6Yiwe28tDJSJWBuT1Ru3w+bHlZUj6
  usNOf/sMVk5xXqxsWZ0auedCRr0QW8ZVJZbijERDLeai4kQAbP2yRW0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-228.messagelabs.com!1634082607!234122!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23305 invoked from network); 12 Oct 2021 23:50:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Oct 2021 23:50:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8AF241009EB
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 00:50:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1E2531009DF
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 00:50:07 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 13 Oct 2021 00:50:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 6.2.5 -> 6.2.6
Date: Wed, 13 Oct 2021 07:49:34 +0800
Message-ID: <1634082575-112891-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634082575-112891-1-git-send-email-wangmy@fujitsu.com>
References: <1634082575-112891-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 23:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93261

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:

(CVE-2021-41099) Integer to heap buffer overflow handling certain string
commands and network payloads, when proto-max-bulk-len is manually configured
to a non-default, very large value [reported by yiyuaner].
(CVE-2021-32762) Integer to heap buffer overflow issue in redis-cli and
redis-sentinel parsing large multi-bulk replies on some older and less common
platforms [reported by Microsoft Vulnerability Research].
(CVE-2021-32687) Integer to heap buffer overflow with intsets, when
set-max-intset-entries is manually configured to a non-default, very large
value [reported by Pawel Wieczorkiewicz, AWS].
(CVE-2021-32675) Denial Of Service when processing RESP request payloads with
a large number of elements on many connections.
(CVE-2021-32672) Random heap reading issue with Lua Debugger [reported by
Meir Shpilraien].
(CVE-2021-32628) Integer to heap buffer overflow handling ziplist-encoded
data types, when configuring a large, non-default value for
hash-max-ziplist-entries, hash-max-ziplist-value, zset-max-ziplist-entries
or zset-max-ziplist-value [reported by sundb].
(CVE-2021-32627) Integer to heap buffer overflow issue with streams, when
configuring a non-default, large value for proto-max-bulk-len and
client-query-buffer-limit [reported by sundb].
(CVE-2021-32626) Specially crafted Lua scripts may result with Heap buffer
overflow [reported by Meir Shpilraien].
Bug fixes that involve behavior changes:

GEO* STORE with empty source key deletes the destination key and return 0 (#9271)
Previously it would have returned an empty array like the non-STORE variant.
PUBSUB NUMPAT replies with number of patterns rather than number of subscriptions (#9209)
This actually changed in 6.2.0 but was overlooked and omitted from the release notes.
Bug fixes that are only applicable to previous releases of Redis 6.2:

Fix CLIENT PAUSE, used an old timeout from previous PAUSE (#9477)
Fix CLIENT PAUSE in a replica would mess the replication offset (#9448)
Add some missing error statistics in INFO errorstats (#9328)
Other bug fixes:

Fix incorrect reply of COMMAND command key positions for MIGRATE command (#9455)
Fix appendfsync to always guarantee fsync before reply, on MacOS and FreeBSD (kqueue) (#9416)
Fix the wrong mis-detection of sync_file_range system call, affecting performance (#9371)
CLI tools:

When redis-cli received ASK response, it didn't handle it (#8930)
Improvements:

Add latency monitor sample when key is deleted via lazy expire (#9317)
Sanitize corrupt payload improvements (#9321, #9399)
Delete empty keys when loading RDB file or handling a RESTORE command (#9297, #9349)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/redis/{redis_6.2.5.bb => redis_6.2.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.5.bb => redis_6.2.6.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.5.bb b/meta-oe/recipes-extended/redis/redis_6.2.6.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.5.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.6.bb
index 58d759b59d..87fade7e04 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.5.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "4b9a75709a1b74b3785e20a6c158cab94cf52298aa381eea947a678a60d551ae"
+SRC_URI[sha256sum] = "5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


