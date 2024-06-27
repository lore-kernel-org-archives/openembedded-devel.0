Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F92BC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 09:08:02 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.3778.1719479279909665396
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 02:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KLVn2Q1f;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719479280; x=1751015280;
  h=from:to:cc:subject:date:message-id;
  bh=WJbDuiZCrYMljYm+Nb6X28miAQnIBdqCINtZGO6ieiI=;
  b=KLVn2Q1fi5E2EflZdAMZRAnlfQDHu1zHnk3+1mGcEfBMYQ5QQ1ebHH1+
   79ak+6FBWIJQym2z0ub+O8W73ox1TKvqUc1XiUTFHlu+wunu5gNsLVW4p
   Rt3K2i6Mt9RT8KPLBt1Sms0YeKqvw0KznwhSSgOuoHED+rLknf6GKeFmW
   cxtJSV+6m55XA15u4ehvFCwy+beLKey94UzoVS+SsAQv8qC8VNuiUFc5x
   ZhgTw/y9AAnMc/g1A61A/V9NJjdActf8Ihw6ASwHNRSg6wAcaEFbO/XEx
   UdFW1oHMZzlAp3UdAiaiVsBUJPHSMHfhdxeeBXUCvRhI6TW+mnI8ifSef
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="165095499"
X-IronPort-AV: E=Sophos;i="6.08,269,1712588400"; 
   d="scan'208";a="165095499"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 18:07:57 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D7C2DD5A47
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 18:07:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F84BD0AC9
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 18:07:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F2472007FAEF
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 18:07:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2851C1A0002;
	Thu, 27 Jun 2024 17:07:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 1/2] sblim-sfcc: fix build failure with gcc-14
Date: Thu, 27 Jun 2024 17:07:48 +0800
Message-Id: <1719479269-11512-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28484.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28484.006
X-TMASE-Result: 10--5.762200-10.000000
X-TMASE-MatchedRID: e52ZkoJcYPYs0w7LCKZc9jo39wOA02LhCZa9cSpBObm+f7ap9DJaDe79
	DJRUi35pWwhqFGcExMuaernOJKdgiK/Elphzpf1LEXjPIvKd74BSuvtBzlaEqDUvQN19brjgZng
	ixNorteD4XJPAGTaiPNEqY6Wu67POIyXWEI5lke2zRPQ8T4oe5fambF/lwyYQWnq/tYmiZBDDMi
	e/nY78fR8sC277STHTH6FmqkQO4spTqTvkr4no8CsIuzCLc2mNZUc2QJCkRg3GsuYyb68ajNzRL
	TWypO1xGkCSv90XSDWAMuqetGVetr9k4V4N5ceA3QfwsVk0UbtuRXh7bFKB7oyk20IqTPXseE/h
	i97MBuRh1awkNumtWNTspLhf3mBwHIV02d1rpG8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 09:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111121

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-pointer-type-error-with-gcc-option.patch | 72 +++++++++++++++++++
 .../sblim-sfcc/sblim-sfcc_2.2.8.bb            |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
