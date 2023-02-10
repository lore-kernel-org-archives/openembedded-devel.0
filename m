Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7257BC05027
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 10:02:55 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.11028.1676023369963044580
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Feb 2023 02:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=VcMyBg2Z;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676023369; x=1707559369;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1z/z5/IF6neqsG47Fvwon+CazuicS+2+d0Fjsy+Vnnk=;
  b=VcMyBg2ZhGtnJYwtL8BoYgbmmp+DRX86kNFg5rjkeaifxAA43gNVifxi
   pnsSzgMcVWscorGxq8MQ2NaDcTQTzu6QMAcueuudYQ3MmWZ8KGPlXVjXJ
   k8P8bq2+5zsusiqQzJW5haEhEZPeJFaOkV3WcnvmuL3OXkMu69xVAsQsU
   BUNTO2HPyOPf/g/tDmrtjM3a78ETToNbx48fKfqiDWQSE4y9iwOAIJj5S
   rNICk6osQpI9Kb1bNFDv9M175mvsxgo9KV7uckr/wtkga8W6u4iHmW7N/
   RAOiP9v3uR1uUgosf+7yK+lAjJYSS+4RNcAkd6wLTR9aw32Rh9PCg66sQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="394988259"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="394988259"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 02:02:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="645582776"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="645582776"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 10 Feb 2023 02:02:48 -0800
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][patch] tmux: update to tmux_3.3a
Date: Fri, 10 Feb 2023 18:02:40 +0800
Message-Id: <20230210100240.2839345-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Feb 2023 10:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101017

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.1c.bb => tmux_3.3a.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.1c.bb => tmux_3.3a.bb} (84%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.1c.bb b/meta-oe/recipes-extended/tmux/tmux_3.3a.bb
similarity index 84%
rename from meta-oe/recipes-extended/tmux/tmux_3.1c.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.3a.bb
index c9859b386b..e5784be518 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.1c.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.3a.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[md5sum] = "7301d3fa12f35051edb185496766c745"
-SRC_URI[sha256sum] = "918f7220447bef33a1902d4faff05317afd9db4ae1c9971bef5c787ac6c88386"
+SRC_URI[md5sum] = "8eee5883b9f6550fa4efaad0c9ec38f3"
+SRC_URI[sha256sum] = "e4fd347843bd0772c4f48d6dde625b0b109b7a380ff15db21e97c11a4dcdf93f"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 
-- 
2.37.3


