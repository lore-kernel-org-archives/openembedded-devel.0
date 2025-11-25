Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C03CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:12:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13193.1764061934682269062
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s3a3lDZE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061934; x=1795597934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6OzLk0TX6BOAdVAO9eMDFcq4Sm+qusFHiYxHACq4K04=;
  b=s3a3lDZE6WmECh8tnoQsmvMvZMgwlAVRT9LZUuK5z1jeSj6kBfWCm8ec
   /7RP8FsT2C9wJKjnA2e6eLn0qNnjF0yb9M+7HDk/euVGDhmdBQT+Yw/Uk
   vk636ZuCj0GGfLtQZ6EVyXg1MnlWGjRB6nrjQFFeDDO0qjXeGLHpp/L7O
   7WBiP8iSqLzZi8pLU4spWvHaigHc1JpxehxGHjqD/+sp+JD59s9VYu/tV
   XTa9qQ7cSsWYJNRYMJodE9aHxw/vZXb+mooilDIe0VXZ+yWN11Tjalz8S
   tQ68m7G660l2dL6yQ/eAbhWbMpvZvwQvHlK/Qt1ySDtcAeMywVxK2ZMdl
   A==;
X-CSE-ConnectionGUID: XwNNWW8tRUqodmU0o/39xg==
X-CSE-MsgGUID: XJSGQHtNRVKTs2xSFSMM0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="208280816"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="208280816"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:12:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 31A938204D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:09 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E81CB14003A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3373214001E4;
	Tue, 25 Nov 2025 09:12:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/26] gpsd: upgrade 3.26.1 -> 3.27
Date: Tue, 25 Nov 2025 17:11:33 +0800
Message-ID: <20251125091156.1376-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122029

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-  Improve support for newer signal ids (L1/L2/L5, etc.).
-  xgps add signal id names
-  gpsrinex, support new signal ids.  Add -g and --gnss options.
-  Initial SPARTNv2 support.  Disabled by default, terrible protocol.
-  Many ubxtool updates for newer u-blox receivers.
-  Update driver_ubx for newer u-blox receivers.
-  Lexer() FFI interface is unused, and deprecated October 2025.
-  xgps and xgpsspeed work under Wayland.
-  Add support for Qt6.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-navigation/gpsd/{gpsd_3.26.1.bb => gpsd_3.27.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.26.1.bb => gpsd_3.27.bb} (98%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.bb
similarity index 98%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.27.bb
index e4a571daa6..41a3231069 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://gpsd.io/"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] = "dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990"
+SRC_URI[sha256sum] = "6195292dd7910be68cb7018d45166283eaefd3f9db9773fcd6e9a78d49eac999"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
-- 
2.43.0


