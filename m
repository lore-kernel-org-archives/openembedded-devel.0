Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D683D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4224.1765274236731225353
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RS0YvfDC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274236; x=1796810236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=td1To3XWgjIPlkqlg5qqLOJF7ciVWc9K8ntZxkdm740=;
  b=RS0YvfDCApg0H3zlDnD3Ioe+8cwWuN1pPw8ZXYkBwUzdDUHBjhHkphjF
   fj53QaN9XVgoLClaoZaGxqRGjIDLe7yNURuRrAgXUNxViwg35sy7cyMom
   1wXiirvtiR6ghMBQrLznbHwBnFTJ1HCN2G0fmIS14OAMwN3mI3clGoQCz
   auJXvHOoXo4smmgbIRbvnJ71lQyBGfpiLoGYwdOhKg+K18szNzVfYwuR3
   kHPAEOE+BxBE42L8x/x2nhIXwkrxguc1KEYVEFNWx1/r4iUZQe5PUOjE4
   MFtUuz9HpRkL60ePvwNPe7okepFMVaCVNKviqDgfH4NHc+YQ1BQEWkJ4E
   w==;
X-CSE-ConnectionGUID: PgQ+AAqOSWq7Kf9KhXZ8RQ==
X-CSE-MsgGUID: pWmyhOWDS7GNPJ1mSlzEkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="222613732"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="222613732"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:57:15 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 447051451
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:15 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 07EB91800E90
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id DB5B720002B8;
	Tue,  9 Dec 2025 09:57:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 36/38] usb-modeswitch-data: upgrade 20191128 -> 20251207
Date: Tue,  9 Dec 2025 17:55:50 +0800
Message-ID: <20251209095552.690-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122440

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...eswitch-data_20191128.bb => usb-modeswitch-data_20251207.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20191128.bb => usb-modeswitch-data_20251207.bb} (84%)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
similarity index 84%
rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
index 2dfcd886ca..3bced56f44 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191128.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20251207.bb
@@ -7,7 +7,7 @@ inherit allarch
 DEPENDS += "tcl-native"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3f039b60791c21c7cb15c7986cac89650f076dc274798fa242231b910785eaf9"
+SRC_URI[sha256sum] = "0bb12d64aee5e467c31af61a53fb828ff7aa59c54a82ca85eeede4c5690bfa66"
 
 do_install() {
     oe_runmake install DESTDIR=${D} RULESDIR=${D}/${nonarch_base_libdir}/udev/rules.d
-- 
2.43.0


