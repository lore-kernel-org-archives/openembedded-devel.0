Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17C9111225A
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7213.1775096123469670295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F/+SjnBZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096124; x=1806632124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=60vYLd78d5pctoeRXw9QIEoW/8zPDq4Iul9kf4fQPd0=;
  b=F/+SjnBZHySzKCJdZgxBG2eqoSuNjC1o4RfOyrwYcUjrfYPiEijpFAVj
   ViOikqVIpmlregNhbIXb9FWF2PGW30lBFddcw8afOMQCdGQnRbIn6Y6x+
   x3lgc4RcKekwQE7Bh1/vxptenq25Qnh2E51fq3u+P0OQikd2qv5GIHaAB
   Yk7cc7fOaRLN6g7znOWf81NdxUw6zWEq9Ma2C1gW+jIIDufXsJkXWh1pC
   rKknCDI/Dnp+G/X8zUMHr4nbAO7mEf00bC6cY8Cyo7q2j/8F2HURNfPi2
   M7VtRM/16BBtXm699x5HW1/4GB0RLAYg10BcFs2q87NikCNHjdmrbFX+o
   w==;
X-CSE-ConnectionGUID: vaRqDmupTRCigVIX2gCJYQ==
X-CSE-MsgGUID: 3o9+FO21R+axAJ6wkA8Mug==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235451163"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="235451163"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:22 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DE2243FE2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:21 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8D3501C135FE
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 1833B1003742;
	Thu,  2 Apr 2026 02:15:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 10/39] libgedit-gfls: upgrade 0.3.1 -> 0.4.0
Date: Thu,  2 Apr 2026 10:13:25 +0800
Message-ID: <20260402021355.1324-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125925

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gedit/{libgedit-gfls_0.3.1.bb => libgedit-gfls_0.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gfls_0.3.1.bb => libgedit-gfls_0.4.0.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.0.bb
index 8d864daac0..05c30a1e35 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.4.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 gtk+3"
 inherit gobject-introspection features_check gtk-doc gnomebase
 
 SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=main;protocol=https;tag=${PV}"
-SRCREV = "0a0c8dd29ae2f9f4a99cbaaf1628d2352953e0bc"
+SRCREV = "b292896adfb1c371aa8db0819f4754ff3bf4a848"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.43.0


