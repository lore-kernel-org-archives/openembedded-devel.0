Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DC4C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3311.1787132177979739747
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MkwNQT0A;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132178; x=1818668178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GF6KAG6DkQVwY0F5/G9dU5Nr92bquIVLZumC+mwmP4c=;
  b=MkwNQT0AqYNBqjVQz7x6alpkEc1/zZH9sl/rBu130o0GvBmzd6I4sD1s
   Tlt1EPpVqyqnqGGbOctgFwUc4uT//Aw03lhYKy+PX3rM9yK9Zo8Sg3q0v
   BysIdz3iXNtH83k6yiIezG/2aQJpWKeYc3lbKoIOEOx1nJBrdhpDtuDgQ
   wcXixEismNo6BFhiZglx+pVoIQTgcXFwaZvMJavpBDxUhkQy44vV/JaXn
   +srllw+p6V0/afzB2vVKcQdLkKWBGeLlBIhZT4zLXbutQlj0JNMZm5NCz
   3Ho6UTi9pjwkZXVJMEg6Lr8RNOZt808+tfF+ZLHOugMsF9miFRsE8AP6L
   w==;
X-CSE-ConnectionGUID: /hQQqXjuQre0d9oLC//Ptg==
X-CSE-MsgGUID: FxfirMdXQO2uhF9h9Nldlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239330848"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239330848"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:16 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 62B711C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:16 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 153BC1800BEB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0B09D1801C0A;
	Wed, 19 Aug 2026 09:36:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/70] python3-filelock: upgrade 3.32.2 -> 3.32.3
Date: Wed, 19 Aug 2026 17:34:36 +0800
Message-ID: <20260819093514.1101-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129302

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- test(strict): deflake close-fault injections on graalpy
- docs: publish llms.txt from the docs build
- fix(fork): survive audit events during interpreter shutdown

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.32.2.bb => python3-filelock_3.32.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.32.2.bb => python3-filelock_3.32.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.32.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-filelock_3.32.2.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb
index a88cd6f427..d2750c785f 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.32.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "c33351e1f49cae33414acbc6d56784e6ecee82514ec90795da1161fc4836b5b8"
+SRC_URI[sha256sum] = "0ffa185a3540854c95caa7fa76b76cb219d907415e2c5dc9af25fd970563487f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


