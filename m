Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F4CC18E7C
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46470.1739178127190769251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D9TiTP98;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178129; x=1770714129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EhSdImVEBxr3TFu9FB5tzFh7gGI8PmPhGhF3mQv/x9g=;
  b=D9TiTP98G2RG64whVrEY2vz3ptOYXMzVbsL+XkNbGBsq6qcanLmYYou7
   LIICuJW5lhGyzxgIvr9FwjYiFBXxfzXC9RS/p34L2bbDzsMR3nP+VY8P5
   SCcgnV50Fj3EbL/ibUUXPumTKIm4inFAMJgnBf8zRzt3PhvXrilEQIJGr
   MtGpMxg8BsU3IAaD2IMFg867Z60mBeUAwxB/DScpZ/bvc1CDraxUd9YvD
   wztcFfkKUgXP7Qfl7QOZ9e9FWjdm1lIc4Cc94O5YZXQL08ybh6rmi5fLH
   3fYs7HvZ+oCqNQKba8F2zchTtFJmr2x+B5Lp8L88WlD0AdUL1someBzh8
   Q==;
X-CSE-ConnectionGUID: CBOPRC/EThCOnfoEA7GV4Q==
X-CSE-MsgGUID: j1tlCX80QQOnAiqji6pDzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189712458"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189712458"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:08 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 001CDD4C70
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B68E8D4C33
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B8301A000B;
	Mon, 10 Feb 2025 17:02:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/66] python3-prompt-toolkit: upgrade 3.0.48 -> 3.0.50
Date: Mon, 10 Feb 2025 17:01:23 +0800
Message-Id: <1739178095-26432-54-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115380

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- On Windows, use virtual terminal input when available.
- Support for multiline suggestions.
- Handle InvalidStateError during termination when using
  run_in_terminal/patch_stdout. This can happen in some cases during
  cancellation, probably when using anyio.
- Fix cursor that remains in hidden state when the application exits. This can
  happen when the application doesn't show the cursor and erase_when_done is
  being used.
- Drop support for Python 3.7
- Fixes non user impacting regression on the output rendering. Don't render
  cursor hide/show ANSI escape codes if not needed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rompt-toolkit_3.0.48.bb => python3-prompt-toolkit_3.0.50.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.48.bb => python3-prompt-toolkit_3.0.50.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.50.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.50.bb
index fc9991e374..f59b6a6ae7 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.48.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.50.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "d6623ab0477a80df74e646bdbc93621143f5caf104206aa29294d53de1a03d90"
+SRC_URI[sha256sum] = "544748f3860a2623ca5cd6d2795e7a14f3d0e1c3c9728359013f79877fc89bab"
 
 inherit pypi setuptools3
 
-- 
2.43.0


