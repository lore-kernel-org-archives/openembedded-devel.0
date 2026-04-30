Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8464ECD3426
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:19 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17223.1777546212179282997
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NdK8WeZ3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546212; x=1809082212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JGdUwslVR8SxCMBdMqmJAibTH4AbozzIkbjE+jnxJfo=;
  b=NdK8WeZ3+KGmhK2fWr1otPDzYRY4x50Wl6jpMHRBGNCJUG0eYTg1Vkv1
   jFUIj1jqQFFIIjefcuk0oa7LEgt3PZKziU4MevDdcvgYbTKaiFBFkMrYJ
   EsjLHHhD9/TLtNhpEQMgFfvkWD7tr+Ox0E0y0qAEwWxLYzt1cy0IF5Vfh
   gxvCShnn44t7a6JEqflKIyIBnjAEbkG4E7NA1/81fs9zHE1iF/7ttX4lt
   xzmnF66DIOJntg1UtDHtCwkFuIORDmMVNQ5nur/yMsuwo+FvdGqu795gB
   fUSRA75mo7AKzuISDy7xMGktLFbuiGpIUwBQXnPpItvucgjpmpdODEccG
   w==;
X-CSE-ConnectionGUID: 9oILibxjTzqaHmDg+4xhZQ==
X-CSE-MsgGUID: o5wWcJ8nQ2uMZtqU4Q2eyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="243116210"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="243116210"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:10 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BDDF142A306
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 66CCFC01834
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D49F8180113C;
	Thu, 30 Apr 2026 10:49:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 20/64] localsearch: upgrade 3.11.0 -> 3.11.1
Date: Thu, 30 Apr 2026 18:48:39 +0800
Message-ID: <20260430104924.1106-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126693

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix possible failures when extracting metadata from EPUB, ODF and OOXML documents

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{localsearch_3.11.0.bb => localsearch_3.11.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{localsearch_3.11.0.bb => localsearch_3.11.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.0.bb b/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/tracker/localsearch_3.11.0.bb
rename to meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
index d49482cfec..48d5e6b39f 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
@@ -18,7 +18,7 @@ SRC_URI:append = " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
 "
-SRC_URI[archive.sha256sum] = "c6774761a8b9f4a06f6812f1c8078bee2e937d65e376c3d2338b78993e5f4666"
+SRC_URI[archive.sha256sum] = "7b39a6c28a8acf2b172f15b2fb5ee7c7a3764c447c2f4a14caa239b7ebe61942"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.43.0


