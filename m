Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1ACD2D8D2
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:48 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7133.1769507082669502987
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aGGao/D8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507083; x=1801043083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XNWU4zvQcJ9JQRXm4/Ng2OAM5GlkjjAgrc8RAcISDgs=;
  b=aGGao/D8+G660uw8p9jnCSaQME6yAn0ftxuk1d5dH3Pu66qyzRzW0DbF
   5wkVwrdYLgCsmG7haKQrnEeU713sv12lKbcAMDTjrs8w08IhLk44xIt2s
   OcKc+NmmJcWsWt0j+JWMD7WYlaYsUrvrk1PNO71WhRQXgcBiKhEXu0ovb
   R2EjNf9YdhNrvdjnAwp7u01g/Qd8nmdX7Y4IFXDVHAwBv3f7pMf1E9gqg
   jBUs7zmjY5MRNaHHGa/ueczvQV8XaJt88lbGyzhQTN8CXlCxgcvU+zS6u
   kzTtqbvh/AHRuWqbEjxjEn6UPqqq5Q4JI9cNXrvHuhcCfISeEfA60aYZf
   Q==;
X-CSE-ConnectionGUID: jNbXaBmeRwOowqpb/T1xtg==
X-CSE-MsgGUID: F3h6DcmATwWHKqveUlqwzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227279347"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="227279347"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:01 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A36731461
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:01 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4C96C1C00F96
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id D0F8220000EC;
	Tue, 27 Jan 2026 09:43:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/25] iotop: upgrade 1.30 -> 1.31
Date: Tue, 27 Jan 2026 17:43:22 +0800
Message-ID: <20260127094339.1081-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123929

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 1.31

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/iotop/{iotop_1.30.bb => iotop_1.31.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/iotop/{iotop_1.30.bb => iotop_1.31.bb} (83%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.30.bb b/meta-oe/recipes-extended/iotop/iotop_1.31.bb
similarity index 83%
rename from meta-oe/recipes-extended/iotop/iotop_1.30.bb
rename to meta-oe/recipes-extended/iotop/iotop_1.31.bb
index 9fe774f9f2..f37b5a5dd3 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.30.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.31.bb
@@ -1,11 +1,11 @@
 SUMMARY = "A top utility for I/O"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3154adaa1a9ca0d8dcc1944518ece1b9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=26b36b714daebf72b11715ba73efbad4"
 
 DEPENDS = "ncurses"
 
 SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "c3366a8a235f9c8ddc4797625f22cfdf12ba2c36"
+SRCREV = "57890d671ba69ebc4a619a1cfe7d76cdd3d836a8"
 
 
 inherit pkgconfig
-- 
2.43.0


