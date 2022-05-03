Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89006C433FE
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 09:17:13 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.8841.1651569427599219807
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 May 2022 02:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=K6OOc8fP;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.20, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651569427; x=1683105427;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jy/+pKNgzMzMnZkb/2FEcb8gdzZ/qvTJ4BxVslryzqs=;
  b=K6OOc8fPJ2MatXiwvIo04WE7NtCIbB6h0iN8MA/g8aafwoplwrF7CYjf
   XlBsuhfPM9naFKVzpXZQr7zDXoLAItn/vlteYnSxnTNqEUfsaWpB2NCAW
   BdtcuGkISjjBaIv6CEf3zERzYwj1v/egl8SXvj+PYupi+vuqOyqCuM4u1
   DUKp5QtzIYF2p/bkQvG6ViNqzCmKkyvsYYNBvt+h1t2FjOquoXRDa6cU4
   3IXurYKD2TgS/yAuJfOU6SVEfXeEQ3fR2XSUlaRqPoTKRWJFSaHya6oce
   FQu6RAwDJt9Gif2TJkj1fRQeRtZnHzZdR3t+cF9fh9BlTpBfIhw28I73K
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="254897493"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600";
   d="scan'208";a="254897493"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:17:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600";
   d="scan'208";a="562140521"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:17:06 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-oe] [PATCH 2/2] openldap: Upgrade 2.5.9 -> 2.5.11
Date: Tue,  3 May 2022 17:16:44 +0800
Message-Id: <20220503091644.2507658-2-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503091644.2507658-1-jiaqing.zhao@linux.intel.com>
References: <20220503091644.2507658-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 May 2022 09:17:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96948

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 .../openldap/{openldap_2.5.9.bb => openldap_2.5.11.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.5.9.bb => openldap_2.5.11.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.11.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.5.9.bb
rename to meta-oe/recipes-support/openldap/openldap_2.5.11.bb
index 958a21b9c..cc84d8d86 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.11.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org does not record this license
 # at present (so it is apparently not OSI certified).
 LICENSE = "OpenLDAP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=5cc6ef74da4ad25d707c4f5903d64975 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=beceb5ac7100b6430640c61655b25c1f \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch \
 "
 
-SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
-SRC_URI[sha256sum] = "c08e12f4ca5803d5d9f9948c70ad3491282cda3c17ec8b655dcbcb2364e6fb9e"
+SRC_URI[md5sum] = "c7205085cd4192cf95d0df6f5afa510a"
+SRC_URI[sha256sum] = "9514b07776d09f2e39aa75857395cd5634dafc209b526adb2abcb6f1c611d7f1"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.34.1


