Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446C5E7314C
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 09:06:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49001.1770023156737576959
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 01:05:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NWHO9MF3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770023157; x=1801559157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=norHfABP8YVuhjwtsgd1PLMBRqsz2Mbs6Wq8NazLTV8=;
  b=NWHO9MF3U/TrZBV13HWKIYtL0THB+v+W2Xbc9MGcb5qcYSiq7zFg0B9D
   SY6l2/9h7hijKlzxiDwBBEQEw8agB3KhhnlbFX7+Hz5LtIdvh2Qmb0ba2
   VU9+2EPQJqikwXReYrTTWZ0+NXF/utJ6tErzVBpOv4jpjBz1CEWgZXeb+
   iUiz2eokGSh98lFPF0yzUEO5p40by8OkqAL3/P77dWTSWSXaY6J5jexRw
   ry2c5sda/ZZgXOI9abgsEKN1MdTBgvJGNqRUpKCqZODvkEj3wAEZBJvnu
   cYOHN25QQRbAq1TfxhSqdzDXjrbGuNmAjJREBO1W4TKCkQSCNHF+lyVZ0
   g==;
X-CSE-ConnectionGUID: SFFFlhYpTaS3TpfWY3lmCw==
X-CSE-MsgGUID: Zm2jhe9RSF2HE5QLgx+L3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="228166205"
X-IronPort-AV: E=Sophos;i="6.21,268,1763391600"; 
   d="scan'208";a="228166205"
Received: from unknown (HELO mail.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 18:05:55 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 12F9C1002BB8
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Feb 2026 09:05:55 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BD2511801FF5
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Feb 2026 09:05:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 497901401861;
	Mon,  2 Feb 2026 09:05:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 3/3] exiftool: upgrade 13.46 -> 13.48
Date: Mon,  2 Feb 2026 17:04:09 +0800
Message-ID: <20260202090409.1251-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260202090409.1251-1-wangmy@fujitsu.com>
References: <20260202090409.1251-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 09:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124057

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_13.46.bb => exiftool_13.48.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.46.bb => exiftool_13.48.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.46.bb b/meta-oe/recipes-devtools/perl/exiftool_13.48.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.46.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.48.bb
index 36b48354cf..0ace1e10eb 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.46.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.48.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "b717b450787d53ed3e97ab3245b21cc2af04d1f7"
+SRCREV = "5a760372fadf23effe370ab5e9ca8e2df9448411"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
-- 
2.43.0


