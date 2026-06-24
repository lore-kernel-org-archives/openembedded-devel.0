Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8C3CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:59:00 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3454.1782295131619902444
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 02:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sii4lG3B;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782295132; x=1813831132;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nkvm3FXcJ4LZRUbO8OdDWTnKcRZXHcoJToVHNPhss2c=;
  b=sii4lG3B8G5qShXbjWyrpMr0+IH2IZNlrkn7t5cNVas1qXS8oSwhqxTm
   hzzBHuq56jY5PPdZgr/WWOv0QpxUO31tllvmy8Jm0Yp+++xr69avWy38n
   WqQKNnr0i7vO+P3/5/xtd4X+a0GxNwSNUgWznLT+iwJUWX/7m719usNqt
   io2yRpOZqoNySCiQ80mbZnJ6DTZXbPUMe9+AWsROkIkHEHaZg6xWh+TMu
   Na6E3PcczHWETGQM9JcWkH/sWhYrMFfaORJVT9g8Wu9B+JputCcelbCrl
   KWOmeXyJvZHf88Uk9blhQdKbMbptChGvLT+O0NfffEABLR7se2XLewhmB
   A==;
X-CSE-ConnectionGUID: 9ehRcdcJQeusFGOLHYiKbg==
X-CSE-MsgGUID: ByHK70KNQOmX4/4Y8FrNVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="245181790"
X-IronPort-AV: E=Sophos;i="6.24,222,1774278000"; 
   d="scan'208";a="245181790"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 18:58:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B013FC01B19
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:49 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 62C9618000DB
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:49 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9FE7F82DDF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:47 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/5] freeglut: Bug fix and virtual/freeglut provide.
Date: Wed, 24 Jun 2026 17:58:40 +0800
Message-ID: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127707

Zheng Ruoqin (5):
  Bug fix:
  [oe][meta-oe][PATCH] freeglut: Add symbol link to fix opencl-cts
    compile error

  Add virtual/freeglut to provide split version of freeglut and fix recipe which depends on freeglut.
  [oe][meta-oe][PATCH] freeglut: Add virtual/freeglut to PROVIDES
  [oe][meta-oe][PATCH] jasper: Use virtual/freeglut instead of freeglut
  [oe][meta-oe][PATCH] ftgl: Use virtual/freeglut instead of freeglut
  [oe][meta-oe][PATCH] opencl-cts: Use virtual/freeglut instead of
    freeglut

 meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb | 2 +-
 meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb  | 7 ++++++-
 meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb          | 2 +-
 meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb      | 2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.43.0


