Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006FAC44507
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4722.1783503940191941333
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FzPl3W7n;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503942; x=1815039942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ytOj/OaLKeIwzclcF6GimWAhs5PX9KC6W2HOTs8DwXc=;
  b=FzPl3W7nEsDDJUgwJq2UiRdeIbdvxqihYaer7wes3lpPuwy3RYvHD0CS
   nBcYkXyM0bHI/uK+S4vOgUIgFRuzKPqCcD8atsoOqu3sr+Cmw1ZZe0j5W
   NsWlgbfT4/dARvNyromtwozucrpcjpl7kTUTxHyiy59/dEbLDYYXW+2/F
   sTf32gCi3Ckni+sCes/MgD3W5CNxVuW25sNzvDcyRn5jhDn6Noo6DUZqV
   e98QK8jx0Fgey4+DbHU/Lqntr8sLGYB8Hv7sBhtrfl7bdKpzIvNHra/I8
   y4aEUVbP5tz5it6lDD814t/fr44DimnvxWo81bI4+gXfhzZx1WlInZdvY
   Q==;
X-CSE-ConnectionGUID: DpeI7RsgT7CeRzHMBXlnQA==
X-CSE-MsgGUID: qovNjQxgT4ioIHv/44dZZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="224395685"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="224395685"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:40 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 83D5B1000347
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:38 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 358D61807168
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 51C34180113C;
	Wed,  8 Jul 2026 09:45:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/37] python3-argcomplete: upgrade 3.6.3 -> 3.7.0
Date: Wed,  8 Jul 2026 17:44:25 +0800
Message-ID: <20260708094508.2060-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128086

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Escape glob and brace metacharacters in quote_completions
- Quote prefix passed to compgen in FilesCompleter
- Remove deprecated easy_install script detection
- Type hinting improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.6.3.bb => python3-argcomplete_3.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.6.3.bb => python3-argcomplete_3.7.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.7.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.7.0.bb
index 4a60dbaec2..21b12ded49 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "62e8ed4fd6a45864acc8235409461b72c9a28ee785a2011cc5eb78318786c89c"
+SRC_URI[sha256sum] = "afde224f753f874807b1dc1414e883ab8fe0cda9c04807b6047dcb8e1ac23913"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.43.0


