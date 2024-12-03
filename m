Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81876E69EA5
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.8201.1733185013588391052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g7UeYm3w;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185018; x=1764721018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=avI5WSemWJzZXRJWKTwX7T6nKaJDhLi5i7wqEMiCP4I=;
  b=g7UeYm3w/ThTbsNnK6KE2wKxLT/tcXrDw9GSgwF11XPvm1+y4598hVpA
   N70fdVwr0TONL0x9+gY87dSVja9KNC6pr0yCYNK+Z0J0XCWuG8bGCAgKL
   RaIV80jRnGFezrKc0m/5QQ8Yj7WWvXRTLHVvCpfM8mF4Ss1sIOvAv+F8F
   KsmNpcUdZ5aJtUUnwoJShBsTrw0vRwFM4o65POgHULkKlamDTENOWr2QZ
   1vqH2tSnZlZeanICe8dcRgCEvchoU7Els3FDbWgbOWtxZ/P8jzcgZwZJd
   Mkh4hiEREw7Gjzn5zinQY35pJ1CXJEa22j/4XAL403wF2NoNNrr7GA1JP
   Q==;
X-CSE-ConnectionGUID: b8KXqYYPSHeZe23S7Iwyog==
X-CSE-MsgGUID: yihbYj2SR6yRbLJo78xR2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182588491"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182588491"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1816EE60A5
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DF247D4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A0F76CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1AE581A0071;
	Tue,  3 Dec 2024 08:16:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/34] python3-asttokens: upgrade 2.4.1 -> 3.0.0
Date: Tue,  3 Dec 2024 08:16:19 +0800
Message-Id: <1733184999-27041-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: N88p3DLIqpCjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJXW6gM8Ys8CB8TzIzimOwP/hxxPCwzUoPEQdG7H66TyHEqm8QYBtMOWb8
	w2Z+4I78+frwmzmG/0kyg8ceX6kY2FBdKQnO+znvUFZAvsWVASeuLcnn8bk2/GgLkS/3mRg9hpw
	pp/KlgGDkz8Imn4S9Rgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114156

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-asttokens_2.4.1.bb => python3-asttokens_3.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.4.1.bb => python3-asttokens_3.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb b/meta-python/recipes-devtools/python/python3-asttokens_3.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_3.0.0.bb
index dbb2fc0ebe..16256535de 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_3.0.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b03869718ba9a6eb027e134bfdf69f38a236d681c83c160d510768af11254ba0"
+SRC_URI[sha256sum] = "0dcd8baa8d62b0c1d118b399b2ddba3c4aff271d0d7a9e0d4c1681c79035bbc7"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


