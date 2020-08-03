Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11825.1596463541914244416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40282 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2b5w-00024S-Rc; Mon, 03 Aug 2020 17:05:41 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-openpyxl: Upgrade 3.0.3 -> 3.0.4
Date: Mon,  3 Aug 2020 17:05:16 +0300
Message-Id: <20200803140520.23250-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803140520.23250-1-leon.anavi@konsulko.com>
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 3.0.4:

- Find tables by name.
- Worksheet protection missing in existing files.
- Exception when reading files with external images.
- Reading lots of merged cells is very slow.
- Read support for Bubble Charts.
- Preserve any indexed colours.
- Reading many thousand of merged cells is really slow.
- Adding tables in write-only mode raises an exception.
- Add support for finding tables by name or range.

License-Update: Use the exact line from PKG-INFO for the
checksum of the license. The license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-openpyxl_3.0.3.bb => python3-openpyxl_3.0.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.3.bb => python3-openpyxl_3.0.4.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
index 018c4abe2..d0946e49a 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.4.bb
@@ -5,11 +5,11 @@ was initially based on PHPExcel."
 
 HOMEPAGE = "http://www.python-excel.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a6e506457afab4a25ecbaeb4bc3ed623"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "9583cea56b9d4441d96eb63a8a5c92a4"
-SRC_URI[sha256sum] = "547a9fc6aafcf44abe358b89ed4438d077e9d92e4f182c87e2dc294186dc4b64"
+SRC_URI[md5sum] = "8491219f6bd83ca6ad8334bf77435cf5"
+SRC_URI[sha256sum] = "d88dd1480668019684c66cfff3e52a5de4ed41e9df5dd52e008cbf27af0dbf87"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
-- 
2.17.1

