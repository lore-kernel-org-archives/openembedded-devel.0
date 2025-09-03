Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A58CA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7930.1756890208034123632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tXqDpb94;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890208; x=1788426208;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YG4+MCMc/XcZpSm5PIgm4WZ2EWAUNRbaedP4vY90EZ4=;
  b=tXqDpb94tD7HN9/TYlYVd55fFnMhGL7NvMcEry/ZwgyUCws8gsSj3Cwl
   CwrFMYL9JwsLNNqjo5ExHAOUdQoEgLqL+xObvlEY0eLwK7qOoERdW181E
   Hw9cITcTthjUERXHjDYDS1uXEyIO5SkfKP6ZsuppMbTvnHpyJc9gQKT2+
   jzjMTsC4+bvMUU7RGBGk1V3olnsQUq9jvbg7X9Nn+PHJM/z7ZsJpKdIzR
   uudDhMijxqTWHi6zz9a7jbNMYweu44S1HKZWwuFf6eHbv3NivH3JTiiTF
   4Wm8weuHJf2wjRR8ABN+mQCyHdAHxSlDSIyu/meX45kmAm8PA53xEMdnS
   Q==;
X-CSE-ConnectionGUID: M7mGVH4TSL+qir/g7amHhA==
X-CSE-MsgGUID: c4dhCGzFQKyhCteNu1V19w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199446228"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199446228"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:26 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3ACC718B3
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:26 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E6D9E1C2C229
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:25 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id DD1061805CB4
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E58D71A0069;
	Wed,  3 Sep 2025 17:03:20 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/56] asyncmqtt: upgrade 10.2.0 -> 10.2.3
Date: Wed,  3 Sep 2025 17:02:22 +0800
Message-ID: <20250903090317.2002-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119198

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Added missing pingresp timer cancel request hanndling on asio_bind sending.
* Fixed pingresp timer management.
* Fixed receive_maximum invalid handling issue.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asyncmqtt/{asyncmqtt_10.2.0.bb => asyncmqtt_10.2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.2.0.bb => asyncmqtt_10.2.3.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.0.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.3.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.0.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.3.bb
index 557c7d3d12..76f1dca72c 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.0.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.2.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
-SRCREV = "9e26e92d1c3571ff2723c380c9548b3527bf37a6"
+SRCREV = "008dbe26d1366b1da3dd8bdcc1471f066b567166"
 
 DEPENDS = "openssl boost"
 
-- 
2.43.0


