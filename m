Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1344C54E71
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8723.1724833547871109374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ss6VC8pI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833554; x=1756369554;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=S1iSlsEJ2GQeFxYRg2sZ4xcOxAhOUQT6UgFNTTb2HpQ=;
  b=Ss6VC8pIMDiaTg2p0Le/nu3lIa11FOvr/ryfyfVCSz6SnUg/f1e5Gvdw
   M2+CEzkjbGpUwOw0FIL3lWZhUDYVp3Ktq+mputucr+HKINczl5gQRmVcz
   Fnqxz1wTlgzC6HDAzr9TqMZZ+Hy4F6Qkil/NqJFhf8jiNdQUgZOzOwa09
   1SM0HV8W646YgsasEKf9HawgN0/dY7WqhvKlb9C0185dpvXbpqTwOuLZa
   b1cv8/MnbZ0FvnrC5DANTaVsvBI6FOd5923/2sb+0IpT9g0WuP3VpNqLj
   jMq/61n0smOybLREfLphphQwKFBSRoHW3qQBCjGk8gRPrPMgjA7L5jNy8
   g==;
X-CSE-ConnectionGUID: xdMdsHWcQ/CS0aYw/T5Z+A==
X-CSE-MsgGUID: xFUbv/cAR7agCgn+OsfheA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913202"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913202"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E3B8C9322
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FBA5D3F12
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EB04F6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 949E41A000C;
	Wed, 28 Aug 2024 16:25:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/46] python3-paramiko: upgrade 3.4.0 -> 3.4.1
Date: Wed, 28 Aug 2024 16:25:08 +0800
Message-Id: <1724833525-2162-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--0.334100-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytM+b8yxBqvA4tx
	jghoBojmJZyncll9YiqPRELuGamkm4JpH56NKtA6KrDHzH6zmUUOppRHqXDlrzgdF6p9YUFlvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgPioIsi7Sa0gYA3qL69rXq5pEX
	AOzwbtMeLzNWBegCW24nmFeyfGnuMJDq6FP0TYUsRB0bsfrpPIcSqbxBgG0w5TCUdrL7oOwGqN0
	MLJjZ9jEauHUflDH52p6xR5j/0KqFq8bBHLBcYr3NSIO9kE5DbG/J4AMr2kzTV3GMuMHTfNxWvt
	9q9yeEWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112007

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix a 64-bit-ism in the test suite so the tests don't encounter a false
  negative on 32-bit systems.
- Modify a test-harness skiptest check to work with newer versions of
  Cryptography.
- Massage our import of the TripleDES cipher to support Cryptography >=43;
  this should prevent CryptographyDeprecationWarning from appearing upon import.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-paramiko_3.4.0.bb => python3-paramiko_3.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.4.0.bb => python3-paramiko_3.4.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.4.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.4.1.bb
index 0d32d361c..498bb6d01 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "aac08f26a31dc4dffd92821527d1682d99d52f9ef6851968114a8728f3c274d3"
+SRC_URI[sha256sum] = "8b15302870af7f6652f2e038975c1d2973f06046cb5d7d65355668b3ecbece0c"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.34.1


