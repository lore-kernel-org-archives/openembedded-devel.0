Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FACE77193
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.30369.1735032451362737997
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U1ip1Hm3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032452; x=1766568452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=c8rigsy5uCVJ8o97cwzzkGP2QPBts47fqJ2sjOveKQc=;
  b=U1ip1Hm39WUIKa6TfhaWiKXomdaLfo81+XNj4LYUdanbwRr6tvAnlkFq
   oWDLdUC/COPumKR+kUqBEXsToWRDvIPJtVvKiJ5tDfcYjK2GZtnem8KYd
   QC9cIQiv5RHWTeTAFD88Dy6UfYT34/qmwnlTC1wZjhf5RnRWCprs6Tpk1
   31SXf7buMGTNxeLhJaP7iDhVKBr87w4GCy94wO0dR+AfXubJGy3hOVCAG
   ge41mojNNh5fR7r/ZdClWF3X6EHDS50QITLypcES8bQUvW2E1dKiU2zcI
   oUnBZGvGbzZ6rs7BiRtjGTHmmBncJbdcu+9qdWlKjmoVdNAxlyBtwWqd/
   Q==;
X-CSE-ConnectionGUID: mXO3cVFSRACexEmCNCoVwg==
X-CSE-MsgGUID: h/Kpnh5LRl+qJNVjW31U7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="187212828"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="187212828"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3310ED6EA7
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0AE33D5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9983420071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42C1A1A006C;
	Tue, 24 Dec 2024 17:27:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 63/67] python3-wtforms: upgrade 3.1.2 -> 3.2.1
Date: Tue, 24 Dec 2024 17:26:57 +0800
Message-Id: <1735032421-13513-63-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.480100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mr9KNfMK9+36/LEBZoZNUobmtr
	6WeUiwRmmSh6ivEJiyXzslOXY3oDJDbcsMCH+ZLFWTWEh5N2a9GycrvYxo9Kp+ZYcdJgScjxzws
	ZM0WpYprgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq5pEX
	AOzwbtMeLzNWBegCW2wgn7iDBesS3fd+P6wwCt85Rncg/kBNofwhZvuBlrcFP1+nQIgT8xgkiyv
	+jh+eSCrDJSIA0mKNRAYFXIDPXWJbgp+wmXWy/IMdnUkcKLuGC3f23JqDf0THC00QSEfR/8/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114533

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Translations update: korean, chinese (traditional), portugese, russian,
  dutch, kazakh, swedish, turkish, slovak, ukranian, spanish, french.
- Move the repository to the pallets-eco organization.
- Stop supporting Python 3.9 and start supporting Python 3.13
- Removed required flag support from HiddenWidget,RangeWidget and SelectWidget to
  conform to W3C
- NoneOf and AnyOf can validate multiple valued fields like SelectMultipleField
- Use GHA and pre-commit workflows inspired from Flask.
- Fix SelectMultipleBase import.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wtforms_3.1.2.bb => python3-wtforms_3.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_3.1.2.bb => python3-wtforms_3.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_3.2.1.bb
index fa54282152..f7cbff2f4e 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.2.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=17ed54aa95f4a6cd0d7a4747d14b64d0"
 
-SRC_URI[sha256sum] = "f8d76180d7239c94c6322f7990ae1216dae3659b7aa1cee94b6318bdffb474b9"
+SRC_URI[sha256sum] = "df3e6b70f3192e92623128123ec8dca3067df9cfadd43d59681e210cfb8d4682"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


