Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF16CAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lNcOpjlE;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628676; x=1790164676;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tTdDaGaHLxTwNIqcJoYSyF5N6h7sYH5/O+WatQ8zt+s=;
  b=lNcOpjlEcPHffVRHsMid6hFvTcoHw+fLHUT65XWce7ovFVjKPQIu5V8v
   TirmcViBXMRcP+/uiEiOvJB+iwRT4g3+PlZvfoeYeJlhkEYkUqgVQhxBK
   P75fBN5kcAhqUFSyk5IbjYdnwmubAUlWXF06+9TFf6K+BU/4xL14jth0D
   INznAVQhhq20JCPtfmiZe21ffKBuIpp+FGu9ydZBcY8KuudqRjAO4KZSM
   5vYSY4P22CEFq6M/3lsCjQFw0vPxZKPnToihrYELoljnzld4+fz5EPnW7
   qoO/8G8kuRSP/VZ37VNEKnR05luyng98l6vf2QCx0U5BIUra1HbBYspD2
   g==;
X-CSE-ConnectionGUID: BN+e1qC6R0Whdw8dTqhbTg==
X-CSE-MsgGUID: +Ja9KSP8TQmedi3bg7QK4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821788"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821788"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:56 -0700
X-CSE-ConnectionGUID: V78hb9ujRFex3ZEW8PQRlQ==
X-CSE-MsgGUID: Q/mbNopwRAKJSP5x+3tLog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875186"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:55 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 10/24] meta-oe: image: optionally remove RAW image after sparse image creation
Date: Tue, 23 Sep 2025 19:57:13 +0800
Message-ID: <385b1baa2b2aa5d65d0db5852b3dbefa94f57abf.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119699

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

When creating sparse images, the RAW image is no longer needed in
some workflows such as Android and CI pipelines. These RAW images
can be multi-GB artifacts and consume significant disk space.

This change introduces a configuration option
`DELETE_RAWIMAGE_AFTER_SPARSE_CMD` which, when set to "1",
removes the RAW image after sparse image generation.

This reduces disk usage in builds where sparse images are the
final deliverables and RAW images are not required.

Default behavior is unchanged: RAW images are kept unless the
variable is explicitly enabled:

    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "1"   # Delete RAW image
    DELETE_RAWIMAGE_AFTER_SPARSE_CMD = "0"   # Default behavior

(cherry-picked from f5246b7df447ac76ec04c6e5add398862d1c9ccd in master )

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/classes/image_types_sparse.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index d6ea68968e..5416c2a019 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -9,9 +9,15 @@ SPARSE_BLOCK_SIZE ??= "4096"
 
 CONVERSIONTYPES += "sparse"
 
+DELETE_RAWIMAGE_AFTER_SPARSE_CMD ??= "0"
+
 CONVERSION_CMD:sparse = " \
     truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "${IMAGE_NAME}.${type}"; \
     img2simg -s "${IMAGE_NAME}.${type}" "${IMAGE_NAME}.${type}.sparse" ${SPARSE_BLOCK_SIZE}; \
+    if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" = "1" ]; then \
+        rm -f ${IMAGE_NAME}.${type};\
+        bbwarn "Raw file ${IMAGE_NAME}.${type} removed" ;\
+    fi;\
  "
 
 CONVERSION_DEPENDS_sparse = "android-tools-native"

