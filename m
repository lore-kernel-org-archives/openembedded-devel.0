Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C98D0C82B
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:01 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56078.1768299895947863579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cIYHjXY0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299895; x=1799835895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pw5HcLs/jZ9xZn+dFFY/pULBy2KcWoUXsUxUsYUvv6I=;
  b=cIYHjXY0WZADbj/ell94e34YdDAz9YfLpxlZAgbeg515EhC36RztGdMv
   9oORV5kdVUQeiaXGE2fPR3KicVHfCQH2b/s8wKDliermc9GzUf81i5Ufl
   PLesrjSnyGHhP8owppkDfMNwgaq6VYc5s4FupgdwM8ElKuGtbAjEPdCaM
   WrOObghqBOHBGx5QrNJ/w1TyUaN7k7+A7vlU6UTIlb0hDxOhp3WJ+STER
   dP73raaszXU7gWkOSRWCFEWNTFSKRynNAf0qRJwWzDJH3L15xPb3HWFtX
   uDjmrQiuqOu1Fc4/BKpE7M65zKryyRlcqK6rHeMs37A1xmISZOKvOlALv
   A==;
X-CSE-ConnectionGUID: vTB1DIWLQD+uPa2+0VyETg==
X-CSE-MsgGUID: U+X4dZaOTe6QNRw8F0OV4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225618041"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225618041"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:54 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 5936A1C1C703
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:54 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0B3FA18000A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2FF531019049;
	Tue, 13 Jan 2026 10:24:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 22/22] qpdf: upgrade 12.2.0 -> 12.3.0
Date: Tue, 13 Jan 2026 18:23:34 +0800
Message-ID: <20260113102334.605-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123428

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_12.2.0.bb => qpdf_12.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_12.2.0.bb => qpdf_12.3.0.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.3.0.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_12.3.0.bb
index 663c60affe..9f89913ad6 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "856d32c610334855d30e96d25eb5f9636fb62f08"
+SRCREV = "e1af26a3a76336113e3fc9061df32d7a58eb7469"
 
 inherit cmake pkgconfig gettext
 
-- 
2.43.0


