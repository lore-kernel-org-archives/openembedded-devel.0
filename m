Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E907AC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7734.1709714681678730278
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HE4643FS;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714681; x=1741250681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t8+WUZblxc8IF7/E3GQAT/9cisDqi82FLrWn+QkY73g=;
  b=HE4643FS6ZDwafOlsGq7GJaEtDhBkW3F5JKIiQl4XprF2ZYiSxq6O8uj
   P7h7+h1E54NSkob7JQhiWsprxwsk1/0TFO2W6oENT92LNrRO8WOW5NScy
   jgGKrtzokTvKjhrel+nJW7yC01BTNluop6jMv7Y8yrOQwsuhtBya3z+qO
   XrgptjMInElz5kzYyjhtVY+5P9phqlUJakHRE6L2SZD76DY3hYk2tenaq
   JcZlwf5Ohmd0gQRyJfr/N4dc3zc5DQhPytCC6fpAtwqsM6bBHUEDHwKUu
   WxKZoWb653RBMd8PZrZKOLTITrBV1TJOB160hltzQKBcALw+zN5aKIeuK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="130690857"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="130690857"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BA359DC13
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 944EFFD911
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CA022008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE4DB1A006A;
	Wed,  6 Mar 2024 16:44:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/26] python3-ipython: upgrade 8.21.0 -> 8.22.1
Date: Wed,  6 Mar 2024 16:43:22 +0800
Message-Id: <1709714608-19296-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--0.045600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mra9qiaDSLgo3GsuYyb68ajHw6
	H06bMgivjMviyMhatdvrKqobRGAjtcfdkIlEiI2kGqSG/c50XgMViwPKAm6hSpTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprQFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcsszxj0r6+2nxVVAbMo9FQlVi2NBeDXP6UvBL
	xiN2cxdRhj1pc0Kx0TZQX/giokpAR97aBkx7YFsfVhTsOt8VIE3oJxxSkbZg/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109160

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- More compatibility with emscripten :ghpull:'14316', :ghpull:'14318',
- Test more downstream project to avoid breakage :ghpull:'14317'
- Fix recently introduced bug with the "store" magic.
- Fix issues with multiple call to "matplotlib.pyplot.switch_backend"
- Fix crashing IPython when some tracebacks encounter dynamically evaluated
  code.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.21.0.bb => python3-ipython_8.22.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.21.0.bb => python3-ipython_8.22.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.22.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.22.1.bb
index 7f5dde768..6571eda7b 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.22.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "48fbc236fbe0e138b88773fa0437751f14c3645fb483f1d4c5dee58b37e5ce73"
+SRC_URI[sha256sum] = "39c6f9efc079fb19bfb0f17eee903978fe9a290b1b82d68196c641cecb76ea22"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.34.1


