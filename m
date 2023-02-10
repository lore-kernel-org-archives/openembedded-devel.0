Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02EEC636D3
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 09:37:34 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.10414.1676021845475661525
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Feb 2023 01:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=HEX1xXnK;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676021846; x=1707557846;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NufmVJ+I7zKAdAIpBY812fpzFrGSTqSriAKDTmrbOAE=;
  b=HEX1xXnKe+F9o/F2VXM/65UGnyWWKsL+0UKw4CDdBK0jkTw5CdcBTdRE
   b6rdr5RzVugZ/YyvaPLTvIN4oSEywabMhpz6h8p2pF+tqE4wyXRxv8oFn
   b6CKCdE5XESueI2dm7M0qrCeSTzvChTNbpcqMnJFxiGIMOYUMp/JXYShz
   d+bvTz+yLkW8TG4dSlctbciiKS7LFN2VkREkPS0gtrATkT7sDnG8n7bdO
   8Pjr6iDfVwnN7x/E09CzbhH/Jrug8WNsUiECOUrg7iP4Z3E3lqtubt1BS
   Vh4R4RMdMdD/sGxdVH1goP5vpfNXmu8KyL7TBk2z3us4Mg04oDgJcWwHN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="331682459"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="331682459"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 01:37:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="791904665"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="791904665"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 10 Feb 2023 01:36:57 -0800
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][patch] tinyproxy: fix CVE-2022-40468
Date: Fri, 10 Feb 2023 17:36:49 +0800
Message-Id: <20230210093649.2823724-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Feb 2023 09:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101016

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../tinyproxy/tinyproxy/CVE-2022-40468.patch  | 33 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.1.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
new file mode 100644
index 0000000000..4e2157ca75
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2022-40468.patch
@@ -0,0 +1,33 @@
+From 3764b8551463b900b5b4e3ec0cd9bb9182191cb7 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Thu, 8 Sep 2022 15:18:04 +0000
+Subject: [PATCH] prevent junk from showing up in error page in invalid
+ requests
+
+fixes #457
+
+https://github.com/tinyproxy/tinyproxy/commit/3764b8551463b900b5b4e3ec0cd9bb9182191cb7
+Upstream-Status: Backport
+CVE: CVE-2022-40468
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/reqs.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index bce69819..45db118d 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -343,8 +343,12 @@ static struct request_s *process_request (struct conn_s *connptr,
+                 goto fail;
+         }
+ 
++        /* zero-terminate the strings so they don't contain junk in error page */
++        request->method[0] = url[0] = request->protocol[0] = 0;
++
+         ret = sscanf (connptr->request_line, "%[^ ] %[^ ] %[^ ]",
+                       request->method, url, request->protocol);
++
+         if (ret == 2 && !strcasecmp (request->method, "GET")) {
+                 request->protocol[0] = 0;
+ 
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
index 86f57d88ff..999deff4de 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://disable-documentation.patch \
            file://tinyproxy.service \
            file://tinyproxy.conf \
+           file://CVE-2022-40468.patch \
            "
 
 SRC_URI[sha256sum] = "1574acf7ba83c703a89e98bb2758a4ed9fda456f092624b33cfcf0ce2d3b2047"
-- 
2.37.3


