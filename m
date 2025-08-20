Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A7ACA0FE8
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.15387.1755679204792210627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IkusuCBP;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679205; x=1787215205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WIKZslbFanL5/VtpXC+cM4AaIz9Q/uNiZpkD8Ff2+X0=;
  b=IkusuCBPVzR0xJFi5Ko8wuAK1TgV9eELtmsyg+H7wIzX0moDr2L/Kb5B
   GXjL0C1Rgg+ptQ3VXasZdvFHqHNeg+RNAlZ+gSjhic1bfONWPYtoQzXaA
   8vIti4J/nRhhGQeiY6DHW318OGy0uRA6eJ/6fEa6V2Ln1JrK5TrVkpSK9
   ktK8h1Fa4mwyO9S2N6Lb4EPz3iXaaQra4rIN5eO9wyej6nh/f/w6k+2wM
   RJvKxExE2DL/Vvmv59jLFkZVbs/U9JkZrScF5X4YdcJD2ZU2xQVFv5lFc
   VI1G9ThyL+oCzfLp9C46kerUOEn/zmPvAuC4rdwoqi5kxHqX0SiXsSZBG
   Q==;
X-CSE-ConnectionGUID: +K+FsBDMT5yR8/I6J6MbnQ==
X-CSE-MsgGUID: 5WuZjnh1Sx20FMXUeEuuKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="188971861"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="188971861"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:03 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 389278203CB
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:03 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E5CE7C0244A
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id EE95F1400BC7
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 11E451A008A;
	Wed, 20 Aug 2025 16:39:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/26] networkmanager-openvpn: upgrade 1.12.0 -> 1.12.2
Date: Wed, 20 Aug 2025 16:39:32 +0800
Message-ID: <20250820083945.802-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix bug that caused that challenge was incorrectly reused if invalid or expired.
* Add support for "data-ciphers-fallback" option.
* Add GUI support for "data-ciphers" option.
* Fix export for password connection type that was not exporting some fields.
* Fix mnemonics in editor's Identity - Advanced view
* Auth-dialog ported to GTK4
* Import certificates into the XDG_DATA_HOME directory.
* Update translations: Hindi, Slovenian, Catalan, Polish, Brazilian Portuguese, Ukrainian, Georgian,
  Swedish, Hebrew, Russian and Danish.
* Skip release 1.12.1 because of a bug in the release pipeline.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nager-openvpn_1.12.0.bb => networkmanager-openvpn_1.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.12.0.bb => networkmanager-openvpn_1.12.2.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.2.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.2.bb
index 9859d01463..2dec7cbb86 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/Netw
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "903fd4c0aebd2aa7ac70c9d8c2bed8df922655d22d764514403566ae89b7e886"
+SRC_URI[sha256sum] = "aa1b5f9addf8d64bc8c459361cf0d5e3eb99f14b60ea82a3500631928af62a6f"
 
 S = "${UNPACKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.43.0


