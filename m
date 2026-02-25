Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3E6EFD222
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:37:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41945.1772012262765241123
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EqkRyKr4;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012263; x=1803548263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0+hecjDYOc8Uwy4jJbeCrj3umU1pvbzYfslk1mOQ9Co=;
  b=EqkRyKr4qrjaD+y7AlzdiSR1mD/K6JPTF0ZK52BCqu5xv3pl+5uJUMOg
   o2C1gSTTiEwaW4bvELK1Z9kKiKTc7w56j/o6A08RHMhprscM8tNb7EbQB
   CwJ0KxiuMPi6p3DxkzxQmBD7LvoftkaTX299mG3zyQmDMeeM1F+hc6WiI
   r3jYpKtr3mRnC3p3oprw2gcG4/e5oqWV1/H8NTaXtFythZumFuyhrQUVz
   FXBG95VDsMXCFk5nzvHW6vuFaIye0LYfStDvJcly6x9UzjRxvPAeEcHkz
   kOgIXmJXsYgcctcw8mtzoReB3XPpr60ib3EAl1qUjgEKqnqksW1Nyn9v9
   A==;
X-CSE-ConnectionGUID: yK6mH+krT0mwxhu98/ACrw==
X-CSE-MsgGUID: CxRwUG1UQTOqSOGevLaQGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230416676"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230416676"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 29A984071C2
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:41 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CC2091C00121
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 06C29101BB76;
	Wed, 25 Feb 2026 09:37:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/33] byacc: upgrade 20241231 -> 20260126
Date: Wed, 25 Feb 2026 17:36:58 +0800
Message-ID: <20260225093727.1284-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124616

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../byacc/{byacc_20241231.bb => byacc_20260126.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/byacc/{byacc_20241231.bb => byacc_20260126.bb} (65%)

diff --git a/meta-oe/recipes-extended/byacc/byacc_20241231.bb b/meta-oe/recipes-extended/byacc/byacc_20260126.bb
similarity index 65%
rename from meta-oe/recipes-extended/byacc/byacc_20241231.bb
rename to meta-oe/recipes-extended/byacc/byacc_20260126.bb
index 8d74dbb83e..cf58f4025c 100644
--- a/meta-oe/recipes-extended/byacc/byacc_20241231.bb
+++ b/meta-oe/recipes-extended/byacc/byacc_20260126.bb
@@ -4,7 +4,7 @@
 # Setting to PD as this is what the upstream has it as.
 
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=6a728308869d7a7901618a5bcb970f7e"
+LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=0eedc51db8ab59ff33e74b4e8138035c"
 require byacc.inc
 
-SRC_URI[sha256sum] = "192c2fae048d4e7f514ba451627f9c4e612765099f819c19191f9fde3e609673"
+SRC_URI[sha256sum] = "b618c5fb44c2f5f048843db90f7d1b24f78f47b07913c8c7ba8c942d3eb24b00"
-- 
2.43.0


