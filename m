Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75910F55128
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28883.1773581757440479503
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ie2vAC1z;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1132; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kMBKfNpRjVirUfuasieP4yugLtJ4SLlA+wlUH4Ma7pQ=;
  b=ie2vAC1z0ZfosK7U1LuAl/+c4lxbuyfPvy7V/guWlPBYd71jUCoimSYs
   GLwiCl/Yd504KYRNlNO03das63DYrb8/iQ27l54QDigFgrNFbPcvWRCUH
   eL4OFy6HQtZwqkOKGJGgVP5Kc8NNsdFXbFO0n5mVE1E6/3CIQ4JqYv0bp
   2EfkgPW7VNQF2Rr4uzmCXga93Hv9AtgS0TObrsxsgKPFXmnmmYFmfGSuu
   jn/YAcxZi3fBKMhlZqbdItmacqvNU/5rlorw6Lz4mhTAiubKm2IdkYBbo
   uG96Q2EqvM2KbJQq/i1qHAQ2AA3pdaZqY+pVDzS1UcH/KkgKA2qcnvXPv
   Q==;
X-CSE-ConnectionGUID: ieGSEOQhQZGE0q0HgAV6hg==
X-CSE-MsgGUID: 0q8huHXzRaqCFUMWBIRBaA==
X-IPAS-Result: =?us-ascii?q?A0DeBQCAtLZp/4r/Ja1agjQQGoJED3FfQkmUKoIhA54ag?=
 =?us-ascii?q?X8PAQEBDzcaBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbVGgiyBAYMoA?=
 =?us-ascii?q?YFTtQgBCxQBgTiFPIgZdIR6JxsbgXKEB3aECoEGhXcEgiKBDpMsSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsN?=
 =?us-ascii?q?xQbBD5uB416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaDyBW?=
 =?us-ascii?q?XAVgyIJSRkPjl/KAiM1AjsBAQcCBw0DC4FokACBfQEB?=
IronPort-Data: A9a23:N7PXDaxf4sd40NpWsBN6t+dwxyrEfRIJ4+MujC+fZmUNrF6WrkUAz
 2MZWWCCM/2INGD2c9AgO9+28R8FvJXdz4dhHgA9r1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH2bOKJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYvaz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtPTtShsaic7XPNJEAateZq7gc9pZk
 L2hvrToIesl0zGldOk1C3Fl/y9C0aJu+bLoGlWYiMyq/WLrK2K04/pHMh82MthNkgp3KTkmG
 f0wMjsBaFWHwumx2r/+ErAqjcU4J86tN4Qa0p1i5WiGVrB9HtaZHviMvIQItNszrpgm8fL2a
 8cUczNzbBPoaBxUMVBRA5U79AutrianLG0I+A3F+8Lb5UCL1VxxzZjdIuDcY/ekeOBqtGeij
 GvvqjGR7hYycYb3JSC+2nW0i+nCmCn2VI4fGPi0++BnhHWXx3cPE1sRTVa9rPyzh0KyVt4ZL
 FYbkhfCtoAo/0CtC924VBqirTvc51gXWsFbFKsx7wTlJrfo3jt1z1MsFlZpAOHKfudvLdD2/
 jdlR+/UOAE=
IronPort-HdrOrdr: A9a23:iWymyaqXm7MiyIwqI8AJJxcaV5oqeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT0C7Y+eAa2STSq3BkW6FL+o=
X-Talos-CUID: =?us-ascii?q?9a23=3AixKKD2qNBit9xV66LyXe3yvmUcEoXUbw607QGn2?=
 =?us-ascii?q?XJD5wEJ2aYGHO+Kwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AHtImKw6xjgbHdrxjNXbLPr9Fxoww+vSuFWA9g68?=
 =?us-ascii?q?PouKqCAlPERanpj2eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="707888786"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:56 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 6932F180001E8
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 18C91CC12B5; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 01/24] libburn: extend recipe for nativesdk builds
Date: Sun, 15 Mar 2026 06:34:18 -0700
Message-Id: <20260315133441.3034831-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125220

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require libburn to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
nativesdk variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
index e84a60a543..29f3cae254 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "7295491b4be5eeac5e7a3fb2067e236e2955ffdc6bbd45f546466edee3
 
 inherit autotools pkgconfig lib_package
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


