Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78535C54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6745.1747818004731831507
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XcOV4XCu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818005; x=1779354005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3GtmxkDMCVWPst790nmDgkrsZ8p1s3QGVQJ4/zwRG9c=;
  b=XcOV4XCufJ8y0VsU6V4yh7Ns2Bh83zDetOVBJ2thOeLYIfUfWkmAwSFz
   9FZW6M2j3MePmX+aG4U1bGCSmNFC3wIrkHs3Z63tnxqljWwsOkT6DZgWD
   GfSGHdnnpqqWdBNR5aQ22/TTtjG1m2q1IHoWFyUnBloVALSXlMFQTdfy+
   89QNVjBcNVmP09p44t8iAqAdwJkm/NN1ooDVoFSq/heXCP6gMhavxFvet
   kcGV7WKqN056PMcp14nP3Fo/p60pcuzLLJRWOSd4hluKqY+bQXzP6FuNb
   Z/rKozsteqji2gqOPvA9xkv/TQbaeUS3TSxQwfVq1vbZI4pgVIYBURGQA
   w==;
X-CSE-ConnectionGUID: wiEKN8rWRXyA5SiQR+6jVg==
X-CSE-MsgGUID: vGgKYsAVRUSnLZOAFa+nmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="203136712"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="203136712"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 96A4BD4C30
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 53060D8C1F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 101841A00A0;
	Wed, 21 May 2025 17:00:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/43] python3-termcolor: upgrade 3.0.1 -> 3.1.0
Date: Wed, 21 May 2025 16:59:25 +0800
Message-Id: <1747817972-28874-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117563

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add true colour RGB option as input arguments
- Cache system lookups to save invocation time
- Advertise typing via classifier
- Migrate coverage configuration to pyproject.toml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-termcolor_3.0.1.bb => python3-termcolor_3.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_3.0.1.bb => python3-termcolor_3.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_3.0.1.bb b/meta-python/recipes-devtools/python/python3-termcolor_3.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-termcolor_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_3.1.0.bb
index a88482f5d4..81e96507dd 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_3.1.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a6abd5c6e1284cea2934443ba806e70e5ec8fd2449021be55c280f8a3731b611"
+SRC_URI[sha256sum] = "6a6dd7fbee581909eeec6a756cff1d7f7c376063b14e4a298dc4980309e55970"
 
 DEPENDS += " \
 	python3-toml-native \
-- 
2.43.0


