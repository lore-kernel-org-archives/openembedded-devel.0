Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CADCD13DF
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:53 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17250.1777546248679091465
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n0r5YH2E;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546248; x=1809082248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6E+w8ZG1Q5MOPc+1DBkXC3bFtApZy//pk8wQO4cz7M4=;
  b=n0r5YH2Es3Rd2vrTHMokVybvZYZ9Mxn4geSxQgT/WKAM+5ukZHMMgKzY
   Fzu2+u6DzvemTk1QXw8UMBzDTqkyKLdbPJcR6jxmlMtVODtyJI7J4a51I
   BD9IOanLSNJ7ISkcyA8j9subon+um859GvL8PMopPauX0a47Fnr1R3Zlw
   HsFCWYAkV3TSgAsig0fsVdyEZs9HMwzlSKE5KQUg1j7SlTya6kfr7S4dF
   xh7okFR2ceagDH4Ga2nRZD+bUAH2h9imJZPqeZuWnxII7idPA2+dEIYS8
   CcXN/yyIY+YFjceqgez6KK+jlVNwrxJGiP1jcqPGfMMy84JmkiWnB2gUe
   Q==;
X-CSE-ConnectionGUID: o175TzqXRXW0Cl+nD8IsJA==
X-CSE-MsgGUID: IAjdZdP7RLaAfJzRvHcDYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="227309915"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="227309915"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:47 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4D39533D8
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:47 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F2EF3C0023E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 72127180113E;
	Thu, 30 Apr 2026 10:50:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/64] python3-simplejson: upgrade 3.20.2 -> 4.1.1
Date: Thu, 30 Apr 2026 18:49:08 +0800
Message-ID: <20260430104924.1106-49-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126719

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-simplejson_3.20.2.bb => python3-simplejson_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.20.2.bb => python3-simplejson_4.1.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
index f1a8d55132..0579513a96 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_4.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "5fe7a6ce14d1c300d80d08695b7f7e633de6cd72c80644021874d985b3393649"
+SRC_URI[sha256sum] = "c08eb9f7a90f77ae470e19a07472e9a79ebc0d1c2315d86a72767665bd5ba79f"
 
 inherit pypi setuptools3
 
-- 
2.43.0


