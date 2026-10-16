Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00953CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 07:21:07 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16252.1792135260425776148
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2026 00:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Kx2Ngqah;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1025; q=dns/txt;
  s=iport01; t=1792135260; x=1793344860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SlBn7QxC2Zp+j1/p5Kb5Tnrc/x8D91D5lcx+3AyDXMk=;
  b=Kx2Ngqah9cNpVqnADoV5amWlKDWEVWFl7W9Wrm9kykHxQ+gkSsb1Br5y
   UGdqm1vXZEGmhnP3Fqplly5jA7dk6YswsJ1RltpYBL4PaP5H/URwWkRtB
   6dyjS5dvVJe27Su7lW2L8OhdVgS7TAzTiAsQFlnGts8BSbrc+EqLlg0kE
   Zj/IcX4jVkZmY+1kvScQrTe1M2zQ+Kz2wn2CkX8/M6ugG+jwo3iOKiJ3E
   26btg2m27l5im3BxA3fpTRkKh4WZ6z5ibYazYg1j6JQ6eTrnWtMgh7/z0
   ajjCxEiwcrHcv13HfDwsf/gculW2Q2QvZQlmbETkkWG8Qa6H9CFfGYBbV
   w==;
X-CSE-ConnectionGUID: UjoB0JPfQ3uUS6I+xh3TGQ==
X-CSE-MsgGUID: 8fbQiSGWReGcuMPi6s8Zbw==
X-IPAS-Result: =?us-ascii?q?A0DDAgBQz9Fq/43/Ja1aglmCV3VgQ0mTWQGCBJ8LgX4PA?=
 =?us-ascii?q?QEBDz0UBAEBhQWOFwImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QFTYBRjBcRIMCAYJ0AxEGvRCCLIEBhH7bMgELFAGBOIVAiCOFc?=
 =?us-ascii?q?icbG4FyhH6ECoEGhVYiBIIiehKXIUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HR?=
 =?us-ascii?q?VMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5IUHoJlgQ4qApVkkj2hDwoog3aMIpU6GjOqb5kIjgqWT4RpgWkBOoFZc?=
 =?us-ascii?q?BWDIglKGQ+OLxWIc8lHJzI9AgcCBw4DC5FogX4BAQ?=
IronPort-Data: A9a23:UIcgk6spChEGYXeXdXMuPLclaOfnVAZfMUV32f8akzHdYApBsoF/q
 tZmKTuGa6nZY2HxKI93PoXk/BlUvsOAm9VqGQI9/i9jRCNAgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvra9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwx+RwKzlsz
 fIhcy0wVU6ixPK2m46Uc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/mM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtOYH49tL/Aan3Xfz5VrFuUtKMf6GnIxws327/oWDbQUoHRGJsJxhbE/
 goq+UypDBsjNeew9gCI3Xmxo9fOwziraogNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:QamHhK/zuhc9qnNtiKduk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:54BAzGNLrooHHe5DZStg3hY2Is4cKWDg9ynxYF+4UlpGcejA
X-Talos-MUID: =?us-ascii?q?9a23=3A6Rouvg9yn/5jb67LgvqcGj+Qf5dm6Z2vM28yq5g?=
 =?us-ascii?q?psNShDS0uIGevhiviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535640840"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 07:20:59 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 53C3618000483;
	Fri, 16 Oct 2026 07:20:59 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id F057BCC1611; Fri, 16 Oct 2026 00:20:58 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-perl][PATCH] libhtml-parser-perl: checksum the LICENSE file
Date: Fri, 16 Oct 2026 00:20:56 -0700
Message-Id: <20261016072056.3951935-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 07:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131070

From: Darsh Kelaiya <dkelaiya@cisco.com>

The 3.85 README ends at line 996, so the existing license checksum
covers only a blank line. Checksum the shipped LICENSE file instead.

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
index ccebd48962..34e8cc6de8 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.85.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://metacpan.org/release/OALDERS/HTML-Parser-3.83"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=996;endline=1000;md5=68b329da9893e34099c7d8ad5cb9c940"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c673252ed1ff54b3a0d20b3673061f9d"
 
 DEPENDS += "perl"
 
-- 
2.35.6


