Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868B5FEE4D8
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:02:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116080.1772269336331108121
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SCeazwku;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772269334; x=1803805334;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9eIJayEKAi/1A72SDxbDWsrTqqKgZ6pTgodgIYkwG5s=;
  b=SCeazwkuP2/5ArGIBXB+O7rTUmVdESIQUw4ujYExjupF0JIowfhBIk7u
   Et4bcNT2YrRATOFqKvF/zkBzaUuEoIGi+Ah1YDUb9g9+cDfu2nWzXV72f
   bopadE3+mxzT98aHuZtXOcm8hyhVKoln1MNJMMCdPZ4dUWYpuWZiLD/jZ
   7UYbFvQ03HDJaShVIpziLZF0sA8RqPliDt0GM5h37JjJ+LT0dBhpTh6yF
   zSqEmPUaJofT0KgnkMjvu5jgk4/xM8w7OE84Y2KCYdCuvq9aYesPH8AXq
   dpvTuXfRnWic+k4vugwkNi2CyVe+nvBawxbQ+DwY9gR/mPS1SpX08NnNy
   w==;
X-CSE-ConnectionGUID: f+FDUzDTRMGCT2tco4M8+Q==
X-CSE-MsgGUID: Kf7vFe+lQjWHrz8S0NPQTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="210211120"
X-IronPort-AV: E=Sophos;i="6.21,315,1763391600"; 
   d="scan'208";a="210211120"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id 9434FC00413
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:14 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4DADC8D65C5
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:14 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 07F3E101C92A
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:11 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] tnftp: upgrade 20230507 -> 20260211
Date: Sat, 28 Feb 2026 17:02:02 +0800
Message-ID: <20260228090204.3587-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
References: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124775

1.Changelog:
 * tnftp.h: improve <arpa/nameser.h> compat.

 * Sync inet_pton.c to lib/libc/inet/inet_pton.c 1.8, via
   othersrc/libexec/tnftpd/libnetbsd/inet_pton.c 1.5:
         * Lint issues.
         * Hex formatting change from bind 9.4.0.

 * Sync inet_ntop.c to lib/libc/inet/inet_ntop.c 1.12, via
   othersrc/libexec/tnftpd/libnetbsd/inet_ntop.c 1.5:
         * Always set errno when returning NULL.

 * Sync fgetln.c to tools/compat/fgetln.c 1.12:
         * Switch to a version that does not suffer from reporting the
           wrong length if the file contains NULs. From OpenBSD.

 * Fix -Wformat-overflow issues detected by gcc 11 in fetch.c.
   (Also fixed in upstream NetBSD ftp, will be part of next import.)

2. LICENSE checksum has changed as Copyright year changed

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../tnftp/{tnftp_20230507.bb => tnftp_20260211.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/tnftp/{tnftp_20230507.bb => tnftp_20260211.bb} (90%)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb b/meta-networking/recipes-support/tnftp/tnftp_20260211.bb
similarity index 90%
rename from meta-networking/recipes-support/tnftp/tnftp_20230507.bb
rename to meta-networking/recipes-support/tnftp/tnftp_20260211.bb
index 4ab694fbba..90bff9a71b 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20230507.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20260211.bb
@@ -30,8 +30,8 @@ ALTERNATIVE_TARGET[ftp] = "${bindir}/tnftp"
 
 FILES:${PN} = "${bindir}/tnftp"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbbb944979c7466ed5509b4bbc6c328b"
-SRC_URI[sha256sum] = "be0134394bd7d418a3b34892b0709eeb848557e86474e1786f0d1a887d3a6580"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a78330785e3081e1679266f0ba58c555"
+SRC_URI[sha256sum] = "101cda6927e5de4338ad9d4b264304d7d15d6a78b435968a7b95093e0a2efe03"
 
 PACKAGECONFIG ?= "openssl \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.43.0


