Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A03EC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.49377.1753918173711608602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kFPBmdi4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918173; x=1785454173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O3IxJ+RxQ4h9RfQLu+ywHXAozUPn4GlhyCYv78p3zA0=;
  b=kFPBmdi4U3DMjShZFVooDi7FUOpV0TNQD7aUOWENWoN03MzBJ6uBh0Nm
   KAQLFeDXXqPA+Cin2r+SEnirJZuy4STotYVolqNFPNTwQdCFFo5toPKPd
   GuA3HbR/PJJJaOKiCIk+P2sBcvYRcK2SIq4MhyKBLTsI+uhLyzIekQGZU
   3tzoUmDj+B4ghR4ZgoYhGNsdsjpn7LwbXIELYJ/X7WcHDshqWWjAxtftO
   XCcNB7Kb2EwPdQ6Fkbobih8qT0HR2D+Sy6Z7nauAljr4quOByJuX8ATqH
   ZrzD0pPqKMe9V4jeP/RtZFmFdfJcxhEzhz/tyrSg+LMCg+AYR2AMo9YPZ
   Q==;
X-CSE-ConnectionGUID: sp5iE5VQTpC6Bo1QInQQ/g==
X-CSE-MsgGUID: vERkgCvLRxijIzS7ZWoKAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="207978896"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="207978896"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:31 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9C282820703
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 069211806318
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B74951A0078;
	Thu, 31 Jul 2025 07:29:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/40] python3-moteus: upgrade 0.3.89 -> 0.3.90
Date: Thu, 31 Jul 2025 07:29:13 +0800
Message-ID: <20250730232923.522-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118804

From: Wang Mingyu <wangmy@fujitsu.com>

git shortlog of the moteus python library [1] for the corresponding release:

- For dual encoder configurations, set the output low pass filter too
- Improve hall effect performance
- Fix the encoder filter frequency to actually be the 3dB cutoff
- Set python unit tests as small size so they run by default
- Remove moteus_tool --restore-cal
- lib: python: moteus: moteus_tool: add no-verify option

[1] https://github.com/mjbots/moteus/commits/main/lib/python

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.89.bb => python3-moteus_0.3.90.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.89.bb => python3-moteus_0.3.90.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.90.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.90.bb
index 5467293ff8..6bc49bdcb0 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.89.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.90.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "78ed04c213e20b44c81b73e2b66f5a7e45339014cc3fdaf94c4fcc875d35402a"
+SRC_URI[sha256sum] = "13d31a485c3082e36e385c570379f13d267c93501baaf5395bd1e7e7286e7a13"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


