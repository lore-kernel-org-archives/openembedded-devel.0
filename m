Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5532C48260
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:59 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.37324.1708333370023497256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pTLvcN77;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333370; x=1739869370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KSILCWDSe6mAD43E671/G511GX+gMRtxQkJi8j7/TrU=;
  b=pTLvcN77NbjPefhahTCa144822XkdG+7YeuRRfrHQOU0Mb8QgEXkLAAZ
   O3JENtznR4v31yNOvtFzWSyoCS4jvasAOfeVe30r1gRKFEDSk98/wNliC
   iwaphN2OT83Ik/nw7psguSimWFomVI6PWI4BA+bbmBDm3A4Z/MUD1kTKP
   emB1KbloieWOsHFzo79fUk5r51h94gJtaSGg5oGg7omENdrSIMv/NGtuN
   Zk2pgvHnYmZrKxCU59J6zh/y75DdxR8gNeg+cQxWXALxeSJPUN0hzNT5z
   K4jGecjrrKp/KFzYGLsdcEPfIL+O6KasFjcpuUrVES+FqmCPFiu8jdyyT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="137396501"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="137396501"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:47 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 643A74DA764
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F77FD5CEC
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3218D202DFF43
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D5EAC1A00A0;
	Mon, 19 Feb 2024 17:02:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/23] python3-cmake: upgrade 3.28.1 -> 3.28.3
Date: Mon, 19 Feb 2024 17:02:21 +0800
Message-Id: <1708333346-17704-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--10.498400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr/1vXbkGjWeUxkLdkW7C5qlE5
	i6jtS+HHieOLvlv9rYvov4MY2WSEP+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ2uX
	Hvx4h0c3de+c0gz7NjHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIfiAqrjYtFiTPx0
	d/vVNJ+jtVT1Ym+7cqcXit7PinhfFk+MxMpd7HQX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108863

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-chore(deps): bump cmake from 3.27.9 to 3.28.1
-ci: group dependabot updates
-chore(deps): update pre-commit hooks
-chore(deps): bump the actions group with 1 update
-Update to OpenSSL 3.0.13
-chore(ci): use 4 threads to compile on GHA
-Update to CMake 3.28.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.28.1.bb => python3-cmake_3.28.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.28.1.bb => python3-cmake_3.28.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.28.1.bb b/meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-cmake_3.28.1.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb
index a6a7b6c4f..6b31d0b4f 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.28.3.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "0d4051d101d151d8387156c463aa45c8cd0e164f870e0ac0c8c91d3ff08528e1"
+SRC_URI[sha256sum] = "a8092815c739da7d6775c26ec30c2645f0fca9527a29e36a682faec7d39cde89"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.34.1


