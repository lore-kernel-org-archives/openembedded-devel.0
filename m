Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3043FCD12A0
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.39473.1711983094575666180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qz8oJAEz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983096; x=1743519096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5eIKPcX/jezPqaS450fj5QgtSPaH+wW94hbSuHjNlCo=;
  b=Qz8oJAEz+5kf/6MZ007uFkiATefAiykGBZrgStSyY25L4j//Ebb3q7a8
   C1JDNQX1FFG2UteHsDpbWmezwGzKK1L7v/3/XKidbSPnoVMuPmVLPIeQq
   5bQe7gTX8KKruAfVGLCQXdUtIGYAjm/sX3OKEvMTZiEWzdaCrSXTjIoAX
   H3dqOZ7SHYDQxb04Flo/oL1GqJkFzcxa+ox3Jkxgwu3I98XOO72Za8Rvw
   UJ8zxdxXg/1DWvMbUZpdjTSDRqUrPezgA0Pvl/tBfXMeKqS5EDhIFpSG2
   +iEYSo9TDozXE+X1QayPjP9Fh4smnhv3TuzWUYfAWLIlEUoW/FCoO9/oP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="153710756"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="153710756"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 67315C9FF4
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A0FF4D5602
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42C4A40FF7
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED6761A000A;
	Mon,  1 Apr 2024 22:51:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/47 v2] python3-djangorestframework: upgrade 3.14.0 -> 3.15.1
Date: Mon,  1 Apr 2024 22:50:46 +0800
Message-Id: <1711983079-16849-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--3.006500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv5nlJilS5UkZgU
	Ly4zAbFBwCqHJHGt2iNDc4lSgrowpe/Ui0F8hu7QA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY7Cl8sx4HBG1XgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIgnxDbTPgXgCmjnmxM92yx3dykXQPfSP++SaW2hgON9AGPu
	cHcYGDypz4xeiJWqhl5QcLboMWEqn3RnavHz/EdKim0KCn26ydLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109730

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix SearchFilter handling of quoted and comma separated strings, when
 .get_search_terms is being called into by a custom class.
-Revert number of 3.15.0 issues which included unintended side-effects.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ramework_3.14.0.bb => python3-djangorestframework_3.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.14.0.bb => python3-djangorestframework_3.15.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.15.1.bb
index c39f37f7e..9515aa229 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "579a333e6256b09489cbe0a067e66abe55c6595d8926be6b99423786334350c8"
+SRC_URI[sha256sum] = "f88fad74183dfc7144b2756d0d2ac716ea5b4c7c9840995ac3bfd8ec034333c1"
 
 PYPI_PACKAGE = "djangorestframework"
 
-- 
2.34.1


