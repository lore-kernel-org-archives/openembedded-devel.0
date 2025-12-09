Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AA2D3B7FE
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:40 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4201.1765274198307219023
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=de6QBdxl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274198; x=1796810198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=seFTNFI3A94iPXTqPMzt1m78guznajDbzUTVb4OFft4=;
  b=de6QBdxlYvp1a5PTgjviwxgeXOK/VFLhAoD0IdXbnCyhLgQMSt6SxBi/
   CWlak1KOjvQnKvAs6gPJZwVSGruY0jhupTAntL0AYBTmjvf7y8ZjuXSwZ
   uXqNrkui1QsjJ8teKK64rbLDXJzThBTDHKeIgXXAQF7pLx7TYlHIvrDDJ
   mh+nFJeh+RhF7Pxmc0inva+vgLyypKGiGvzWIzx/+K+uS+CpVE883f+dU
   dw0WfwkPwjRZgxt4IeVpjqkWwtBP+0s4kcJZhN+KurvWiRoqKKZWB5QiJ
   OHoPZ7qwkd/X9VlrWIgzm9gaIggk/E/rYh0v2CPrl6X2AtzvrCzVTZD/i
   g==;
X-CSE-ConnectionGUID: 4QxUGdseRmKBRI+aZB0GZw==
X-CSE-MsgGUID: OyyA3nU7RdSjpm26ORK4nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221991915"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221991915"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:36 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id AB4441000377
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:36 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5D9971000454
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 009BC20002B2;
	Tue,  9 Dec 2025 09:56:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 15/38] openfortivpn: upgrade 1.23.1 -> 1.24.0
Date: Tue,  9 Dec 2025 17:55:29 +0800
Message-ID: <20251209095552.690-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122419

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- add OpenSSL 3.0+ PKCS#11 support using OSSL_STORE API
- add OpenSSL Engine support (with OpenSSL < 3.0)
- update package links for distros in README
- remove deprecated option --plugin
- increase the maximum size of the proxy response
- route: always remove wrong pppd route to self
- fix several Coverity warnings
- fix a memory leak in new ipv4_drop_wrong_route method
- HTTP: fixes missing '\0' in debug
- IO: fixes a RC use after free
- SSL: Avoid leaking SSL context

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{openfortivpn_1.23.1.bb => openfortivpn_1.24.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/openfortivpn/{openfortivpn_1.23.1.bb => openfortivpn_1.24.0.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.24.0.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
rename to meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.24.0.bb
index 9823d772a3..eb5599ab07 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.23.1.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.24.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Client for PPP+SSL VPN tunnel services"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d575262a651a6f1a17210ce41bf907d"
 
-SRC_URI = "git://github.com/adrienverge/openfortivpn.git;protocol=https;branch=master"
-SRCREV = "a011b5c916075bd240db6a03c02eac95baf09ad8"
+SRC_URI = "git://github.com/adrienverge/openfortivpn.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "9230413f47de40fbf0dc8ba18eff42e943e27ca7"
 
 DEPENDS = "openssl"
 
-- 
2.43.0


