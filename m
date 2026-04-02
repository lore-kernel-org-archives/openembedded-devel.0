Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E52D1112276
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7130.1775096175837857056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cTrgP9Ox;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096174; x=1806632174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L3AhEDTNNLVYWICsQogGxRxL7Q4OpicKiMvoRyxbxss=;
  b=cTrgP9OxgW71mu6hdwzYXIqOHwu38xjsLKIJK/w89cYPbv34tlmX17IS
   iVFreOVQ+WObA1/QG4o8JjM2Amnw6VsNvAcx8TS8pfT02aeR9JEjx9vFS
   VSHjGPKXgk5SU/k2XUd54yBDGX/0HrXmBMyH5cyIreZC7XPdYPepWy6Qu
   yPvowkpXZWx0OE++D4fWerrfI6ACk1hrH286D1cYCiS+c34ZOoe99n6JL
   dRTZmF1a7kKvCUemqLgssMxmgoNy746WwiMlmUOhYfIAqHyQKnIiwuIA2
   sQNNxcc88m2X3+5On+Djnfed0yasGBs1BQKmHgqybjiNw7foY87PSoZmm
   w==;
X-CSE-ConnectionGUID: mzfHncV3SJu8epq54rse5w==
X-CSE-MsgGUID: 6vZBh4PzQQeq521HDa8cRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="224161106"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="224161106"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:16:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2496F820C26
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:02 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D26BF832855
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 7E3B610001CA;
	Thu,  2 Apr 2026 02:15:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/39] python3-werkzeug: upgrade 3.1.6 -> 3.1.7
Date: Thu,  2 Apr 2026 10:13:50 +0800
Message-ID: <20260402021355.1324-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125954

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- parse_list_header preserves partially quoted items, discards empty items, and
  returns empty for unclosed quoted values.
- WWWAuthenticate.to_header does not produce a trailing space when there are no
  parameters.
- Transfer-Encoding is parsed as a set.
- Request.host, get_host, and host_is_trusted validate the characters of the
  value. An empty value is no longer allowed. A Unix socket server address is
  ignored. The trusted_list argument to host_is_trusted is optional.
- Fix multipart form parser handling of newline at boundary.
- Response.make_conditional sets the Accept-Ranges header even if it is not a
  satisfiable range request.
- merge_slashes merges any number of consecutive slashes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-werkzeug_3.1.6.bb => python3-werkzeug_3.1.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.6.bb => python3-werkzeug_3.1.7.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
index edddca72e0..29ef2db10a 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.7.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "210c6bede5a420a913956b4791a7f4d6843a43b6fcee4dfa08a65e93007d0d25"
+SRC_URI[sha256sum] = "fb8c01fe6ab13b9b7cdb46892b99b1d66754e1d7ab8e542e865ec13f526b5351"
 
 CVE_PRODUCT = "werkzeug"
 
-- 
2.43.0


