Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCC3D58B33
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:02 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28886.1773581757778989745
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lD+jfEZo;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1051; q=dns/txt;
  s=iport01; t=1773581759; x=1774791359;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OrUu+i6+hXfjqA2jmZ2mE/NX/HBL0E+ZvFRdfUzNMa8=;
  b=lD+jfEZodmzVjRR+peJLTCq1MInHy3FtLkYmRyuFYabtljZo9A7PdNkV
   iaePRoxLogkvdLo2m9EXSAATnws7FHlc+XMrFrth3nosB+aeWsWXB7o7P
   Mk9bWMRk2yEaY1LimK3/uQpLApFXyb1RuJVTa1vXhpMaT972/aDQ1dI8q
   1q5ioB1s+nMFlIX1PIySCftYKWuggE6YePtcc1JbO0SCPtrCmA45w6JFL
   3TQmeiLNCJ16n+nDGQQLsiPM8958mpFH7YjsdsISgJ7Nl1AsV8nIMfNtW
   mH/yUUaPzxBrCJd+lZ7e/yyfv9rbDYxC0rhJYWaIZJrsroD5Feq2I8lD5
   g==;
X-CSE-ConnectionGUID: dExRsckeRmKFreUP1uubDA==
X-CSE-MsgGUID: l5uDPLSXSs2lSfzABueOfA==
X-IPAS-Result: =?us-ascii?q?A0DZBQCjtLZp/47/Ja1aglmCSA9xX0JJlCqCJJ4agX8PA?=
 =?us-ascii?q?QEBDzcaBAEBhQcCjSICJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyGWwIBAzIBGAE9IDErKxmDAgGCcwIBsXyCLIEBgygB3HkBC?=
 =?us-ascii?q?xQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6Bf5EtSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbBD5uB?=
 =?us-ascii?q?416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaDyBWXAVgyIJS?=
 =?us-ascii?q?RkPjl/MfSM1AjsBAQcCBw0DC4FokX0BAQ?=
IronPort-Data: A9a23:PaVoV6K0fDfVVdfeFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENSgmABy
 WNKDT3Xb/aIMzbzc4txaIW+8xsO7MKGy4MwTQcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9gGcpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1iIVEMJoYb99xyIk9U+
 MEgcS0QZDyq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME6ojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjum3aoOJIoLRLSlTtkLFu
 07+21/JOQpAMOeR2xOv73+LiMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:wWTt9K1HUfRBbcjFEam5QQqjBLMkLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddm2wUMqyXMbC85vyKhzWFLw==
X-Talos-CUID: =?us-ascii?q?9a23=3A3DWVxGq+y+obnY8O8pcGEmLmUcwIYkfGx3TdGUq?=
 =?us-ascii?q?bJ3xkdYXMVEKa1Ioxxg=3D=3D?=
X-Talos-MUID: 9a23:yd6yqwjiutS+JkCiw9QRmsMpMJp1z5yKM3A2is8CgMeWHAZtNhCTpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="692214063"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id D81AA18000D12
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 37E9ECC8D57; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 09/24] libtracefs: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:26 -0700
Message-Id: <20260315133441.3034831-10-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125238

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require libtracefs to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
index 8f27db9bf0..81e191c175 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
@@ -23,3 +23,4 @@ do_compile:prepend() {
 do_install() {
     oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
 }
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


