Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605F3C54733
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2880.1722934012727295909
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N1EMh6FU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934021; x=1754470021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/i1cjVEiTMJ+JHq6LTSG6Dt3jvYehIdLt7bLY2scgW0=;
  b=N1EMh6FUs4EH7jtdh7k+OZ6VGs6nF/miSDzbyN4Y2j0eiGKJXqk7zXAw
   cafTxDk1KxxDIXWUz5OP0PcGQU070VvSDJtAXVLTlz4R3TeBiI64Gtjgn
   wKwbxb1sd95E1aMMMz45Xo24eYorX+spRgx7pWQo3aGQO05vWGloWHdxh
   Wsu2U+lzu4sk3lESNJXdW0Wqq3lqu1r4LlCUI08UlEO1TiRIvI+sB/ukh
   JiOGH2H20O1h4XlMEoqgtaz9rF/vPTR8cCbfFyF5sLK/xecIvTw4DMy8p
   KwuTnk7mjpsJGZuhy+duUEpku58zMSsak9goXo+IkyeBHxT30XDo5NHiD
   w==;
X-CSE-ConnectionGUID: e8HLo0vZSa+2HGz2rwiVDA==
X-CSE-MsgGUID: tGO8xEUmSGS71ABX9HuvzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169882454"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169882454"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0440D64C6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AC9BD4C3B
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B875820050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6683C1A0002;
	Tue,  6 Aug 2024 16:46:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/60] python3-a2wsgi: upgrade 1.10.6 -> 1.10.7
Date: Tue,  6 Aug 2024 16:46:06 +0800
Message-Id: <1722933994-32549-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDUc+LRf7A1ObzAugdflTp1/ob7lYwmlEQv6goe+7gR8nyykhc3yYtvjpidg3DDk3ZsnOZ
	28/y592wNRgiG3EB2qQPXgneCizJPyvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111546

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-a2wsgi_1.10.6.bb => python3-a2wsgi_1.10.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-a2wsgi_1.10.6.bb => python3-a2wsgi_1.10.7.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.6.bb b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-a2wsgi_1.10.6.bb
rename to meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb
index 445cc5a73..e65519ec3 100644
--- a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.6.bb
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e10d05d29ec6d8be8bfc503683f1bc9a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-SRC_URI[sha256sum] = "6e5e859623c8b62e6570b9082bbc1e714f78d7c3f7844847be8b666037c6d94c"
+SRC_URI[sha256sum] = "ce462ff7e1daac0bc57183c6f800f09a71c2a7a98ddd5cdeca149e3eabf3338e"
 
 DEPENDS += " \
         python3-pdm-native \
-- 
2.34.1


