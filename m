Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4EBC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 21:56:16 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.2469.1647554174975126394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 14:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22HLuDmf021816
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 14:56:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22HLu8u6026786
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 14:56:13 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 17 Mar 2022 14:56:07 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 17 Mar 2022 14:56:07 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-perl][PATCH] io-compress-perl: upgrade 2.096 -> 2.102
Date: Thu, 17 Mar 2022 17:55:59 -0400
Message-ID: <20220317215559.36323-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 21:56:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96046

Added alternative links for streamzip and zipdetails
as they are also provided by perl package.
Priority for streamzip and zipdetails provided by
io-compress-perl is lower so that perl package takes
precedence.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...ress-perl_2.096.bb => io-compress-perl_2.102.bb} | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libio/{io-compress-perl_2.096.bb => io-compress-perl_2.102.bb} (65%)

diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-perl_2.102.bb
similarity index 65%
rename from meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
rename to meta-perl/recipes-perl/libio/io-compress-perl_2.102.bb
index ccc78d007..d0e393722 100644
--- a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.102.bb
@@ -10,10 +10,10 @@ HOMEPAGE=	"https://metacpan.org/release/IO-Compress"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
 file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-2.096.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "18ad197cad5ca87bc3a7d2538998e017"
-SRC_URI[sha256sum] = "9d219fd5df4b490b5d2f847921e3cb1c3392758fa0bae9b05a8992b3620ba572"
+SRC_URI[md5sum] = "b79ef532ba8b6c1672dc2a401715f5cf"
+SRC_URI[sha256sum] = "d6fa7f9a5beee446452a0fbc43589a0c73fe7e925c075b98628b018048dc72a4"
 RDEPENDS:${PN} += "compress-raw-bzip2-perl"
 RDEPENDS:${PN} += "compress-raw-zlib-perl"
 
@@ -22,3 +22,10 @@ S = "${WORKDIR}/IO-Compress-${PV}"
 inherit cpan allarch
 
 BBCLASSEXTEND = "native"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "20"
+ALTERNATIVE:${PN} = "streamzip zipdetails"
+ALTERNATIVE_LINK_NAME[streamzip] = "${bindir}/streamzip"
+ALTERNATIVE_LINK_NAME[zipdetails] = "${bindir}/zipdetails"
-- 
2.33.0


