Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6925.1586161920570890273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 01:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=42224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jLNAk-0004FY-KW; Mon, 06 Apr 2020 11:31:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 3/3] python-luma-oled: add new recipe
Date: Mon,  6 Apr 2020 11:31:50 +0300
Message-Id: <1586161910-31315-3-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586161910-31315-1-git-send-email-leon.anavi@konsulko.com>
References: <1586161910-31315-1-git-send-email-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Python library interfacing OLED matrix displays with the SSD1306,
SSD1309, SSD1322, SSD1325, SSD1327, SSD1331, SSD1351 or SH1106
driver using I2C/SPI on the Raspberry Pi and other single-board
computers.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-luma-oled_3.4.0.bb                | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb
new file mode 100644
index 0000000..ee3b00e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.4.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A small library to drive an OLED device"
+DESCRIPTION = "\
+A small library to drive an OLED device with either SSD1306 , SSD1309, SSD1322, \
+SSD1325, SSD1327, SSD1331, SSD1351 or SH1106 chipset"
+HOMEPAGE = "https://github.com/rm-hull/luma.oled"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "2944155b2242b9d2ddeb6e139c6083b8"
+SRC_URI[sha256sum] = "2ea2b535e7e2f056a51a8c54ad78aa1f00d5699fc439c01bc7c2902823889552"
+
+CLEANBROKEN = "1"
+
+PYPI_PACKAGE = "luma.oled"
+
+RDEPENDS_${PN} += " \
+	${PYTHON_PN}-luma-core \
+"
-- 
2.7.4

