Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AB5E94116
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 06:10:48 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59626.1767075041997251058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 22:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JsyDn7bn;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767075041; x=1798611041;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xZzPX6UmurofWAKX1e94WGwI6BRLCBN82sA3Boh4tPY=;
  b=JsyDn7bnmPO6/B0e9tkwH31Uzv+dwgSFH/YhW6CLmfP1ha9XHP8Hve54
   lv7akvjqeEEYiQt0zU0rdv4NtZV7b+hylhPqcA+rpKTOylPLD7kQcE5UZ
   t71BMjv1riSONL21eR5yZYWwn00kf1RfbIc7KUAURgFTWEmQskFOiZI1/
   53N5+dfnDcpbVSeM51rCaeWrcJhDA9Q3k9voqugxWMxuaytmxaKG0iZof
   8IW/ExQY32Gve06npaHp6dNq0wKDzS1yXNTlahDUDmnpIbKLVdb8nB1a/
   K9gOCAadvFMkczM59iXw6uNLr5BDcMKFyyTSNPamL70Cyq9rwRj2RLM3u
   A==;
X-CSE-ConnectionGUID: lcrb+AyYSdWqDgKDLfXonw==
X-CSE-MsgGUID: MY3RVrCERQefVZkfd1kdHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="224285271"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="224285271"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 15:10:39 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 184511002B82
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:40 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C6A501800252
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:39 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 950AD829F03
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:37 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking 2/3][PATCH] networkmanager-openvpn: upgrade 1.12.3 -> 1.12.5
Date: Tue, 30 Dec 2025 14:10:28 +0800
Message-ID: <20251230061030.4804-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230061030.4804-1-liuyd.fnst@fujitsu.com>
References: <20251230061030.4804-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123002

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ger-openvpn_1.12.3.bb => networkmanager-openvpn_1.12.5.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.12.3.bb => networkmanager-openvpn_1.12.5.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.3.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.5.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.3.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.5.bb
index 159c3f7100..d21810a98c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.3.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/Netw
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "4bda1c8559bb8c35f6f131c09edae90cdfccd0314e8b8cb98ac55e09b6005adc"
+SRC_URI[sha256sum] = "ce32e38b0500eddf2fc8072ca17679817fc2d35eb91f6ff7b9904209c14b5afd"
 
 S = "${UNPACKDIR}/NetworkManager-openvpn-${PV}"
 
@@ -43,6 +43,8 @@ FILES:${PN} += " \
     ${datadir}/metainfo \
     ${libdir}/NetworkManager/*.so \
     ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
+    ${nonarch_libdir}/sysusers.d \
+    ${nonarch_libdir}/tmpfiles.d \
 "
 
 FILES:${PN}-staticdev += " \
-- 
2.43.0


