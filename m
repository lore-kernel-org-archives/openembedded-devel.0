Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.27437.1629962385190454056
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 00:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Dj7OtFXs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629962382; i=@fujitsu.com;
	bh=AaFKT2PszQuwl91pKjyg33oHCbtoOIl+Azo/NsscQqU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Dj7OtFXs5a9X3X/qc37V0dPyXpJw1Jes1BdfByko9bsXxulMQsEb5540MbRF2+1vr
	 R+Fb3UWf8EI6QSity7CqTB/6WxD7ujDEnnmtmki6fR9qjRyf4GC7krNfqyXgH5+OpN
	 Yovgcsn3dc1OXGfwMOv944G2/uXnvt9dOU5yBsHdhDyRVVpwt9H14/jbyxauc4Abv7
	 QQRu+uhGeKSAmtE9/4c8QPpRDFhNlB6hJnt+vN9nG5kvNokTahtAPP0Id+lD9x/ZrE
	 gVh2vFboF8GAqY7gcA+dxf5ZKjlrm3JRw+98EuTVyBBst0ryPWJ8SfuvU22xVVJzdr
	 vd268vTDwZOyg==
Received: from [100.113.7.191] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id C0/30-25187-E8047216; Thu, 26 Aug 2021 07:19:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqtvnoJ5
  o8Oi4jMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjG18w97wSWOiu2vd7A2ML5h72Lk5BASmM0k
  MWNPCYS9h1HiyytFEJtNQFfi3OO1YDUiAvoSS2fvYQaxhQUcJRZ1vwOzWQRUJXa2TWXtYuTg4
  BXwlOjokQMJSwgoSEx5+B6shFdAUOLkzCcsIDazgITEwRcvmEHKJQQUJWZPl4cor5B4ffgS8w
  RGnllIOmYh6VjAyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FjXRNfQ2EAvsUo3SS+1VDc5Na+kKBE
  oq5dYXqxXXJmbnJOil5dasokRGEIphSxNOxh/v/qgd4hRkoNJSZR3g5J6ohBfUn5KZUZicUZ8
  UWlOavEhRhkODiUJ3ne2QDnBotT01Iq0zBxgOMOkJTh4lER499kBpXmLCxJzizPTIVKnGBWlx
  HlNzYASAiCJjNI8uDZYDF1ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMx7DGQ8T2ZeCdz0V0
  CLmYAWF/CpgiwuSURISTUwST/POyNTeEU7ICJr9UETfw/Z3M/cAksUJnXfc1rx8YyeWNdEe7d
  rXBHX38/nmL/xQPrrsjbLjTft3yrOmbL3teh9p7e20Wn/LDx969ZGP2jWK5jOLHfg1Ou3K0N+
  BLG4CS51W7Fir039qnnHNv4/93D1DHb7pnPxE/dqRi3f9rtJRu3iA4eyeQ0KZ+/rpFw9KC534
  MqHnnbLtd8q5Gt4raM+eyjZOIWxcEdsy/8398Hl9WtNF1+y8Q1o3cDnxS0yp7fHwmeyvOsP35
  ufNtWrlAad+PigZ3dF4PnLnnVRTjbfgrN29XKtW/N5LbeXpgPTqk+3N7j+DZKXyfJ5HGeq3rs
  nlDfow5vWspemp9pClFiKMxINtZiLihMBnORPfBwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-32.tower-248.messagelabs.com!1629962382!254585!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3949 invoked from network); 26 Aug 2021 07:19:42 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-32.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 07:19:42 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q7JgxW007070
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 08:19:42 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 08:19:40 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.2.31 -> 1.2.32
Date: Wed, 25 Aug 2021 12:30:08 +0800
Message-ID: <1629865808-121891-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../xmlsec1/{xmlsec1_1.2.31.bb => xmlsec1_1.2.32.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.31.bb => xmlsec1_1.2.32.bb} (93%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.32.bb
similarity index 93%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.32.bb
index 6a8af5111e..15da5aa6cb 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.32.bb
@@ -22,8 +22,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://ensure-search-path-non-host.patch \
     "
 
-SRC_URI[md5sum] = "182f5cbdfb8ddbac535c04470c170dc3"
-SRC_URI[sha256sum] = "9b10bc52cc31e4f76162e3975e50db26b71ab49c571d810b311ca626be5a0b26"
+SRC_URI[sha256sum] = "e383702853236004e5b08e424b8afe9b53fe9f31aaa7a5382f39d9533eb7c043"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.25.1

