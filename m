Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6411EFCBA7
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28884.1773581757481437802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=X0nJ8NUj;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1056; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jsrfggYe7DUyBKyAl8F8MmKRWCFgDpKSFOakeKpFbkw=;
  b=X0nJ8NUjOi3xh/1hHxGMgY3kB98FrdvICMsSRAj1alSyX6z3NNni2ODV
   oDTwoy8MymB89Z71tk/yxub6Q2YCetEHGFg0vLfPI36Hbr1rO/LxENZvl
   xD7p3oijBLlfB8nhFJJyzm7Gp+64zrHsC4BlxweyrJg24A93gH5zzLTFx
   sGEVu6STB/PafoIvb9KgXCeYFme6tb+iQs/HD3vaVSTbc3C0bvOFBpYjy
   hkeTis47xFGqOQzdybtgT1ezIkGHI/UZBEWmeZKBmioZB7RAzXt0JBjL/
   e22NkRjrxXc9mrMkpRdymEtj+KttbjKBbm1MWG/EoxUuSJEkFY+UfzzN8
   A==;
X-CSE-ConnectionGUID: RizJUPSeSeiitNF4DsOPag==
X-CSE-MsgGUID: 4i5fcoUwRQC1lALqOHfIGw==
X-IPAS-Result: =?us-ascii?q?A0DaBQAatbZp/5P/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbF9giyBAYMoAYFT2?=
 =?us-ascii?q?yYBCxQBgTiFPIgZdIR6JxsbgXKEB3aECoEGhXcEgiKBDpMsSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaDyBWXAVg?=
 =?us-ascii?q?yIJSRkPjl/MfSM1AjsBAQcCBw0DC4FokACBfQEB?=
IronPort-Data: A9a23:sU7B4Kymj8heOqjPe8B6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkVSz
 zFLX2qOPP2CNmunc9gnbYXipkwF68LSm9Q1TwdspFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYvaz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHs3L68lwt16OmxP9
 OA+BmwhdTe7ju3jldpXSsE07igiBNPgMIVavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPHWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCzYYOKIo3XFJQ9ckCw+
 mOb8W/+Pw4gDffGzROh61WMiM7ggnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:5HKjFaNQ4v/87cBcTsCjsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3DHio379
 YHT0C4Y+eAamRHsQ==
X-Talos-CUID: 9a23:jMSJ8WGT0kRc0AHZqmJd9Vw2J/gef0bQzXbMBWHkJX1OcLSaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A/rO/1A4plQhXAt+v+J4JqTZbxow04vmgA0cwjq8?=
 =?us-ascii?q?/kJCAHAhpHBeTrRuoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="691709599"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:56 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 776DB18000277
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 20E99CBEFBF; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 03/24] libisofs: extend recipe for nativesdk builds
Date: Sun, 15 Mar 2026 06:34:20 -0700
Message-Id: <20260315133441.3034831-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125221

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require libisofs to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
nativesdk variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb
index 0add3777f4..bad8dce0b6 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.6.bb
@@ -12,4 +12,4 @@ DEPENDS = "acl zlib"
 
 inherit autotools
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


