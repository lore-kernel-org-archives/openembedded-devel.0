Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5B860A7E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 17:51:28 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id q84so12817883oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 09:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MprIH+4fH5Ixo+lBV3u4v2Zc0M5UU+twsfIBC/Bny0Y=;
	b=Nf6wDaBTHst/my6EuS73YiijhcjT4+43fyK088CGF9xTEC8EIwz26N7F23HPB2+N3E
	5I7ZOuViZtGmvpyK1fy0JJ5NF8wVscKn3odzfckaJG6yRGx8GPSWtwBzBIA5sLWHmif/
	jXsTwliYyV7rB5NyI+3uDXsoAyWi0AIzAgLMjJPMg6XR1NEBRZmSEtqLtq4xq5yPE8hU
	4i0DI6fRMubqFvQzNbkqQWCHoStebHuLaUhlXZigO7xsl8QCSzxh3+s65bIHgNqQHI4S
	rUsxYhg6c2lfPaADzauj4yvu1Dz5y03M1/f64biLSWYQy86IUFPy/iIWU5b+jLtA4Y5B
	PbCg==
X-Gm-Message-State: APjAAAXM6k+GnsfUYV6ksB9SJnIj26lf8kgdRoW9GgXWKm8XJH0ITE3N
	H6q2f8nS0m9AY7qvaRR2hGtJH5Je5xs=
X-Google-Smtp-Source: APXvYqzSWmgHiPzex9AP3jMIi7Ica8QQc8kW1JKa2c1NRlAlL4vsy5xbmUBnAj4rAV3375xgqihvuQ==
X-Received: by 2002:aca:5258:: with SMTP id g85mr5628349oib.80.1581789089215; 
	Sat, 15 Feb 2020 09:51:29 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	k201sm2999523oih.43.2020.02.15.09.51.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 09:51:28 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 12:51:19 -0500
Message-Id: <20200215175119.3553-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-crcmod: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Sat, 15 Feb 2020 17:51:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-crcmod.inc    | 14 --------------
 .../python/python3-crcmod_1.7.bb                 | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-crcmod.inc

diff --git a/meta-python/recipes-devtools/python/python-crcmod.inc b/meta-python/recipes-devtools/python/python-crcmod.inc
deleted file mode 100644
index 85da7cb3c2..0000000000
--- a/meta-python/recipes-devtools/python/python-crcmod.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A Python module for generating objects that compute the Cyclic Redundancy Check."
-HOMEPAGE = "https://pypi.org/project/crcmod"
-LICENSE = "MIT"
-SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a19291627cad2d1dfbfcf3c9fb85c2"
-
-SRC_URI[md5sum] = "2d5b92117d958dcead94f9e17f54cd32"
-SRC_URI[sha256sum] = "dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e"
-
-inherit pypi
-
-RDEPENDS_${PN} += "${PYTHON_PN}-unittest"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb b/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
index 6996b13d0d..14a344f76f 100644
--- a/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb
@@ -1,2 +1,14 @@
-inherit setuptools3
-require python-crcmod.inc
+SUMMARY = "A Python module for generating objects that compute the Cyclic Redundancy Check."
+HOMEPAGE = "https://pypi.org/project/crcmod"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a19291627cad2d1dfbfcf3c9fb85c2"
+
+SRC_URI[md5sum] = "2d5b92117d958dcead94f9e17f54cd32"
+SRC_URI[sha256sum] = "dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-unittest"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


