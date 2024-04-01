Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F62CD12A4
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.39485.1711983105434290641
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RlBvdYQR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983105; x=1743519105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sb04oK+Hd6GzzVZKoevSwvbN6x1w00/f3D+HGtK6Ukc=;
  b=RlBvdYQR/QOtEoAOEITxcydZ3C/geQHddQLO3QAsfD+KzB1QyuL7BLEI
   54gf5OkGAPHvJIEsSnefEt/BL7bGUPZaW3CViFzFfCtbRGglAQs2jRJfG
   LBccqOWb/ifPZTRcTR7mCONDsbdaVsKrb7/8QSjTvSV1Oq+lSdtsL91Nl
   q3lV/N6LWn58VvRJLrTqxZP7LvloREzsKfhk8vplnmE+u1R8rMmvR4Cau
   hZgn6gMg9eBDy7eup9Ncst2yNp+Oi9J1LfamcHD+C2wPYRfDtrE84tS9o
   +WX8ZlmjWfysblsdvvPP9zeQNFZBG4Na3pDm60vz5lSpUj9Lcjwgf1uBA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="142245643"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="142245643"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:43 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B8625AF72
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 49B7EC520A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D2D8021EEEF
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 89A531A000A;
	Mon,  1 Apr 2024 22:51:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/47] python3-pywbem: upgrade 1.6.2 -> 1.6.3
Date: Mon,  1 Apr 2024 22:51:04 +0800
Message-Id: <1711983079-16849-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--1.954900-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhYC5LPd7BvbQwb
	B6fWQkqsbYrLH2KRF5GGnd3eINHu2GtU7eMET1WtPKN38CLPK0GZmLDnd2pI30jINjnv2/BMB82
	GyGpZHXsk5bb+bpOTHSZAMkTWXOgoHsYi+P4ETTUD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whhnLZrdrkdgaW9OepgphdNGVeAZ5VSHdZ2bKItl61J/yfJvo
	cwUrWp7JMHEoA1T0L4LbigRnpKlKZx+7GyJjhAUdD/H2vTxBlJRK2YEHnmmnUW7rfviFQQwKAij
	TqzA1K82VYWeS6u3EJ36OKI4x9swaczKY+SzLOPVZ9XzQCYOOWBDhRbEblDf7H2fVekOqwmYL1K
	ImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109748

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fixed new Pylint issue for unused variable 'exp_result'
-Fixed use of pytest.warns(None)
-Fixed pkgutil install issue on Python 3.12
-Test: Upgraded GitHub Actions plugins to use node.js 20
-Fixed call to pipdeptree
-Added Python 3.6 / Windows / latest to normal tests
-Pinned lxml to <4.9.4 on Python 3.5 on Windows
-Added RTD default config file (#3083)
-Split safety into separate make target and moved to end of test
-Disable cyclic-import issue.
-Update .safety_policy, dev-ramts, minimum_constraints.txt files.
-Test: Circumvented a pip-check-reqs issue by excluding its version 2.5.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pywbem/{python3-pywbem_1.6.2.bb => python3-pywbem_1.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.6.2.bb => python3-pywbem_1.6.3.bb} (94%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.2.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.3.bb
similarity index 94%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.6.2.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.6.3.bb
index f607de779..7d1ff2858 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.2.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.3.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "26e8179bc17e3176b4cd576b9f5a7730f848d51be0513768fd7f31fd9b270a96"
+SRC_URI[sha256sum] = "78df30dee98c508620b599b8951f322a81c6c0a9d7b78ffe5e017b9417cd97b9"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.34.1


