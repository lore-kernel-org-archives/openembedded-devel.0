Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBA6D116FE
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:51:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4463.1764669102817664285
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I4VJOMLD;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669103; x=1796205103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lLguOIVxKWYYardP7GrSe+x24BdgRTMRlvdnmF46FGM=;
  b=I4VJOMLDB+JqGY7EDTuGLnrVQqpHmrqWx5bWSuJC+8bVOd1/73uQJz56
   HlVJGHk1GyxEcDCIssQWh5Un2bnRkVz3VB2chnC76x0Rg3aMKRlx0SRDm
   LFkHR2LchQkcIfLkspUMvyBaulCERTzyml5A69+YoAOGprQSMOiqvp4dm
   /BpPH42oLyayf5vJ0X7Lx72mOghuo5C1/YdI+tBKfw9bTaCx3cIU/mh+1
   WZSzTpqKZp2YN5hxqxg5aGAA6/hIh1vtrgX+VvOljRF8mjAnO744QMM0o
   IayqrPcFj4mowxBWbRhA/zVvWfSngKb3wwvLyMEsFsA3+LmoIiDtZL39V
   w==;
X-CSE-ConnectionGUID: V2KzZXOuTBWcDrW8tqjfdg==
X-CSE-MsgGUID: FYxcT67FQPywMRc02/1dZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200140643"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200140643"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:51:41 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 4AFCFC00215
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:41 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F31E9C0183C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 78C64101A42C;
	Tue,  2 Dec 2025 09:51:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 02/25] fcgi: upgrade 2.4.6 -> 2.4.7
Date: Tue,  2 Dec 2025 17:51:09 +0800
Message-ID: <20251202095132.652-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122235

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fcgi/{fcgi_2.4.6.bb => fcgi_2.4.7.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-support/fcgi/{fcgi_2.4.6.bb => fcgi_2.4.7.bb} (87%)

diff --git a/meta-webserver/recipes-support/fcgi/fcgi_2.4.6.bb b/meta-webserver/recipes-support/fcgi/fcgi_2.4.7.bb
similarity index 87%
rename from meta-webserver/recipes-support/fcgi/fcgi_2.4.6.bb
rename to meta-webserver/recipes-support/fcgi/fcgi_2.4.7.bb
index 691274578d..1e8ad9e496 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_2.4.6.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_2.4.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.fastcgi.com"
 LICENSE = "OML"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3aacac3a647af6e7e31f181cda0a06a"
 
-SRCREV = "1ad48735cdf86d918936b53739348356daaa486d"
+SRCREV = "47f2c03b7771f0ef61d887734ef91e6fa747f837"
 
 SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master;tag=${PV} \
           "
-- 
2.43.0


