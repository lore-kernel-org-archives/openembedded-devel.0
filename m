Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06B6CDE006
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 02:04:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2726.1782353082578136000
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 19:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dCEs4U+K;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782353082; x=1813889082;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1IQvkMArcLIsqSL5e9aIGF8ypKyoNEpIE8RsrQtlwIE=;
  b=dCEs4U+KPxbfIbnNGRDtn/VCTy+BYTd0c8RsbrDrS1lrsTxM/CS9px5i
   qy69JEFNpgyjcsxGy0BltR/vhdkoyIF+ZmlPLjgDjUBa9EtHUKIep+f+c
   /b+XcPb4Rox91y+AQqaz1APTuputbaaUWN52c5qrQfclhj4pa+kwqKR4F
   YAcCVkFMqwGsh8LBNKhLIe0zAE6bc+oAHA+jZC+c7TB+9MqXtSHRu2kyF
   2IaD4Zftwm7yq5Sd3iuC64mRLy9pLvZ3aHgy1e04LKk40ZkxIz9eLsAwD
   oIGNDqVVfhNqu32anKU7+4zrT26AuG/iD9nEGuaDoMS3IksMuVizq9qlZ
   g==;
X-CSE-ConnectionGUID: c7Vc3M0qRQaipoPvhqvDzw==
X-CSE-MsgGUID: kykNKAETQeqVXV9mYDkPKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="233210286"
X-IronPort-AV: E=Sophos;i="6.24,223,1774278000"; 
   d="scan'208";a="233210286"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 11:04:40 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 79F26CA59
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:40 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 2C24A10CF1DB
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:40 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7D10F1017302
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:38 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 0/5] freeglut: Bug fix and virtual/freeglut provide.
Date: Thu, 25 Jun 2026 10:04:32 +0800
Message-ID: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127726

Zheng Ruoqin (5):
  Bug fix:
  [oe][meta-oe][PATCH v2] freeglut-gles: Add symbol link to fix opencl-cts
    compile error

  Add virtual/freeglut to provide split version of freeglut and fix recipe which depends on freeglut.
  [oe][meta-oe][PATCH v2] freeglut: Add virtual/freeglut to PROVIDES
  [oe][meta-oe][PATCH v2] jasper: Use virtual/freeglut instead of freeglut
  [oe][meta-oe][PATCH v2] ftgl: Use virtual/freeglut instead of freeglut
  [oe][meta-oe][PATCH v2] opencl-cts: Use virtual/freeglut instead of
    freeglut

 meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb | 2 +-
 meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb  | 5 ++++-
 meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb          | 2 +-
 meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb      | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.43.0