new file mode 100644
index 000000000..5e8f4fa0d
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
@@ -0,0 +1,72 @@
+From 5151163d6f4d4de0699d1e85c54fbe2cb5b55460 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 27 Jun 2024 01:51:36 +0000
+Subject: Fix incompatible pointer type error with gcc option 
+ -Wincompatible-pointer-types
+
+| ../../sblim-sfcc-2.2.8/TEST/v2test_ec.c: In function 'main':
+| ../../sblim-sfcc-2.2.8/TEST/v2test_ec.c:86:31: error: passing argument 1 of 'showClass' from incompatible pointer type [-Wincompatible-pointer-types]
+|    86 |           showClass(data.value.cls);
+|       |                     ~~~~~~~~~~^~~~
+|       |                               |
+|       |                               CIMCClass * {aka struct _CIMCClass *}
+| In file included from ../../sblim-sfcc-2.2.8/TEST/v2test_ec.c:7:
+| ../../sblim-sfcc-2.2.8/TEST/show.h:9:34: note: expected 'CMPIConstClass *' {aka 'struct _CMPIConstClass *'} but argument is of type 'CIMCClass *' {aka 'struct _CIMCClass *'}
+|     9 | void showClass( CMPIConstClass * in_class );
+|       |                 ~~~~~~~~~~~~~~~~~^~~~~~~~
+
+| ../../sblim-sfcc-2.2.8/TEST/v2test_ein.c: In function 'main':
+| ../../sblim-sfcc-2.2.8/TEST/v2test_ein.c:96:36: error: passing argument 1 of 'showObjectPath' from incompatible pointer type [-Wincompatible-pointer-types]
+|    96 |           showObjectPath(data.value.ref);
+|       |                          ~~~~~~~~~~^~~~
+|       |                                    |
+|       |                                    CIMCObjectPath * {aka struct _CIMCObjectPath *}
+| In file included from ../../sblim-sfcc-2.2.8/TEST/v2test_ein.c:7:
+| ../../sblim-sfcc-2.2.8/TEST/show.h:7:39: note: expected 'CMPIObjectPath *' {aka 'struct _CMPIObjectPath *'} but argument is of type 'CIMCObjectPath *' {aka 'struct _CIMCObjectPath *'}
+|     7 | void showObjectPath( CMPIObjectPath * objectpath );
+|       |                      ~~~~~~~~~~~~~~~~~^~~~~~~~~~
+| make[2]: *** [Makefile:1110: v2test_ein.o] Error 1
+| make[2]: *** Waiting for unfinished jobs....
+| ../../sblim-sfcc-2.2.8/TEST/v2test_im.c: In function 'main':
+| ../../sblim-sfcc-2.2.8/TEST/v2test_im.c:82:40: warning: '%s' directive argument is null [-Wformat-overflow=]
+|    82 |     printf( "invokeMethod() rc=%d, msg=%s\n",
+|       |                                        ^~
+
+Upstream-Status: Backport
+[https://github.com/kkaempf/sblim-sfcc/commit/881fccbaf19e26cbef3da1bebe2b42b3a9de1147#diff-ad9eeee99837ead0f29c70cd5f3956178dc3d51bd79618affd53d72a31404d5f]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ TEST/v2test_ec.c  | 2 +-
+ TEST/v2test_ein.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/TEST/v2test_ec.c b/TEST/v2test_ec.c
+index 940ca57..72a93a5 100644
+--- a/TEST/v2test_ec.c
++++ b/TEST/v2test_ec.c
+@@ -83,7 +83,7 @@ int main()
+        count = enm->ft->hasNext(enm, NULL) ;
+        while (count > 0) {
+           data = enm->ft->getNext(enm, NULL);
+-          showClass(data.value.cls);          
++          showClass((CMPIConstClass *)data.value.cls);          
+           /*
+            * see if we have any more
+            */
+diff --git a/TEST/v2test_ein.c b/TEST/v2test_ein.c
+index ede95c1..c9d1152 100644
+--- a/TEST/v2test_ein.c
++++ b/TEST/v2test_ein.c
+@@ -93,7 +93,7 @@ int count = 0;
+        	  
+           data = enm->ft->getNext(enm, NULL);
+ 
+-          showObjectPath(data.value.ref);
++          showObjectPath((CMPIObjectPath *)data.value.ref);
+           /*
+            * see if we have any more
+            */
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index c9d3ddd6b..7d5e1c4c2 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -5,6 +5,7 @@ HOMEPAGE = "http://www.sblim.org"
 SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-cimxml-Include-sys-select.h-for-fd_set.patch \
            file://0001-Fix-implicit-function-declarations.patch \
+           file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch \
            "
 
 SRC_URI[md5sum] = "0bac0dec19f17ec065b6c332a56d7bae"
-- 
2.34.1


