Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7AB2CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4820.1761099770140278199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R1QVUT/p;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099775; x=1792635775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dzAQ22824yC3ugh/p0QMY1YcXJrGbSSiHJ9WBThPLPk=;
  b=R1QVUT/p5C8GOEBygllzrdTNkDmIyLpxqWApi8vquU/fz7ptPcSp7c3o
   tGrYA9/u3HvzvkQHcLodX2pFWjyXStcl3tt21EPLhZW2crg3DqsN2Ryqp
   rYLmh+4bezpOfLh5q9poz6foBObzlPsNr+wF9FNmlzlLalYzA/BsIn/vr
   zTTqngfibeHFAJqWvF6AKSD6Rjp1MCpvlrWaGs6xPFnEZtcuLHFNLmRcD
   OwvH49Vjs487AdwBJsgBQLa40gEwGOOFnmZ9R2F7FFadlhxBOdOjaYVCp
   RDnlBaeP+3zw7YFLGWcNVKPMdE+hQFVeP65OJ18I+HvxPX6pGhjrPLD0l
   g==;
X-CSE-ConnectionGUID: t/j72KXNSSG+rmV7l4IFLw==
X-CSE-MsgGUID: Ou3qJdxGTPmJ4NdzoLD8Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="195536270"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="195536270"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id CE5FC8204C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:54 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 85ACCC01809
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id CB4C282C0DC;
	Wed, 22 Oct 2025 02:22:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/29] pv: upgrade 1.9.42 -> 1.9.44
Date: Wed, 22 Oct 2025 10:22:07 +0800
Message-ID: <20251022022227.226-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120858

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/pv/{pv_1.9.42.bb => pv_1.9.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.9.42.bb => pv_1.9.44.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.9.42.bb b/meta-oe/recipes-support/pv/pv_1.9.44.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.9.42.bb
rename to meta-oe/recipes-support/pv/pv_1.9.44.bb
index f60460c025..2cc1f0b229 100644
--- a/meta-oe/recipes-support/pv/pv_1.9.42.bb
+++ b/meta-oe/recipes-support/pv/pv_1.9.44.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "fbd7d1b04efee62c8241255a3fe1c5f5236f1a6e1ed85f02730b0c6448810175"
+SRC_URI[sha256sum] = "e130c9e18b1e6e9e2ef95bec6117c72cb9be27a1b8ffe97fca787e4c8e014562"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


