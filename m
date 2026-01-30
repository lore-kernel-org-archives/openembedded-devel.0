Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11504D49C93
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 09:57:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7190.1769767020005200994
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 01:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O2FQ2ZB5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769767020; x=1801303020;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=C/e+qQ2ZiH1yFp/VXqlR+U1GA84PfYTNJcFLa8ymeLg=;
  b=O2FQ2ZB5LI53zUVz6QSSh03kLyPHD9u1rfuWNIXpyMSKxZZLsPlDOyP5
   GvwBm+LBwYLTD+eH+2kDFUnKZPhyTfTG8GeAy8IBqlXqpPJFYWOxcpWxr
   uSR8yiImruHcVnXFDPsT7tp4PYNdiSq2HnGel+ltYnDWofG5QE0XZIZ2P
   2E3Jji7kC6xqwnumYK2Pc5pIJRcfNktZqfdDWKWGoVWWxiurhlIrGyD2B
   VSVu2lHzsWU9IuA4vHKmAToq0Rid3PQqTk6rd687W+W6dpPxdPHj0vnwf
   IDaxrw0d7abHfZa6jJU3bN/45Nb110sDUyKkTDhHclhOTPY3ZQbmoxoy0
   A==;
X-CSE-ConnectionGUID: 0Z8WA52ATJSJ7ATOim1zUg==
X-CSE-MsgGUID: UAzWO+fORUyMOEwnMVVeJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="231959685"
X-IronPort-AV: E=Sophos;i="6.21,262,1763391600"; 
   d="scan'208";a="231959685"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 18:56:58 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 461A781DA
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:56:58 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id EFB201000245
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:56:57 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 99CA1140012E
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:56:55 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] qpdf: upgrade 12.3.0 -> 12.3.2
Date: Fri, 30 Jan 2026 17:56:53 +0800
Message-ID: <20260130095653.11586-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 09:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124011

ChangeLog
  https://github.com/qpdf/qpdf/releases/tag/v12.3.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_12.3.0.bb => qpdf_12.3.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_12.3.0.bb => qpdf_12.3.2.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.3.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.3.2.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_12.3.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_12.3.2.bb
index 9f89913ad6..68fb0d4f6b 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_12.3.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.3.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "e1af26a3a76336113e3fc9061df32d7a58eb7469"
+SRCREV = "a898bb3a7289d1d05789d6d3f0d5dd534943a8da"
 
 inherit cmake pkgconfig gettext
 
-- 
2.43.0


