Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 86C2D7D264
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 12:16:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l17so2961271wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 04:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F33yC1MEprTDQSBx9Hr46v9g1wrT537D4QrE+S0To9c=;
	b=l7P2pjndxGeq5cpSRfVPwMZmxL1yOZfCEaEEc3ZTtAnFw+A14pacNLh392fSxmYTFD
	2ISqNYwQkHS+CaYAc4+Whjn6x7MBeEIVy0bR9alxquLnTjwq8xCqsMpft8U6QhcCgQ1T
	4DYhmhKg+bs4OjfZiyMRf6tLmNj2yz9dAJIoQ06dusMsmEQy79YUYSk2mdu2QvJuzQUj
	afOzcEXazfDmyf2g9qtF1A9agw47ZON6TnYO9UcwA1SEviYYrNcOzaL/DZFa7a+gkGLq
	3hL+bqMbG09KqNjgfTIK2R2D90SHIB3E3dPo9xafpjJkOu0iGvt3T9lRWGmQ+zKAUSZz
	nuug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F33yC1MEprTDQSBx9Hr46v9g1wrT537D4QrE+S0To9c=;
	b=axc7g/uueEQ8HY8XhYgW3u41GJYblue8qkQJmPFrrG1Vd3HTvBhMQ8yNeJQ8sqDE9A
	lLw7p8TBAXsd4tvz4k7ZfAuQum07KNfWI1jvg0mczwmZVPvF8VNupkaxd2dUazdTcIJZ
	vsEBQZ02/IWXOrukqpprrpKTYK7gLO/K3s6HJiQ9+wi/vuza3BFMO7aSuamlHHurk+XR
	3mwHPNyoLxDiaJvFCFMtpzDPsXUJB818oeWmFSmoh4YTO/Ed4Fu5FSeLuDbCF90Fe6cx
	Olt0FnG2jkX2P7BDEY5aYC17krw+2NrxBbBBTmADVAVTW6R6O05fgZ5wcu6h215Q1/mV
	QRJg==
X-Gm-Message-State: APjAAAXWHrwoN9Qtaqi6tjPIk92sWbtxkuWP1zDziRQ4BEbGkUF+6EEA
	fOdrllQs68HUsoSuzsxcBxaVhm2I6ek=
X-Google-Smtp-Source: APXvYqyGQQ3QYGMwf5wNm4WmHE2GmIOu5xqgga/HgNdh64SqfpLe4ay5xdrLkC2+FojsQljEqFNFFg==
X-Received: by 2002:a1c:e3d4:: with SMTP id a203mr4886478wmh.173.1574165790742;
	Tue, 19 Nov 2019 04:16:30 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 11sm2945036wmb.34.2019.11.19.04.16.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 04:16:29 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 12:16:10 +0000
Message-Id: <20191119121609.19869-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-importlib-metadata: fix class-target overriding default dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2019 12:16:30 -0000
Content-Transfer-Encoding: 8bit

in commit fcda3fb1a3fbfac075325482074898dfb7138da7
  python3-importlib-metadata: RDEPEND python3-misc only for target and nativesdk

The RDEPENDS for class target was "appended" with +=
  RDEPENDS_${PN}_class-target += "python3-misc"

Using += for class target does't append the dependencies to
the existing one, instead what it does is overwrite it.
This was causing the RDEPENDS to be wrongly set only to python3-misc
not including the one included in the inc file (zipp, pathlib2).
Use append instead.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python3-importlib-metadata_0.23.bb                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
index 851d703c9..8a971dac0 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
@@ -1,5 +1,5 @@
 inherit pypi setuptools3
 require python-importlib-metadata.inc
 
-RDEPENDS_${PN}_class-target += "python3-misc"
-RDEPENDS_${PN}_class-nativesdk += "python3-misc"
+RDEPENDS_${PN}_append_class-target = " python3-misc"
+RDEPENDS_${PN}_append_class-nativesdk = " python3-misc"
-- 
2.20.1


