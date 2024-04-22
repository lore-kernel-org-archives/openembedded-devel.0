Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB77C19F4E
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:21 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.13981.1713777371031018333
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C86+Q/EY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777372; x=1745313372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1u5uey1a3jbr43xSR15p+npLFK8zddrGmMZWKIebn80=;
  b=C86+Q/EYT46jpvvHic0G8umngbHGOxG5pY9RxgT1nZTBAV98TlmSPIMW
   brZo3L5X7ny9tM0OL2GnDYrPs55O6sByPIjscap7SDBrEvnzVKU6b5ARI
   Lugbi9mx5gdFCigVqGJDChXaEG4fAS709Hb5RTS89R6bYBTcNSdI7fHPX
   ZhMi1KLUH8ogo3tu6bQxDJ5CAGPSjOeO7WjSbC2DsDm3bmpz2cmfyRRd7
   Y79JH0SwrNkuWf3ffG2PUtJEy3Nl7AJKmvsX98/RoT08c8+P10rj2ywf8
   1vxGR3xzkwOA82jytzPcQlJrMpKAqAFeMIXB09J9dyxqk4nRsbHtdO+Ko
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="155754392"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="155754392"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:09 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D12CC68A2
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D91E1590E
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CD5DE20093277
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 76F1E1A000B;
	Mon, 22 Apr 2024 17:16:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/15] python3-argcomplete: upgrade 3.2.3 -> 3.3.0
Date: Mon, 22 Apr 2024 17:15:35 +0800
Message-Id: <1713777345-29264-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10--0.834300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrj0Iuqb6gHRuU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6ajY
	vpiZlpdcP1eqy2SPN4jfM8eCIa6rHHKwcKvTQOR0PKonF8hCa66cRLYYyMNoieoFG0wvpmdrOP/
	UIcI1X6KD4b2AtS1daCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110089

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Preserve compatibility with argparse option tuples of length 4.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.2.3.bb => python3-argcomplete_3.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.2.3.bb => python3-argcomplete_3.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.2.3.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.2.3.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.3.0.bb
index 8d8c8a4e2..d96861010 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "bf7900329262e481be5a15f56f19736b376df6f82ed27576fa893652c5de6c23"
+SRC_URI[sha256sum] = "fd03ff4a5b9e6580569d34b273f741e85cd9e072f3feeeee3eba4891c70eda62"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


