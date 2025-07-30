Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE35C87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:19 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.31498.1753869311118235702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tWb7IQJ5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869311; x=1785405311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QpRX6Uw25gTLsTZKWZ6TKgnTMqmzLt2qMWWAzXjUe0I=;
  b=tWb7IQJ5rjJLXN7k2VzIhM94KD0XsgfwU87TKftZrK1LrW5QFfNYiFIB
   yc3LN3c268ERmrNgSGv3QGaUFvprlAC8L337yytpLJGIVHeDG/mbCzoET
   393sBUChcsxNh/05Y/kPrWJXbgTbiYgc8UJP+Xi9SY1BmPThGm2POXCdf
   pB6ETO1VbGvX8KS3B3qr0sMqee5SDWulb+LUaaTxh1wadyjzDRlmOwrpA
   Up3QECr8KC8pbux138+ao21JgHzCAxitswhQMByit0/VZkJxmuBEidT1R
   Bcalw5F17ez8v4qMWMsZNybqEdyASqqzcL0AykEeMvXD9TU1pQCpO6nlu
   A==;
X-CSE-ConnectionGUID: 6iAm37L4QN6GLc2IzoQZ7g==
X-CSE-MsgGUID: 0s6TCKOMRuuIxrW8islLPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="195310743"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="195310743"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A182A42A305
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 0E5671802AF4
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EE1A21A0090;
	Wed, 30 Jul 2025 17:55:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 21/40] pstack: upgrade 2.10 -> 2.12.2
Date: Wed, 30 Jul 2025 17:54:37 +0800
Message-ID: <20250730095456.695-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118790

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pstack/{pstack_2.10.bb => pstack_2.12.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pstack/{pstack_2.10.bb => pstack_2.12.2.bb} (83%)

diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.10.bb b/meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb
similarity index 83%
rename from meta-oe/recipes-devtools/pstack/pstack_2.10.bb
rename to meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb
index eb8b2965f1..24f46396e8 100644
--- a/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
+++ b/meta-oe/recipes-devtools/pstack/pstack_2.12.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=671019a96ba80415b696240ed2ca5e80"
 
 DEPENDS = "tcl virtual/libx11 libxt zip-native"
 
-SRC_URI = "git://github.com/peadar/pstack;branch=master;tag=v${PV};protocol=https"
-SRCREV = "a310df637d74917a1d3570c540bf3aef899d7e63"
+SRC_URI = "git://github.com/peadar/pstack;branch=v2.12-maint;tag=v${PV};protocol=https;tag=v${PV}"
+SRCREV = "98c4ddb7f0faa5221ea0a5f38105fc2a2f5cbfe7"
 
 PACKAGES =+ "${PN}-lib"
 
-- 
2.43.0


