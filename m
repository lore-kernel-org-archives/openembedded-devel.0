Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1DDEFD221
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:37:51 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41947.1772012264797229261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s/Vj+mpn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012263; x=1803548263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bn8x2N7l2n6NyQuv4iyOOGRGKpg9+wDJN3QOyXHjO9o=;
  b=s/Vj+mpnw5xFzbIVUNAQkZywUQ6Jd5FwHERDFpCyTS7eALW/g7ZbUqbo
   qc58khFQjhJebTjDSJMBvq6y7xNhHQzgMEAbu3didI6xGoMl0FykNLfOf
   1/RRY0NJRGmSfXMKPeKzKiZavKkp/GX44M6Js32+fkXdoDJsSrLOmMwGp
   unOWaPseqj7nwBKmRaQww2XFg6uJsfW7x7NIh1LwqAAgRkgmci3tzZ89s
   JP37W0Q+eEkH8fDlFXa6eQ1UxVWriJKmwMUb0f/DMGc5G0e0f30r6zU2I
   W5VgQ+pz6/Gz1CInxI0SxG5q3EkWeDkCZIwpzrxBPt2iK5Vn3wDWom6AR
   Q==;
X-CSE-ConnectionGUID: /IOcIYEcQN2uTUow+gqZHg==
X-CSE-MsgGUID: EZ386Ce6TPOxInOK9+b6pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="235192602"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="235192602"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 4F4BC1C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F2EC81803206
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2BFBA101BB6B;
	Wed, 25 Feb 2026 09:37:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/33] catch2: upgrade 3.12.0 -> 3.13.0
Date: Wed, 25 Feb 2026 17:36:59 +0800
Message-ID: <20260225093727.1284-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124617

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/catch2/{catch2_3.12.0.bb => catch2_3.13.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.12.0.bb => catch2_3.13.0.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.12.0.bb b/meta-oe/recipes-test/catch2/catch2_3.13.0.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.12.0.bb
rename to meta-oe/recipes-test/catch2/catch2_3.13.0.bb
index cd51686c0d..c5d85ba302 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.12.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.13.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https;tag=v${PV}"
-SRCREV = "88abf9bf325c798c33f54f6b9220ef885b267f4f"
+SRCREV = "29c9844f688acb27c87338c39cd186ebfe41aa19"
 
 
 inherit cmake python3native
-- 
2.43.0


