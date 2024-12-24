Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D885E7718E
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.30373.1735032453127536578
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hjAd2zIa;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032453; x=1766568453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nyRt+sT7VZcl13F8M4MNvxI6wV94Bzq/nsET+6MnKWM=;
  b=hjAd2zIaO9K+vor/ajVHjzziT3/KmoFQEucaszzjCg3oOD9ZKvGVXzpB
   7sx0C3rjhi0Od7seoLxBpT+YMDrIfQg+33Kj8NWALBS9Jz+k0L3Qii3b3
   7ZbzSWhELQyv/RR3J61QVXI1ZVb4mheiQrbA4bQbHmms8nAKXmz1Eo7UZ
   vC9TIK61KKh6fx7MbS3F5b1WrxSKGQOnO7Y71SWcbr2zUrs36CZsCuAbS
   sGXutBjj/h3/s7ZQnDVCAyyC+aZhsS3Mr629yIe1XygIEhGzVYPrvCi9i
   WKx1tZCdtDFqxJAfOSlpxbeAfwukskJ5HPyO0izRereri1L5oPfOvvQ9q
   Q==;
X-CSE-ConnectionGUID: YYwmkShORw6yoBs475j8NQ==
X-CSE-MsgGUID: OXqacJmuSSiWKSpOxK5FFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172776107"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172776107"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BA5896741
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D6B1311C58
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 425B86BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 097E21A0073;
	Tue, 24 Dec 2024 17:27:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 62/67] python3-web3: upgrade 7.3.0 -> 7.6.1
Date: Tue, 24 Dec 2024 17:26:56 +0800
Message-Id: <1735032421-13513-62-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrYT7ycQ5wYy4mgp2gQ2P6ljxFjFd5u1TbODjkxdzO+qKJfa/+rsi9237cA
	68lQxqZOHcrO5Zp7r+j33vrdxDbw56uXmaZh6Oyh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114538

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_7.3.0.bb => python3-web3_7.6.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.3.0.bb => python3-web3_7.6.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.3.0.bb b/meta-python/recipes-devtools/python/python3-web3_7.6.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_7.3.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.6.1.bb
index b0b67dfac4..9c0db28b3e 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.6.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c8694da5a97575618474d9caf8c812da"
 
-SRC_URI[sha256sum] = "74d52cfcc23b8e99c837190128b932923f38fca290ae2cf2d690edbf622252a0"
+SRC_URI[sha256sum] = "0cce0f33bef9096fc976ee00c38e71cdd10a61d4302a6b13b56ab58327764f9a"
 
 inherit pypi setuptools3
 
-- 
2.43.0


