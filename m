Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4316CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:19 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.4832.1761099788211420143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FWDlLLWs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099792; x=1792635792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N4KjPWkxMe7WpqPcOw9n2HwTVluq4a5+ONmSBq8NlFY=;
  b=FWDlLLWslg074MWdMGEVZEynr+cwKYJIFLeHsxgCX3uaIskOeoLMDkUN
   7Vi3b2bI5kPkZYJ0ZCFjtpmZ9YJDwVEFLcGIcfuPQAcDi6tKaJ7oB74FM
   QX/7rZLHKybnn0DqIzWvi+5waO/kr8W/WqgEZVHSgZnHx9DDQazeKQf69
   0mPabVGbc7Uktt4TSHI3XT/dxm1GE1Mfxs2xs5sskSzQIsg5GnV8eYFah
   eJgIyL32okXC9gL0ffbDKvGPVJohWzrrz97CX6/LP/vIzOvwlPPcnKe0p
   GIvJx2Anuf4/aDE8VDz61MhdoJCKFw/VeHemjyeEsmaZ60b/c6rupZG4u
   Q==;
X-CSE-ConnectionGUID: eApukNdWRSyXGIQWLkt4aQ==
X-CSE-MsgGUID: bL0tCQevSHq4pQwKXTHxdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216694945"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216694945"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:12 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D2FF6C01B0E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:10 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8DAD08D2051
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DAD7C82C0E2;
	Wed, 22 Oct 2025 02:23:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/29] python3-inline-snapshot: upgrade 0.29.3 -> 0.30.0
Date: Wed, 22 Oct 2025 10:22:15 +0800
Message-ID: <20251022022227.226-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- External.run_inline() now uses the same logic as External.run_pytest.
- The test-dir config option can now also be a list of paths
- added Python 3.14 support
- Disable ensure ascii in json.dump to support non-ASCII characters in external files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.29.3.bb => python3-inline-snapshot_0.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.29.3.bb => python3-inline-snapshot_0.30.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.3.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.3.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.0.bb
index 2a3d253e3c..6608b34f64 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.3.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "f11e309d3474ab5f517687288bf23092e1acadb392e1e38ddb3d5bb165a8723e"
+SRC_URI[sha256sum] = "486e996ef133d4d91bacf78c8b712f76668709e7ffde6d9d925148d36c7c8fbd"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


