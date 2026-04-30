Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E174CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:03 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17255.1777546258491554769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e+iVpmwU;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546257; x=1809082257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iv5/m3NM+6hL5KbfkbXGzgQermXQJ+A3GKPcT+sxYow=;
  b=e+iVpmwUXhAPtjofWZLKCrQyZ1XucG4XHyajan2gZxDgAAdIi3+5/bmz
   sO0z7rSej0x9MNGx6P2nkXVeUhLf70xzgfu5JH3Lo//tqrns1i4KC8yhR
   GolT++5AgQ0G8wmbcawY7pXHWJKAVi6FhDBdgDVbccHhxR0qP6vdSQx2w
   ywRErw52VFC6xiNCzZpkdl1nTEVquWBe4XTlFdLsCRh+bsws9bu0YhkGQ
   cnn3j6NmLH51W4AffINY83KAR9DVgzVzprbiNLqwPMks+N7/hQyqW5aft
   2IA7vMUBLNjYzSMXPbgfYdm5sZpwsPqFJYlU8BPTwRy9kz67ZwqC3WVLm
   w==;
X-CSE-ConnectionGUID: 5yA2m02zR8SgR/f3FKdmbQ==
X-CSE-MsgGUID: a7vTXs1dTViNrtoGCqc/zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636989"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636989"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:56 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1A0BB426E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:57 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B400C1800E9E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2CF54180113E;
	Thu, 30 Apr 2026 10:50:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 55/64] python3-zopeinterface: upgrade 8.3 -> 8.4
Date: Thu, 30 Apr 2026 18:49:14 +0800
Message-ID: <20260430104924.1106-55-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126725

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-zopeinterface_8.3.bb => python3-zopeinterface_8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_8.3.bb => python3-zopeinterface_8.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_8.3.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_8.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_8.3.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_8.4.bb
index 2dc586a3ab..51169e04f7 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_8.4.bb
@@ -6,7 +6,7 @@ PYPI_PACKAGE = "zope_interface"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "e1a9de7d0b5b5c249a73b91aebf4598ce05e334303af6aa94865893283e9ff10"
+SRC_URI[sha256sum] = "9dbee7925a23aa6349738892c911019d4095a96cff487b743482073ecbc174a8"
 PACKAGES =. "${PN}-test "
 
 RPROVIDES:${PN} += "zope-interfaces"
-- 
2.43.0


