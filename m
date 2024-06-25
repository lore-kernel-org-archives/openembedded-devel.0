Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD696C30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 09:39:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web11.167524.1719308354268903561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 02:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=cVXMhK8m;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719308354; x=1750844354;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fWt5hYcWRTk3K8PoUInxyq7oqS9ABc3oIND6AtMK9YU=;
  b=cVXMhK8m/rkH+5HnwQp19kDM/NgJyIUMFiV1+mzZSVi3uDEydRCHg0jO
   R5PEn3IUdvfAwzRGBR+O0r+d0TnNHYUnGfubnXZqINUN1ISXrD9nD+yKD
   GLwW1/C8688y/JhLr+Rh3yWgd9uUzFr5lx7QNeaOmrUxrfPeFUR5gxtrv
   HjSAhz4513F2+xOpYuOSf4gJ6Z/K2j7h3DDhwkW6slGaouvVQ4ZebGjz/
   ZcqBokkEMjoB1OxM6F44D5mS4KJiorbpmQzwP/PaspoeuHWr0Y5ryxZRu
   XIR+PgA8UP4/WCPaZoZleNVyaccq+SHBJrsBdscx7X0BexpdQmSsun9KP
   w==;
X-CSE-ConnectionGUID: Dxms1MCPQhytr9Bqr6Llwg==
X-CSE-MsgGUID: rA7g99FpR3+ZCjAqDG/kSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16140184"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="16140184"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 02:39:13 -0700
X-CSE-ConnectionGUID: tE8lQvP0QnaANXZ3GkPYdA==
X-CSE-MsgGUID: MT2PR5ryR3OvM/LGZf2yJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="74792020"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.249])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 02:39:12 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tbb: pass TBB_STRICT=OFF to disable -Werror
Date: Tue, 25 Jun 2024 17:39:03 +0800
Message-ID: <20240625093903.52671-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 09:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111071

Don't treat compiler warnings as errors to avoid failures when compiling
with newer versions.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.11.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
index f834726bd..0f9f02655 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
@@ -25,6 +25,7 @@ inherit cmake pkgconfig
 EXTRA_OECMAKE += " \
                     -DTBB_TEST=OFF \
                     -DCMAKE_BUILD_TYPE=Release \
+                    -DTBB_STRICT=OFF \
                 "
 
 # Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)

