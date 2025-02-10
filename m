Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA8AC021AE
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.46465.1739178120497717104
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qQSvmqMX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178125; x=1770714125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CD2tGPFsAIqbxjh98me5FyeZ2pmSt0oZPolOJW4ryWM=;
  b=qQSvmqMXx9xTaqTtGsD2/mjKzU9Ldwto0MpIvvf1frSdVgMLRSweBFdi
   7EpYvdbj//++UnEtb/ccDb6J10Dy7GCzEyWYGkUXm+ZLnTGzB7kE+v+kE
   SS00VmmqD9o2lCxH96wSV1j/PVkTKgQRyb58+o01pqiUnJGEce0ZI9KCt
   v03A9ahnkWW9DfrZnlgsphlkXRndPStH04UGgQeAyACCiD2NlQo4JBcIB
   4FYuXyiNh7pSGXJEmv1GxRY8iSk4QFv4nXm2ZcrF4qM56DZJ+lt+Jm5QG
   K87rrOMMRAmW3c4O4bFbxaarwPVcD1am8Fy+F5BE/+Al0LacMwQFtXVGj
   A==;
X-CSE-ConnectionGUID: hgNwaYuzTMyEUwTeT4e7Fw==
X-CSE-MsgGUID: g+pL3T3ZRoyB4OK8RsklVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177845844"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177845844"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 19991B416C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D7A12D5078
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7B91B1A006C;
	Mon, 10 Feb 2025 17:02:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/66] python3-inline-snapshot: upgrade 0.19.3 -> 0.20.1
Date: Mon, 10 Feb 2025 17:01:12 +0800
Message-Id: <1739178095-26432-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115371

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fixed a windows bug with the readline module
- pytest assert rewriting works now together with inline-snapshot if you use cpython>=3.11
- ... is now a special value to create snapshot values.
  The value change in assert [5,4] == snapshot([5,...]) is now a create (previously it was a fix)
- fixed some issues with dataclass arguments
- fixed an issue where --inline-snapshot=review discarded the user input and never formatted
  the code if you used cpython 3.13.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.19.3.bb => python3-inline-snapshot_0.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.19.3.bb => python3-inline-snapshot_0.20.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.3.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.3.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.1.bb
index 4e172e1820..5219675e04 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.3.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "1e40f34da64fe2406c6bba3f473905e22386da43e16c85060610692325aa94d7"
+SRC_URI[sha256sum] = "c56c871e59973500eca00610022eac19e79cd2c1b0b2d7a18abe14dde11a1431"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


