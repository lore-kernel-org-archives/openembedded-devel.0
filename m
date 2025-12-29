Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6C9E8FDB1
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:29:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40567.1767000585601211592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s1uJSq0W;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000585; x=1798536585;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/A/QeIarQnVPSo8dTmK9/ypJOOvKqt4UCypCNk3eyjI=;
  b=s1uJSq0Ww+RCqJyzl03bY6Su3aKpzN98e7ozip6ZshmSC8+9Ubd66+JD
   NwJOlnY1o9gmSBtR6BROzUlhaG1EE9m49vMF/Mbe+piZUmPs1wswzkWf3
   HeNfhVc4Bz7MRXftMMhnGjSoE0wwyi8SA9oZZ2ZWWcwLJbGXmlNGXmPLV
   zNR0fwigHq07hs870OJFYet9a1RXqfxTP51PI1a1HqOa+QU3jLu0OX7Rp
   fvPgiIZMPR4vncDHehCY+3ZegmvwFEJpNTWfpgHZvno2NWxASPxsVtQJP
   E5yP+HHgMpxpv9XzozkvrJ1swHvsjpqFrPuLdAlPWg/oY/nf8eRxllrY5
   g==;
X-CSE-ConnectionGUID: xzUlDzQhTbi4RmW5TrU0Mw==
X-CSE-MsgGUID: mrV9QTJbRmyhQoKWcWeslQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="224222437"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="224222437"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:29:43 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id C0B961C1C705
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:43 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 768558D65DD
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 1085610003AE;
	Mon, 29 Dec 2025 09:29:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/10] exiftool: upgrade 13.44 -> 13.45
Date: Mon, 29 Dec 2025 17:29:27 +0800
Message-ID: <20251229092936.1483-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122965

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added a number of new values for some Sony tags
- Added a few new button functions for the Nikon Z9
- Added some Nikon subject detection values
- Added a new Canon SubjectSwitching value
- Decode Ricoh APP7 maker notes
- Patched to allow a specific PreviewImage to be written to a DNG file
  containing multiple previews
- Fixed minor error when writing some DJI DNG files
- Fixed bug reading large Protobuf integers on 32-bit systems
- API Changes:
    - Added SystemTimeRes option

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_13.44.bb => exiftool_13.45.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_13.44.bb => exiftool_13.45.bb} (94%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_13.44.bb b/meta-oe/recipes-devtools/perl/exiftool_13.45.bb
similarity index 94%
rename from meta-oe/recipes-devtools/perl/exiftool_13.44.bb
rename to meta-oe/recipes-devtools/perl/exiftool_13.45.bb
index 8b5a0319cd..9feaeb10b1 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_13.44.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_13.45.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "aa4baf5c71d92e5dc9a077ee24fcc4fd478936c1"
+SRCREV = "6219b531484ad790d7fcfa5732d5a9f42ff9e5b7"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master;tag=${PV}"
 
 RDEPENDS:${PN} = " \
-- 
2.43.0


