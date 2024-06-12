Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E73C2D0CE
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:47 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2491.1718161125267143248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QmHR387u;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161126; x=1749697126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kYh1vZlsaGgoDyKPEgXTbf+5QdUjvQ0jlqFKEBfBKpc=;
  b=QmHR387u2sF7PKPnXBYNGPWerTyRlJjF3JYUfgjRoxkbYW8DuRI70WA8
   Q1TicfRaPcMmTRX2+hFwmRebWfRtFe+lw2RUA3W7kKijZNpP9Mr428D/4
   YKpOShGZvSxjeuRhMft12zqozo0LPg5c3C1QTXTjFmrTZ/Mx5g2jG7OSJ
   tqZCwhiQmtI1JaC16/IY68XY9Ol0biIM613Uu6J4N0aTxcl7idwhe+yKL
   dvDYbx5gnEIwo2om5gY8H8VQCk7SyRvBvuj6/VEGLKtWK66444hZC6Ygc
   5YB63dKcosqC1nzaAU7/8on1nhT/SmqpqvJbib/JfYCgkZC3A9CiVXiBU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162818306"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162818306"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31DFCD8001
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D45FD4C1D
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B56520071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B855A1A000C;
	Wed, 12 Jun 2024 10:58:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/43] python3-pdm-backend: upgrade 2.1.8 -> 2.3.0
Date: Wed, 12 Jun 2024 10:57:51 +0800
Message-Id: <1718161096-29710-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--0.073400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/ozDhGeQC9Er5i
	k3cWxqiyVLAa8KXwKt45UGidmkKLaO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAGbGIU7vAISFBDzdqaapRu/rAgqGnClQA+/dVhObYoPOYQ/YwD2F4d92gW5lCwIw1Q59g
	Ga7ebRigce8MLH/wfi7hOf5SYiRGvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110856

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Remove support for python 3.7 and older
- Add tag_filter as a way to pre-filter tags
- Error about dynamic project version
- ci: CI matrix on macos latest
- Use Literal type for valid target values

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pdm-backend_2.1.8.bb => python3-pdm-backend_2.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-backend_2.1.8.bb => python3-pdm-backend_2.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.1.8.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pdm-backend_2.1.8.bb
rename to meta-python/recipes-devtools/python/python3-pdm-backend_2.3.0.bb
index f1f507243..4185f7858 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "2487dfbd13f69d80fb4e6a08006a3ee68272833970813047dc5fcfacdfdc0151"
+SRC_URI[sha256sum] = "e39ed2da206d90d4a6e9eb62f6dce54ed4fa65ddf172a7d5700960d0f8a09e09"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


