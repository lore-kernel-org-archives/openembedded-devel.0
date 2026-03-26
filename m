Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2565310A1E9C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46410.1774526226736510048
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OKZI1/aA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526232; x=1806062232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NL1rgpMZaQHHAtMe/uzFMckeIOpAFZVILu9hxfuhMS8=;
  b=OKZI1/aAxjBC6EihzMf/eXUbGfWrp6vl84JiajlpggKXdk0s8ZKChhW9
   KXWycmTsIFZvJaGptfAd0+BEke+uts2DfbvewJtDxTpsrUrAifsLGqllH
   nxi0Uem9v0SqmEfgB2+vuqEtZaOFxuLQe1vOi2Xd60C5K0j+go5GmEInt
   zje5RFYz3UxrctR8LxYP8yuZBoCAxPVPhXMFoOApZZson77EUIli/HFKc
   0ULkp92CCIV9MGRU3+XDNG63wQhW7Nca3Ay4Ow9KBnDByriUbx8PLaGbv
   PDFEADSNGMPMykqHj0AybZLRMK9BRReFgK2u7IEjC28/phXr/CJdA3IDy
   g==;
X-CSE-ConnectionGUID: TQrwrfkFRwK5pOPfWfusHw==
X-CSE-MsgGUID: Z6iFvOs0QCmsV8CcjPMNQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234718848"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234718848"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:12 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B670D4DD1
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:11 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 69FD01846192
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B57BC1807148;
	Thu, 26 Mar 2026 11:57:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 19/63] libgsf: upgrade 1.14.55 -> 1.14.56
Date: Thu, 26 Mar 2026 19:55:49 +0800
Message-ID: <20260326115634.1199-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125674

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix problems with ole files using codepage 1200 (unicode).
* Restore check for ole cycles accidentally removed in fixing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgsf/{libgsf_1.14.55.bb => libgsf_1.14.56.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.55.bb => libgsf_1.14.56.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.55.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.56.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.55.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.56.bb
index 77d621ec12..e1e1578411 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.55.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.56.bb
@@ -9,7 +9,7 @@ DEPENDS = "libxml2 bzip2 glib-2.0 zlib"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "74d60abba15bd3ea5ad17da5b924d8e36f649a25c3dc77adbabd2a3628a02131"
+SRC_URI[archive.sha256sum] = "9d21d30df1d12feaf03e181afd6067f65e3048ab69cb6ad174a3c5b72b92d297"
 SRC_URI += " file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
-- 
2.43.0


