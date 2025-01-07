Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C777E7719F
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.16530.1736240519393926078
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=huVYzbyJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240520; x=1767776520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vjx8h4EYHc497WtF+Caplv0lNo7S3Nyx1IHYVx/p0vs=;
  b=huVYzbyJTUhCJGH5GihMJo4WehTiq7kpNiN7wLquQbUHRV2vxAbWb1+U
   xSvwVqxRoFdb6CQ6IGCkW5givMwvmwsQxtLJJ3OHo+w7kieHzm9mZzih5
   tPIH3bwkL2Va5eIxdoeE4w3i0Yb7qXNdyfDaOjrPOxv40UC41sx6kSj8g
   94AdUBEzKeFeIhwzkcVZ8Ny5WDWbhlMnwFHqW6roqn8Cv5dG74aJwIIi4
   feCAZkb87O/4pnzGCl4dKU5onP/HDKd+KHmAnle3IQzfUl4l0QN593At4
   gcFoRm5o5DZjZvNTv0CEFYo8Q2lQcNkVLYYtLzXVUMlh2mdAFfJl71+kX
   A==;
X-CSE-ConnectionGUID: /IKvnZ6/TqqwrML/gUPhnQ==
X-CSE-MsgGUID: kxif3YeJSISMu47RvsoS0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="173144580"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="173144580"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE0AB96742
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C3F01CF7DB
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AC2AE293A
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 311CD1A0073;
	Tue,  7 Jan 2025 17:01:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/18] python3-portalocker: upgrade 3.0.0 -> 3.1.1
Date: Tue,  7 Jan 2025 17:01:40 +0800
Message-Id: <1736240504-5315-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-1.581600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SE2CIF52lijtgFq+YqNRzTyosxveHrxRLpWf6sBwk3T3E23
	xGPQkOXMj7AGoeBEkZVvaB9fYdUyZhG5XCu/ICYtXnmmehthnqS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114690

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Improved type hints
- removed accidental toml requirements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-portalocker_3.0.0.bb => python3-portalocker_3.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_3.0.0.bb => python3-portalocker_3.1.1.bb} (89%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.0.0.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.1.1.bb
similarity index 89%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.0.0.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.1.1.bb
index 6bdef37482..7a36ab74e3 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.0.0.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "21f535de2e7a82c94c130c054adb5c7421d480d5619d61073996e2f89bcb879b"
+SRC_URI[sha256sum] = "ec20f6dda2ad9ce89fa399a5f31f4f1495f515958f0cb7ca6543cef7bb5a749e"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


