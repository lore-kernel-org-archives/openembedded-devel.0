Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.8079.1617284409464973810
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 06:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33924 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRxYN-0006Ea-Jr; Thu, 01 Apr 2021 16:40:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-xlsxwriter: Upgrade 1.3.7 -> 1.3.8
Date: Thu,  1 Apr 2021 16:39:58 +0300
Message-Id: <20210401134000.7628-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401134000.7628-1-leon.anavi@konsulko.com>
References: <20210401134000.7628-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade to release 1.3.8:

- Added ability to add accessibility options "description" and
  "decorative" to images via :func:`insert_image`.
- Added fix for datetime.timedelta values that exceed the Excel
  1900 leap day (timedeltas greater than 59 days, in hours).
  This is a backward incompatible change.
- Added the worksheet :func:`read_only_recommended` method to set
  the Excel "Read-only Recommended" option that is available when
  saving a file.
- Fixed issue where temp files used in `constant_memory` mode
  weren't closed/deleted if the workbook object was garbage
  collected.
- Fixed issue where pattern formats without colors were given a
  default black fill color.
- Added option to set a chart crossing to 'min' as well as the
  existing 'max' option. The 'min' option isn't available in the
  Excel interface but can be enabled via VBA.

License-Update: Updated copyright year.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-xlsxwriter_1.3.7.bb => python3-xlsxwriter_1.3.8.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.7.bb => python3-xlsxwriter_1.3.8.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.8.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.8.bb
index a8f013c58..e89221e5c 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.8.bb
@@ -2,13 +2,12 @@ SUMMARY = "Python 2 and 3 compatibility library"
 HOMEPAGE = "https://xlsxwriter.readthedocs.io"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0960d52d61b0801760f39463288c2672"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4e95e368cd6cb090815046688e92d11e"
 
 inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[md5sum] = "8c0595292fae76297eac03ae76507b7b"
-SRC_URI[sha256sum] = "9b1ade2d1ba5d9b40a6d1de1d55ded4394ab8002718092ae80a08532c2add2e6"
+SRC_URI[sha256sum] = "2b7e22b1268c2ed85d73e5629097c9a63357f2429667ada9863cd05ff8ee33aa"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

