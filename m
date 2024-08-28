Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F81AC5472D
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8726.1724833550442503744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ObgHZ7CB;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833550; x=1756369550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pDnLcrVjqx7qgFm1wskgqK+GfwfvvWiwjyPjZP2j8sE=;
  b=ObgHZ7CBE9Is5N7axGLvmTDrzdUtPftp2b//5JKEWPROqcTaDxvJQ3c9
   qxi8LiK2/knfPHxvT7TKeVwBE6MeAZyf59DGe5LX4B3+Z//71vK8tvYWX
   KvuJYNgEHN4EbuLOjsy9lOgt0BcA1bLgJK43qRA1m+yQWzqKJU5sbjtyg
   FSVV6Pf8gtKY+/4kqkxjmn4RDg7xwxmlP9bIltuYBq1DykejrbwV1mBvk
   9RPML7vz71s49ULJzkXw6RhnKUj7zaUHU9Q/SPaIfp/zllUj5vO6n0MGS
   R4Rr2RHrSuZhAyLUTi6+yndHe1hhFYxaun87Z14vgzuLs+FjyuGFmbMHK
   A==;
X-CSE-ConnectionGUID: A9OPNljVSjCLHWNqq9CC8A==
X-CSE-MsgGUID: 8gDNrzstQs2wjx00CqmX2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="150902401"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="150902401"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:48 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0234BD2ABF
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FA2CBF4AA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D823420079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 820CA1A0002;
	Wed, 28 Aug 2024 16:25:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/46] python3-gunicorn: upgrade 22.0.0 -> 23.0.0
Date: Wed, 28 Aug 2024 16:25:02 +0800
Message-Id: <1724833525-2162-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-3.286000-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrG24YVeuZGmOpTkI0HK8zpcr9
	4vyfQs+ZXppxnSmnssDd+dXlft5oG6qkg+o+yGWuEGOqXTRZcB8BGSO+Oopk6l3V0cSSKu6fkrI
	9/WPu3jfX1u63/F4Cq0zgn4zIF3hL9xWd9ZideuiBDL96LgyuMV7OZ6hrwwnztjC7onS6zuUwV1
	2/6ktut9PTUDa8SKRWDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4Ixtn8UJ
	sHf0X9zgZBEjCNOXeLrixWWWJYrHx8TzIzimOwPah1zjX08EkLEQdG7H66TyHEqm8QYBtMOyl5z
	kXGSAeE+EzhRX0hd5cW9ILMXXFOic2wNYUY2AZIhX01zpXXJrnas3nESrKxM84BgeE0m6UVEQF5
	BWwWFJJMBqo43qfOdgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112002

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- minor docs fixes
- worker_class parameter accepts a class
- fix deadlock if request terminated during chunked parsing
- permit receiving Transfer-Encodings: compress, deflate, gzip
- permit Transfer-Encoding headers specifying multiple encodings. note: no parameters, still
- sdist generation now explicitly excludes sphinx build folder
- decode bytes-typed status (as can be passed by gevent) as utf-8 instead of raising TypeError
- raise correct Exception when encounting invalid chunked requests
- the SCRIPT_NAME and PATH_INFO headers, when received from allowed forwarders, are no longer restricted for containing an underscore
- include IPv6 loopback address [::1] in default for forwarded_allow_ips and proxy_allow_ips
- refuse requests where the uri field is empty
- refuse requests with invalid CR/LR/NUL in heade field values
- remove temporary --tolerate-dangerous-framing switch from 22.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gunicorn_22.0.0.bb => python3-gunicorn_23.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gunicorn_22.0.0.bb => python3-gunicorn_23.0.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_22.0.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-gunicorn_22.0.0.bb
rename to meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
index e9ad084d4..8d825c865 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_22.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "WSGI HTTP Server for UNIX"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5b70a8b30792a916f50dc96123e61ddf"
 
-SRC_URI[sha256sum] = "4a0b436239ff76fb33f11c07a16482c521a7e09c1ce3cc293c2330afe01bec63"
+SRC_URI[sha256sum] = "f014447a0101dc57e294f6c18ca6b40227a4c90e9bdb586042628030cba004ec"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


