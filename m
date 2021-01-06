Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.1149.1609970857007467832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxn-0004lA-7n; Thu, 07 Jan 2021 00:07:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-babel: Upgrade 2.8.0 -> 2.9.0
Date: Thu,  7 Jan 2021 00:07:02 +0200
Message-Id: <20210106220702.10483-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.9.0:

- CLDR: Use CLDR 37
- Dates: Handle ZoneInfo objects in get_timezone_location,
  get_timezone_name
- Numbers: Add group_separator feature in number formatting
- Dates: Correct default Format().timedelta format to 'long' to
  mute deprecation warnings
- Import: Simplify iteration code in "import_cldr.py"
- Import: Stop using deprecated ElementTree methods
  "getchildren()" and "getiterator()"
- Messages: Fix unicode printing error on Python 2 without TTY.
- Messages: Introduce invariant that _invalid_pofile() takes
  unicode line.
- Tests: fix tests when using Python 3.9
- Tests: Remove deprecated 'sudo: false' from Travis configuration
- Tests: Support Py.test 6.x
- Utilities: LazyProxy: Handle AttributeError in specified func
- Utilities: Replace usage of parser.suite with ast.parse

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-babel_2.8.0.bb => python3-babel_2.9.0.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-babel_2.8.0.bb => python3-babel_2.9.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-babel_2.8.0.bb b/meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-babel_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
index c69098b226..7248abf33b 100644
--- a/meta-python/recipes-devtools/python/python3-babel_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-babel_2.9.0.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=942469df9305abb1c59e95f778310384"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22a580b27e4ebf9689e466b63aedeb7f"
 
-SRC_URI[md5sum] = "6fad9772e75421969ddb41975483abdf"
-SRC_URI[sha256sum] = "1aac2ae2d0d8ea368fa90906567f5c08463d98ade155c0c4bfedd6a0f7160e38"
+SRC_URI[sha256sum] = "da031ab54472314f210b0adcff1588ee5d1d1d0ba4dbd07b94dba82bde791e05"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.17.1

