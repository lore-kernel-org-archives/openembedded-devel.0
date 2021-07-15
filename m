Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.172.1626365357960108706
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 09:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41550 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m43vI-0000O5-98; Thu, 15 Jul 2021 19:09:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-dateutil: Upgrade 2.8.1 -> 2.8.2
Date: Thu, 15 Jul 2021 19:09:06 +0300
Message-Id: <20210715160906.26266-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210715160906.26266-1-leon.anavi@konsulko.com>
References: <20210715160906.26266-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.8.2:

- Updated tzdata version to 2021a
- Fixed a bug in the parser where non-ValueError exceptions would
  be raised during exception handling; this would happen, for
  example, if an IllegalMonthError was raised in dateutil code.
- Fixed the custom repr for dateutil.parser.ParserError, which was
  not defined due to an indentation error.
- Fixed a bug that caused b' prefixes to appear in parse_isodate
  exception messages.
- Make isoparse raise when trying to parse times with inconsistent
  use of : separator.
- Fixed tz.gettz() not returning local time when passed an empty
  string.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dateutil_2.8.1.bb => python3-dateutil_2.8.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dateutil_2.8.1.bb => python3-dateutil_2.8.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
index 5326924e64..a68a736a8c 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.8.2.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://dateutil.readthedocs.org"
 LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
 
-SRC_URI[md5sum] = "f2a1d4b680b297b367a974664ca3a4f6"
-SRC_URI[sha256sum] = "73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c"
+SRC_URI[sha256sum] = "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
 
 PYPI_PACKAGE = "python-dateutil"
 inherit pypi setuptools3
-- 
2.17.1

