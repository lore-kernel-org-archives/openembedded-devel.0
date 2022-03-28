Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7857EC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 12:57:45 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.10494.1648472263455987272
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 05:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=ZjRhbshy;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648472263;
  x=1680008263;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=54SBOe2GIFb9KQjyfWvySIJZot8vL4acb5YhXD3p3bE=;
  b=ZjRhbshyVCSCY0/5H48XX4C4GzFO0NdO6hahgLFfMcAMrxRjlzXOSFa7
   pUU30tksSVqSrKdoKpYHtux/iZva8sQAU87nVXFj6Iqc6GeoFpLFqdjbW
   3Ltmvj7pB9p6E3uYWxqhY6Ns41sqp2CP4TtN8pOLRMvR3gRd1wI/wRwbx
   nQrSHbc0pyU48vOIBHHEk+rKo7IZsaZZ3tU3rTJ9vKMT9av+e1bO7iHzs
   fsEznq98HXbqbWuA95KUc1rrjsT+uHHdvumEij2cNk0eJS4JD1rsUhSOp
   qN2ARUKLjz7dgfFEtwOIuRqtM6YVjMc0dgLrmRROq9+fmoLysCW+05bbs
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][honister][meta-multimedia][PATCH] libsrtp: Switch branch
 from master to main
Date: Mon, 28 Mar 2022 14:57:38 +0200
Message-ID: <20220328125738.23172-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 12:57:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96239

The master branch has been renamed to main in the github repo.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
index 5b4f34592..b494a3ca0 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 
 S = "${WORKDIR}/git"
 SRCREV = "d02d21111e379c297e93a9033d7b653135f732ee"
-SRC_URI = "git://github.com/cisco/libsrtp.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/cisco/libsrtp.git;branch=main;protocol=https"
 
 inherit autotools pkgconfig
 

