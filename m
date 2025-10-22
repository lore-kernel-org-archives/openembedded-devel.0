Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4B3CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4820.1761099770140278199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HGPhT/dE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099769; x=1792635769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8+m8D0A9dVJmN+jmOZTQb59bGbGs9GLY3SXvLHGhgjU=;
  b=HGPhT/dEnt6ETkKAxWvVcNsnHkPaZ5oD90coad1sIvDcPQs3wgBDF/JZ
   1PDeiE/Z3o0IHLDtGb8e8/rQMSOPyeYaTy0wdKXUlM/rO3DH1Fvk86n9M
   joUCqm+w1hgOutFbZe2djQKGrWIU8ZD8YxU0cYLh9EEX6MiU26Vt1VLbg
   Xm2QMfB88orzjLfqf560talGuU3ubUxA5ORWtZNKn38cKqdmCe5yVEGa1
   qteIPS+5Hr2L8jEd4UdmfIMNNDIy/7mnQYDF2NVssWsUJNGrDaZymlH6z
   8+JIghJOFnU9hSRcS630vi7Tp+rumMGndeK2FnV6lnn40UAE3xVdMLY2g
   w==;
X-CSE-ConnectionGUID: Vj8D340YQRO5cA0A9dnWAQ==
X-CSE-MsgGUID: sBoulNCHST+njD5g/xIc7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="195536251"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="195536251"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:48 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 990CC42A306
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:48 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 54CC8C006FE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B5F5582C0DE;
	Wed, 22 Oct 2025 02:22:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/29] liblognorm: upgrade 2.0.6 -> 2.0.7
Date: Wed, 22 Oct 2025 10:22:04 +0800
Message-ID: <20251022022227.226-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120855

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liblognorm/{liblognorm_2.0.6.bb => liblognorm_2.0.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/liblognorm/{liblognorm_2.0.6.bb => liblognorm_2.0.7.bb} (87%)

diff --git a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.7.bb
similarity index 87%
rename from meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
rename to meta-oe/recipes-extended/liblognorm/liblognorm_2.0.7.bb
index 89670d10ca..6de22d392f 100644
--- a/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.6.bb
+++ b/meta-oe/recipes-extended/liblognorm/liblognorm_2.0.7.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ca016db57e008528dace002188c73dad"
 
 DEPENDS = "libfastjson libestr"
 
-SRC_URI = "git://github.com/rsyslog/liblognorm;branch=master;protocol=https \
+SRC_URI = "git://github.com/rsyslog/liblognorm;branch=stable;protocol=https;tag=v${PV} \
            file://0001-Add-asprintf-to-autoconf-function-check-macro.patch \
            "
-SRCREV = "46c6ee4c8e5f827893e485a4ef1aff04ea881273"
+SRCREV = "3761794fc0d3b0a9fbfe4daa14a545063f48ce6e"
 
 
 inherit autotools pkgconfig
-- 
2.43.0


