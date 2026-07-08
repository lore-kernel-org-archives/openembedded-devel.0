Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472DEC44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:52 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4725.1783503947952875227
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rhIP/RlN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503948; x=1815039948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ck0YBMENeNmks6evj0IqP9xmpqZ4Am9GPZTBx9g+UHI=;
  b=rhIP/RlNsI7IVW9FhnZCLB0yXbLkqARt8mkumMgiFdl8u1hu9z7G/DQq
   ZggnwnMORbUHUz0KmT173p3RsIyz6FF+JwwRIwXhfNTHDW2gHIRhM5ZJx
   B3PEAIXDtpOn9oEk0L4EiXxvmQ50s7N7goCruDsckhs2XEXOeuJn+SaYO
   xuvGEzRT0B1Ncbp+0z7sf/FOOn9IFiU4tUsAglV9vQ9etfmurkZOZa9eq
   kCiVCyUmte6Sy0xxBNpFmdFB6vf3+jUecAcjOVvmFLe5qkbXOS1eQkfbi
   J56tZyeKQLCB5MQ3hZKWfA5PegOMluj9KuxmjYhXFBxt7L4fb/G9xLsuv
   A==;
X-CSE-ConnectionGUID: UiBMH6eqTLW2rfS+VJeegA==
X-CSE-MsgGUID: TJ+5sXO4SG67rKMBoC6UWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="250142770"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="250142770"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:46 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6B4731C000F1
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 190651C2DF56
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3246C18030D2;
	Wed,  8 Jul 2026 09:45:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/37] python3-huey: upgrade 3.0.3 -> 3.1.1
Date: Wed,  8 Jul 2026 17:44:30 +0800
Message-ID: <20260708094508.2060-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128091

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Ensure we use a safe name for long postgres queue names. PG has a 63 byte
  limit on the channel name.
- Ensure recycled worker threads no longer leak their LISTEN connections
  w/Postgres.
- Add first-class Postgres support: PostgresHuey. Workers use LISTEN/NOTIFY
  when a task is enqueued, giving Redis-like dequeue latency without polling,
  and dequeues use select ... for update skip locked so any number of consumers
  can share one database (requires psycopg 3.2+).
- The django.tasks backend is now also compatible with the django-tasks
  backport package, extending support to pre-6.0 Django.
- Use an explicit fork multiprocessing context for process workers, rather than
  setting the global start-method from the consumer entry-points. Fixes -k
  process on MacOS 3.8+ / Linux 3.14+ when the consumer is started via the
  huey_consumer console-script or a programmatic create_consumer().run().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_3.0.3.bb => python3-huey_3.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.0.3.bb => python3-huey_3.1.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.0.3.bb b/meta-python/recipes-devtools/python/python3-huey_3.1.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.1.1.bb
index 7c780b48da..185549fe91 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "1a17fef95fc8432f75413f1b77439cef5f3493c1ddbfba9151756b31a1b2dad3"
+SRC_URI[sha256sum] = "156f30e90f0fae81ae2e004f2062e1b18ec9dcbc684564df63159ef546b13502"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


