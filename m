Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C00EFD225
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41950.1772012275461436010
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UdzXFknb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012275; x=1803548275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ltvFNDRiTJ5WmDNb9ZXcgcyVJ+FIZDqXwCgvu0plen8=;
  b=UdzXFknbknmj6UwYJq2+Y92v/T3YLpuf6YGvhGTKZdDPAglUQRZokn2U
   rteEuAuixRzfReXsqsnmTRQj+zM2cZXqHvuNGHkcaTnN+7mIDL1tFapD8
   0wwJ3IWe8PFeI7eKk43TsmYvOWcFh9PFDpUwTRHSBcVuT/Fshz94UryIC
   qoBkgpogDMlySXH892hMsVMsgZvNBjsmhF17WtCFL0GVmgaaIxnfloz3K
   kLjp47Up9mjyd5LwXJHr31GgLZBTOC40Xfoxglvpd8XlMQHGgs85eqqac
   6n0wjIZakXDYaCT51txafU8NCU6wib+VIf1TYoiqxkGlDb3BkMrxp/pn+
   w==;
X-CSE-ConnectionGUID: Ya+oB60/TCWV/fyXxTmVyA==
X-CSE-MsgGUID: yvZ69m2gR9iEko8X7iZmWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="231670382"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="231670382"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 11DE81C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:54 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BAB9DC0219A
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E49F7101BB70;
	Wed, 25 Feb 2026 09:37:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/33] gensio: upgrade 3.0.1 -> 3.0.2
Date: Wed, 25 Feb 2026 17:37:04 +0800
Message-ID: <20260225093727.1284-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124622

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Fix afskmdm shutdown issues
- Fix a crash if gensio_acc_disable() is called more than once.
- Allow the pcre2 package to be used.
- Fix a locking issue in cm108gpio.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_3.0.1.bb => gensio_3.0.2.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_3.0.1.bb => gensio_3.0.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_3.0.1.bb b/meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/gensio/gensio_3.0.1.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb
index 3427ef3a30..da6b1961d3 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_3.0.1.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "f15f54da21697c3656a6fb3ad65a8bec1687c772"
+SRCREV = "57320144c7f3a3ba3d00435a966aa811e219e374"
 
-SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=ipv6-fix;tag=v${PV}"
+SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master;tag=v${PV}"
 
 
 inherit autotools
-- 
2.43.0


