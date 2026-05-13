Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C7DCD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:08:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87.1778645279556638024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X1rJXEsc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645281; x=1810181281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1fDYDCUIK7xMkbNnDngfypz/Kik6B4Tfn/fxXBBabOs=;
  b=X1rJXEscSoydIygQhxvfqgfwlv8bzPruIJXpe4pTAGyexrbqvzQ14AQM
   UpVVtsCq5VsvlfaXisioK/N08U3bvsO9HRINXQCWtdKi5UieBnVl2J87b
   xZ7ef30ePk/wlwCJGOQSF9yATYSJjfTO9UNVqs4rN1UuxzbjumQFU1Qlx
   vq1X2P0STTAFWGRBKSEnLSYihIW1h/onHGk1j0Rjwfbdn7axxdTMyJ0XY
   jgXMTy9kmzu/ppHMzfqLLfilvIphDUwTl0GWAXtKm6Qb3OZi5H/mxS9JX
   S+c/ay3fCNHo1T7Az+3DEaX9VgSMqfICZN9Z+kl2hewPP3ftSg5y9hn3u
   A==;
X-CSE-ConnectionGUID: fHP/nxJ5RMGKnV8P/YjQAg==
X-CSE-MsgGUID: X0/ao0VjSx2Mk4hTGdYmFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240264927"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240264927"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:08:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 082591000154
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:01 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B19981004160
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2A9DB140008F;
	Wed, 13 May 2026 04:07:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 13/56] libgsf: upgrade 1.14.56 -> 1.14.58
Date: Wed, 13 May 2026 12:05:12 +0800
Message-ID: <20260513040555.377-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126894

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Fix gsf_infile_msole_child_by_index
* Fix problems with ole files bigger than 4G.
* Document property fix.
* Introspection fixes.
* Make gzip, bzip, zip handle 4G+ writes.
* Make gzip, bzip, zip handle 4G+ reads.
* Improve testing.
* Ole performace improvements with loads of children.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgsf/{libgsf_1.14.56.bb => libgsf_1.14.58.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.56.bb => libgsf_1.14.58.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.56.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.58.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.56.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.58.bb
index e1e1578411..a23ca13608 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.56.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.58.bb
@@ -9,7 +9,7 @@ DEPENDS = "libxml2 bzip2 glib-2.0 zlib"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection gettext gtk-doc
 
-SRC_URI[archive.sha256sum] = "9d21d30df1d12feaf03e181afd6067f65e3048ab69cb6ad174a3c5b72b92d297"
+SRC_URI[archive.sha256sum] = "06e07ea12b7a52b9e316faddfecb640b1717a4875c59f0efb3b0cec1e2ccf35a"
 SRC_URI += " file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
 PACKAGECONFIG ??= ""
-- 
2.43.0


