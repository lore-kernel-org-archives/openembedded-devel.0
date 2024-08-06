Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB37C5321D
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2878.1722934011958228024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AULGnO2W;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934026; x=1754470026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f77NnrRle0Ajn9ZQMnUOVcFURHCwArUGdeT9x2Gi/sc=;
  b=AULGnO2Wn86ha25/pXSrFGJExrXtBgZoNnDva+RKG3lI3QVtdwAroFeM
   6lsSj+SKH5deq58fIGTguoGWZ7O9nZLcx9b4zm7GfC92Rg7TOcB74uiPG
   h4f266LaqHdEPLksox0tyDYqMSdv/lE3jeREM/+7Z3Z5iJ9nQA+uM+dfD
   8k4zs0hFqOKj0c6v6MHfnFJOuIJIWiev8jWQRRWYrxfxs7AXnhPzXzsTD
   6xGPZUS92kYKozMpxMdXGCIWrbdXM2n3zzvAj5cKiCPxdXeTZJ+05Ys4i
   /FrvmMCCFFxybAyOjYObkVhr7s6WesGfOLTV2VFH4A44xrvqoeUAIVX/x
   Q==;
X-CSE-ConnectionGUID: YV38OwQeSHOVAshicuHG2A==
X-CSE-MsgGUID: EfoCBbXqS8SII2hBUdykdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169971752"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169971752"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:05 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4956ED8016
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 98B87BF493
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C1F320076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE5A51A000C;
	Tue,  6 Aug 2024 16:47:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/60] python3-types-setuptools: upgrade 70.3.0.20240710 -> 71.1.0.20240726
Date: Tue,  6 Aug 2024 16:46:26 +0800
Message-Id: <1722933994-32549-52-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-2.463800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy6avPqv3X7/XOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrfjwBT0euw9l9gJQGy170lB1HECrXHWKVWS8UB8vJrsi+tYvzj1hyMjkoH
	6mgVTbl40/wgXR31OaUVKLcWxCb0ZFvtSs9aiQ0x0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111566

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....20240710.bb => python3-types-setuptools_71.1.0.20240726.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_70.3.0.20240710.bb => python3-types-setuptools_71.1.0.20240726.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_70.3.0.20240710.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_71.1.0.20240726.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_70.3.0.20240710.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_71.1.0.20240726.bb
index b461e7445..ace198d04 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_70.3.0.20240710.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_71.1.0.20240726.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "842cbf399812d2b65042c9d6ff35113bbf282dee38794779aa1f94e597bafc35"
+SRC_URI[sha256sum] = "85ba28e9461bb1be86ebba4db0f1c2408f2b11115b1966334ea9dc464e29303e"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


