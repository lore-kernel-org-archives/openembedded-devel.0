Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2583BC54750
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8717.1724833536738925702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fra8lMOb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833537; x=1756369537;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=St/5pNzqkiw54M9QMoCWVKa+Loh3rC11uAg9DGCkvj8=;
  b=Fra8lMObYpdTiHT//Oj7aRUMs2jw98/g+owM2Etg8lnBNXx5/T5h/rsX
   4mzUtHKbdNTdYGe0QsQPRq58zdEr6hDGO9plccp51lnTX+TgII3f/dDcP
   0M4p7mluU33ae1YH7n1ABXbN+0U1OOZ6Dg+FBEqJgblrT7ag3qsbMS5HR
   UVvBxNNKAGLgu0DTjHvaGd5j9mDamndEgK+Qmw7GI6hnwleX4IaIH0k+o
   3p2ozp9XccBAaKXChbiOkL+7LEJIoPV0hmoYpE9LNr94hL42/vLpPMe+I
   sjxfnRCBUBaBk4IqVA8KtzDyDa7PaxGw7fPW34ZjRLyEHpR1p5JYnv7EX
   A==;
X-CSE-ConnectionGUID: Ox9HtPgBQ6Cov+CN7J7W2w==
X-CSE-MsgGUID: DegwpkF5RUiRe7wrcnXO+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171131365"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171131365"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C5EE1C9323
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1678A13F45
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A9D46BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 467C11A0002;
	Wed, 28 Aug 2024 16:25:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/46] ctags: upgrade 6.1.20240804.0 -> 6.1.20240825.0
Date: Wed, 28 Aug 2024 16:24:41 +0800
Message-Id: <1724833525-2162-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQKgbFDL87a+2Imldww/ruBWSqr9ihthjmsE/chzpKkLmGkQxmOrgWpK2B
	v1XBU22KRGct4YHgTOFlhYJ9ZfebMSSzwmimJVeh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111980

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240804.0.bb => ctags_6.1.20240825.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240804.0.bb => ctags_6.1.20240825.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240804.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240825.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240804.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240825.0.bb
index afddf155f..88b5f9fa1 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240804.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240825.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "a9e213cabeda252c2706f59616f455f07057d542"
+SRCREV = "a7b07d75535163f45331ca910245ad4b516379fa"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


