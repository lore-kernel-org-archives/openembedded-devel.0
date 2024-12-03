Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1FCE69EAE
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:09 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.8215.1733185028024875654
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DdVmmh8i;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185029; x=1764721029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5hma5VMsQk8tbNoyVfWPN3Rwo9SZWPUWRWRNk00ZoHg=;
  b=DdVmmh8i7qqE9yD/n3nCqahjJjbUHvDXyWyJmm2NyMqMtx/hWLHHyoPF
   S+6tMLk9e2n13spbIBw6Eq3Zfq5Hc9IndNuRRbc6/fJCVDv2xkdhcu5vE
   mIX3uLMg6Xb/FswD5YCOD5GCosuoTQuAxkE/1lRlQ99sx+SjlsrvRmS4Q
   1+532xsknQg7P24F2cGTggbBLeB0sDxjxM61V8bn67yAcfn8o2UbhbGkA
   XXdTHD+b3mo4yRK8F+lmRo6p4SpBbRlXjIogJitRS0AaJRK+Q+wcIZdMQ
   sJtbHwYiwFjbzWjlHUuCa+di+dTbPF+A9/m3B8J1C8Vf1NFpGYxhJJ2Lu
   w==;
X-CSE-ConnectionGUID: Oz2GtdmBSJeLqviMCTeTSA==
X-CSE-MsgGUID: kaRno2vpT7eOevjF6Mwd9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="161830283"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="161830283"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AF45F96742
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 86C1BD96F0
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 170A020071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ABA931A0003;
	Tue,  3 Dec 2024 08:17:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 31/34] rabbitmq-c: upgrade 0.14.0 -> 0.15.0
Date: Tue,  3 Dec 2024 08:16:36 +0800
Message-Id: <1733184999-27041-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--0.076500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yXtNecKMjy32YjDXdM/x2VPdtCoZAk3E1GsW
	ZV9YMDBb1VQqHsDf436l4FU9jS8so/12TsqRMnfHDnkURiAlfT1UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiCGqH67UhpHueAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNQwWxr7XDKH8b0O5yYXXKz7FRYUrzqlTLVu09kEl0wyFWy5wX4w8wfErZJzynbik8lDBo
	zl7xDBkn4trSJjOk677EHZkcvr+2GSfI4OseZlzHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114173

From: Wang Mingyu <wangmy@fujitsu.com>

## Fixed
- Warning on MacOS about incompatible function declaration
- Logic when decoding AMQP data after bad data may cause crash (#837)
- Use SSL_get1_peer_certificate when compiling against OpenSSL 3+

## Changed
- Updates to various github actions.

## Added
- Add amqp_publisher_confirm_wait function (#841)
- Add amqp_literal_bytes macro (#844)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.14.0.bb => rabbitmq-c_0.15.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.14.0.bb => rabbitmq-c_0.15.0.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.14.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.14.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
index b0556ffc0b..680174f005 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.14.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
 "
-SRCREV = "124722b5045baa41a24ce2e2d7c52a47467e7ac0"
+SRCREV = "84b81cd97a1b5515d3d4b304796680da24c666d8"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


