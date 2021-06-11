Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web10.5885.1623402129874325348
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jun 2021 02:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g/tAf1Dk;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623402128; i=@fujitsu.com;
	bh=spKj8TOMGpMEDeBFQ1UdU5Yzoe2YnvuBY86rrqWsNgY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=g/tAf1Dk2FdgTVlWNwiUyzaQogYkZLgq8b4XboPpK6Ph8c+t8956xdJPW9ygMfFEn
	 SfJ2MyEb64flCQXo14QOUE2ZASqORfBFrASKG5h4yccrREp3ChBJFyJReeizznZXm0
	 hWtop9Q/eMAVzOKsFrTSreiZNduBJNytqU1I0O8LyJ6Adv0bF4pfWw3ovVwJ+LuHrW
	 LpnW2BtT7vNCFJFDBBg+zr+P2KETMroCTZWKgWimXMEbQ4Vt8lv3kkM9MfVraEXv0P
	 MQLHHaTg/SdXvtkmAenLoFwUeKAHK6lWK3JGvjPW1z7BDrIIZILX2QxD/qyopsIkGZ
	 Su58EhJ2JRQYg==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id E7/21-34775-F8623C06; Fri, 11 Jun 2021 09:02:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0e1XO5x
  g8PSTnMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH3QB9zwSX2ij9PExoYP7N1MXJxCAnMZpK4
  9/wKK4RzglFi25tupi5GTg42AR2JjhfdLCC2iIC+xNLZe5hBbGEBO4l3x5+B1bAIqEp8ujIBr
  IZXwF1i//yljCC2hICCxJSH75kh4oISJ2c+AathFpCQOPjiBTNEjaLE9p1nWCDsCokZM7axTW
  DkmYWkZRaSlgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLY11jYxN9BKrdBP1Ukt1y1OLS3Q
  N9RLLi/WKK3OTc1L08lJLNjECwyil4OCrHYwr33zQO8QoycGkJMo7ke1wghBfUn5KZUZicUZ8
  UWlOavEhRhkODiUJ3luqQDnBotT01Iq0zBxgSMOkJTh4lER4J6sApXmLCxJzizPTIVKnGBWlx
  HmFQPoEQBIZpXlwbbA4usQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFcTZApPZl4J3PRXQI
  uZgBYzaxwCWVySiJCSamDK9A6R3N76f8KVpYY3HXY+1bqyptnh9tnrCyQZ+icwLj2xNmFmwIS
  /Ow80l1bJVVwrO1r5aeHBe+5iky/lu57pP3pTfaX2XOEP7mHmhV9Lk1inTGJPPrFBNED3plIY
  2zx1NcbjUlfNXE/mRC/15VXsMXt/2mtJwapF2/S2xWW/nJ961fnOzlfOUjVzZm7kP7Hl56PY0
  MKbeocOKac/jRNhZtrN0LyD4f7ryHu7F+3lf6ak42/+/YlWnpal1IVa8Wbb7CO/Pk2/PJcp3/
  3Ys17Z/DWHf18scU8y7mSJnqRUrKGax/TTvuV84I6thV8Vav/s10/aqunSvY73DMvBq1zWnKe
  /Tq8uesPybvv8NWrMSizFGYmGWsxFxYkA3cmvJx4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-271.messagelabs.com!1623402127!20610!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2791 invoked from network); 11 Jun 2021 09:02:07 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-15.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jun 2021 09:02:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15B921gs005608
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 10:02:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 11 Jun 2021 10:01:59 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] toybox: upgrade 0.8.4 -> 0.8.5
Date: Fri, 11 Jun 2021 17:01:51 +0800
Message-ID: <1623402111-51803-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-core/toybox/{toybox_0.8.4.bb => toybox_0.8.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.8.4.bb => toybox_0.8.5.bb} (97%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.4.bb b/meta-oe/recipes-core/toybox/toybox_0.8.5.bb
similarity index 97%
rename from meta-oe/recipes-core/toybox/toybox_0.8.4.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.5.bb
index cc98b9ec07..90a0ad6c73 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.4.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.5.bb
@@ -9,7 +9,7 @@ inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "cb2a565a8d30015d08d73628795dca51a85b99b149aeabbbecd9e8dbdbd8fddc"
+SRC_URI[sha256sum] = "bfd230c187726347f7e31a1fc5841705871dfe4f3cbc6628f512b54e57360949"
 
 SECTION = "base"
 
-- 
2.25.1

