Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAF7C2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4162.1741683327332887572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=omCzfmdI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683328; x=1773219328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iTxYyB2W6OocYcl/pS+/YdnPg8WoQT1ffh7E/T5YitQ=;
  b=omCzfmdImjT6YTiUneadIhBZ+J7F+gTpb0UB64ZSKPcq/0SggowlhVEG
   3Pe+I7lHYUJYDs2KWBrZkj+7liMkyVseLULkApvENWv5vAfbmJCqY3BrJ
   +aOUGZB2TdrWor/QMRAxBf5ozm+DC6cwiNwnlMafBUUm8bMwZBvMgnvAR
   tMRmOhqCWOYNHoqlNllq/iTSmKjqWnZfVcL0F2luhLG/BcefGzbmySlDP
   tZTXgOxzkgu5v9g/xTQx/oJTVdyzMsUO2Y9KUHImB4YYU9u4Dwi63DlIt
   phYCVNrQgepOgiqo74MMvspHhQqc5oWeEOBXUXNHo1ncaZDk2VH27ZqMs
   g==;
X-CSE-ConnectionGUID: RtNy8e5bS+Gz9oVmtmVABg==
X-CSE-MsgGUID: XvmIlAaiSR6W1S4pyUZ0Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192660311"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192660311"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E20B4E8523
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A568DCF7E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4080B1A00A0;
	Tue, 11 Mar 2025 16:55:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/36] jsoncons: upgrade 1.2.0 -> 1.3.0
Date: Tue, 11 Mar 2025 16:54:41 +0800
Message-Id: <1741683310-8681-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115857

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fixed bugs:
    - Added "-Wnull-dereference" to CI and worked around some false positives.
    - Invalid json schema compiled successfully
    - SIGABRT when serialising unmapped enum value
    - Fixed a jmespath issue with parenthesized expressions involving projections (wildcard expressions,
      the flatten operator, slices and filter expressions) where the right parenthesis did not stop the projection.
      For example, given JSON '{"foo" : [[0, 1], [2, 3]]}', the JMESPath query '(foo[*])[0]'
      returned '[0,2]' rather than the correct '[0,1]'.
    - Fixed a 'json_encoder' formatting issue when 'array_object_line_splits' option set to 'line_split_kind::same_line'.

- Implemented new features:
    - JMESPath Lexical Scoping using the new [let expression]
    - JMESPath evaluation now supports late binding of variables to an initial (global) scope
      via parameters.
    - New 'json_options' members 'allow_comments' and 'allow_trailing_comma'. These options should
      be preferred over using an error handler.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.2.0.bb => jsoncons_1.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.2.0.bb => jsoncons_1.3.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.2.0.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.2.0.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.3.0.bb
index 9e43d42051..b983531068 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.2.0.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master"
-SRCREV = "072d106130fd5d89a405a78b6b0e4f2efc45010d"
+SRCREV = "68fafa1a69367768d7d452d45432048b93ba5c9b"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


