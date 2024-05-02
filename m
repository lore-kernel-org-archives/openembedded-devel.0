Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA5DC25B7C
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.6639.1714628968804437873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k56GYuj7;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628974; x=1746164974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YHmISwIwL/0a71F4y3TtXBCYQKsTh2OXjS/91bJ6Ek8=;
  b=k56GYuj7pfuadtHtdOYbuqSibRnO1xs7aLbqM1pTI4I36YbWFJI5lwf1
   mIKVtibxY7TOJvz8A+C04Ug32CbiE+cf3bCSkvxnUEVjoHrIjfir5wn7Z
   SqHxmznouiDoS8OWLSSqb9cLmLfGDVHnTSlAJPXkXVreVrmfA6WeN/rHz
   scy2DqDYYvM+Kby8KVvCWXRNWZRhSUdOMGnwPBdb9lA2IvmX4HzL45HQT
   /YADoTckUge7IdtsSz5/H9KBKaIn516OOzSRPaU4AXpnT99TeVwc1LOyJ
   z8W1yiCfGVHWLR0VpqWBdQ3z4kL29LHolo6+AtXSlqCdGsOEZz5EQ8VZs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="136526442"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="136526442"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:33 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C346E8FBF
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F653FCEC8
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C01D7223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:29 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6E42B1A000C;
	Thu,  2 May 2024 13:49:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/30] python3-validators: upgrade 0.28.0 -> 0.28.1
Date: Thu,  2 May 2024 10:48:20 -0400
Message-Id: <20240502144829.241208-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--1.698200-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvyTR4/DDsonj+z
	OGOcS0k5qd+YAx0QQgkV0YMoO/TJlZ6Xc36AO8HnRa3I16lfmABcsgu/IQFPzpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/3LhUU/qa4OGYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDpXw6
	Yx9vNFN8Ewa9c+PCyN+OeYgG5VCnhlT24KMHUDnKX5Zx5BUVWENdAKR2TjPXlrwjVPDyOhpyjlB
	SsAT7DIB2QTwmOLhP1uMG6V02+QySir3tZId0WN+6klq53W5kJ9Gzq4huQVX
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110224

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix: reduce memory footprint when loading TLDs
- build(deps): bump idna from 3.6 to 3.7 in /package
- fix: rfc cases in the domain validator
- chore: documentation maintenance
- chore: update contribution guidelines
- chore: updated dev dependencies; bump version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-validators_0.28.0.bb => python3-validators_0.28.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-validators_0.28.0.bb => python3-validators_0.28.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.28.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.28.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-validators_0.28.0.bb
rename to meta-python/recipes-devtools/python/python3-validators_0.28.1.bb
index 36444c0bf..7666ae7d4 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.28.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-validators.github.io/validators"
 LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3fb4b9e6db86c69a33d5e3ee013ab59"
-SRC_URI[sha256sum] = "85bc82511f6ccd0800f4c15d8c0dc546c15e369640c5ea1f24349ba0b3b17815"
+SRC_URI[sha256sum] = "5ac88e7916c3405f0ce38ac2ac82a477fcf4d90dbbeddd04c8193171fc17f7dc"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


