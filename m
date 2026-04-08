Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F06FD5F6A
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 04:03:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98852.1775621019552519181
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 21:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rG3Dhwj2;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775621020; x=1807157020;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=YF/0LiCmdqnGr8jlJRvcmsRksoU3+8d9lv8CSdph9uI=;
  b=rG3Dhwj2J+NiN1yI0Zaj4c0pEpmcajOd5lTjh48H44Cfy7++UvgAZWi8
   jrG9FHosK5hBmeuFBjBn24HyLOBUfSIpAxmnfqslhCm0dxdXT7pP2b6RL
   CVU7fHG+qdQ2S5wvHyzRdSb3w1I09e4agSBmhw66PEXYVi7/c+hJ9qVi3
   H+Jz/YQAg2Emrr5NbfY2LZsY6pjS6nz+Ye15zEAd5rUgFKzgQkV4JE9Uu
   1/lv0X2zS+cSWod4ZgIIdJ5scgD5fM4nkl8/TwQrH+VTIUTW5Nn8QtSPd
   MJkaup/r3uM0G/ohAkT89wI+envSROiQ6g6NnWJKcZLOTCDFP9O8wJcJq
   Q==;
X-CSE-ConnectionGUID: /2hpnJYlQYW2jXZaCz8AEg==
X-CSE-MsgGUID: u/M2V0/sTuatjvdd3CZBRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="215218374"
X-IronPort-AV: E=Sophos;i="6.23,166,1770562800"; 
   d="scan'208";a="215218374"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 13:03:39 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 191BB1C001BD
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:39 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C4E90180416E
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:38 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A73B58214FA
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:36 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-setuptools-git-versioning: upgrade 2.1.0 -> 3.0.1
Date: Wed,  8 Apr 2026 12:03:29 +0800
Message-ID: <20260408040331.22227-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408040331.22227-1-liuyd.fnst@fujitsu.com>
References: <20260408040331.22227-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 04:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126094

Changelog:
 https://setuptools-git-versioning.readthedocs.io/en/v3.0.1/changelog/3.0.x.html

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ng_2.1.0.bb => python3-setuptools-git-versioning_3.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-setuptools-git-versioning_2.1.0.bb => python3-setuptools-git-versioning_3.0.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_2.1.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.0.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-setuptools-git-versioning_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.0.1.bb
index 8206e8513d..561f1d06c6 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.0.1.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://setuptools-git-versioning.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92e79e3a844e66731724600f3ac9c0d8"
 
-SRC_URI[sha256sum] = "6aef5b8bb1cfb953b6b343d27cbfc561d96cf2a2ee23c2e0dd3591042a059921"
+SRC_URI[sha256sum] = "c8a599bacf163b5d215552b5701faf5480ffc4d65426a5711a010b802e1590eb"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[python-version-smaller-3-dot-11] = ",,,python3-tomli"
-- 
2.43.0


