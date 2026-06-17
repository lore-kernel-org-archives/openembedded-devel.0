Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B999CD98F6
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11085.1781686707999152583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AszfvExN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686708; x=1813222708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ke0bsTYO/06g1aJtHsMn0Hz/C/a5N2QLL54SmuUhqHs=;
  b=AszfvExNeRSM9Yn+rQ1yGUqy437S+bGhDD1lHs2tvTyLWMXpp6u5TIBz
   artc40/O4iUg+/0PKgz1B6rSDENQEHdebhqdFmsCe6ofWpn6Zf/2pTTdy
   i0lrD6lVAKi+4/1QEhQuyIIRXQHQm9I7Su2dSO6vz+WhVCVVUqTgwM1mh
   yu7gk07Kt3FRoXI/jrNHQ8er/98B7xHK5Lk9MFdPNXjwn+WhhISK44zR6
   ec1XruhZ6YuEJrX0ikuBff+UibU9/XRMOUWHHtJbRm+TtHEkbQI3Zo2uH
   k5k8yv+nYFYSx6aE5GD2bftf9jGhKqgsrM/IpoLm1WqbWo1URTDe68pc9
   Q==;
X-CSE-ConnectionGUID: B/a2nBpdSo6Ia2CGbvnDvg==
X-CSE-MsgGUID: ssMd+ivkRri4bPhNRJGCcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="243835431"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="243835431"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:26 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 288431C01687
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:26 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D5FFF181AA78
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 01D981000A79;
	Wed, 17 Jun 2026 08:58:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/17] pv: upgrade 1.10.5 -> 1.11.0
Date: Wed, 17 Jun 2026 16:57:57 +0800
Message-ID: <20260617085807.542-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127644

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/pv/{pv_1.10.5.bb => pv_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.10.5.bb => pv_1.11.0.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.10.5.bb b/meta-oe/recipes-support/pv/pv_1.11.0.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.10.5.bb
rename to meta-oe/recipes-support/pv/pv_1.11.0.bb
index 5ccb9f05af..32b8fa9d48 100644
--- a/meta-oe/recipes-support/pv/pv_1.10.5.bb
+++ b/meta-oe/recipes-support/pv/pv_1.11.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "ab21b4f8662280646b6a02e1b9f096790918f89c952bbe0d06fef75d3b52fb15"
+SRC_URI[sha256sum] = "fc02c9fc2b82b20a92cc8d98f844be63f22abd98751a8e4abc875e1d803662eb"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


