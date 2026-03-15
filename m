Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6A1D58B3D
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28886.1773581757778989745
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QXLch1qv;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1062; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iH4l3r6yXxkPGf+rcfS+rxka5TKsl4csfKoBcrqQOVk=;
  b=QXLch1qvobItcfwhDRpAc3aT7kcfpu4rJlPTZ+RZnaDpdwqFES8Xgrmo
   ltDhxcRHwhm7QgA3gI+2dNrbDeh1pV3/7Hj342gbMrxAuhtH1uzmchi0u
   8GBng/chl0DDBP81F5kqWMTnLg23h8oMWWpBszBo47+FseyVlgacm1s0/
   AtoMpgCLC4Vwzd/Z4/k6y/Hmd/ftSno9H+FetyuHaZNOswdmimNsxOdxa
   gxgcKLQCNAvmEBC9rVhfl5RYwLalypXdo5jEvcBK2jauo6rT1RcCPnfIs
   wkqeDvLLJLP7DJjy+OK1OYtbYbzSWkRrMOSOpFopHSKYPLpsquShi5MdV
   Q==;
X-CSE-ConnectionGUID: 9KYEl4MeSxWyMvbGauhksg==
X-CSE-MsgGUID: we8UAFm1R9Oagn6ycSyEHA==
X-IPAS-Result: =?us-ascii?q?A0DbBQCjtLZp/43/Ja1aglmCSA9xX0JJA5QngiEDnhqBf?=
 =?us-ascii?q?w8BAQEPNxoEAQGFBwKNIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGXIZbAgEDMgEYAT0gMSsrGYMCAYJzAgGxfIIsgQGDKAHce?=
 =?us-ascii?q?QELFAGBOIU8iBl0hHonGxuBcoQHdoUQhXcEgiKBDoF/kS1IgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFmAzUSKhVuMh2BIz4XgQsbBwWFGg+IcnRtgRODLQMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjXo9gjMBPVEBgUQCaAGmHKEOCiiDdIwelToaM6prmQakWYRogWg8gVlwF?=
 =?us-ascii?q?YMiCUkZD45fzH0jNQIGNQEBBwIHDQMLgWiRfQEB?=
IronPort-Data: A9a23:jZf9J6zrARx0nahVdJl6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUOy
 zcbWDqOa/uMajTwKt4kOd+//BhXvpWHndZjHAtp+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYvaz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBAVDKAcpsN6OnFx5
 NkGIh8EcxCAnO3jldpXSsE07igiBNPgMIVavjRryivUSK56B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOnWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCzYYCPI4DSG589ckCwu
 W+Wwk3XB0ggZfuWxjzb43mXl8LvtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjRCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:AWTCkak87TMMQ19KgjGQpx/s6ZvpDfIt3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNDU1ZmIK6/oTJ2KDYrEd/OU=
X-Talos-CUID: 9a23:EQm/RW37rmwZ6HBG2XBH0rxfS+MUX3mB6XrrM3CpLHhjZ7SISVyL9/Yx
X-Talos-MUID: 9a23:6ifZHAoQgkMuaigUnvAezy5vZPpBzaH3MhEqmJoA5diPDj1dGx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="692214062"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id D5FE0180001B7
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 3C20DCC8D58; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 10/24] trace-cmd: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:27 -0700
Message-Id: <20260315133441.3034831-11-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125228

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require trace-cmd to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 6686f1ccd9..9db9e4bba1 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -30,3 +30,4 @@ do_install() {
        # Because makefile uses cp instead of install we need to change owner of files
        chown -R root:root ${D}${libdir}
 }
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


