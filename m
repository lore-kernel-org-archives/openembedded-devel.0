Return-Path: <kartikey.rameshbhai.parmar@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC39C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 08:21:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.23860.1644394901980758915
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Feb 2022 00:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HLWB9WWl;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: kartikey.rameshbhai.parmar@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644394902; x=1675930902;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5OJw/aeEYVRyw8IiB05dqp/WJIgtEXomF2bG2Hxl/04=;
  b=HLWB9WWlSe5cqlphtiFr0t7Fuhau2sBvLJCB4jxDZTZaijAiRBvW5e7A
   eo9h+OeWxb/VVjX9g9IeOZUSWcfBE5rKan3hgrfR5FRCMmGGJqkZh9YQp
   5vPvAy9uiIZ06TkU82J2I5bmecF5V5leQNO1JP+YVzvgyic6b3dyubliZ
   1a+FEUq+QDfp3aYDaogw8lyu7+NmD8kwuUKxs0FG9zbB/dTFjWiDOrN2z
   QTCSLekYgHQqPzDEBJsa3BbS2U/CRJza9Z/i4qntdK9eqXO00bH0uJqab
   Szt1LYjFsSkfiGcPCOGdLb2KkOU90K7U7ZdNhZRCnMzJa9U1eQpIJdrMK
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="335555410"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600";
   d="scan'208";a="335555410"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 00:21:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600";
   d="scan'208";a="773419964"
Received: from ubuntu161tb.png.intel.com ([10.88.227.41])
  by fmsmga005.fm.intel.com with ESMTP; 09 Feb 2022 00:21:40 -0800
From: kartikey.rameshbhai.parmar@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][hardknott][PATCH] libsrtp: update SRC_URI branch to
 main
Date: Wed,  9 Feb 2022 08:21:30 +0000
Message-Id: <20220209082130.4291-1-kartikey.rameshbhai.parmar@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Feb 2022 08:21:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95274

From: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>

master branch on the reppository has been renamed upsteam to main.

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


