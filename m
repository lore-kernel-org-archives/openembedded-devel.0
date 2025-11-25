Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DCCCFD37A
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13206.1764061990535119038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gDGdiRYj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061990; x=1795597990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tLx5oLOss5+4pO5h/gNLWHL1sV1aE0RrdoEyoagUJ9k=;
  b=gDGdiRYjbA7m0wJ4tzNRVi/+coX8y3SU+9AC3wYm+4i7tkBLzSJXakIt
   wlmd1NuxqKlkSrYIiZCgMfsau3G4skAuQ1ZxA/eLsKhAhEsu8kCzivF8Q
   PeEPwJdKGhQuRDg/Btw/5lCFoCjAV1+P9F3vJZSMw/Va8rUXVaBE+fFAo
   MtTQnDeh9+u3eLUHeNjJQpJ8Minm43RzEXvZUOjZxiWU4iv0aKyx7CH84
   nz44hjjx/PE2+MJL/FNzvqd3AXmFJ/Ybd4FI5pFC1lirQgFcqRBr2o0bW
   jQyhbj7ocvuN+UzEWC3snjBEmDy3lF6N5N5W6XNTCAdQHr9phjIpGb3Az
   g==;
X-CSE-ConnectionGUID: BF47WBarTSSD/zGuyZVwZQ==
X-CSE-MsgGUID: IVE7ptU1SJCVGtdvFpLuHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="208280927"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="208280927"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id F0BCE42A30C
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:08 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A99621800EB6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5213A14001EB;
	Tue, 25 Nov 2025 09:13:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 09/26] openvpn: upgrade 2.6.15 -> 2.6.16
Date: Tue, 25 Nov 2025 17:11:39 +0800
Message-ID: <20251125091156.1376-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122034

From: Wang Mingyu <wangmy@fujitsu.com>

Code maintenance / Compat changes
---------------------------------
- adapt to new "encrypt-then-mac" cipher suites in OpenSSL 3.6.0 - these
  need special handling which we don't do, so the t_lpback self-test
  failed on them.  Exclude from list of allowed ciphers, as there is no
  strong reason today to make OpenVPN use these.
- fix various compile-time warnings

Documentation updates
---------------------
- fix outdated and non-HTTPS URLs throughout the tree (doxygen, warnings,
  manpage, ...)

Bugfixes
--------
- Fix memcmp check for the hmac verification in the 3way handshake.
  This bug renders the HMAC based protection against state exhaustion on
  receiving spoofed TLS handshake packets in the OpenVPN server inefficient.
  CVE: 2025-13086
- fix invalid pointer creation in tls_pre_decrypt() - technically this is
  a memory over-read issue, in practice, the compilers optimize it away
  so no negative effects could be observed.
- Windows: in the interactive service, fix the "undo DNS config" handling.
- Windows: in the interactive service, disallow using of "stdin" for the
  config file, unless the caller is authorized OpenVPN Administrator
- Windows: in the interactive service, change all netsh calls to use
  interface index and not interface name - sidesteps all possible attack
  avenues with special characters in interface names.
- Windows: in the interactive service, improve error handling in
  some "unlikely to happen" paths.
- auth plugin/script handling: properly check for errors in creation on
  $auth_failed_reason_file (arf).
- for incoming TCP connections, close-on-exec option was applied to
  the wrong socket fd, leaking socket FDs to child processes.
- sitnl: set close-on-exec flag on netlink socket
- ssl_mbedtls: fix missing perf_pop() call (optional performance profiling)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.6.15.bb => openvpn_2.6.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.15.bb => openvpn_2.6.16.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.15.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.15.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
index 8a88282cd5..88f564313f 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.15.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "e35513ee15995e3c71adfd8891b9f33522896c70b3baa2ed9a23c7a42c4d7bde"
+SRC_URI[sha256sum] = "05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.43.0


