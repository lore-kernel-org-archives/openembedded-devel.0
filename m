Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FF3C7114C
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.77958.1749526434397322213
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bkJmlY+x;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526434; x=1781062434;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p2M4yafupy61hqUFIxye9FGmWPKJKCxLUJ6Y1KmG7EY=;
  b=bkJmlY+xG2+/OjyHpsW7y1FwISkgD2kTV5fXFtAGWc1xv+tJRVzfRk0t
   LEp+ns5QSmmu9bArn1UMXSWBS9ETRbTloMikZUOuH6OnXFdMl5w79VpXv
   ofQMWuQOgOkyqpufV814ckj6c9UFmd8Z3teoxMM+SqDp9ehiXmb2mZB0c
   CXjEDc4q8zjOC4Yco9Gj9EaKuebgnHBTI1zjbN1AB6CzxTrn8Yzucmye3
   tNOjSnReZMIfJK1oZZOcUouaVc8Nl33kF/npxIJQo6cb5oWLcHfnu3HAM
   vV8nLDICM5QChVAux+A2hqhTU0Z5jo3ST5QiNT3aStGbuHFLQOP1oeLIv
   w==;
X-CSE-ConnectionGUID: 9vrq7rq9RzC7hnawTll6Vw==
X-CSE-MsgGUID: Mk7BBsWNS/aUqAK/Ka33xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181135332"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181135332"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:53 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 26E6BE8FE0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BDC3ABF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:50 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 49B2C1A009B;
	Tue, 10 Jun 2025 11:33:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/64] python3-multidict: upgrade 6.4.3 -> 6.4.4
Date: Tue, 10 Jun 2025 11:33:11 +0800
Message-ID: <20250610033330.924-45-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117836

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-multidict_6.4.3.bb => python3-multidict_6.4.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.4.3.bb => python3-multidict_6.4.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.4.3.bb b/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-multidict_6.4.3.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
index 5b6c31568d..da8403af40 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.4.4.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
-SRCREV = "5f64e68142df6b4b3075b9df6d7b80b50e4a26eb"
+SRCREV = "e77793a006e8c27ee96ae8b638a38c6413f87b9c"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.43.0


