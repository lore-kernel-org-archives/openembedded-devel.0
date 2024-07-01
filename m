Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7992C31D97
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.13621.1719816259115150338
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eid3RruU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816259; x=1751352259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=B3vVKawrvfMJaf14xWYlxvfEpGWWLSqzn7VQT0kTu0M=;
  b=eid3RruUjxhLK7CJzNFBYat2f/ts5dbOBoagq7SZUxPChssA9dI0mgRw
   ebIhD9Mu0JBjDCvLe2Zgk11rvH8yky0nOd+v3Efd9PCx9M6Q2KqC/54mh
   6/H+xrj1/7xhXDUdDh7JByT8stFOLUmiZ3tHY6WdnAUNgMC4p4/PjqAiB
   57xK7lp6surmohOZqGrlVr4pJ/M7Uw5VFIGCEZFYIo0uOgSZX74zu/f0y
   1HNj0lTQ6VncVOJv6K5EBav2TvP3H6Z5JCWrLfH0uxI+XYZEgmGnHcY4K
   itP4ApCmrVTOJRC+K/N1WdELSS5TRitnCoxA8FAHX+mTZzEiEZW7ShkAS
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="167338959"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="167338959"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:17 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C181C68E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ADFABD968B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 458126B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E96A31A000A;
	Mon,  1 Jul 2024 14:44:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/25] python3-a2wsgi: upgrade 1.10.4 -> 1.10.6
Date: Mon,  1 Jul 2024 14:43:44 +0800
Message-Id: <1719816242-11839-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--1.944800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbytzOAUUviTGIxNh
	u03caeD7CGTR5YiqPz1g62EFNWAoiO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6I0z
	05igW1+bmP7DkFRiktZEejMWAnJHR1obyvgGTm8o2LtDqgNXfH0GI/2kmeZWX6E17fj1HkDOmd9
	WOedgLiDs1avPwp2piCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111173

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix ASGI app running error message set
- Fix ASGIMiddleware Receive (#59)
- Require typing_extensions on Python < 3.11 (#57)
- delete http.disconnect from asgi.py

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-a2wsgi_1.10.4.bb => python3-a2wsgi_1.10.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-a2wsgi_1.10.4.bb => python3-a2wsgi_1.10.6.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.4.bb b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.6.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-a2wsgi_1.10.4.bb
rename to meta-python/recipes-devtools/python/python3-a2wsgi_1.10.6.bb
index e6b980266..445cc5a73 100644
--- a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e10d05d29ec6d8be8bfc503683f1bc9a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-SRC_URI[sha256sum] = "50e81ac55aa609fa2c666e42bacc25c424c8884ce6072f1a7e902114b7ee5d63"
+SRC_URI[sha256sum] = "6e5e859623c8b62e6570b9082bbc1e714f78d7c3f7844847be8b666037c6d94c"
 
 DEPENDS += " \
         python3-pdm-native \
-- 
2.34.1


