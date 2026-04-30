Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E1ECD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17425.1777546173502871540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g+B/5KGt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546173; x=1809082173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VTsJV3NfZnEuS3WP3nfjDBOoeA5Igzs8Kyp6ggnPURo=;
  b=g+B/5KGtB4qaIrfb5JonIH9kQhGVcTd8C6xjgBjXplIiKMJkZV29a6Ni
   2B74g7wkc8kQUYh3fIKdU055wzIfe/wy0R4mpUkCXz54PP5MWDPdZ37yt
   WQUXn/Lxn1AtTthbcVT3pTmQFqKDkvLbkYF538NhsdEb1ZNeKUET7E/bE
   GW1agc4sWvo1HQPbtbZK8K1TVTafEx5GAfUbO9k0H54lxPLxL7g1iMcky
   t5OU61XB+Hwgff5ZIs+nY2OhzYYQwjGzjR7DLIvWnOOHl3ZgT/LNSVmp1
   nIGtuym6+SwtXS33zjttG+j/qhqWwLlcmJbbN79uqQWlWrPYypdXxIsrB
   A==;
X-CSE-ConnectionGUID: hQrxUXIFQP+8hgpKQ/qzsQ==
X-CSE-MsgGUID: IfHrX5ARSqyiGpRCWr5A+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226100941"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226100941"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:31 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id ABA6D8203FA
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:31 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 61A4514003DA
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id F29E5180113C;
	Thu, 30 Apr 2026 10:49:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 02/64] appstream-glib: upgrade 0.8.2 -> 0.8.3
Date: Thu, 30 Apr 2026 18:48:21 +0800
Message-ID: <20260430104924.1106-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126672

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Drop support for libstemmer
- Add font glob match for .ttc files
- Do not veto the extension if the parent cannot be found
- Include screenshot height in "too small" and "too large" error
- Make the appdata filename check match the plugin globs
- Remove Check for X-KDE-StartupNotify
- Stop trying to convert Fedora licenses into SPDX
- Support RFC9512 registration for application/yaml

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{appstream-glib_0.8.2.bb => appstream-glib_0.8.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/appstream-glib/{appstream-glib_0.8.2.bb => appstream-glib_0.8.3.bb} (91%)

diff --git a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.2.bb b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.3.bb
similarity index 91%
rename from meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.2.bb
rename to meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.3.bb
index efb85d77c5..399d9813af 100644
--- a/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.2.bb
+++ b/meta-gnome/recipes-support/appstream-glib/appstream-glib_0.8.3.bb
@@ -20,7 +20,7 @@ DEPENDS = " \
 inherit meson gobject-introspection gettext bash-completion pkgconfig manpages
 
 SRC_URI = "https://people.freedesktop.org/~hughsient/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "71256500add5048d6f08878904708b3d0c3875f402e0adcd358e91d47dcd8b96"
+SRC_URI[sha256sum] = "84754064c560fca6e1ab151dc64354fc235a5798f016b91b38c9617253a8cf11"
 
 EXTRA_OEMESON = " \
     -Drpm=false \
-- 
2.43.0


