Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC686C05023
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:59 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2764.1713318111134881218
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kKjWgOXu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318111; x=1744854111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9qcr2MMFRNAonPnJX6bWHBT8LFWSBJboBNE4krRExT0=;
  b=kKjWgOXuZE4ZK/Xf7w+0cZtKkTF6rT1teVvqRwCdeEu69uKnOC093Jtc
   5aNif1TY4ATnveMuZYc1dAqkzRubI2ikDl+GmhJn1Lbm82BoAoUo3cDkX
   V/hAGmT0ztaAV7c2CxZdu1tGQEQhuhARz7bjKrYlMzqS8qhHWhxfjdDUO
   RUcVLzCHs0yUlBO+qAFhOn2CvzBDJNKgfedUO+xbKg/9DJSJMRai2IqZw
   bZJmLD2242b/6i9vWGQKqvp7WgN70EofsKnDXm8lp3hpzJw+7CW1owV0n
   OQneVznpFSSn1wwmfpEbOjzSu1tgJOp7Nnv5u1jnevYQD6Zamq/v7FE+d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155671460"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155671460"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 33DA7D4802
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E4E8105F73
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E827F22D91A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 950951A0002;
	Wed, 17 Apr 2024 09:41:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 47/49] toybox: upgrade 0.8.10 -> 0.8.11
Date: Wed, 17 Apr 2024 09:40:59 +0800
Message-Id: <1713318061-17128-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-1.843300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z71Wx2uUbPLfExmr5hqNL1tzONa1Rspx3NU1
	b05rVsAkWm/gAtjCd7Bq+GDzhZYNl5UcZtwNsCroURSScn+QSXjk3o/SlA4+V9zw4lzv7RUmOhz
	Oa6g8KrXFkOTbyD/fI6kd47VBVdTHidpf6C6qRkrAtpMNBt45LS4VSTsTrlSi7jfFqGn8dbW6Fb
	5vqfl28IS0xzo3LkByzTbFyoFWp8R0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110033

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-core/toybox/{toybox_0.8.10.bb => toybox_0.8.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.8.10.bb => toybox_0.8.11.bb} (97%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.10.bb b/meta-oe/recipes-core/toybox/toybox_0.8.11.bb
similarity index 97%
rename from meta-oe/recipes-core/toybox/toybox_0.8.10.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.11.bb
index d747ebf36..db071a199 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.10.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d3afee05ca90bf425ced73f527e418fecd626c5340b5f58711a14531f8d7d108"
+SRC_URI[sha256sum] = "15aa3f832f4ec1874db761b9950617f99e1e38144c22da39a71311093bfe67dc"
 
 SECTION = "base"
 
-- 
2.34.1


