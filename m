Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83AB6E99079
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:27:21 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153340.1775816832778345421
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DOJ49l0S;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775816833; x=1807352833;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Xj8Fy5O5tEF54QC2trZHKufDUTvVwLNPu6iQpDU/98=;
  b=DOJ49l0S9a0zPF32Hyp2mV4kSBEMDYrVld2ek3nXvNOvUdyV8Z/UEkSH
   6RM2z1aO5jUkw7PlYwVt1U3Wg1kxbiJ/xD8O0s9o6TkZwAaD7wE+w6LOJ
   V7JKB1Ye89mkHPONKlR7+Kmmsqbuzrrdy5uPY4CpWYKlkFGoMEn0TZbJ4
   GGQz8KkgntxyrNTzMGcnre4tbp640IrplNlfjTqKl6ZAI+cbHVE/BndmO
   heiJfZKbEG7kGa87aLeaTSxYjWiaDJeR2Q0oKroQr5o9ynDsOZsYISuju
   65MvK1M4cM5+rpQUVwBCinVKQAeB5gHcfYQAi5JUuBaWuL36fhoJUic1q
   w==;
X-CSE-ConnectionGUID: RTMqysoGR2KxDJm/DLhBsw==
X-CSE-MsgGUID: xXUukSzvTXGYpSI8UIq/qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="235975337"
X-IronPort-AV: E=Sophos;i="6.23,171,1770562800"; 
   d="scan'208";a="235975337"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 19:27:11 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E77EA1002808
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 10:27:10 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9C4D81809C34
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 10:27:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 1D73B402639;
	Fri, 10 Apr 2026 10:27:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] dovecot: Fix checksum mismatch
Date: Fri, 10 Apr 2026 18:27:04 +0800
Message-ID: <20260410102704.1621-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 10:27:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126239

From: Wang Mingyu <wangmy@fujitsu.com>

Update the sha256sum to match the current upstream archive.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
index 10ca595029..a6b78ea781 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            file://0001-adapt-lua_newstate-to-new-api.patch \
            "
-SRC_URI[sha256sum] = "e0b30330fe51e47ecfcf641bc16041184d91bdd0ac3db789b7cef54e3a75ac9b"
+SRC_URI[sha256sum] = "ff0be85228122f250627b19e67505fdb7fb2f72a702ef6bf35f27fce54c072e5"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-- 
2.43.0


