Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C43FD5F6A
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 04:04:21 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98851.1775621018485666498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 21:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oaeRAhTG;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775621022; x=1807157022;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gd08d0ncRGv+R2I8E9Mce5lTHaw1VYlu/39Ag8r8ohY=;
  b=oaeRAhTGF6MOMKY506l+Wf80w+rdPkvg4kL4a7rokxeYzzWkgIHQlWn0
   q6w3+PIfmn33UvFDfxQIFRpZ50ebXoV26tXS6unwu8qvfI5+yjWtrZLJp
   T9XP0MxqYJNwJ+O+oXa43MOYu+dk9w86mugalaI5GLr+pBX1hNeWOXJBF
   JuZ6kUqcOaxNgf7wW0J24buP8eR4rb13Xl2CnqBZPCRudFotujdLFYiCA
   2pW40KLsTJdxmBfThfxNwZrC1poZw+Bk85aPVgh042unZDecgCl/LtQ2Z
   Dctg6QAhGeuWQrbN4CYG3MO7WPGIwMGCtcePgc8hcxHbM7lr85M8XVbjr
   g==;
X-CSE-ConnectionGUID: E/dBErvNQBqD2yENJLsc7w==
X-CSE-MsgGUID: tTscKMa3S+C3xSp6ciuuYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="223683822"
X-IronPort-AV: E=Sophos;i="6.23,166,1770562800"; 
   d="scan'208";a="223683822"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 13:03:41 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A6EEA100037E
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:41 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5B11118041AE
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:41 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 30F4682172E
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:38 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] sanlock: upgrade 4.2.0 -> 5.1.0
Date: Wed,  8 Apr 2026 12:03:31 +0800
Message-ID: <20260408040331.22227-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408040331.22227-1-liuyd.fnst@fujitsu.com>
References: <20260408040331.22227-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 04:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126096

Change SRC_URI to https://codeberg.org/sanlock/sanlock.git as sanlock source moved to it.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../sanlock/{sanlock_4.2.0.bb => sanlock_5.1.0.bb} | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_4.2.0.bb => sanlock_5.1.0.bb} (87%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_4.2.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb
similarity index 87%
rename from meta-oe/recipes-extended/sanlock/sanlock_4.2.0.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb
index 8babaf8017..72242946c1 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_4.2.0.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_5.1.0.bb
@@ -11,22 +11,18 @@ SECTION = "utils"
 LICENSE = "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
 
-PV .= "+git"
-
-SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
+SRC_URI = "git://codeberg.org/sanlock/sanlock.git;protocol=https;branch=master;tag=${BPN}-${PV} \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
            "
-SRCREV = "efe86d2e691383da07942fe9a4bccab13046f3d4"
-
+SRCREV = "995685ac3ad8909cb7562e74dd13e3b450833d9c"
 
 CVE_STATUS[CVE-2012-5638] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 
-DEPENDS = "libaio util-linux"
-
-inherit setuptools3 useradd
+DEPENDS = "libaio util-linux libdevmapper"
+RDEPENDS:${PN} += "libdevmapper"
 
-SETUPTOOLS_SETUP_PATH = "${S}/python"
+inherit useradd
 
 do_compile:prepend () {
     oe_runmake -C ${S}/wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
-- 
2.43.0


