Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A311DCFC52A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.50345.1728896174806757882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bS0Lz09M;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896177; x=1760432177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=22jy5Kqi5keMGpPVPBHSWwmtMELwQ8KpvN+t/PCtGWI=;
  b=bS0Lz09MKBQZYyhuYlwD8CIb0FFSlJ77XB+APXgnEm/MKPPkHHDJQNiT
   wnERGb884tppSlTkQ9cgwOUAF0flJc4vh4OBAUOaEYK6/8V7K2/5fvWKC
   RZ0pjDTw0lx8bbUUAuc+pY/Is4R6/l6c2FNEOC31zM7/WLtaZGvsrfOai
   lnukDPXpiSECF6BOivD8sJtc9OMQ5Y1iCLQPhDys6HKareCy+0iL6CoW4
   m2gFROzh3k9fYwvt6pz/YsURllo8nU9IOSOwE2S26bAjdMwT6B65/6YC0
   +uATOu+Aq3JrlEzXkt7zeCGfz6A5tTszZ4i4K5A6zASlwosPtZEPSPat2
   A==;
X-CSE-ConnectionGUID: DWgLLIJ7RZaDUqp8/AI50Q==
X-CSE-MsgGUID: UOhomDpSRye0PUZ15Ox9iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="178861019"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="178861019"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 099F8D433F
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D022E4999
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 22C0920071A28
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E04E31A000A;
	Mon, 14 Oct 2024 16:56:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/54] python3-scrypt: upgrade 0.8.24 -> 0.8.27
Date: Mon, 14 Oct 2024 16:55:00 +0800
Message-Id: <1728896115-2944-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-1.565100-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGDkdZrWTFzcxOjf3A4DTYuF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrXdkG8sbQc+4sdyTqYTiEEbtHfh9xbj97sh22hmYs0tM7+0Suv7+3idijr
	3iL45lWipBsYCiR6HjnIKbXmQRUP/gT9AYezWxdB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112894

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-scrypt_0.8.24.bb => python3-scrypt_0.8.27.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.24.bb => python3-scrypt_0.8.27.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.24.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-scrypt_0.8.24.bb
rename to meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
index 94c83e495..a3254de07 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.24.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.27.bb
@@ -5,7 +5,7 @@ HOMEPAGE="https://github.com/holgern/py-scrypt"
 
 SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
-SRC_URI[sha256sum] = "98ffde45e4a95461d73ded54ba7a26857679920d4f8ff320f6f7ade6e29531bd"
+SRC_URI[sha256sum] = "a7b637848ed518c1ea2b31a9ecaaa3f49616598d8442de8706cf1f01fbabf0a7"
 
 inherit pypi ptest setuptools3 dos2unix
 
-- 
2.34.1


