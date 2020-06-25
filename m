Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6534.1593076123859871746
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNsA-0005y7-5D; Thu, 25 Jun 2020 12:08:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/12] python3-coloredlogs: Upgrade 10.0 -> 14.0
Date: Thu, 25 Jun 2020 12:07:18 +0300
Message-Id: <20200625090719.16068-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
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

Upgrade to release 14.0:

- Integrate native Windows 10 support for ANSI escape sequences
- Native support for ANSI escape sequences was added to Windows
  10 after its initial release
- Merged pull request #80 that drops support for Python 3.4
  which has gone end-of-life and now represents less than 1% of
  PyPI downloads.
- Improved compatibility with the Python standard library by
  changing the order of positional arguments received by the
  initializer of the ColoredFormatter class
- Add support for the %(username)s field and properly document
  supported custom fields.
- Consistently use console highlighting in documentation.
- Fix a broken link in the readme.

The year in LICENSE.txt has been updated.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-coloredlogs_10.0.bb => python3-coloredlogs_14.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coloredlogs_10.0.bb => python3-coloredlogs_14.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
rename to meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
index 88fac87c7..64f3008ee 100644
--- a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Colored terminal output for Python's logging module"
 HOMEPAGE = "https://coloredlogs.readthedocs.io"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
 
-SRC_URI[md5sum] = "0a186966a1955fff8cf9489373e691d9"
-SRC_URI[sha256sum] = "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36"
+SRC_URI[md5sum] = "34cd8ef3f758b10c6f1482b2614a81f2"
+SRC_URI[sha256sum] = "a1fab193d2053aa6c0a97608c4342d031f1f93a3d1218432c59322441d31a505"
 
 inherit pypi setuptools3
 
-- 
2.17.1

