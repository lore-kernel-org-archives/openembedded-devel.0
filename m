Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.36536.1629793111198997884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 01:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45220 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mIRdV-0003rk-G3; Tue, 24 Aug 2021 11:18:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-colorlog: Upgrade 5.0.1 -> 6.4.1
Date: Tue, 24 Aug 2021 11:18:12 +0300
Message-Id: <20210824081816.1806-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 6.4.1:

- Renamed colorlog.logging to colorlog.wrappers
- Import log levels from the logging module
- Dropped support for Python 2 and Python versions below 3.5
- Added type hints and added mypy to CI
- Support 256 colour ANSI codes
- Support "light" ANSI codes
- Support the NO_COLOR environment variable, and a no_color option
- Updated various examples and documentation
- Merged TTYColoredFormatter into ColoredFormatter, and ensure no
  ANSI codes are printed when colors are disabled
- Replaced LevelFormatter with a far simpler implementation
- Fixed version_info check for the Formatter validate parameter
- Define formatMessage instead of format, so that ColoredRecord is
  used in fewer places
- Use setuptool's "normalised" format for the version number
- Add PEP 561 typing marker so mypy can find type annotations
- Renamed internal modules
- colorlog.colorlog is now colorlog.formatter
- colorlog.logging is now colorlog.wrappers
- Removed colorlog.escape_codes object so that the
  colorlog.escape_codes module can be imported and used
- Import log levels from the logging module

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-colorlog_5.0.1.bb => python3-colorlog_6.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_5.0.1.bb => python3-colorlog_6.4.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_5.0.1.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.4.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-colorlog_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.4.1.bb
index 61b8152a1e..59a0e94939 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.4.1.bb
@@ -7,4 +7,4 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "f17c013a06962b02f4449ee07cfdbe6b287df29efc2c9a1515b4a376f4e588ea"
+SRC_URI[sha256sum] = "af99440154a01f27c09256760ea3477982bf782721feaa345904e806879df4d8"
-- 
2.17.1

