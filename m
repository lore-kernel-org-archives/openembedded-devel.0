Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CE1E77189
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:02:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.77614.1734426116070653535
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DrlO5DAB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426117; x=1765962117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NvRLeExw5zUV5QZsXFCzG/nF0C2GliEm1Fa8D3WAmbM=;
  b=DrlO5DAB1uVLq0NZFFDgyvCVpyaMZ02bK2QTBYVTTnpZK/VxMWxVQ5on
   pi7qsXn46rIJqB5LPNteRoyWvIdMdvAZhvJWuFBVSA+ZjDMqNZhfCbCfg
   sgBfoU3WdQhiBwAS29Zq0CDMjRGUeQC1xqMSCQv0WZIX9dGMVHWrPsLnU
   PzJRegQnzS/me4lpZel1wsVkbxpnSvwMBQuK3EZt9Hf3/++e0DGTmzdrE
   51R+oXs9d8nK5fzHEx1ZHwWOOMDtccJgA58H6TVc6qOLoIImlHKP4xLPD
   zSPzm2FhZv8UdsxILv72obLQzvB/ytqV7ZffN/hty/zKg2gdmRpI6w4MK
   A==;
X-CSE-ConnectionGUID: gE2JHE6DRg6USvmxp9Wd/g==
X-CSE-MsgGUID: krB0DvvASiSXttYFP3wR9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184048213"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184048213"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2ADED500F
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F5CED5098
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FD3D2007C3F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE21A1A0071;
	Tue, 17 Dec 2024 17:01:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/17] nanopb-generator(-runtime): upgrade 0.4.9 -> 0.4.9.1
Date: Tue, 17 Dec 2024 17:01:31 +0800
Message-Id: <1734426096-18300-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--5.017000-10.000000
X-TMASE-MatchedRID: 90G6ca/P0SOdsbtv2+OMzH1zro62qhdCpxAd6mi1Ga14YeSlHZYFopoa
	FR9udOkRi1QzF8xBpkVaMorJtMi2CNGETJv1/WyO/HTKStsDGMJHNQ8CqEKO2GAN6i+va16ud8u
	5EqsUWd+KhXV7aRCSUuaffHI8kAmi7IWnvto+9Z1oMLOoNHsM9lQtFGrTSjaZB1VGYAjOG0CjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq1umtdHlhOYywA8IWxItjeBFKMv70xo4jC1lyRHRbfMWOMDG
	I++UDKi
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114361

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changelog:
==========
- Fix memory not released on error return from pb_decode_ex()
- Fix deprecated MakeClass() call in generator
- Fix compiler error with enums and --c-style
- Fix version conflict with bazel build rules

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...{nanopb-generator_0.4.9.bb => nanopb-generator_0.4.9.1.bb} | 0
 .../{nanopb-runtime_0.4.9.bb => nanopb-runtime_0.4.9.1.bb}    | 0
 .../meta-python/recipes-devtools/nanopb/nanopb.inc            | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/{nanopb-generator_0.4.9.bb => nanopb-generator_0.4.9.1.bb} (100%)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/{nanopb-runtime_0.4.9.bb => nanopb-runtime_0.4.9.1.bb} (100%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.9.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.9.1.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.9.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.9.1.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.9.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.9.1.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.9.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.9.1.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
index 7c2e553c70..8480ea5b0e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
@@ -2,8 +2,8 @@ DESCRIPTION="Protocol Buffers with small code size"
 LICENSE="Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 
-SRC_URI = "git://github.com/nanopb/nanopb.git;branch=master;protocol=https"
-SRCREV = "98bf4db69897b53434f3d0ba72e0a3ab1a902824"
+SRC_URI = "git://github.com/nanopb/nanopb.git;branch=maintenance_0.4;protocol=https"
+SRCREV = "cad3c18ef15a663e30e3e43e3a752b66378adec1"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


