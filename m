Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6BAC35FF2
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4201.1741683325664021609
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GIPMHhfD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683325; x=1773219325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fMIXwowGszHiI8AkTiBFFggupNXSsnWjsVxEHBv2vS8=;
  b=GIPMHhfDRnqwKxzjyzm/QcvLcNbkxg/yd+OnrNJMOt6jCSKfaRlm9oNY
   Xas5PPWLXIjesCK8y3Qm8lWzEPpbWdTCKMJiUqJ63mAFaudZMXFUIdXWW
   4WvTRsZpNxcRzHQD6oi/S3ih3jei+7w4cIhu73ZNQjtagtSNz5pOvt/yL
   4g7Ch8hqKd/2l30ShNQThcHSvZ58ShAPOKAaXCLIKb8EhlmbzqdxzHZIG
   MM7hX1VwEIuHjco/KnFU4E4bWlm7qoKr0H+zTLbrnIq2qo7+bazzyZ6pb
   5xILkGa44ttdoHoz6CqkSSDsnKPn3s42YyNQNCKG/dilZvKj+3d4hIbz4
   A==;
X-CSE-ConnectionGUID: IsroBEtwQfaiiKfbaiJVkg==
X-CSE-MsgGUID: RohVlGH+RFmdrCs3W1Fyvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="171563502"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="171563502"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:23 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48F4AC2260
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FB9CD8B71
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A3A471A0071;
	Tue, 11 Mar 2025 16:55:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/36] faad2: upgrade 2.11.1 -> 2.11.2
Date: Tue, 11 Mar 2025 16:54:38 +0800
Message-Id: <1741683310-8681-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115855

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Add option BUILD_FAAD_CLI
* Add conditional build with DRC
* Use adts_frame for adts header detection
* Fix gapless calculation in frontend
* Fix write_audio_* function heap buffer overflow

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../faad2/{faad2_2.11.1.bb => faad2_2.11.2.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/faad2/{faad2_2.11.1.bb => faad2_2.11.2.bb} (88%)

diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
similarity index 88%
rename from meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
rename to meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
index bec9b75ebd..9a7ee412da 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.11.1.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.11.2.bb
@@ -10,7 +10,7 @@ LICENSE_FLAGS = "commercial"
 PV .= "+git"
 
 SRC_URI = "git://github.com/knik0/faad2.git;branch=master;protocol=https"
-SRCREV = "216f00e8ddba6f2c64caf481a04f1ddd78b93e78"
+SRCREV = "673a22a3c7c33e96e2ff7aae7c4d2bc190dfbf92"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


