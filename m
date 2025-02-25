Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4F6C282D4
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2201.1740525897971903896
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ApxxOyIA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525900; x=1772061900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=l6d6OTIqyoPDyQBeC8safgCEpuncIwsmc5X+P2O5Gig=;
  b=ApxxOyIAm5wtQdg4TXkQlHiVKAGkrq7kHNBwHsIX1K2CJnfwCuEGTazR
   KbtJR9mu4DBOwmYa00uUVlJ7qI7Tfd+bGT8lMNElwsoW2NLxdAIHKKWPZ
   lMHiAdLSfRstBpXY6U3u/Zw2oeACy8btxG36vDJ9rIrXiwA5WiEDZamLG
   QwcR7mBEpVruODR9Q+okS0B//aDp6GfVwSzR4S2+glcOrsS90jWrK117l
   tDKpLQaJP/S4Fqr9mih/Cj+RTd/DQe0EgmRJ2npw92w0cF5b9At8erMCK
   L0gVdvrZ5MUYHm6uLtRJjKC0mqSbmijxcaDP3jxuGpzkaNs2AJaePhUcG
   A==;
X-CSE-ConnectionGUID: yE5X7t2dQV+FGXLogHGX5A==
X-CSE-MsgGUID: MRq0icDkSfupgA6PwRZ5Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="193783218"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="193783218"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id ED899E6142
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B87FDD8B3C
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5BA6E1A000B;
	Wed, 26 Feb 2025 07:24:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/51] parallel: upgrade 20250122 -> 20250222
Date: Wed, 26 Feb 2025 07:24:13 +0800
Message-Id: <1740525881-21103-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115619

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20250122.bb => parallel_20250222.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250122.bb => parallel_20250222.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250122.bb b/meta-oe/recipes-extended/parallel/parallel_20250222.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250122.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250222.bb
index 143839dad7..cb6068f6d6 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250122.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250222.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "03c79e5b346e330cf9e5381c8e5a435fcbcdd08448964676b42f04e199bc8db3"
+SRC_URI[sha256sum] = "d05ab27e0dd14e3bf253dbae18e7894717ce834193336c9a8eb26081305dbbf7"
 
 inherit autotools bash-completion
 
-- 
2.43.0


