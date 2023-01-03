Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA20C3DA7A
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 02:49:18 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.54886.1672714153540605498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 18:49:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=jkG8WNDE;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672714153; x=1704250153;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ubg0LErLXgrfApBstLHAk7Ia+ssHp3cqpMAH/FFWK8o=;
  b=jkG8WNDEEz+Ljx7/VNsXT0gmz6dF8FOLVL/3Y0FVaO8VsTgg8AMKbQsK
   +H5mfao1FQzhu0NszqLWGNfcrQFTrVI7HqiZBUM+rHL2B/CwvZbeOoJt6
   aRwqRWEW7dS/PmmrBWK0n7KIQXwGSPO9/gbaB/Fk+niTp+4JKHvKFX9sJ
   mY3bQUQHNyaF+2hDLsgEdhmWw64fxw8UsiCyRb7IDmTtQn6x/K25LTrsw
   KQXg7pjLkW70gQ5cLIhAALlfjF08D6q0yNS4go+dxCsFIsUfewwSLe/4J
   Wyz9adGSVp6546/svGrqiilCu4xQ7OXQmUlhJFkl4NEVZdJt9yC7+bN72
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="348791450"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="348791450"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2023 18:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="743340205"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; 
   d="scan'208";a="743340205"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Jan 2023 18:49:11 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tcsh: add native nativesdk BBCLASSEXTEND
Date: Tue,  3 Jan 2023 10:49:04 +0800
Message-Id: <20230103024904.612101-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 02:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100343

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
index f7282bf1f..49d7c3f75 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.04.bb
@@ -44,3 +44,4 @@ pkg_postinst:${PN} () {
 echo /usr/bin/tcsh >> $D/etc/shells
 echo /usr/bin/csh >> $D/etc/shells
 }
+BBCLASSEXTEND = "native nativesdk"
-- 
2.37.3


