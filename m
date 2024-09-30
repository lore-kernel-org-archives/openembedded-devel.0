Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F25CF64A1
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:58 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.48957.1727682230177837087
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MuHupC5B;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682231; x=1759218231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=U8ciTqRaa29k0AahAccYKxLYpEIRFf6omu3p5GnoNOI=;
  b=MuHupC5BrrEyOnbGmXMSe3eyikzNVSKz1kc2fG6VqN6J0WdU4m1f6Atk
   Gx/shVK5l7C1clwEyFFJztmwikblKSDYUEcapnT6Cqhm+Bk8l8u000QIq
   b9mOGmrv4I+vMN1Q8vsqVRKQTCo3WXnslseYw04A2WU+q7MT1SCmBC12H
   49crLaBxI7GJau+E/cg5gDD/hX+of0FqIk0rrboYpVBuJUUSUBsw4/x6P
   jDnmnhmcP8c3KrEjZcx4X8yugqdY8Mv6cEXs/E4hZYMb/1eH96WHnReKe
   sopqzo5JZwUV2pm5X19UwNhKJCpNiMKhc1hulR9o/APwxOaus64KKR23M
   w==;
X-CSE-ConnectionGUID: CpkHV5VKSBGUMnvflEQ3ag==
X-CSE-MsgGUID: XroAml4rQUCdfXixEtz8Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="154666747"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="154666747"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:48 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E60CFCA1EA
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 368C5D7749
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C828520076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7A4821A000A;
	Mon, 30 Sep 2024 15:43:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/40] python3-huey: upgrade 2.5.1 -> 2.5.2
Date: Mon, 30 Sep 2024 15:42:48 +0800
Message-Id: <1727682185-12664-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-0.493600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrtjHGWON8yeP+Aw16GgqpO4hT
	/BhfRbII0JBo+IVTgnENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzrpKIpYDWfSVl6L
	Rg/LYkzLgr2FJpRmJbvvcDWiONRzVjjGbjBdvxX552KERdlWs8yPHODeZnfQ8DlUajMdZPwIVw3
	TO52WgEiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112582

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Prevent bad task serialization in schedule from causing a batch of tasks to be lost
- Ensure we catch ResultTimeout which may occur when used with Sentinel
- Remove junk SQS implementation I was testing out.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_2.5.1.bb => python3-huey_2.5.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.5.1.bb => python3-huey_2.5.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.5.1.bb b/meta-python/recipes-devtools/python/python3-huey_2.5.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.5.2.bb
index 471fd6cc2..7829555b9 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.5.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "8a323783ab434a095a4e72b8c48c5b8f957f9031fa860474a390a0927e957112"
+SRC_URI[sha256sum] = "df33db474c05414ed40ee2110e9df692369871734da22d74ffb035a4bd74047f"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.34.1


