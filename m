Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2955E77194
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.30509.1735032445057522136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dPYfOu/g;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032447; x=1766568447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lgLB/ZyGhBZxsNyeDAQWBHOYgAAt986MTdMrKsnOouE=;
  b=dPYfOu/gjKUuMhKFZxFSfLo5hHz1nVMxQbOna09dDU8GovzFa7Nvht+A
   0Z5uRsw5RmYmEVyMJEnKjoBzjl2Pqh2KlvozLJR6VrPIImn8Xicv+8tn5
   ivTOUGWfAjYUmfz/rxzc4vSjlZBc6A1w07i37XosU5l338nJ+3aEPurOn
   NW88Yvae5sdBqFYhmQA7ftIFjsBsxlWIR7jRNG3uGMlCiTGeM6OksYu1f
   eg6DsfZ0C28LMOONRdXy5jfzV1Ojw7vwmwikfuhJ+h0YZ91ui8FJv72Hy
   sjtrw5GyUhKexSUnqpEjlFfc5Z8+8cjDKWBe3IEa4ftGxwyNyqElYS2RV
   A==;
X-CSE-ConnectionGUID: EE1RaJOrQ2isebHSz+R0/A==
X-CSE-MsgGUID: FpKcnfITSBCvmz9qcq/r/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="163714076"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="163714076"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:26 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B3CCD5019
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 621DAD5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E803F6BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE6121A0073;
	Tue, 24 Dec 2024 17:27:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/67] python3-pycurl: upgrade 7.45.3 -> 7.45.4
Date: Tue, 24 Dec 2024 17:26:38 +0800
Message-Id: <1735032421-13513-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.784400-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyMJxigKCCiS1y0
	IRSrMSjgqh9drh/jR8L6XlaQTkk4xyzTDssIplz2PkILbTHNp5tNLPQl0QAltD3BZApXJkDbKJp
	KpGmR8G3x16QpcyxYnVkuyy8gaRTjEuYl3YX/IW4/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IWXBXaJoB9JZxRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs2cMd
	QR5hYhu2UK89OoQkSOayRldOIUAK8dqsXjDFaL9oDHfxr7rlmpA3pifXqSXSqha85bcjj9+OHw7
	jhmHk92LeC5/a/alm4geppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114515

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Add support for CURLOPT_HAPROXY_CLIENT_IP
* Port tests from bottle to flask
* Add constant for CURL_HTTP_VERSION_3ONLY
* Add EFFECTIVE_METHOD info option
* Don't use `-flat_namespace` on macOS
* Add some missing GIL checks to callback functions
* Fix assorted bugs in pycurl tests, including a segfault
* Fix minor bug in examples/multi-socket_action-select.py
* Build all wheels using the latest version of libcurl and its
  dependencies
* Implement Certificate Authority path autodetection when building
  Linux wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycurl_7.45.3.bb => python3-pycurl_7.45.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.45.3.bb => python3-pycurl_7.45.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.45.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.45.4.bb
index 8dcc2dff18..240b78fb4a 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "8c2471af9079ad798e1645ec0b0d3d4223db687379d17dd36a70637449f81d6b"
+SRC_URI[sha256sum] = "32c8e237069273f4260b6ae13d1e0f99daae938977016021565dc6e11050e803"
 
 DEPENDS = "curl"
 
-- 
2.43.0


