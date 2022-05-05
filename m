Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70597C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 02:56:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.6557.1651719374517563046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 May 2022 19:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=T2LBN2bl;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.115, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651719375; x=1683255375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Q6HXHXmUO8r7rSywsZonzxMJw3nop5rra053/nKcI8=;
  b=T2LBN2bl2i5IziPkOenG4+Ds0AKEHwiooM2LUP8hWHawURUvNgAYOmI6
   XVdLJ5qkAfyLuZHcIVD/V6F8Qo1NaeeOy66TRMFVcJQi8P3oEYeudE13I
   yYhlhMkuiHNgJjKpYXn2zdP/BepErE+acQjy/0CKIEYixNYgmRPO391BJ
   aABEHpHSBBmtqPdHFJ1sktDYPC2QLhCLgT415ZSeEiZLiQafttgpuJr9T
   OP1XGvHaAFAelFR0gxfwBzZUebKHcG7Uyk9tiEm0xTcXIiS58nx8o/OKq
   ufTVmcZIOPNbYam5V17mqjzDmu6fwsrB+HI5bdnxmp2F+N/Uws67a6C6W
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="268120249"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600";
   d="scan'208";a="268120249"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 19:56:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600";
   d="scan'208";a="563024799"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 19:56:14 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-oe] [PATCH v2 2/2] openldap: Upgrade 2.5.9 -> 2.5.12
Date: Thu,  5 May 2022 10:55:53 +0800
Message-Id: <20220505025553.3019552-2-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505025553.3019552-1-jiaqing.zhao@linux.intel.com>
References: <20220505025553.3019552-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 May 2022 02:56:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96958

License-Update: Copyright year updated to 2022
Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 .../openldap/{openldap_2.5.9.bb => openldap_2.5.12.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.5.9.bb => openldap_2.5.12.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.5.9.bb
rename to meta-oe/recipes-support/openldap/openldap_2.5.12.bb
index 958a21b9c..e4475e506 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5cc6ef74da4ad25d707c4f5903d64975 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=beceb5ac7100b6430640c61655b25c1f \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -25,8 +25,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch \
 "
 
-SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
-SRC_URI[sha256sum] = "c08e12f4ca5803d5d9f9948c70ad3491282cda3c17ec8b655dcbcb2364e6fb9e"
+SRC_URI[sha256sum] = "d5086cbfc49597fa7d0670a429a9054552d441b16ee8b2435412797ab0e37b96"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.34.1


