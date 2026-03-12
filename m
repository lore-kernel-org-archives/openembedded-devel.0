Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D394E105A566
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18775.1773312828983263685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DZDWhoJL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312828; x=1804848828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eBNONLDEm8WJ+o01RYYLC6ckzN7Az6O4MBe2hi4BoUc=;
  b=DZDWhoJLQPmgW8XGG5JOmJte816KgQ3r0BS1vcC22cRayFLy5J1x7nuB
   jIaEcDbUXQc9QVzXay2fA0xIZPaHn3S0/334pZTCixLqCRMec7SbW2Nig
   leJsHfxyiOD0OrE1etYCDl7XzczKfQ8DiruU8rv4FopyvJwB/IfC2Adyr
   DltixTYnBDN/lCCqdTXZDgybvRy0EwZKzwniFyQKeI6e+8Jd/Pt3u5sAc
   Nviy1X+v/VOSnINwQt02V1PWHM44zPqm5IbfmEfW7Lxm1hiLuKV3Aejx1
   6Z+BBktoSSyjSd+RwigYHQnH5dhBj6lwELKBNMe9RXltrzj9MCKXw3D/w
   Q==;
X-CSE-ConnectionGUID: ftN0ZNpnQoauoxIbNXdd/w==
X-CSE-MsgGUID: gaZiYBWYSzKVJK8+cxc3sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="237281278"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="237281278"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:47 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 908EC1C1C708
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:47 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 42C5A8D65DF
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 50C2418029A4;
	Thu, 12 Mar 2026 10:53:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/64] python3-ipython: upgrade 9.10.0 -> 9.11.0
Date: Thu, 12 Mar 2026 18:51:54 +0800
Message-ID: <20260312105220.1856-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125138

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.10.0.bb => python3-ipython_9.11.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.10.0.bb => python3-ipython_9.11.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.10.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.11.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.10.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.11.0.bb
index 9b9c6ce34a..3db3763f3e 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "cd9e656be97618a0676d058134cd44e6dc7012c0e5cb36a9ce96a8c904adaf77"
+SRC_URI[sha256sum] = "2a94bc4406b22ecc7e4cb95b98450f3ea493a76bec8896cda11b78d7752a6667"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


