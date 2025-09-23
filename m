Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956D5CAC5B4
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=UQXhJqFi;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628679; x=1790164679;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Ukq1h58SaJMw9nL8p03wwl18HXDal0fp13ZdXy2wb+g=;
  b=UQXhJqFiEnb1bTJosalTgg6ChJ4cGI7KwsNSOSeZJxwH0HBWir1Jg/i4
   ZJ9S8djLwfhTqFTWk17JSFbWwVNrmYJJ7uwSXH4lhB3VW+5ZMb56GY5xI
   Ik3qzmLoHFG5M84G39f34FLB74u2BJOVBtPPSZjh+gEScGJQEW16sABBQ
   I5FSd7Qv0vTy1dCh4TMZvo5KBn7+1bKoqYQj2BPAKtTCqXgrEy9Mx0ehv
   1BYLVUAmO3fTlamxKDXJjhRULyNU2YYOfmsSjn95O/GPeBK21N+WsdPbB
   mroE7SmsVG6FwkR223e5jeP8ZUsv/cUDfIzJo8QsjNUtQPTLPiRN7b+ds
   Q==;
X-CSE-ConnectionGUID: LAV5tiZUS8iwEeGD8wP0lA==
X-CSE-MsgGUID: rVbkY9flT3u50E9NcKWJ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821794"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821794"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:59 -0700
X-CSE-ConnectionGUID: 10MOnep+Txm4U5+RFfaypw==
X-CSE-MsgGUID: mI/YjQUYR5mBXYrQFNkFPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875189"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:58 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 12/24] apache2: upgrade 2.4.64 - 2.4.65
Date: Tue, 23 Sep 2025 19:57:15 +0800
Message-ID: <a5de2a57285b1332983d92e5c2cd0c9cb0a8e382.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119701

From: Archana Polampalli <archana.polampalli@windriver.com>

fixes CVE-2025-54090

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.65

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index f587935b8f..34526fc78e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29"
+SRC_URI[sha256sum] = "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3"
 
 S = "${WORKDIR}/httpd-${PV}"
 

