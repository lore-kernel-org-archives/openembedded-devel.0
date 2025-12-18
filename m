Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7447D6ACC2
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37575.1766048645798903905
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j/Xs+WwO;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048646; x=1797584646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SefzZQCpOMm+Ma6S1jPK6SDlGNU72fRRf5OzFz2upJQ=;
  b=j/Xs+WwOV5te8v5oTZe7MUohM7PTPXSnWa9FfWgQAlczYQ61V+JYRZhS
   1oGYX/XkYL2G/JUKK7n2L7i5YbZFJmkiLx0jjBRAi/6ttshxG91AfwLeI
   MmM35mFgjad4iTS3AB4FuStuMuFvZQMv44oWP8qI6tMFby6sz+GykzRa8
   NNStAVV8Hcs8ootn8gKOfl+T5+Y+RpmU6WwzLVxsd7kupDxpOi3hOZicO
   AepO1LK5/l3pUZvAlLALxWTs6fXIvpwWrIj7aZb5dSxSR7U5kP7vFNkMA
   jDyIx3fR20kY8Z5r9wPYmZ/GOnL1pjGNMhCAo8Ak82PvDQncvnkAt4J1H
   Q==;
X-CSE-ConnectionGUID: mGQKCUFtQMebouDzj7B2Og==
X-CSE-MsgGUID: hpeaj6WUQ1iFz33mBgnbZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="210514132"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="210514132"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:04 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3E07D1C1734A
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:04 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id ED1128D9FE7
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7C64C101B4BD;
	Thu, 18 Dec 2025 09:04:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/20] microsoft-gsl: upgrade 4.2.0 -> 4.2.1
Date: Thu, 18 Dec 2025 17:03:32 +0800
Message-ID: <20251218090346.735-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122740

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{microsoft-gsl_4.2.0.bb => microsoft-gsl_4.2.1.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_4.2.0.bb => microsoft-gsl_4.2.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
rename to meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.1.bb
index 16a0af334d..87a8cbbb88 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.1.bb
@@ -8,10 +8,10 @@ HOMEPAGE = "https://github.com/microsoft/GSL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=363055e71e77071107ba2bb9a54bd9a7"
 
-SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=main \
-        file://run-ptest \
-"
-SRCREV = "2828399820ef4928cc89b65605dca5dc68efca6e"
+SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=rel/4.2;tag=v${PV} \
+           file://run-ptest \
+           "
+SRCREV = "249146590e322123cd0b378b1f364d6069717687"
 
 inherit cmake pkgconfig ptest
 
-- 
2.43.0


