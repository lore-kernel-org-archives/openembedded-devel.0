Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750B5EFD233
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41958.1772012309823094843
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lP7mn5z1;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012310; x=1803548310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LxilkpnNBrhEHyztldGGxtEbWysQwHa4JK8BfpZ9TKA=;
  b=lP7mn5z1jzwaSp+RmmedqBSsD053tYryPsW3q6qyHEur4Jz1lWaH/gie
   kvOMr+g26si2rPnBLFr7tle5Ac2GrJygAsm6JLbzAlCWXV84cbP0FgLJ7
   AoZ6SQOsbK7yDEW4pGn/awmRAXma37grJ+Ur0pXX8OQqoO6NB4PsplMCG
   lkZxb8rlxkWkzXOlYIMWUHdlH6j34+jViFr8DmrOJITJcWnqKU8DE+ONQ
   9vJ8+M+rtSEXCCrVtd8mge/mdPUfDAbHijoNTsRRahtW7Y6l47eAViRYV
   RasK0ax5XfKDK/YmJmdgIi0ZwrKJJN1MFDiN/5YrduuGk5FC9BaoF/fJ2
   Q==;
X-CSE-ConnectionGUID: c/+NEiO+Rf2riEoNKZNJQA==
X-CSE-MsgGUID: BjVo6MU6QEK5bkyMa3gSLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="219620611"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="219620611"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 6CBF7100036E
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:28 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 218431004146
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4B3A2101BB42;
	Wed, 25 Feb 2026 09:38:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 26/33] parallel: upgrade 20251122 -> 20260222
Date: Wed, 25 Feb 2026 17:37:20 +0800
Message-ID: <20260225093727.1284-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124638

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20251122.bb => parallel_20260222.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20251122.bb => parallel_20260222.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20251122.bb b/meta-oe/recipes-extended/parallel/parallel_20260222.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20251122.bb
rename to meta-oe/recipes-extended/parallel/parallel_20260222.bb
index c2775472d7..cf01b783bb 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20251122.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20260222.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "368d1982cfd9dbebb8cd0e444de6199559df94ac2dd1edf95f74350f0af1e84d"
+SRC_URI[sha256sum] = "c6272a48972a0f2fdd3f39560d698f3c5abd3d8a4de40d52f9772f3a03ae1f48"
 
 inherit autotools bash-completion
 
-- 
2.43.0


