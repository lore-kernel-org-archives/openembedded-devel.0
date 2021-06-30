Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.3746.1625090319958884405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jun 2021 14:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ttasciog@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 15ULwd9d030209
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 14:58:39 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 15ULwc9s019582
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 14:58:38 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 30 Jun 2021 14:58:37 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Wed, 30 Jun 2021 14:58:37 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 21862)
	id 61E8B90140F; Wed, 30 Jun 2021 14:58:37 -0700 (PDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [meta-oe][PATCH] redis: upgrade to 6.2.4
Date: Wed, 30 Jun 2021 14:58:12 -0700
Message-ID: <20210630215812.146648-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upstream changelog:

Upgrade urgency: SECURITY, Contains fixes to security issues that affect
authenticated client connections. MODERATE otherwise.

Fix integer overflow in STRALGO LCS (CVE-2021-32625)
An integer overflow bug in Redis version 6.0 or newer can be exploited using the
STRALGO LCS command to corrupt the heap and potentially result with remote code
execution. This is a result of an incomplete fix by CVE-2021-29477.

Bug fixes that are only applicable to previous releases of Redis 6.2:

    Fix crash after a diskless replication fork child is terminated (#8991)
    Fix redis-benchmark crash on unsupported configs (#8916)

Other bug fixes:

    Fix crash in UNLINK on a stream key with deleted consumer groups (#8932)
    SINTERSTORE: Add missing keyspace del event when none of the sources exist (#8949)
    Sentinel: Fix CONFIG SET of empty string sentinel-user/sentinel-pass configs (#8958)
    Enforce client output buffer soft limit when no traffic (#8833)

Improvements:

    Hide AUTH passwords in MIGRATE command from slowlog (#8859)

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../recipes-extended/redis/{redis_6.2.3.bb => redis_6.2.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.3.bb => redis_6.2.4.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.3.bb b/meta-oe/recipes-extended/redis/redis_6.2.4.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.3.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.4.bb
index 67ac974de..35f34a27d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.3.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "98ed7d532b5e9671f5df0825bb71f0f37483a16546364049384c63db8764512b"
+SRC_URI[sha256sum] = "ba32c406a10fc2c09426e2be2787d74ff204eb3a2e496d87cff76a476b6ae16e"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.32.0

