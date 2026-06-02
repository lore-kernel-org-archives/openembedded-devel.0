Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECB6CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:09:05 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21235.1780394943783420458
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b3IjeNir;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394944; x=1811930944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rFHdHBDwS69yynqsL3PqjxLu30qQU7GCZVwPFnMBg5U=;
  b=b3IjeNirHQznzGJ3SuMSgmXJZPqU1onELpyvxdaaLdmsoxya4dX9NvX2
   cWFoAdvd09gM5I6THYmFcD05dLACJqwJIE2XSIzW6hozXXdZwXkkeGLeL
   w8OMe3LIXiaKam7FzGtpentBVEwV7ZqzGlo/NQgaUqVePLIqftXK3b4z9
   6tWHrsYDwoVWaElqbb+JG+UIE6zwyoJTOdHUIQfMuCLwYwW+WX1VcKh2V
   aGek0hWmPW96S+Xpqf7Y0BnHM7BuUtVW/eIplFa/LqEzAJMQt15ohwEYJ
   4mRG/7aDvQSVZjxxusPUtskYEp7LwvN6SDRYrZT/uc5Z7Z549vkjOnZkG
   Q==;
X-CSE-ConnectionGUID: jOuoNHFsQZ2RUbuppmuC4Q==
X-CSE-MsgGUID: /jZPZhn0Skq9zy+kPjiiXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="228863288"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="228863288"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:09:02 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4F76E4DF9
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:09:02 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EE3C2180CCF5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:09:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 17522180051C;
	Tue,  2 Jun 2026 10:08:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/38] python3-zopeinterface: upgrade 8.4 -> 8.5
Date: Tue,  2 Jun 2026 18:07:51 +0800
Message-ID: <20260602100755.2117-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127357

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Build and upload free-threaded (cp314t, cp315t) wheels for all platforms.
- Replace all remaining PyDict_GetItem() calls in the C extension with
  exception-safe alternatives (PyDict_Contains, PyDict_GetItemWithError).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-zopeinterface_8.4.bb => python3-zopeinterface_8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_8.4.bb => python3-zopeinterface_8.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_8.4.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_8.4.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb
index 51169e04f7..a148622f13 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.5.bb
@@ -6,7 +6,7 @@ PYPI_PACKAGE = "zope_interface"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "9dbee7925a23aa6349738892c911019d4095a96cff487b743482073ecbc174a8"
+SRC_URI[sha256sum] = "7a3ba1c5877f0f3e3906b02ddf793abed2becc2948116414ce0e1dd820b68d6d"
 PACKAGES =. "${PN}-test "
 
 RPROVIDES:${PN} += "zope-interfaces"
-- 
2.43.0


