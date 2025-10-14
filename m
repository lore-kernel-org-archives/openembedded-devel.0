Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BB4CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.11102.1760433615330039716
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U1QrwJg/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433622; x=1791969622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d8lYchrpxRhWiSdBEnCCNVJ+w3cVjTrBXhtBPAIxAuo=;
  b=U1QrwJg/kHT/XjRt0XJEC5tqExDM/H4Q8JvRBCjCzX1BSNqq6ozmv1cf
   jJi8Rb/w3WL1AAUaSLsG1ksXMMMSmjE6pc6Y0+QNbyGjnpT/gUCPkJrc4
   QviCznA5eGXn/F2lev0sYRKq7eNyXZunux01uESgJ+MqBGpSViM84nsxW
   36Qy7o3rtAdRMb0vCZ29MUIlr1R3kCwbjA7XGHH3mkzb/T6nj0jwr1SQ4
   4JHrHLLvH846rW5xZewLwGS8YCoYvQmG556JHo5pEUfuz+gN7cJCX5V+B
   AHLvRpyaV7YuTZOcDndN/k1eGZUOBGSUsHiEpgRMj3Thi/hbtNJ8r7BP2
   Q==;
X-CSE-ConnectionGUID: BqkujLNZRDWrdGo6zShBJQ==
X-CSE-MsgGUID: 8roY1H1DT1mwKtIqt40j6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203275707"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203275707"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:22 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id CD2171002B9B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:21 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 84650C0181F
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E78A0101BB77;
	Tue, 14 Oct 2025 09:20:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/44] python3-matplotlib: upgrade 3.10.6 -> 3.10.7
Date: Tue, 14 Oct 2025 17:19:10 +0800
Message-ID: <20251014091927.493-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120584

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 the minimum version of pyparsing has been updated to version 3.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-matplotlib_3.10.6.bb => python3-matplotlib_3.10.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.10.6.bb => python3-matplotlib_3.10.7.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.6.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.7.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.10.6.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.10.7.bb
index 578a6b9945..b5b5250a56 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.6.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.7.bb
@@ -22,7 +22,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Do-not-download-external-dependency-tarballs-via-mes.patch \
             file://0001-Change-types-for-width-height-to-match-definitions-i.patch \
             "
-SRC_URI[sha256sum] = "ec01b645840dd1996df21ee37f208cd8ba57644779fa20464010638013d3203c"
+SRC_URI[sha256sum] = "a06ba7e2a2ef9131c79c49e63dad355d2d878413a0376c1727c8b9335ff731c7"
 
 inherit pypi pkgconfig python3targetconfig meson ptest-python-pytest
 
-- 
2.43.0


