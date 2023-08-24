Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F47C27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:09:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.6121.1692864543530654960
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="117554373"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="117554373"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:09:01 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E27F5D29F0
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:08:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D4619BD9AF
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:08:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 60EDA6BE7F;
	Thu, 24 Aug 2023 17:08:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH] nginx: upgrade 1.25.1 -> 1.25.2
Date: Thu, 24 Aug 2023 16:08:34 +0800
Message-Id: <1692864514-2221-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.005
X-TMASE-Result: 10--1.495900-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr0bdjqKOoG3f+Aw16GgqpO4xl
	dh/WCr0bU+1cP4ZL2WG0ehXfQPcHKXeeA+rySyNtdPuue3cRiRgW6QrsMqT6p99RlPzeVuQQgg8
	W5tsFXID7tBxFpWhryf+1065WI2+4L/tBTZzO5Q25x7uAXGEprQFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipclPbprwbHJKL/NU5waWPV25d0yDlJHDknMF/b
	rX4qNMCTQN8BJE5NLCHjfCIzzySuaqCYlPK8Fxmv2L9h5XgosuEeVubA8W0FP6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104562

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 *) Feature: path MTU discovery when using HTTP/3.
 *) Feature: TLS_AES_128_CCM_SHA256 cipher suite support when using
    HTTP/3.
 *) Change: now nginx uses appname "nginx" when loading OpenSSL
    configuration.
 *) Change: now nginx does not try to load OpenSSL configuration if the
    --with-openssl option was used to built OpenSSL and the OPENSSL_CONF
    environment variable is not set.
 *) Bugfix: in the $body_bytes_sent variable when using HTTP/3.
 *) Bugfix: in HTTP/3.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-httpd/nginx/{nginx_1.25.1.bb => nginx_1.25.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.1.bb => nginx_1.25.2.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
index 702eac39e2..66eef23895 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
 
-SRC_URI[sha256sum] = "f09071ac46e0ea3adc0008ef0baca229fc6b4be4533baef9bbbfba7de29a8602"
+SRC_URI[sha256sum] = "05dd6d9356d66a74e61035f2a42162f8c754c97cf1ba64e7a801ba158d6c0711"
 
-- 
2.34.1


