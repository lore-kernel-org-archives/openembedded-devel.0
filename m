Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CE4C83029
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.13873.1750662712085557795
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BNMtih3n;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662712; x=1782198712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mUWVPuqv7l35PPNsfWYq0whQXEz5ru0OT1Wvi76jsSY=;
  b=BNMtih3n/GABXswK1HiL2ztdYu1Q/hAdaRCfZKgTMBMk53vc/zJc226f
   Y/B08136N68GsylxP+cfsbzxf1YCMjfkhcynYJeZzlF7bOot5pr3MNuSX
   x69zjfL9i3JAobNYgjYjP/47ntguaOCSHpVK40UJo1zHMjXz3CdEAbYa4
   R+UIrCIKrszoErPXQTe0DVlWOLr/Q2U9M2Qs0TKbEqQH1yUSKK0Zz/ukz
   nXH9qeeQbqNL+mMYYaFt+RE2gBRX+aL48W7gPZ3yLKc3HekoXLVw5rzD7
   x2QG7kYvgsYuHfT1FZFviEqu1OdDJaxMvTJMUPM4ASMGzzY6oHTkt1aWx
   Q==;
X-CSE-ConnectionGUID: TKnh4myMRuqWFmAS0VwD6g==
X-CSE-MsgGUID: 1jMRb3v6RkiRUdiIIFFwfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="203567331"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="203567331"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:50 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C396C68A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1944BD5041
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:47 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8EE921A008D;
	Mon, 23 Jun 2025 15:11:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/30] cppzmq: upgrade 4.10.0 -> 4.11.0
Date: Mon, 23 Jun 2025 15:11:10 +0800
Message-ID: <20250623071138.402-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118032

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Features/fixes
---------------
- Add zmq_timers support
- Add file descriptor support for poller
- Feature/expose monitor socket for active poller
- Allow generic sequence of poller events
- Add configurable sockopt for raw router sockets
- Add on_monitor_stopped function for monitor_t
- Add ZMQ_BUSY_POLL option
- Fix std::max compilation error on Windows
- Fix -Wold-style-cast compilation warning
- Remove space in custom string literal

Package/tools/internal
----------------------------
- Remove ENABLE_DRAFTS option
- Update to Catch2 v3
- document CPPZMQ_BUILD_TESTS and adjust formatting and semantics of build instructions
- Update CMakeLists.txt
- docs: fix link target
- Version 4.11.0
- Update CI runners
- Upgrade deprecated CI OS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zeromq/{cppzmq_4.10.0.bb => cppzmq_4.11.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zeromq/{cppzmq_4.10.0.bb => cppzmq_4.11.0.bb} (86%)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.11.0.bb
similarity index 86%
rename from meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
rename to meta-oe/recipes-connectivity/zeromq/cppzmq_4.11.0.bb
index e411e6efc0..10a132c0c9 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_4.10.0.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_4.11.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "c94c20743ed7d4aa37835a5c46567ab0790d4acc"
+SRCREV = "3bcbd9dad2f57180aacd4b4aea292a74f0de7ef4"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=master;protocol=https"
 
-- 
2.43.0


