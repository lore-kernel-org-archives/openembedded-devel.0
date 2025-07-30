Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A5AC87FD3
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.31370.1753869305878522006
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sz4Ndb8+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869308; x=1785405308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fgn/tlc8G0ulqYMtP/23kouMlRyQs1nXRxcbbURXiKg=;
  b=Sz4Ndb8+uq6ctnulaKAyblLWGv7YU3W9HxW/loB5uZBq3/5/AlJXc+1W
   o5c6Pano9uyVMB1eA4nHVP/2h9133vsJE3/wNlV47ColPOVU+o6U8FLUi
   bEGbZUNQcOP1CAd/zJCnbKsOtKd610YQHQPHzi8rsMMVQqLPiJBgQLS9s
   ncbQukW+LT8mUBehTTkfmCW0kDdgmE5A9avTciJb1rNslDRsULXomVe0N
   BmkGUFCmkqhIDQ7KuPH/FApn01LdxyTiJ/pWrACaCzjdELjNHGKrSxE+A
   joJhl7mpEeaf7yoPJ3OVRvFbnB8NgLobZJIA1a2CmVHsOTwz/WfkBgk17
   g==;
X-CSE-ConnectionGUID: YAtECMWtREOAuGvKYQCCsw==
X-CSE-MsgGUID: PzpzzEEWQIqonzez7HKjWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207935302"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207935302"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:07 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 8DB9A1C000B3
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EE8E7C0371C
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E9F291A0078;
	Wed, 30 Jul 2025 17:55:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/40] nano: upgrade 8.3 -> 8.5
Date: Wed, 30 Jul 2025 17:54:31 +0800
Message-ID: <20250730095456.695-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118774

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Anchors are now saved when a file is closed, and restored when
  the file is reopened -- if and when --positionlog is active.
- Nano exits with an error status upon keystrokes ^O^Q and ^X^Q.
- Keystroke ^L just centers the cursor, while M-% cycles it.
- Option --whitespace is accepted, but left undocumented.
- Syntax coloring now works correctly in more locales.
- Bracketed pastes over a slow connection are more reliable.
- Tabs in an external paste at a prompt are not dropped.
- Feedback occurs when the cursor sits on a Byte Order Mark.
- The Execute prompt is more forgiving of a typo.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_8.3.bb => nano_8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.3.bb => nano_8.5.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipes-support/nano/nano_8.5.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_8.3.bb
rename to meta-oe/recipes-support/nano/nano_8.5.bb
index d1af89ef8d..8c47289691 100644
--- a/meta-oe/recipes-support/nano/nano_8.3.bb
+++ b/meta-oe/recipes-support/nano/nano_8.5.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d854a3ca3778f111e"
+SRC_URI[sha256sum] = "000b011d339c141af9646d43288f54325ff5c6e8d39d6e482b787bbc6654c26a"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.43.0


