Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4013D116FE
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:19 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4296.1764669129982086809
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JWk3EGYv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669135; x=1796205135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=530AtPhsirrZTG06AK0Kvd2xieqxnjLrUrdndO+GUz4=;
  b=JWk3EGYvnHMgLu9XdLJh2vjHPjTOL9qMRuuoKbT38wZV9o1Hd91czJZv
   +hfz2HsvwZCWtm+kX5HgNWwq9F0FcJ9iiBP/CXCw42jG/FHPY5Jg1PdNt
   1sOZy2jsgec8CTNoY8/mxcNNF7ZUGDjtOU0Se+ztU0S7QhNp6KlYFTGaF
   YP+2eciFekXwVifKojHOwwYXPpD1ONo0ciO9MOuclZQG1LSNe3AhBw4O0
   QS71nsxELqc/97yYRUKHC3xzcrUdSqOnx7rhkH9D1hx16RqpaVgCqvR4+
   ZUTkRbnhUvoiI3UemjjcDgyBIszycxbEsK2HBvEbKVpsI8ccROkch4/Dw
   Q==;
X-CSE-ConnectionGUID: cY/x3vlFRYaOf5K6Lp5rYQ==
X-CSE-MsgGUID: aKkmDdzYRt2zIwjgVjSTMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="225034835"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="225034835"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:14 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 6219E1574
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:13 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 18AD81800EAD
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id AB75E101A432;
	Tue,  2 Dec 2025 09:52:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/25] python3-pymodbus: upgrade 3.11.3 -> 3.11.4
Date: Tue,  2 Dec 2025 17:51:25 +0800
Message-ID: <20251202095132.652-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122251

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 full support for python 3.14 and a number of packages (like mypy) have been updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.11.3.bb => python3-pymodbus_3.11.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.11.3.bb => python3-pymodbus_3.11.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.3.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.11.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.11.3.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.11.4.bb
index c7dbcb1ce8..6d961fda1a 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.11.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "10c2902838ad5a233baefb64b1c1fb064fa762b22b221bf35191bf39f01449a8"
+SRC_URI[sha256sum] = "6910e385cb6b2f983cd457e9ecee2ff580dbb23cf3d84aefec0845e71edd606a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


