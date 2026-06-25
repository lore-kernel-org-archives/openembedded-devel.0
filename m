Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1ABCDE00B
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7002.1782378110802205006
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J4fxqd3O;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378111; x=1813914111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=osRuKQX5aMKO6GkiK+WBC+F/7uDroQA+CSNB0JNxIYI=;
  b=J4fxqd3OJ4WSQqSz2Q9RCbiA52ZN4uW0MMZr/lCS+4okulzveyK+8K0o
   bdHKCf9uHyQ9WHsKVIuz4Ja0/3Q3tVI9Y3+f3Z3GLSFaAE5wXNS7/AGFd
   25V+trEL2dlsX+0ktvc9M/rXWamxbnNFLImBFNoHM2YG954zsTcC+tFv5
   Z1KzRqYYJad5XM9+xSQvNwL3SM3mjNfgn1xbTpk8x1YSxcTYlU3o5EsWN
   L/MIn84okx1RyTwN3V1DBtFSwTDhLWJY0sOOm3zv54YnHmMOR0/J0ByN3
   ilHX/cDIcNIQDsDXsWU0OCE1ib94lepRrRXKFGhy2UQMHloYRWLnksxK2
   w==;
X-CSE-ConnectionGUID: zJziM8yPSyWczs/+n6KbJA==
X-CSE-MsgGUID: SrJZthZnQUykVqml/47xUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="232700697"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="232700697"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:48 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 94EE61000169
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:48 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4C72AC073E7
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 64356101732B;
	Thu, 25 Jun 2026 09:01:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/47] monit: upgrade 5.35.2 -> 6.0.0
Date: Thu, 25 Jun 2026 17:00:51 +0800
Message-ID: <20260625090127.1563-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127743

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/monit/{monit_5.35.2.bb => monit_6.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/monit/{monit_5.35.2.bb => monit_6.0.0.bb} (95%)

diff --git a/meta-oe/recipes-support/monit/monit_5.35.2.bb b/meta-oe/recipes-support/monit/monit_6.0.0.bb
similarity index 95%
rename from meta-oe/recipes-support/monit/monit_5.35.2.bb
rename to meta-oe/recipes-support/monit/monit_6.0.0.bb
index 97020d1953..5dcf1c83d6 100644
--- a/meta-oe/recipes-support/monit/monit_5.35.2.bb
+++ b/meta-oe/recipes-support/monit/monit_6.0.0.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
 	file://monitrc \
 "
 
-SRC_URI[sha256sum] = "4dfef54329e63d9772a9e1c36ac99bc41173b79963dc0d8235f2c32f4b9e078f"
+SRC_URI[sha256sum] = "ddacd2a8120aeb2351e4486ee04a17782b5004aee99f2041d829bc4dcf2a5b3b"
 
 DEPENDS = "zlib bison-native libnsl2 flex-native openssl virtual/crypt"
 
-- 
2.43.0


