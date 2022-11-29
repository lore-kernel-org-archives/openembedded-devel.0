Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F148C4167B
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 04:02:34 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.140852.1669694552324670611
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 20:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=V176fKkH;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669694553;
  x=1701230553;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BOoyvGrx3LNmAsL0xdECQXma+HWXAQgO+zEIbjUwlZ8=;
  b=V176fKkHOhN+Y+6owdvDMNl56Y/TAtjWNqT5s20v2kX+32hel4Zfp/wb
   zPKZAvBG/80MDpg0R0+gukedZ+RpHLUC1mLCIZSRhrU4olE8sDTY7YpJM
   3x+Pe1YyHyjD/l/+flm0jVTW0oYpDki2O59w8rVYrcF5Pm/34E+IlbHi/
   7P3GbYDKJ5A/RCLChSevdbebCZTAC6R/hioqoU0lpgsX0HsRKVZnqZeKc
   9lAjOW4gu8waFPDCv4NMTx1EiKQjQD4xnJfX9uM6fKUdNZDdin6ZgnXBM
   XHJ2XQeVLyMtGyI/LDFbsE/HhLQS53y8TvrKcamw1wzEjMRHIlvHBTq3s
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 1/2] Revert "lldpd: Use github release assets for SRC_URI"
Date: Tue, 29 Nov 2022 05:02:04 +0100
Message-ID: <20221129040205.2142015-1-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 04:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99835

This reverts commit e1549147181d96e84b73b7fc952cf33e43bb007c.

The change of SRC_URI was probably triggered by the checksum for the
tarball not having been updated when the recipe version was stepped.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
index 6638de1ba..c7237d74b 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/ISC;md5=f3b90e
 DEPENDS = "libbsd libevent"
 
 SRC_URI = "\
-    https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz \
+    http://media.luffy.cx/files/${BPN}/${BPN}-${PV}.tar.gz \
     file://lldpd.init.d \
     file://lldpd.default \
     file://run-ptest \

