Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95765D31A18
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 07:34:22 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5444.1768376058865105414
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 23:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XKSFYDTp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768376058; x=1799912058;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cOwUlcod03jbjg2o5CxAo6SBtx9wH0FrLrtha+/HwS4=;
  b=XKSFYDTpVGli1KzNWZyGT+NDU6bNRbbPNGxsvPi5KmRSmAqkpfGJWi6x
   N6+5TCUalzgK4j6GbdaYM5VdbVcd9H7ZoSWmYP7cddQdLTDqkTYUMMkt4
   3ss54g6LusH7+SbAqfjhWaW//Ub7+qpGFnMRqkxJ245ToLrRicMonv7fX
   JtJqIx6m8XGgJs5V9FLuHyO5tqcIgeZkmwY4HHhc3Dl68I836rAfu0rVz
   oo323SSJZqyKHYg/GilkN6OTU6e34aP5zSaOHa725JlNwVynNkOJGHlzm
   Tcv1YKhKI898xoH6e8fL5hlZrA2KqNHIvkGWFW0TTsCxrMKrO+2kTyxsQ
   A==;
X-CSE-ConnectionGUID: QZr5ESAjSxuQI+ygT/pMEw==
X-CSE-MsgGUID: Rhz6RiRJTWmXu7NGNv1jdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="225774464"
X-IronPort-AV: E=Sophos;i="6.21,225,1763391600"; 
   d="scan'208";a="225774464"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 16:34:16 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 179A31C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 07:34:17 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BB0211003BDE
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 07:34:16 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 63C7C4029B5
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 07:34:14 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] adcli: Fix OECONF
Date: Wed, 14 Jan 2026 15:34:11 +0800
Message-ID: <20260114073411.10320-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 07:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123445

Remove "--disable-static" as it's not needed for default option.
./configure --help
 --enable-static[=PKGS]  build static libraries [default=no]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
index 2f15abbcfd..7bd07491fe 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.2.bb
@@ -18,7 +18,6 @@ DEPENDS += "virtual/crypt krb5 openldap gettext libxslt xmlto libxml2-native \
             cyrus-sasl libxslt-native xmlto-native coreutils-native\
            "
 
-EXTRA_OECONF += "--disable-static \
-                 --disable-silent-rules \
+EXTRA_OECONF += "--disable-silent-rules \
                  --disable-doc \
                 "
-- 
2.43.0


