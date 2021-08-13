Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web10.33531.1628838863913365681
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Aug 2021 00:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EkfJDMlC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: leimaohui@fujitsu.com)
Return-Path: <leimaohui@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628838861; i=@fujitsu.com;
	bh=FJthaqcQ9b6kv/T4M7EqBCLEirpLCxuE2c+XcQyweGI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EkfJDMlCxMk1gh5cFXWPjVDonELuzrC/NYaxhdSHNv0JyqhWtytd63SXbBTn1u0En
	 03K+RsXD99KDLzm4iqjRKgLl3myP3GNmqaO6fnpRp+pbagOt5/UfX4KfgBvo7vMVRc
	 t2NCf05WzGFRFLsb25PeNCE01cP3v5A0r1em2LFPu7MkqeQwUzVyuJ48eehyJlin3o
	 HVoVke+jmdyLLXPAYmE/eBQgvq/1/cce/chGFOGnWAyc4Gd0je+K7+h9I0bmys7bMC
	 WL9G4IFW3LEo5p9q8/VqSimqtyMT2gzPUA5eCrJuxY9k/x++bP88UUUmyp29+mOCxI
	 kjUBcB7ppmAng==
Received: from [100.112.198.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id BD/A6-17036-DCB16116; Fri, 13 Aug 2021 07:14:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxVfestFi
  iQe9cTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePw/B+sBQu5K9ZdmcnewDibq4uRi0NIYDaT
  xMaDzUwQzl5GiTlr1jF3MXJysAloSOyeehnMFhHQl1g6ew+YzSygJnH05U8wW1jAUmLp/6lMI
  DaLgKrEszln2UBsXgEXiRltE1hAbAkBBYkpD9+D1XMKuEpc+HydFcQWAqp58PokI0S9oMTJmU
  9YIOZLSBx88YIZoldJ4u2lPYwQdoXErFltTBMY+WchaZmFpGUBI9MqRoukosz0jJLcxMwcXUM
  DA11DQyNdQ0sLXUNjA73EKt0kvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwIBMKTjWtIPx
  5OsPeocYJTmYlER5N5wVSRTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwRssIZYoJFiUmp5akZaZA
  4wOmLQEB4+SCO8rSaA0b3FBYm5xZjpE6hSjLsfqJ4sXMQux5OXnpUqJ85aDFAmAFGWU5sGNgE
  XqJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvFHAuBfiycwrgdv0CugIJqAj1lmLghxRkoi
  QkmpgMjAPORx+bsFKVwbOgkfiyWp1G2cvvbgpIZf1hGft27v9oQ+Z+Pa+9tHuOzldzU+wybqF
  M2SVvjLz3NwIIc3jT47WqDRPWcU/43tjoKPd7cRFn+dMufN0js0MXme/a68mXbm2qj0k0dik+
  4Tuq+fNXbv9P/9+UyBiIfNIv8LppbKp0a2lkpOm7pyvdujo7Wmxs/w/TI4Qy7wezbudobXnl1
  kYq+X++gf6JddfXvmd1qRquof5ty6PX/zsPdoyOuWppnEXOzzsV2kdVq7R9FjLGrtKpnHvr7T
  kdxMCzS/ccpl5ZMfaft/DndoXXr6zrJOxOj9P3Tta7sds3wAl5R/aWpPi6x/XVx43vbNmz8lO
  JZbijERDLeai4kQAQcc8iE8DAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-9.tower-291.messagelabs.com!1628838860!228182!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9883 invoked from network); 13 Aug 2021 07:14:21 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Aug 2021 07:14:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17D7EFVv016779
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 08:14:20 +0100
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 13 Aug 2021 08:14:15 +0100
From: "leimaohui" <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] ttf-ipa: Added a new font.
Date: Sat, 14 Aug 2021 00:14:05 +0800
Message-ID: <1628871245-5054-2-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1628871245-5054-1-git-send-email-leimaohui@fujitsu.com>
References: <1628871245-5054-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

IPAfonts is a Japanese OpenType font set.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../ttf-fonts/ttf-ipa_003.03.01.bb            | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
new file mode 100644
index 000000000..b0af08097
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ipa_003.03.01.bb
@@ -0,0 +1,25 @@
+require ttf.inc
+
+SUMMARY = "Ipa fonts - TTF Version"
+HOMEPAGE = "https://moji.or.jp/ipafont"
+LICENSE = "IPA"
+LICENSE_URL = "https://moji.or.jp/ipafont/license/"
+LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276 \
+"
+PR = "r0"
+
+SRC_URI = "https://moji.or.jp/wp-content/ipafont/IPAfont/IPAfont00303.zip "
+
+SRC_URI[md5sum] = "39a828acf27790adbe4944dfb4d94bb1"
+SRC_URI[sha256sum] = "f755ed79a4b8e715bed2f05a189172138aedf93db0f465b4e20c344a02766fe5"
+
+S = "${WORKDIR}/IPAfont00303" 
+
+PACKAGES = "ttf-ipag ttf-ipagp ttf-ipam ttf-ipamp"
+FONT_PACKAGES = "ttf-ipag ttf-ipagp ttf-ipam ttf-ipamp"
+
+FILES:ttf-ipag = "${datadir}/fonts/truetype/ipag.ttf"
+FILES:ttf-ipagp = "${datadir}/fonts/truetype/ipagp.ttf"
+FILES:ttf-ipam = "${datadir}/fonts/truetype/ipam.ttf"
+FILES:ttf-ipamp = "${datadir}/fonts/truetype/ipamp.ttf"
+
-- 
2.25.1

