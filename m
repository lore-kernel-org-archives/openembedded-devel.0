Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499E3CF64A3
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.48964.1727682244698533539
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K984lSBr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682245; x=1759218245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pDS2s9O7StcXutCjtGJAq1KR6l9Ayww4HO1Mip7Emm4=;
  b=K984lSBreOTuTKYKymMeuzWY1AMpnVtADIiMgr9FVLK7F47sfOvQqAjF
   U96cciNn5X2ZgX01tOk/koAaxR/Xn2D/sKkQvc/jWTeuKp44oaPY4Jal0
   Pbzrc/5Z0HvB2aVWnkaQ0wn7wJsKkKyZ8h+rR6SEHanxQdam1RCJKGM2Z
   cF5+GioTjB71KNGP9bCPfxFktib3LCJOLg7+StkoUx5eO0UB9FOI/Oz6G
   lTM+t0miGD8r1lm7dwh4Iq8kZzKTdyK00Nvq/uIBQK2cTb8oBMQ+Yr8zZ
   zOZm2pm/cc5lcNfpJaqz6G3jeRbpYUklPoHDvyev32Z0K80gJovUOEc3u
   g==;
X-CSE-ConnectionGUID: czdfUPd2TiOpQYQ384cDrw==
X-CSE-MsgGUID: ka8ycfIvSeyd7ePVg6He0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175268024"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175268024"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:44:02 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 89FC6D8014
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CFFB1D7726
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68CC42007B716
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1B5CA1A000A;
	Mon, 30 Sep 2024 15:43:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/40] python3-thrift: upgrade 0.20.0 -> 0.21.0
Date: Mon, 30 Sep 2024 15:42:57 +0800
Message-Id: <1727682185-12664-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-0.435700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSA6HV5wETgDxb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uYMNZlevXKUzaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFLzoXijh4ubPWRGHewRhzkAb2u
	HqIKJMSl8qZX5W5obCSsXzOnjgP4oDGXizRzzES5Xu78/AVM9tMGRfLcpvs6z5/hQG07Advux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112592

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/apache/thrift/blob/master/CHANGES.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-thrift_0.20.0.bb => python3-thrift_0.21.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-thrift/{python3-thrift_0.20.0.bb => python3-thrift_0.21.0.bb} (85%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.20.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.21.0.bb
similarity index 85%
rename from meta-python/recipes-connectivity/python-thrift/python3-thrift_0.20.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python3-thrift_0.21.0.bb
index 6a0a66aef..6a22f2170 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.20.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.21.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
-SRC_URI[sha256sum] = "4dd662eadf6b8aebe8a41729527bd69adf6ceaa2a8681cbef64d1273b3e8feba"
+SRC_URI[sha256sum] = "5e6f7c50f936ebfa23e924229afc95eb219f8c8e5a83202dd4a391244803e402"
 
 inherit pypi setuptools3
 
-- 
2.34.1


