Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E82ECFC527
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.50344.1728896173761137678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p3Gq7ZFM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896175; x=1760432175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/6tr1tU9fYv0/ACdUj2lI6aED1qufgjivazhageRUgM=;
  b=p3Gq7ZFM0LaLLGkHIV1iqY19Ry3upC1O1kbwxqCXuylBATi9aPsxe0wU
   Qrx8HfcKnsRqgtggY16aYQLrHPV3uih0APRfpVaLR2BcCcRidzLU2mY4D
   ARjl0GGKTLxtPXDO05IEcJohbcM68So+vISAp4kUTA4QOlCK7hd3kaj5S
   gnrWfxgkJjuuME3wWOg9nqS6hzUC6JIyp2ym7gs5/Pu0Zl/x9PoNgWH5A
   R9GKHdfl9hwUFvnjIBJd2r+Mr+M+G+C1FUB9DmQGvVLTb56Pp+2joZp8e
   46J7SgSZAqWYhRufPAERuXky7QkuYqcFwAYuG7xxs1ZFLhDrS4M/449iB
   A==;
X-CSE-ConnectionGUID: 112wcU+GSEqhE8GMpZT4gA==
X-CSE-MsgGUID: WJMlyL4xQXeixFKZv6SFKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176739243"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176739243"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:12 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AA30EC68E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EB5FAD3F00
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AC8D20071A28
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 17C531A01E9;
	Mon, 14 Oct 2024 16:56:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/54] python3-psycopg: upgrade 3.2.2 -> 3.2.3
Date: Mon, 14 Oct 2024 16:54:52 +0800
Message-Id: <1728896115-2944-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrdLpeaiuPXy6NtjzhkNyY4uNfIPpyt7PdJ14wsO3dy6tJtVI7ODPmkpA1/
	F8aSe1u/hsfwVG/n1ZtyWlL4h2czRHqg4zMO6FAh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112881

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Release binary packages including PostgreSQL 17 libpq

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.2.bb => python3-psycopg_3.2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.2.bb => python3-psycopg_3.2.3.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.2.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.3.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.2.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.3.bb
index f92c55600..8c79958ac 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.2.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.3.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "8bad2e497ce22d556dac1464738cb948f8d6bab450d965cf1d8a8effd52412e0"
+SRC_URI[sha256sum] = "a5764f67c27bec8bfac85764d23c534af2c27b893550377e37ce59c12aac47a2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


