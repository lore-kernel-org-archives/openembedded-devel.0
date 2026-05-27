Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9515FCD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16926.1779875310921343147
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dR2SA3Uh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875311; x=1811411311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FSXllAWMLKCTZrnN2aX1i1BREtG2KuAdnpJJiW7EDPM=;
  b=dR2SA3Uh29qXZZuzosnapKUeNeZ+lBs6lw1GgCd8QuaDfeu96+xr6JrQ
   fgXJYh1PbqNKG8gb59r7XkBozmN33xVvR6rSaca9tfIWL22Vf+aDV8GXZ
   SQyDLLkQyzT6aTL9eH9qV76W0kiW5w/Ef/f6SUwq4ENyRkYkXOlpPQX+d
   yeQjWwN9/92qemXTAdBWRDAjsmZ1kA6/yBi9uKa4g/HKtsjbfFeyNZHRX
   N7tgbecTG2A+OEPQgJUF0pXN4VFPc5a2Vl7+3cJsXVXA7aG3hNqmuLrJv
   6QzZUXQj4lLKrehwNItL9Cq9kKnzbeLKSvGNaSdHslrbaYRe+huTnsotG
   Q==;
X-CSE-ConnectionGUID: gBjbJ0nTS0S+eQ0mgomWWA==
X-CSE-MsgGUID: sbvxjj1tTYemUxyjH2aVwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="229391861"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="229391861"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:29 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 55BAB1002BB9
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:29 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0CB75148AD33
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 12D2082A2CC;
	Wed, 27 May 2026 09:48:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/56] haveged: upgrade 1.9.20 -> 1.9.22
Date: Wed, 27 May 2026 17:47:15 +0800
Message-ID: <20260527094805.2039-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127213

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Add ReadWritePaths=/dev/shm to systemd service for semaphore creation
  under ProtectSystem=full sandboxing
* Fix privilege escalation via command socket (CVE-2026-41054)
* Check peer credentials before reading command (CVE-2026-41054)
* Handle failing opening of semaphore
* Fix /dev/shm permissions to use sticky bit
* Use chmod after mkdir to ensure correct /dev/shm permissions
* Update libtool: add lib64 search paths, remove dead code

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../haveged/{haveged_1.9.20.bb => haveged_1.9.22.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.20.bb => haveged_1.9.22.bb} (91%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
similarity index 91%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
index 2ea12b3977..281fe1c2c9 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.20.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.22.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "e2d96806273caa9ce7457e2f8669a3c40517ca27"
-SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
+SRCREV = "21bad00a09233855fbea14ac062bc72b5eabc9a6"
+SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https;tag=v${PV} \
 "
 
 UPSTREAM_CHECK_URI = "https://github.com/jirka-h/haveged/releases"
-- 
2.43.0


