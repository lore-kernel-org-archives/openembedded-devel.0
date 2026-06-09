Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AE6CD8CBD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:12 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76246.1781000999797312638
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j/pS2Gcd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001005; x=1812537005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cPUBSlPRhM7B96woHbSJPoyJjQIlZua9rFl9s71porQ=;
  b=j/pS2GcdW9cTgbbGdy2PUAJ4x/AFQs6EJYzmC+PHSm42bcXhNGoa2XUt
   pMfdvXc9bA5XJzR+RpZz7Nswj0w6DoZB+q2cbg124EySV6ffitIMzRyId
   uP806Au54HUA6EDDYsTt8bsiJAiy9g5mAWBwnHnROVjtsrt4bS2RPkdV/
   27+OJKR43VzKxTSehDLnyLDmjngttrXgHO1pOis5ZSWB3QC9yBkf+Fyy0
   KbAmNwBDNGAeCvoLzqEJDuHq8xayd94QxTh7+6a1IG7FiZluKcLXWIH/X
   P6sn5a5fcz+JEkbcVXjsJGFVyv606L9R/AdnUE/ugttP/JEB74tAOK21d
   A==;
X-CSE-ConnectionGUID: GnTKEdLGTfSTAbGApOufGg==
X-CSE-MsgGUID: YUR8V+x4RUOJFK0An7VZrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="230895887"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="230895887"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:04 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 840151C1C72F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:04 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3A8AC968455
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 59D8E10003CE;
	Tue,  9 Jun 2026 10:30:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/30] python3-ipython: upgrade 9.14.0 -> 9.14.1
Date: Tue,  9 Jun 2026 18:29:03 +0800
Message-ID: <20260609102913.2204-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127474

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.14.0.bb => python3-ipython_9.14.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.14.0.bb => python3-ipython_9.14.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.14.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.14.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.14.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.14.1.bb
index bca4d9febe..044e284f37 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "6f27ff0f1d9ea050e0551f71568bc4b34d8aba579e8f111c5b4175f44ac6b4aa"
+SRC_URI[sha256sum] = "f913bf74df06d458e46ced84ca506c23797590d594b236fe60b14df213291e7b"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


