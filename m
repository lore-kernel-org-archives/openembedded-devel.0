Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FDEC5478B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9269.1708419300752778585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Max3qs/T;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419300; x=1739955300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LXHzmVJp4Gan4CtxhX52oXeitXeusTOJqkS99Ew7+G8=;
  b=Max3qs/TZvo9/3uuo0za29A5QgianKrS4fACk1/WWWjJUk7XxheOkNNa
   3/7oqXi7YJJJm1h3tzUBjqfplLZEYRz19IMuZanLtxC+eiXHVryylZWm1
   Kb/66WqomTtHH7gkrDgR6MyAfVopkElH5ptgW5spaBICGNZA8y8I4wEkT
   hES5ds8OoJwjIUmH7lZvTBToGkWofJZ/GAITi/s4435dBTn9PneMcOWwK
   swSPeAwPeWGwi+w9LziUQYXlqbEsu0Lb0vPN9RJOId1oM0b3yGI5Mmm4k
   PxtAWV7njdb9Ui6wnTVQRkGvD1gay3e5RtjpNDw5wGKdIOfuG77uqz6Pm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149872566"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149872566"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A7BCAD2A02
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DDFA03BD86
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 774E26B8C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 23D451A006B;
	Tue, 20 Feb 2024 16:54:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/26] python3-protobuf: upgrade 4.25.2 -> 4.25.3
Date: Tue, 20 Feb 2024 16:54:29 +0800
Message-Id: <1708419281-26047-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-3.504300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy6avPqv3X7/XOwpfLMeBwRtr9+Kgn2XgeFoJuH6vaNCz1SH
	ks9v6SQxbJcQH3furV3k48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDWQWa
	h5y/5ETWzAAODne5bAkFHXvWk3cnkxWM5Lvr3t33kQrXyQf+PMFfkyYZGb2LHj39nLXW22+gXwc
	MIyaHSRvzJhBWlMsQmZbXP29aXx5lPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108933

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.25.2.bb => python3-protobuf_4.25.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.25.2.bb => python3-protobuf_4.25.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
index 5333d306b..35dfa51f8 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "fe599e175cb347efc8ee524bcd4b902d11f7262c0e569ececcb89995c15f0a5e"
+SRC_URI[sha256sum] = "25b5d0b42fd000320bd7830b349e3b696435f3b329810427a6bcce6a5492cc5c"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


