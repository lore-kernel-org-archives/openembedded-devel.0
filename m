Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AC3CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17473.1777546263122939452
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rn5OVOn4;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546262; x=1809082262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0hriw1PezWla5Izcv/5gGLLcdU5SuGQQmu02EJB30PI=;
  b=Rn5OVOn4X8BpTjoWBkflh1OPY6qKLC2ffd2in8IpnJZ4Wh/JrpGn5/Y3
   EP6qXoBnpSmXAWHf61PyPboosEw4U7WTiUMyFy2hvIKSgWSX85DVXSCKI
   dbQ4JE3uhCEIdZl6NxKWU9xZdC3lrvcIHbQBwSBz6JsJZT/ynv9Beiswi
   YmVOq7a+3cKy/Jqs3Sg2YHCRnONWXVukEH/2QkCP/t+jFae2bHIguFID4
   VcWdaKL6wDtqqEYepDxD9cMFHL/QD310t/Yc10RfUnt9s15atvhJV4GUu
   23tRN7z1efdFJQ+DOigg0VGnMLmFBsmJqB/iFPY3aHsDHgoYHSbxw/jY1
   Q==;
X-CSE-ConnectionGUID: C6qK1r6lScevSf3Xcl9Dbw==
X-CSE-MsgGUID: urNR5GVSSbWbUK9TY0Q+vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636992"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636992"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:51:01 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A68698203CA
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:01 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6020A14003F2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 08FFA1801130;
	Thu, 30 Apr 2026 10:50:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 58/64] strongswan: upgrade 6.0.5 -> 6.0.6
Date: Thu, 30 Apr 2026 18:49:17 +0800
Message-ID: <20260430104924.1106-58-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126728

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- CVE-2026-35328 - Fixed a vulnerability in libtls related to the processing of
  the supported_versions extension in TLS that can result in an infinite loop.
- CVE-2026-35329 - Fixed a vulnerability in libstrongswan and the pkcs7 plugin
  related to the processing of encrypted PKCS#7 containers that can result in
  a crash.
- CVE-2026-35330 - Fixed a vulnerability in in libsimaka related to the
  processing of certain EAP-SIM/AKA attributes that can result in an infinite
  loop or a heap-based buffer overflow and potentially remote code execution.
- CVE-2026-35331 - Fixed a vulnerability in the constraints plugin related to
  the processing of X.509 name constraints that can allow authentication with
  certificates that violate the constraints.
- CVE-2026-35332 - Fixed a vulnerability in libtls related to the processing of
  ECDH public values in TLS < 1.3 that can result in a crash.
- CVE-2026-35333 - Fixed a vulnerability in libradius related to the processing
  of RADIUS attributes that can result in an infinite loop or an out-of-bounds
  read that may cause a crash.
- CVE-2026-35334 - Fixed a vulnerability in the gmp plugin related to RSA
  decryption that can result in a crash.
- Made the Botan RNG types used/provided by the botan plugin configurable.
- The fix for the vulnerability in the constraints plugin now causes all
  certificates that contain excluded name constraints of type directoryName (DN)
  to get rejected.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../strongswan/{strongswan_6.0.5.bb => strongswan_6.0.6.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.5.bb => strongswan_6.0.6.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 405080070c..daa6552899 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -10,7 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "437460893655d6cfbc2def79d2da548cb5175b865520c507201ab2ec2e7895d9"
+SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


