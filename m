Return-Path: <kartikey.rameshbhai.parmar@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A1CC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 08:35:35 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.23971.1644395734339913843
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Feb 2022 00:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IhBmLCZR;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: kartikey.rameshbhai.parmar@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644395734; x=1675931734;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T+BXFpcJZ9R1woUo9STZD2y76NZGXEC8WEu/idy/u1k=;
  b=IhBmLCZRvEP5qGdLGRa0lcGHybXpL/I1ABwGs5jvtDf8xMV3Xuzh3zti
   jcaldgNYM1tQr/CMpksHXRzrz+JeLJ76/mq4VTNng4U5nUbXbtZA2SEYE
   l0Sb2x1HKboUKyOv9cbwzygIMJ8hxms+rytW15Jlffl0JJ59riYXRjiRJ
   EKdSNd8CfWUKCBI5GSfTWjYROLlSZOk6yXCtaJOHUPKgx2QAYfHSuWxmp
   xbDcmbX5+Q1KCXkjJX+BlXjZT01VCH3aWOHyUbH/fZYEsTdLPf8MsFkmF
   zPnnQuk3bCB/OLEXoylBsxYoigYngVvMG/6+TTeJftVSk4jF20kdir18C
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="249362277"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600";
   d="scan'208";a="249362277"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 00:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600";
   d="scan'208";a="525905360"
Received: from ubuntu161tb.png.intel.com ([10.88.227.41])
  by orsmga007.jf.intel.com with ESMTP; 09 Feb 2022 00:35:32 -0800
From: kartikey.rameshbhai.parmar@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][hardknott][PATCH] libsrtp: update SRC_URI branch to
 main
Date: Wed,  9 Feb 2022 08:35:22 +0000
Message-Id: <20220209083522.4370-1-kartikey.rameshbhai.parmar@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Feb 2022 08:35:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95275

From: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>

master branch on the repository has been renamed upstream to main.

Signed-off-by: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>
---
 meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
index 9197a842d..e26d11b68 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_2.3.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2909fcf6f09ffff8430463d91c08c4e1"
 
 S = "${WORKDIR}/git"
 SRCREV = "d02d21111e379c297e93a9033d7b653135f732ee"
-SRC_URI = "git://github.com/cisco/libsrtp.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/cisco/libsrtp.git;branch=main;protocol=https"
 
 inherit autotools pkgconfig
 
-- 
2.35.1


