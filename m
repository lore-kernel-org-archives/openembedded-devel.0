Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FA8C54E58
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:58 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.7739.1709714693034216191
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dPvRLpe6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714694; x=1741250694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gtudsnWY/+xkKFfvy8DF0Mwhdhr5p27LOPLZIVsauPg=;
  b=dPvRLpe6y56DLzrojUNHK4lAxuucxk0rGMiCuiTohwiW6AKGQj86wN4C
   iPkD3t00NML3Pt774HeO4SUku/xJvVhy5qj/lP11Lb9QI0v/US9lYwjaU
   QuS2OL16lICOr2dUtQNK810xoD8LkCe+DvIDVVEHwTzH3OW4FwVEGd51h
   1gcwwPzd71HMj9BZI9QYOaHYIxaWwRqkNKokj7IAm5M14KpnbVXP6RBvI
   az8q/Ri6Rid+EMsNgQE1iKjz7LUxpxChHRmcZiYMpV4+9XuEK7v81QGkV
   8A3PSv28nSoVXqT3DT8IAbcplQYBPLlEwLp8qzupXBpP73PMltovEtWDk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="130775057"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="130775057"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:51 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D40DED9F05
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CEE0CFBB4
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BE90C2008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F6DB1A006A;
	Wed,  6 Mar 2024 16:44:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/26] python3-sentry-sdk: upgrade 1.40.4 -> 1.40.6
Date: Wed,  6 Mar 2024 16:43:26 +0800
Message-Id: <1709714608-19296-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--10.280600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvIFck3f6fvyGpP
	jHo14Z8HD0maSEIJe5QhOBRj/wlr8s3zUc8zGlQgzYK5U+QI3O7fuNwtNj3IRAzvg1/q1MH2UoJ
	JXv0NurAUe+gTY5XymgzLDqEyu1hQ7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5AE59
	pk4kcc5bF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2DsAVzN+Ov/sPYCAk8xoRfM9ik0zH9RfEbDtx
	PYvnCBhpsg74x9nVvvwNUHJL3VLrw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109164

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix compatibility with greenlet/gevent
-Fix query source relative filepath
-Support clickhouse-driver==0.2.7
-Bump checkouts/data-schemas from 6121fd3 to eb941c2
-Deprecate last_event_id().
-Warn if uWSGI is set up without proper thread support
-uWSGI has to be run in threaded mode for the SDK to run properly. If this is
 not the case, the consequences could range from features not working
 unexpectedly to uWSGI workers crashing.
 Please make sure to run uWSGI with both --enable-threads and --py-call-uwsgi-fork-hooks.
-parsed_url can be None
-Python 3.7 is not supported anymore by Lambda, so removed it and added 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.40.4.bb => python3-sentry-sdk_1.40.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.40.4.bb => python3-sentry-sdk_1.40.6.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.6.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.6.bb
index f3f2a5d20..a348f337c 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.40.6.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "657abae98b0050a0316f0873d7149f951574ae6212f71d2e3a1c4c88f62d6456"
+SRC_URI[sha256sum] = "f143f3fb4bb57c90abef6e2ad06b5f6f02b2ca13e4060ec5c0549c7a9ccce3fa"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


