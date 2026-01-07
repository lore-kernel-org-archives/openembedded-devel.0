Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0788DCD582E
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3056.1767781748847133907
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P6pPUz9I;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781747; x=1799317747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Ll79KbAbkNFjH74NyBTNv06CAQOW950UMxU2QCmkxg=;
  b=P6pPUz9IIj3a4H7Chk/nCGUs4jsFR01qg9USqIHHGGgJNtM0Z/Z3S6Xm
   JcCEB710jNjw9zpeBM0+wb/jzzmyIq1HqDEK2teyek1jaNdwSD2NP9vRh
   aimv76Ixg8u5O/mxzvOUEj8ot/OIG6QY7FPIMiRcpKTGR2gaNzwkK9DIN
   KcSfTJf9YI++xfzEPclS4w+zuEuf9PqCjt42EEL1/LsMy0X77fz9Pl7A/
   CONhFLDes/CfVo1P0IS1LqGqSVeJtxLaR87seV4Ef1BrfucHn1qw3qXvp
   5VWR/fXIOUkh89hX+jjWVvE6bBmCFdIriaeT5lPYDilBbMTYBorABrr6p
   g==;
X-CSE-ConnectionGUID: X0QwGxRBSc6As5XgYDG1Sg==
X-CSE-MsgGUID: pOd6m+0gSaqE2jDgyVqBJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="203905531"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="203905531"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:05 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0D37A1002B85
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:07 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B8E99896E27
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D85A38214C3;
	Wed,  7 Jan 2026 10:29:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 03/24] fping: upgrade 5.4 -> 5.5
Date: Wed,  7 Jan 2026 18:28:34 +0800
Message-ID: <20260107102855.228-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123201

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- New option -J / --json for JSON output. See doc/fping-json.md for
  the JSON schema. This feature is still in alpha and the schema
  might change in future releases
- The -g, --generate option now also supports IPv6 addresses
- New option --seqmap-timeout to control the time after which sequence
  numbers can be used again
- Fix OpenBSD sprintf() warning
- Fix fallback to SO\_TIMESTAMP if SO\_TIMESTAMPNS is not available
- When reading target names from file or standard input, lines longer
  than the static buffer are no longer interpreted as more than one line
- Typo fix in error message when SO\_BINDTODEVICE fails
- Options --print-tos and --print-ttl now also work for IPv6, and no
  longer require privileges
- Report received ICMPv6 error messages
- Suppress duplicate reports in count mode with -q, --quiet or -Q, --squiet
- Switch to alpine-based multi-stage Docker build to reduce image size
  and improve build performance; add OpenContainers-compatible labels
- Print receive ping moved to new functions
- Avoid unsigned overflow when determining the memory size to save
  response times on systems where size\_t is the same as unsigned int
- Document the new minimum value for the -p option
- Fix build without IPv6 support
- Fix debug build use of dbg_printf in fping.c
- Remove MacOS-specific test for -I option
- GitHub Actions fixes
- Fix measurement of time for timed reports (-Q) to start after DNS name
  resolution.
- Updated autoconf from 2.71 to 2.72
- Updated automake from 1.16.5 to 1.18.1
- Updated libtool from 2.4.6 to 2.5.4
- Implemented verification of autotools tarballs in Github actions.
- Implemented stricter flag value checking (e.g. -c 10xyz is not accepted anymore).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fping/{fping_5.4.bb => fping_5.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fping/{fping_5.4.bb => fping_5.5.bb} (92%)

diff --git a/meta-networking/recipes-support/fping/fping_5.4.bb b/meta-networking/recipes-support/fping/fping_5.5.bb
similarity index 92%
rename from meta-networking/recipes-support/fping/fping_5.4.bb
rename to meta-networking/recipes-support/fping/fping_5.5.bb
index c4b1a5ad25..24618d1055 100644
--- a/meta-networking/recipes-support/fping/fping_5.4.bb
+++ b/meta-networking/recipes-support/fping/fping_5.5.bb
@@ -15,7 +15,7 @@ NO_GENERIC_LICENSE[fping] = "COPYING"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
 SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
-SRC_URI[sha256sum] = "be320771f075e47dd7e5704b485e9bdc7dd11107884345c0f7c18749357f668d"
+SRC_URI[sha256sum] = "15c4e32b6c55ff105bafe03e8c91c7ca1b2eda31bf9a7127326bb87887ee18fe"
 
 S = "${UNPACKDIR}/fping-${PV}"
 
-- 
2.43.0


