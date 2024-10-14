Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D77CFC530
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.50494.1728896173975221498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VuQlcMG0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896175; x=1760432175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XX6kQDqAi5egs0RgEmaMTtDf+k4O1FMXQtSosOP/o4o=;
  b=VuQlcMG0l5n4BVaNVreKfS5ZrIOU3qFhDubVtD5VTTcA5rbPqJkHyrVC
   LGdELiTju2akDYBNM0VkDY4la936SJKa3Jp+B84ibRBaoGxSO0unfM1QY
   94P8icYqLguwv/T44Odcd3ByvdPuVcThS2c6rK05y+nkwDEf4MRNl6WWd
   nGxS2GsXJsGxHqOCt4KqjFs7wt594SS5E7lT9mCPv4OiIV/tJgyUXaQA6
   gmzqKa+cw5Q8atFAFfhE+pjxKQuq4tZPR+zSkOZDlNGLLQE9wrK5l5wwj
   bLLzug8crhnG03p8aSEr3qTBUn5/6vf3zh0jpeKCcOJjF56i327PGvbl3
   w==;
X-CSE-ConnectionGUID: yVHNLw94QDWl5TjCO+ueSg==
X-CSE-MsgGUID: Ac31k2NmQ9OxhfxgapHjGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="165031667"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="165031667"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:14 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BB9AD6473
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C82FCD7500
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A75A20071A28
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 09D521A01E9;
	Mon, 14 Oct 2024 16:56:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/54] python3-tomli: upgrade 2.0.1 -> 2.0.2
Date: Mon, 14 Oct 2024 16:55:05 +0800
Message-Id: <1728896115-2944-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--0.422400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/k++hGM2nSe5gU
	Ly4zAbFBNvHBLq23QeZcMjdTfFa/Vu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5bcY
	zFzv1+5m6qCR/bVpKvTck5YEeXzPolOPr0+moU+7WfwGX+x9s7beORoFS/6WEttqnlYph7tfmtH
	Ciw8Ncu9YQwNqvVYRuCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112891

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Removed Python 3.7 support
- Make loads raise TypeError not AttributeError on bad input types that do not
  have the replace attribute. Improve error message when bytes is received.
- Type annotate load input as typing.IO[bytes] (previously typing.BinaryIO).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tomli_2.0.1.bb => python3-tomli_2.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomli_2.0.1.bb => python3-tomli_2.0.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-tomli_2.0.1.bb b/meta-python/recipes-devtools/python/python3-tomli_2.0.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-tomli_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-tomli_2.0.2.bb
index 9401ed897..443b2af38 100644
--- a/meta-python/recipes-devtools/python/python3-tomli_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli_2.0.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f"
+SRC_URI[sha256sum] = "d46d457a85337051c36524bc5349dd91b1877838e2979ac5ced3e710ed8a60ed"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


