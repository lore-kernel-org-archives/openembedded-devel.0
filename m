Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187E5CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11265.1781686714667783439
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c7xeXcyP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686715; x=1813222715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YwNapBw7SOGIcntkG/K5HokjV5LmYyaEW5AeWqo0dwk=;
  b=c7xeXcyPTFHQQTZIu/u9k+6ks17QCTeAEt+E/NJYdXOaRN49RHUhrwWT
   lyhvGwmWwks+A2IF2++zckPaQ9CplZH8XdzUQ3qXDTqMYvsYsqCI3Wfng
   XvApSQ61yEZEc5uUUmnok2/6HL1A7OWFTwUyoTCemIHySdapAG/gSJ8p+
   qajhFPqnmmdWU6v/Lx/8hfcPa/fGvd8AxhpLiAZNN3PKj+j/kA4hNtmB4
   heXrKVGOqqx+s7Dh48jBZE8uqh8hDxMGz0/l2baSbgE8R2s+g0nr8HhQE
   sx4FXoP4paFFt6BMZJKfLcdm2b7b/p+i+4rHpkovLl2HlVVfMzNvmjZUr
   w==;
X-CSE-ConnectionGUID: 3lmNWIH5ThSsytRB2MJjfQ==
X-CSE-MsgGUID: 5KSt84QRQFOI9xUOPTZITw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="232383105"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="232383105"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:33 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A2D1E476
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:32 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 56B26100135D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5C9D31000A45;
	Wed, 17 Jun 2026 08:58:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/17] python3-huey: upgrade 3.0.1 -> 3.0.3
Date: Wed, 17 Jun 2026 16:58:01 +0800
Message-ID: <20260617085807.542-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127648

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add a Django 6.0 task backend - pretty much works the same way the normal
  Django integration works (manage.py run_huey), but using Django's canonical
  APIs and decorator. Docs here.
- Redis blocking dequeue no longer swallows ConnectionError -- the error
  propagates to the worker, which logs it and applies exponential backoff.
  Previously a downed redis server caused workers to busy-loop silently.
- Chord callbacks now fire when a member task is revoked, expired or cancelled
  by a pre-execute hook -- the skipped member contributes a None placeholder
  result. Previously the callback was silently lost.
- Scheduler skips missed periodic checks after a stall (e.g. suspend/resume)
  instead of running them back-to-back, which enqueued duplicate periodic tasks
  for the current minute.
- Fix inverted timeout clamp in wait_result() when using notify_result with
  redis < 6 (or an unknown server version): timeouts over one second were cut
  to 1s, and sub-second timeouts blocked indefinitely.
- put_if_empty() is now atomic for the memory and file storage backends,
  restoring lock_task() mutual exclusion on those backends.
- FileLock no longer unlinks an existing lock file at construction time, which
  broke mutual exclusion for any process already holding the lock.
- Process-worker task timeouts use signal.setitimer(), so float / sub-second
  timeouts work. Previously a timeout less than 1 second was silently ignored
  (alarm(0) cancels the timer) and fractional seconds were truncated.
- Consumer signal handlers only set flags -- logging and greenlet cleanup now
  happen in the main loop, avoiding re-entrant I/O from signal context.
- A user-supplied task kwarg named task is no longer dropped during
  serialization. Context tasks (context=True) inject the task instance into a
  copy of the kwargs rather than mutating the task's data.
- MemoryStorage.dequeue() and add_to_schedule() acquire the storage lock, like
  the other mutating methods.
- normalize_time() treats delay=0 as "now" rather than ignoring it, so e.g.
  expires=0 means "expires immediately" instead of "never expires".
- Redis enqueued_items(limit) returned limit + 1 items from the producer end of
  the queue; it now returns the next-limit items to be dequeued, matching the
  other storage backends.
- Redis-dependent tests are skipped when no local redis server is reachable,
  instead of failing at import time.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_3.0.1.bb => python3-huey_3.0.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.0.1.bb => python3-huey_3.0.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.0.1.bb b/meta-python/recipes-devtools/python/python3-huey_3.0.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.0.3.bb
index cbca3cef31..7c780b48da 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.0.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "83ca54fa77c4ee27349393212fc13088142244f491be903f620a9e46e8fca4ce"
+SRC_URI[sha256sum] = "1a17fef95fc8432f75413f1b77439cef5f3493c1ddbfba9151756b31a1b2dad3"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


