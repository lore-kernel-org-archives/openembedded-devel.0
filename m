Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10A3CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10958.1760433677145514994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PAsOF74R;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433677; x=1791969677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tmRA1SGnuaw1dtlnc1zdqJEXfHrVTW7EH7BRpe9xkIY=;
  b=PAsOF74RK8y9AUjkzeRhFFRID1TKUIAjWVWE7wVQ2e49Yq5oVZ/8QSVy
   sCVSu/rVIrXYqqotpG+MR1YkpwqYq1F5URoqgW+Q12Yr+RnBuYd8tbkNi
   8s5EA9qKvvv4GQEOV7QxibQ0KRwrY0onRoMbN7/LYPDZ9HJ61OCpoArig
   TufRW68Vh7cBR38ieyJ0cyDytzl8G8cR9DZvwJowOLMRUvVvo4is3JtpF
   4AVyKRGU4PqTauqAmAGFuCuoW23pOiaipnTrXYOTIorTV6vCogWzm+z0h
   VT062WCYa7KrIkH/wI+m725+Z15lMpYOx6IHH0FevU2Cj30hb67tw8A2a
   Q==;
X-CSE-ConnectionGUID: AcPe9A91Q7SCa0hk91BGqg==
X-CSE-MsgGUID: 0TqRV8VqSn+UM4hzPSJU0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194812744"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194812744"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:15 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id ADCC2820701
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:15 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6802218000C7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D7B3B101BB77;
	Tue, 14 Oct 2025 09:21:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 41/44] sanlock: upgrade 4.0.0 -> 4.1.0
Date: Tue, 14 Oct 2025 17:19:24 +0800
Message-ID: <20251014091927.493-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120598

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/{sanlock_4.0.0.bb => sanlock_4.1.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_4.0.0.bb => sanlock_4.1.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_4.1.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_4.1.0.bb
index fe8592be39..2f4886057e 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_4.0.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_4.1.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
            "
-SRCREV = "70c268a07273da78a4aadd14c40ffb75138ccebe"
+SRCREV = "57013022da9c06c13f65a24684522a04323f59b6"
 
 
 CVE_STATUS[CVE-2012-5638] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
-- 
2.43.0


