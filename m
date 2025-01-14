Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AD2C0218C
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.40067.1736843352103773249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QLgSGDpO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843356; x=1768379356;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sbjxBINYSUFeVhBYZ4XNhbKMJsAiAL7sFLtfPT0TEyA=;
  b=QLgSGDpOwkjutEeLTP9bgMyHNKn/yUMxQn3/7o1AR3yaTpEM97cAIUFT
   +nZHy6fSjnfAkmvyZAjqZ0cP84r6/qE2Y8/U45wHx2OeCvtY8tXhGYXYx
   1REaXcVusfZg3wnXnj1cr+nf/LkkWnzMmrcIoTzmbSr9SwV7OoSjDbAuI
   wHiobZpA7yoF99gaOHQ8TNLF+s83I9TMAV6Zu0HF0WOAZ56fThEwvGvk7
   GFtpXHl8Ddd0MZNv/x2/zKJRbb2qa8MeHSxBRBVcbp+EEtoxq/DSxFfd0
   zoguacpTarMbbl4e4YC0Eevcy1chzGn4CyoQiLjQvYf+117/DlxEhG6Pb
   Q==;
X-CSE-ConnectionGUID: ta9vKmJQQ6uyPsJjlFmNsw==
X-CSE-MsgGUID: VuJt05WWSvWCwc9Ypa/77w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="174471885"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="174471885"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:15 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A0BCDE67B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F171BF4BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 929FC20074739
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:12 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 41E1F1A000B;
	Tue, 14 Jan 2025 16:29:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/30] python3-sqlalchemy: upgrade 2.0.36 -> 2.0.37
Date: Tue, 14 Jan 2025 16:28:43 +0800
Message-Id: <1736843329-4131-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--0.485800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSDVjNsehGf0ven7
	ya/+V5vjMzTo2qNcI5YNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3i4Jg
	4IB24UOj/KVtfZiSDpoNFhuChNKBZeBzEkCCpnRmeAiCmPx4NwJuJ+Pb8n/VxLzP5snaeb1Qqtq
	5d3cxkNT9FMMFmEfceH6yj/ezhLmeXcUp/a5L+WZrsfFaMAPswhW9cVlvkIsACxIuY/9KUi0ILZ
	BB+ILOWjskdCKascIVjsbh53Rb+pPK+uO+faAFZU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.37

License-Update: Copyright year updated to 2025.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-sqlalchemy_2.0.36.bb => python3-sqlalchemy_2.0.37.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.36.bb => python3-sqlalchemy_2.0.37.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.36.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.37.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.36.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.37.bb
index 058d90bbef..fdaf5f7d91 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.36.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.37.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
-SRC_URI[sha256sum] = "7f2767680b6d2398aea7082e45a774b2b0767b5c8d8ffb9c8b683088ea9b29c5"
+SRC_URI[sha256sum] = "12b28d99a9c14eaf4055810df1001557176716de0167b91026e648e65229bffb"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


