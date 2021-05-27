Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.1254.1622078854233608102
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 18:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rBgTf6lk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622078852; i=@fujitsu.com;
	bh=AgAO+zKZmG8OFKy2ObEkrbOUxHKKZEojFHjifz+0pk4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rBgTf6lkQA5ur5+w2yP+/mOiv/l0RRndWKdQm4g22JMdnw7Jjwb/qEbHHQs+Dv1sM
	 dggw5U4ygY95Tli85XfeavEJPpzW6nvtHH+SI+whR/BCGhevbTjrgV08YBFB4PybZH
	 W37P+ggYu3iCo5jKP4Nelo7VYxQma+wgoOiC8eeqNOczHz5NBnjkX+U7KChclzOVlX
	 ipko6m0Dz5WxecIBI/pmK23KsTwBiO3Ob8Mafw1/Ty2qq/D8heTeI6sz3AdZhbgE7U
	 Ay/ZQvegyoXP/TBQuVTORg1W5Sp8lLqgxRtTHr5+RTjBJCSWEGad95jY8tscmaGivi
	 zwz2yp8pTRDJw==
Received: from [100.113.4.24] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 31/29-57985-385FEA06; Thu, 27 May 2021 01:27:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYotv8dV2
  CwflOLouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPV54mMBXs4K5Z0dTA2MN7h6GLk4hASmM0k
  ceDOShYIZw+jRMOLNUAOJwebgK7Eucdr2UFsEQF9iaWz9zCD2MICNhJ7LjxlBLFZBFQlnm/8z
  AZi8wp4Spy6fx6sXkJAQWLKw/fMEHFBiZMzn4DNZBaQkDj44gVQnAOoRlFi9nR5iPIKiRkztr
  FNYOSZhaRjFpKOBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2NdU10DY0N9BKrdJP0Ukt1k1PzSoo
  SgbJ6ieXFesWVuck5KXp5qSWbGIGBlFLI0rSD8ferD3qHGCU5mJREea+dWJcgxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYL34xegnGBRanpqRVpmDjCoYdISHDxKIryNr4HSvMUFibnFmekQqVOMi
  lLivFkgfQIgiYzSPLg2WCRdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuwNkCk9mXgnc9F
  dAi5mAFgslgi0uSURISTUwuaxrvLcuaVrlvor3f2oVKo+zHC11Sn2+8Xm7Xf+udf4VBUZn+Tj
  8q56IGtdvjotc8vzV5HopjerA3VIz3sfnNtlP2PRpmvsck0v3/f4+WZp0Q9zvEFOI7XvVO7PE
  Sny26/qJSG5/tTAvn2eT3Q6PCXOZOmUO7FWSld0xs/W/fmOzpe0L4Q72H5E6u8s0tzQ+83sdV
  duTodEruvL0hE81M9iaCl3k35Q1H2gok/oY+qkoxTHqiuDvdwb9y2/ekjt/J62V4a6gXfNBxS
  NaBWJ+knHf58xdINnwYpHUxbPP5iW4Gx3Yp8CfJ7S0g/2MrMnig67smccMGSc4TDkce9RLqen
  Kh9eBb9ovunrdOOGmxFKckWioxVxUnAgAR6wZ8B8DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-248.messagelabs.com!1622078850!64245!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9532 invoked from network); 27 May 2021 01:27:31 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-13.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 01:27:31 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R1RU71006793
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 02:27:30 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 02:27:29 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] valijson: upgrade 0.3 -> 0.4
Date: Thu, 27 May 2021 09:27:18 +0800
Message-ID: <1622078838-116598-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../valijson/{valijson_0.3.bb => valijson_0.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/{valijson_0.3.bb => valijson_0.4.bb} (96%)

diff --git a/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.3.bb b/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.4.bb
similarity index 96%
rename from meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.3.bb
rename to meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.4.bb
index 049cdeffc0..63930b960c 100644
--- a/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.3.bb
+++ b/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.4.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git"
-SRCREV = "7a52fc88cdffd6678c009ca2fad700151f7363c6"
+SRCREV = "9183462118f58a3ca4be82b8f656f18707229737"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

