Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E03C3065A
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 03:19:43 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.9063.1719544779386667576
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 20:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lo+Dafur;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719544779; x=1751080779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7MrHwMtCiRmc63oOtEfW7c+V+WKuo0gxF0wqXkac178=;
  b=lo+DafursU53WFbyhBDI+r94QaUazzbMOfX4Dh4hMUP88V0c0oNlJ4bm
   +EFkqCYaUkXlW/gsrMJ9v+GfKPaP65I7DwFeADudzXD+sWBnc5lhf3MDZ
   lWQ4YJaObhKuon3f93osFbZbCGfrbkj25+6tKjLvn1NUKKOouxy+03zYX
   Uqf2zhgdqOrL+HX0A7D/JuHMQV63bT0K/dkMWle/aOnnW+qqI0cI42zc8
   v4keOb6Ltb5Bun5NLUbtyuLjvM0idWzXklTb0vhLSDU1k56jE460uvXlF
   T0ZQh0yBxl1qCqPgu5Kf617XACcBpGp5pstC0ehWqxJxMYbPLpwmOgz9M
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="144665386"
X-IronPort-AV: E=Sophos;i="6.09,167,1716217200"; 
   d="scan'208";a="144665386"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 12:19:37 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4283FCA1E6
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C785D53E4
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2121D2007CDE9
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C5A751A0002;
	Fri, 28 Jun 2024 11:19:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 3/4] mcpp: fix build failure with gcc-14
Date: Fri, 28 Jun 2024 11:19:26 +0800
Message-Id: <1719544767-17994-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com>
References: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28486.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28486.004
X-TMASE-Result: 10-1.814300-10.000000
X-TMASE-MatchedRID: VeGrP/UIbZxaQiLka9EcSk7nLUqYrlslFIuBIWrdOePfUZT83lbkEIM+
	DFf1tQVd4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8hxKpvEGAbTDtI5Djiy4pIPt2j
	vl8ZypVnq1z9tQTpVJ9wGWBI8WxHnrm4vH5MXLd/MqkwjGzLuIj2ODW2J8Ed2/wl7ryztWcIWeT
	jmKtKfyoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 03:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111136

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
index 944585673..f34115c3f 100644
--- a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
+++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
@@ -10,6 +10,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05"
 SRC_URI[sha256sum] = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
 
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 inherit autotools
 
 EXTRA_OECONF = " --enable-mcpplib "
-- 
2.34.1


