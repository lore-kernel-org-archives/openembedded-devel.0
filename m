Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73A1CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:59:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web10.15060.1758628758978212948
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=mFtTZOV0;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628760; x=1790164760;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fmnx+qIjh3o3gfpUjwLTkBO8Z8nZL4P1xCFhEtcTO7A=;
  b=mFtTZOV0lfxiKoDz8I+i4aC8EC11CZ17vfy+7kMLYPoBCvqxBosrWswp
   JtKSeSsmPW0W4nbUVRipUIun2hriRUnlrx0I3MqZcfLv7P2kHiC0u7isC
   JBXopa5SCIAAV0HmBsWb2fwnEc+Y3//aqGaiOY7imFo3HSyOcJ5dgcNEu
   0Ztq7atd4d/XRdt2W/ar/4p97dySvABY8NngMU9PK/U1h70In+g0oNLef
   0ZG5+R3tjY2nyjdtGeIngSt0TxJ5fEa38hRjAFTcFsNcc76zlmd1uUS1L
   hY/BKz4hqOC/4cFJrQ94R27CGjegOxcIluz3iPWBGV6mpGKeF/RzeDdzW
   g==;
X-CSE-ConnectionGUID: qBfkgGSvTsKWa1LwmyW9jQ==
X-CSE-MsgGUID: SFr3G5UeSwKEgziAqQzR6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821839"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821839"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:17 -0700
X-CSE-ConnectionGUID: Wi8lP01CSz6dd4Q59G5ulw==
X-CSE-MsgGUID: Bfp70X6gTfiW8u8wRZ6+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875261"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 24/24] ssmping: Use debian mirror for SRC_URI
Date: Tue, 23 Sep 2025 19:57:27 +0800
Message-ID: <adcb6e98419f07da5be085b8997da7f69146b743.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119713

From: Khem Raj <raj.khem@gmail.com>

Original URI is not accessible anymore
Drop md5sum

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ceb91603415c6e059d866666574dd1be5b93867a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
index 0531ffe640..307120dc75 100644
--- a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
+++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
@@ -4,10 +4,9 @@ SECTION = "net"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://asmping.c;beginline=2;endline=11;md5=1ca8d1a1ca931e5cfe604ebf20a78b71"
 
-SRC_URI = "http://www.venaas.no/multicast/ssmping/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz \
     file://0001-Makefile-tweak-install-dir.patch \
 "
-SRC_URI[md5sum] = "ad8e3d13f6d72918f73be7e7975d7fad"
 SRC_URI[sha256sum] = "22103a37eaa28489169a0927bc01e0596c3485fc4d29fc8456c07fd2c70fca6d"
 
 CFLAGS += "-D_GNU_SOURCE "

