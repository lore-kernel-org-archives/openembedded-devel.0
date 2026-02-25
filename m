Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA79EFD221
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42035.1772012271217325744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jnJce5yj;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012271; x=1803548271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xhdTwmC639TfiF9ueI6VxkQFFeLZg/DMBSjJheEUBTo=;
  b=jnJce5yjPOyPVQj6/ql9Irg0v25JgQfc66ZljU5ygTStifUjylIWpMQ6
   HPXNxfc/FkyL9N+F5t1Zplprb/Ef2TqNmitF5f+ScOJqT7Fy4KtX2g65d
   Dy1CjpRfdl+qBkANdP8TMBCI4XIjF0OqK4Nfw236SyHhEzWwTuP5DGBgb
   4S3zjw8IjTSOVQJcsz8VMkg5uCloj1usyMA/FlkQzmdPk37qY61zbmA2h
   l26NQupes5ZHmroF3iBfJIdrsyVAJ31QcXWa1jYm/pkpNt4mip1JsaVZ/
   MDxHG+iIClyFN74IvVMthK6lHvGRR8n92PX1lWQ8pZKYW9DrERTNCFBe1
   w==;
X-CSE-ConnectionGUID: blTSR9S3QvK4b0MZoUfAyQ==
X-CSE-MsgGUID: rc50igfqQA2+8Gq9H7iSKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="209984559"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="209984559"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id BE04B18B9
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:49 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 79E4E1800525
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A669C101BB42;
	Wed, 25 Feb 2026 09:37:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/33] dbus-cxx: upgrade 2.6.0 -> 2.6.1
Date: Wed, 25 Feb 2026 17:37:02 +0800
Message-ID: <20260225093727.1284-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124620

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dbus-cxx/{dbus-cxx_2.6.0.bb => dbus-cxx_2.6.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus-cxx/{dbus-cxx_2.6.0.bb => dbus-cxx_2.6.1.bb} (96%)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.1.bb
similarity index 96%
rename from meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
rename to meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.1.bb
index cfa476cd1c..bedd379e89 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.6.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-3.0-or-later | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=24594f493407a4cd401ce9794e0b9308"
 
 SRC_URI = "git://github.com/dbus-cxx/dbus-cxx.git;branch=master;protocol=https;tag=${PV}"
-SRCREV = "b705ad73bef724de0ed33f60462c70b380b6b300"
+SRCREV = "521a3d88bb731b94cc9998a0f711a5ca9e831e04"
 
 DEPENDS = "libsigc++-3"
 
-- 
2.43.0


