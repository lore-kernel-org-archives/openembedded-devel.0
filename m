Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1AAC74A44
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:21:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.6592.1678281661550948992
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IwAxrNvM;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281659; i=@fujitsu.com;
	bh=X22/53avAihkvqqtLuTTrYjqOh4HfENld49VZHGx6bA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IwAxrNvMhmFEiOaFxCe8nlt0hKzG586CSlmsUAvHju+8Itte975/Oo2QoonNteKBx
	 PiofNB1YPiCxJCyfCdUt37OPyldPLqL5DEy50JMWulhs/vLCeoZJUHaoCG7KcA0MX1
	 QnfWUDjsBvag8o/iO/1aaxCeDLKXohY5JzjM1nZFoTAe+DWKVOCD4SIWBqcfMbIxHU
	 14jtIKzLyVYYpH9r5XtZ3pJCQZcA6nF6sFgaVHbPQE6dZbS3LJ1O1DMlEnOuFWYYr0
	 s7xK26s5ZFIa6TSCp9SYOIEMXtXD1SFMK43cRq9JbQIyM+gFw10nSrVCTfOBBWp7+A
	 jIDEQ2o0xKDnw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWXd3N0e
  KwYet4hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aePdPYCmbwVjy5tI+9gfEydxcjF4eQwENG
  iUcbjjBDOFeYJCZP6GODcPYwSlw9e4uli5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBR4kLrx8ygtgsQPH1jyDivAJOEtc2LwOLSwgoSEx5+B6sl1PAWeLi+rVMXYwcQMucJI
  41eEGUC0qcnPmEBWK8hMTBFy+YIVoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0jXWSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3ZRiNeEdjF96/+odYpTkYFIS5WWN4UgR4kvKT6nMSCzOiC8qzUktPsQow8GhJMH7q
  QsoJ1iUmp5akZaZA4wjmLQEB4+SCO/deqA0b3FBYm5xZjpE6hSjopQ47waQPgGQREZpHlwbLH
  YvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm3Q4yhSczrwRu+iugxUxAiy/sZwFZXJKIkJJ
  qYBLPVpowS3rj5uN3Jh4q+LE6xv9wyMUP/yr2Xu0ONl6+KNs78khI1PpIhzVfa/9YztLV237O
  eoOOnqhF+0leDzmtP/6X1jcKLThr05LrZjav/5v/XW0ZT70l3ccmtlp/vet25mDTHLvzB7U57
  GfP3nFGY9fn7bP/aJpd0n4Rqjt9xmuplczzOmcpPZYq2dq1dEnbXMfINZ455+ZJ1h61zLrTv0
  zgQamV0uFpcVy+C4KCdxQf3br3zqfryhZteu/YbsXnHJMM6T34SaIka49d+ZnjRwUFLMwMH95
  /GtrX8iXdMqlgZxzvsZkSMv2uEr9/hOb+12fVC3jxP+HV/ycRaxW/W6xIVX4R5nDX1uvQ9elK
  LMUZiYZazEXFiQDNLga4WAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1678281659!96778!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6196 invoked from network); 8 Mar 2023 13:20:59 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:20:59 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1BB56142
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:20:59 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0FA2173
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:20:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:20:57 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gsoap: upgrade 2.0.106 -> 2.0.124
Date: Wed, 8 Mar 2023 21:20:40 +0800
Message-ID: <1678281642-25317-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678281642-25317-1-git-send-email-wangmy@fujitsu.com>
References: <1678281642-25317-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101413

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added C++17 'std::optional' member variable serialization.
- Updated wsdl2h to automatically generates 'std::optional' member variables for
  optional schemas when typedef.dat defines '$OPTIONAL = std::optional'.
  Only primitive type member variables are made 'std::optional', not classes,
  because optional types must be defined before referenced when in fact cyclic
  data structure relationships may exist among classes.
- Added missing 'std::vector<xsd__anyType>' deep copy of vector of DOM trees
  generated with soapcpp2 option '-Ec'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gsoap/{gsoap_2.8.106.bb => gsoap_2.8.124.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.106.bb => gsoap_2.8.124.bb} (89%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.106.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.124.bb
similarity index 89%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.106.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.124.bb
index 15c0f6faf..22e011979 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.106.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.124.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
            "
-SRC_URI[md5sum] = "0925d25bc455047b01d4fe9814d30173"
-SRC_URI[sha256sum] = "4e74838baf5437e95ae17aa3efb48bd0621f483bff4424f6255fcf327ff80765"
+SRC_URI[sha256sum] = "4b798780989338f665ef8e171bbcc422a271004d62d5852666d5eeca33a6a636"
 
 inherit autotools
 
-- 
2.34.1


