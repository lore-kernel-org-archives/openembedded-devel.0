Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A12CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8052.1756890209000338735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qrkAWvZj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890210; x=1788426210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UPGlHO9nNGeMM/xxvHzSn+h87BGwHQdQo1Ipu1INKJA=;
  b=qrkAWvZjAALMO7NKy4ZKoCDOLBHrbH8kQpfVd+7taq8nTG1i8+DJnlDr
   OhxXbPl0JUT8Ao+/yjJq9NEn6zzl7svHaBk5lBjyNQtNz+c95oHvtc4/l
   ydcD2bakpoZyYeNR6W56ebRW0yxhFF2pqvu3hWsQVyKIIGa+UWIqP9m8W
   AZn/TfkAZrRe2Hk4Afrk1dFYQsXiqC97N1oHpPuHS8V8rmP+qYFkfPOGk
   QemnCB2a7wO08STOnf7wXeO/4iXRKheQ2k349nuvYqAwsDCUlYYypGpIC
   v+ll1x9gI1nihbpjgkYdAJugXIKqpRRiozFkqlVhwN1xdNk6eVbMdn4KG
   A==;
X-CSE-ConnectionGUID: N3ZsA8zfQi+64iXQhOztiw==
X-CSE-MsgGUID: ArrW+ePIQvCKqW8WEcl1Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211549621"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211549621"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:28 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 3202082070B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E5265182AABC
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:26 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id DFF961000083
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0CAA21A0074;
	Wed,  3 Sep 2025 17:03:22 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/56] cukinia: upgrade 0.8.0 -> 0.9.0
Date: Wed,  3 Sep 2025 17:02:25 +0800
Message-ID: <20250903090317.2002-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119200

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cukinia/{cukinia_0.8.0.bb => cukinia_0.9.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/cukinia/{cukinia_0.8.0.bb => cukinia_0.9.0.bb} (86%)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.8.0.bb b/meta-oe/recipes-test/cukinia/cukinia_0.9.0.bb
similarity index 86%
rename from meta-oe/recipes-test/cukinia/cukinia_0.8.0.bb
rename to meta-oe/recipes-test/cukinia/cukinia_0.9.0.bb
index 2984d9a426..4e61fecd9a 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.8.0.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.9.0.bb
@@ -6,9 +6,9 @@ LICENSE = "Apache-2.0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
-SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "bacdc5437aeae25099b0271231ec8b277e0caed9"
+SRCREV = "ce10e333d7169df80b44a0ea9bbbfaffbe4c59f9"
 
 
 RRECOMMENDS:${PN} = "libgpiod-tools"
-- 
2.43.0


