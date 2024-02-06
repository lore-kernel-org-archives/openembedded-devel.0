Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B27C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 07:26:34 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.16771.1707204389011321793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 23:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n35jVk8d;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707204389; x=1738740389;
  h=from:to:cc:subject:date:message-id;
  bh=N6bjzMkv1eV3Iy7rOmnUhELJl8a1NvmZuHtXN4SG1Uc=;
  b=n35jVk8dSLlHYno5oJrnhRzkRJV9DoCnmQK8kq9QjQo8TFbupBZo9PMS
   Wn6ozYHJn/cMsrWaImm0cTeGrcdQZ1rUZIjwQu+Bqn81N0UrQqkCmGLLp
   98NXmGSRsYnzYhf0YJ5UiV4w54/FaI3sAz++u9wjA7shT3BxaGVRUK2T/
   QHwpsW7dGecHFHx8NQTh8+Mn6p33MzMVNuCWVT2f9PVdkJTQ8AiNACea/
   P0qb6o51f+hkFYJkXYbK8zwc3McXeumBqdbIlnGtpDsrq6+o/8XNwtKrY
   CvPSEIcgE8xmElD1nk8r7JlxOIEvUJpAsbRjz3KhzkYhOZy3Aq17Abo3O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="127928443"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="127928443"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 16:26:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 703ABE95F4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:26:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BECCDD9683
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:26:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C13D6C83F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 16:26:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 06CE41A009A;
	Tue,  6 Feb 2024 15:26:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] md4c: upgrade 0.5.0 -> 0.5.2
Date: Tue,  6 Feb 2024 15:25:30 +0800
Message-Id: <1707204330-4637-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--4.084800-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yQhqMB9TCLP2/Eo10sZXT1NffSkyb6LPSIxS
	vzXEuxuJWdV1PkCMbWRhWgNOVfhPTLUN8Yzp1vtfpzmJJw2f0KE3l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYvL3NxFKQpq1TweK12oEGfvdCok3ibXlQU50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJx7s8kKG295Fsp1oMd9+/pAD6Nk3uTEkgOnLMJl8oTzZyvq
	ojGt4QDm0A/bDJ9fPhZJjVxGV4s0Uv7zOzQ/3Ha8oEUOPuTxURLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 07:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108596

From: Wang Mingyu <wangmy@fujitsu.com>

Changes:
===========
- The specification expands set of Unicode characters seen by Markdown
  parser as a punctuation. Namely all Unicode general categories P
  (punctuation) and S (symbols) are now seen as such.
- The definition of HTML comment has been changed so that '<!-->' and
  '<!--->' are also recognized as HTML comments.
- HTML tags recognized as HTML block starting condition of type 4 has been
  updated, namely a tag '<source>' has been removed, whereas '<search>'
  added.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/md4c/{md4c_0.5.0.bb => md4c_0.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/md4c/{md4c_0.5.0.bb => md4c_0.5.2.bb} (87%)

diff --git a/meta-oe/recipes-support/md4c/md4c_0.5.0.bb b/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
similarity index 87%
rename from meta-oe/recipes-support/md4c/md4c_0.5.0.bb
rename to meta-oe/recipes-support/md4c/md4c_0.5.2.bb
index 755d5f50f..6c409666f 100644
--- a/meta-oe/recipes-support/md4c/md4c_0.5.0.bb
+++ b/meta-oe/recipes-support/md4c/md4c_0.5.2.bb
@@ -12,6 +12,6 @@ SRC_URI = " \
         git://github.com/mity/md4c.git;protocol=https;branch=master \
 "
 
-SRCREV = "481230f4180cb0e0aad56da06de9327d5bacd570"
+SRCREV = "729e6b8b320caa96328968ab27d7db2235e4fb47"
 
 inherit cmake
-- 
2.34.1


