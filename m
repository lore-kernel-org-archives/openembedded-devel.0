Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13522.1604063331029840816
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 06:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59628 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kYU9B-0005mn-8I; Fri, 30 Oct 2020 15:08:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-dateparser: Upgrade 0.7.6 -> 1.0.0
Date: Fri, 30 Oct 2020 15:08:39 +0200
Message-Id: <20201030130840.9169-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030130840.9169-1-leon.anavi@konsulko.com>
References: <20201030130840.9169-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 1.0.0:

- Drop support for Python 2.7 and pypy
- Now DateDataParser.get_date_data() returns a DateData object
  instead of a dict
- From now wrong settings are not silenced and raise
  SettingValidationError
- Now dateparser.parse() is deterministic and doesn't try previous
  locales. Also, DateDataParser.get_date_data() doesn't try the
  previous locales by default
- Remove the 'base-formats' parser
- Extract the 'no-spaces-time' parser from the 'absolute-time'
  parser and make it an optional parser
- Remove numeral_translation_data
- Remove the undocumented SKIP_TOKENS_PARSER and FUZZY settings
- Remove support for using strings in date_formats
- The undocumented ExactLanguageSearch class has been moved to the
  private scope and some internal methods have changed
- Changes in dateparser.utils: normalize_unicode() doesn't accept
  bytes as input and convert_to_unicode has been deprecated
- Add Python 3.9 support
- Detect hours separated with a period/dot
- Add support for "decade"
- Add support for the hijri calendar in Python ≥ 3.6
- New logo!
- Improve the README and docs
- Fix the "calendars" extra
- Fix leap years when PREFER_DATES_FROM is set
- Fix STRICT_PARSING setting in no-spaces-time parser
- Consider RETURN_AS_TIME_PERIOD setting for relative-time parser
- Parse the 24hr time format with meridian info
- Other small improvements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-dateparser_0.7.6.bb => python3-dateparser_1.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_0.7.6.bb => python3-dateparser_1.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
index e4683911e2..e3691dd83a 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_0.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.0.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[md5sum] = "78b4bf317f9b844631562abad5ce040b"
-SRC_URI[sha256sum] = "e875efd8c57c85c2d02b238239878db59ff1971f5a823457fcc69e493bf6ebfa"
+SRC_URI[md5sum] = "24a06a429597239004d47e6b93991aaf"
+SRC_URI[sha256sum] = "159cc4e01a593706a15cd4e269a0b3345edf3aef8bf9278a57dac8adf5bf1e4a"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.17.1

