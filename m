Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5989111226E
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:52 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7230.1775096149856720011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GtWgwM8C;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096148; x=1806632148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5gcgHbooWHm6qv42RMMFVs+WQ9yqUTgpQMaGVD8+e9s=;
  b=GtWgwM8ChkP00bxfq6+gjQugM7wh7El73BkqAMOa6nAnaUo8G4/hDkSD
   Qa92TQkY3zXnXQigSgCAGlhTJSAQ499E0RlpAdXNbatpyNX/O5Dkaw0KK
   VTV1AcaSKFHDytAug+WGY0E87JNP1JFzLv0ekVjKeuIqQF5j3uINim474
   AU6/fVn1eeQM19QZw5o/QccpV6nV4aUs2tXVr917FaMjV5xfv2KrfhZV7
   HqwdXZtp3eHFaf+XlA4Ai8cG1yWkApFs6kIeTz1DiIubPNE//rB4eKw/M
   oiULU+szijveje9TTKw4OvyYcWL8OEl/fto6v/RbKmI9Ge4vmgfw+WRQQ
   w==;
X-CSE-ConnectionGUID: SGVOF9acR6OX0CSlJ44pnA==
X-CSE-MsgGUID: WpJkvlnfTE27Dw1GwzgTJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="236208350"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="236208350"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 708BA1000141
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:48 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 217E5C0E61F
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 97D99100249C;
	Thu,  2 Apr 2026 02:15:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/39] python3-fsspec: upgrade 2026.2.0 -> 2026.3.0
Date: Thu,  2 Apr 2026 10:13:41 +0800
Message-ID: <20260402021355.1324-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125941

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fsspec_2026.2.0.bb => python3-fsspec_2026.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2026.2.0.bb => python3-fsspec_2026.3.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2026.2.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.3.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2026.2.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2026.3.0.bb
index 3b165a663e..4b81c6040f 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2026.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2026.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "6544e34b16869f5aacd5b90bdf1a71acb37792ea3ddf6125ee69a22a53fb8bff"
+SRC_URI[sha256sum] = "1ee6a0e28677557f8c2f994e3eea77db6392b4de9cd1f5d7a9e87a0ae9d01b41"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


