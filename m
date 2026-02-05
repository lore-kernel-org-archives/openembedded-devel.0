Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4456EA797A
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:47 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14289.1770268540960658050
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LzZ232+X;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268539; x=1801804539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mxqrDZQqGkUNqDUGqJRXSyKMbEKK0/UemYOgvW89C0A=;
  b=LzZ232+X/lnL0YhLlV0TY+PCnP5MP8dmRnbWhFGj+1Z0lfPPmRNXSZ68
   Upr4Fk3mqmBCQCnJl2gK2m1aOpaZvW5duw+RQA+a/z9dQ4PGMqqFixaTI
   okOjv6BV/lbuOgy93k8A34yHzbGf5YwFyxrmQ4zNKRg05tJgx6DftW7rB
   PnCRceRhFAYQE92qO4xdydX/T1RwbDmRIF70WGi7ch7vS1N3xvl5jlUDt
   IXqj+k0DXRg2ZJf+BX8as4FDtpYJpmrggW2Rp458KvwzA/M/qDmY0MvAB
   rdTAHtwMPejfVT5onk3zr6v83M/RIeKAYHejbkupmF1tm14u/ZjbTHN+g
   A==;
X-CSE-ConnectionGUID: kMPj29ClTgKU125WtNelqw==
X-CSE-MsgGUID: j3qnJ0bCRYSbUBSr9AceYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228009924"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228009924"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:38 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 72F184071CB
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:39 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 12E37926770
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 6D95B20000D7;
	Thu,  5 Feb 2026 05:15:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/24] python3-nanobind: upgrade 2.10.2 -> 2.11.0
Date: Thu,  5 Feb 2026 13:14:28 +0800
Message-ID: <20260205051435.1366-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124170

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.10.2.bb => python3-nanobind_2.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.10.2.bb => python3-nanobind_2.11.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.10.2.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.11.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.10.2.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.11.0.bb
index 12b7ff5133..92c4c913f1 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.11.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "08509910ce6d1fadeed69cb0880d4d4fcb77739c6af9bd8fb4419391a3ca4c6b"
+SRC_URI[sha256sum] = "6d98d063c61dbbd05a2d903e59be398bfcff9d59c54fbbc9d4488960485d40d0"
 
 inherit pypi cmake python_setuptools_build_meta
 
-- 
2.43.0


