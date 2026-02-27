Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D6BFD7F7C
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92464.1772187311204317051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R3kDLPnk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187310; x=1803723310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1XNJxqEmNwdmzLubw+o0D2PgukVTGsVaYqA00tHFe2E=;
  b=R3kDLPnkFDau36h1xQ28zYR4vMgV8H6MXa7sHCkJ/Nyfp/OSlys8mDrS
   jeLwd79AWt0ahz//eIIgaqCLy5wSEmHjIHx2LrrDq8Ae62koqSE9SaiXV
   nMmV/wWRFgHj8FDYndL1lGUy2Bn4apbqDqlVl6Lh8ZJ06LsDB4I92BYtz
   sEmWpzneXkWTKBhEhgQKkvfrbb5n3QVwshnBaZLYHcbJJqQCv4H6eDBiU
   OuMvgo77YfpZ0OmNY0EPBUeLTrVzQ740t41pz0i82KoaFGvpSU6HwzRxT
   77nKIeiC/1JUlWchZEeVsgIWIK+XTtgJ1sob7r8exoYBQyVG5nQfOnKjo
   A==;
X-CSE-ConnectionGUID: YkBVXzDvSJG7iu7Gr1gL0g==
X-CSE-MsgGUID: c3Ey7gDbT/2aDKnaJcW+sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231325550"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231325550"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 9ACC51002B9B
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:09 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 505B8180ABCE
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6B8DD18005BF;
	Fri, 27 Feb 2026 10:15:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/52] python3-tenacity: upgrade 9.1.2 -> 9.1.4
Date: Fri, 27 Feb 2026 18:13:08 +0800
Message-ID: <20260227101327.1432-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124733

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Apply formatting to num seconds in before_sleep_log
- Support Python 3.14
- Typing: Accept non-standard logger in helpers logging something
- feat(wait): add wait_exception strategy
- docs: fix syntax error in wait_chain docstring example
- chore: drop Python 3.9 support (EOL)
- Support async sleep for sync fn-to-retry
- Fix retry() annotations with async sleep= function

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tenacity_9.1.2.bb => python3-tenacity_9.1.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tenacity_9.1.2.bb => python3-tenacity_9.1.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-tenacity_9.1.2.bb b/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-tenacity_9.1.2.bb
rename to meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
index 76d23aee40..5200c4c0b5 100644
--- a/meta-python/recipes-devtools/python/python3-tenacity_9.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tenacity_9.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jd/tenacity"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
 
-SRC_URI[sha256sum] = "1169d376c297e7de388d18b4481760d478b0e99a777cad3a9c86e556f4b697cb"
+SRC_URI[sha256sum] = "adb31d4c263f2bd041081ab33b498309a57c77f9acf2db65aadf0898179cf93a"
 
 SRC_URI:append = "file://0001-ptest-skip-a-test-that-does-not-pass-on-qemu.patch"
 
-- 
2.43.0


