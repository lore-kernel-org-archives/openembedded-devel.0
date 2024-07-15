Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40E0C52D72
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.33834.1721034182437917523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o8y6Weqg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034184; x=1752570184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PtMW+ZCx43qDuXIPYv90ktJzvA53hM3ShKBkEMs9YE4=;
  b=o8y6WeqggbhIgrJQnGZDfy6krSiHo1e8N7JvF7+nAi896LarThyBBN3m
   UwbAEYhd9KMi8mCaEFDuMNNvVAUuATgLQ9iCblWfFme1LruR3ZdyZ8g8b
   ImujnHStEP0h/XHgeCZ1Z35EvCZXRvNDt+xxP9IanXAMniiXToWb99LGb
   sSGWKrldNXZFllOuyiUbPqL7aE5LWvrVaFr/xHQ3TvWeQg/MJnis10kST
   npyqDod3/Y8UvCcRb5/ZbGzR8lwIPYiYo/CHeNRBBjJ/WiuQJVxImwNap
   c/amndlu46r45GAULQ2vaYxZUEu1YPvMvu6B4C3MxgRRI0OVvLJOJZHVG
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="167046021"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="167046021"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:02 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 728CDD800A
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B9546D8B0F
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4097F20071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E10781A000A;
	Mon, 15 Jul 2024 17:02:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 34/38] tree: upgrade 2.1.1 -> 2.1.3
Date: Mon, 15 Jul 2024 17:02:27 +0800
Message-Id: <1721034151-540-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--3.402000-10.000000
X-TMASE-MatchedRID: h8nmbN2t+rqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvozDhGeQC9Ej2L
	HhcNaAJXuYhCPdC+eqF3YJpD/5yZvWcSI4QxgePnBcaL/tyWL2MbdKgBZxTjZR0zI+Wuf+4mDBs
	Hp9ZCSqy/+cseRgjV45SttLtHP+zp6jttXfVTGg5gKzkBhm9cLxCE2NlBjIjcOpQlVPeCltNdnb
	MQkW7qAceDy7M0OE/jxKmwTS15I7MI72eZSqlThIOlbll4OMtkKrPrDm/w8XOQc9WQFO7fU4RQJ
	083LK5lxj2vKRAxCNJo4PwuzDPJu/Pfj/RbxQwm8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQfiq1
	gj2xET/D+S6e+93mzUXFjkPUX4KkcfRJq1ctTfwrT6V6InEuV5mYsOd3akjfl68WvpTXBHWEgpd
	7r2FIkob1oRJzA0abgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyxv7RJg9205XNyHCPtWvoUtVC0U
	Ht6ZB81lD3HUz5rVAVJ0OkY9daU0s7/8ryi4JWvCQ6p50SrKexEzYHHrjMsqLcrgetJR5p/r/b+
	dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111354

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Mostly a brown-paper bag release to fix the below regression and add a
  feature I forgot to add.
- Fix regression in search() function that broke --fromfile
- Allow the -L option to accept its parameter immediately (with no space)
  instead of requiring it be the next option word.
- Fix issue where --gitignore does not think a pattern with a singular
  terminal '/' (indicating it matches only directories,) is a relative path.
- Don't emit the error 'recursive, not followed' if when using -L, the depth
  would prevent descending anyway. This also fixes up a JSON output error
  (missing comma) when this happens.
- Don't prematurely sort files/directories with --from*file.
- Various seg-faults fixed (Hanqin Guan (The OSLab of Peking University)):
  - Make doubly sure that there is actually a previous path entry when reading
    from a tabbed file.
  - Make sure there is actually a file entity when applying the link info to
    it when reading fromfile using --fflinks.
  - Increase space for the path a little in listdir(), just to be sure.
  - Make sure that there is no topsort (--dirsfirst / --filesfirst) if there
    is no basesort (-U).
  - Make sure gittrim() function can handle a null string.
- Update email address to steve.baker.llc@gmail.com from ice@mama.indstate.edu
  which has been permanently disabled.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_2.1.1.bb => tree_2.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.1.1.bb => tree_2.1.3.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.1.1.bb b/meta-oe/recipes-support/tree/tree_2.1.3.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.1.1.bb
rename to meta-oe/recipes-support/tree/tree_2.1.3.bb
index 1eaea6a22..79e0d5e10 100644
--- a/meta-oe/recipes-support/tree/tree_2.1.1.bb
+++ b/meta-oe/recipes-support/tree/tree_2.1.3.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "https://oldmanprogrammer.net/tar/tree/${BP}.tgz"
-SRC_URI[sha256sum] = "d3c3d55f403af7c76556546325aa1eca90b918cbaaf6d3ab60a49d8367ab90d5"
+SRC_URI[sha256sum] = "c24c9bfbbb3bd31a43b16898f74fd338cfcf348e914de81438ddfcf052076ff4"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.34.1


