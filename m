Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE4AC00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 06:14:23 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.1804.1659593659187136130
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 23:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IXoMxIbZ;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659593659; x=1691129659;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BqMgYXgJika1humTHEqYk0LEHF36rhvThWG75Sm6+mo=;
  b=IXoMxIbZS/sdJUP05jq4s38OsxSaUgSOTWt/g57wKPWoyrBuFkL2KSyf
   zM1JJkwesARKOH0y1cT6GcnGiJLqHeIIuDSWna04LXOw6XwJLLiLZ6+CC
   /5rfel75V9o1VUHyJ7YzVej/lnIV355SnM9msszOycXWl12LswAIR/Pd/
   DbuQPxQJbGUR9/699BQU7GoMOa5gNq2GR9vHx+eFW83IXQzVOZ5qMQtoW
   BqU18k69N2J8DvKQNja5DBzrbj4BquhoTWgncMTFYbWOC0mViySeQw3Jc
   YkPUGpz8PNKJddy3JFEJU54hjvxDnM/qDEkvlJaQXqYVzMw26un0Soxfi
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="376150093"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200";
   d="scan'208";a="376150093"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 23:13:33 -0700
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200";
   d="scan'208";a="603098026"
Received: from ingridhu-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.150.38])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 23:13:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] yasm: fix buildpaths warning
Date: Thu,  4 Aug 2022 14:13:23 +0800
Message-Id: <20220804061323.66985-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 06:14:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98129

ax_create_stdint_h.m4 includes $CC as a comment in the generated header
which leads to buildpaths warning:

| WARNING: yasm-1.3.0+gitAUTOINC+ba463d3c26-r0 do_package_qa: QA Issue: File /usr/include/libyasm-stdint.h in package yasm-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index b5cd35ab3..044fcbea7 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -22,3 +22,8 @@ CACHED_CONFIGUREVARS = "CCLD_FOR_BUILD='${CC_FOR_BUILD}'"
 BBCLASSEXTEND = "native"
 
 PARALLEL_MAKE = ""
+
+do_configure:prepend() {
+     # Don't include $CC (which includes path to sysroot) in generated header.
+     sed -i -e "s/^echo \"\/\* generated \$ac_cv_stdint_message \*\/\" >>\$ac_stdint$"// ${S}/m4/ax_create_stdint_h.m4
+}
-- 
2.37.1


