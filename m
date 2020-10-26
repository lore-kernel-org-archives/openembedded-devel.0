Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10230.1603702957766579335
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 02:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55296 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kWyOi-0003YJ-3I; Mon, 26 Oct 2020 11:02:36 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-aiohttp: Upgrade 3.6.3 -> 3.7.1
Date: Mon, 26 Oct 2020 11:02:17 +0200
Message-Id: <20201026090217.21174-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026090217.21174-1-leon.anavi@konsulko.com>
References: <20201026090217.21174-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.7.1:

- Fixed a type error caused by the conditional import of Protocol
- Server doesn't send Content-Length for 1xx or 204
- Fix run_app typing
- Always require typing_extensions library
- Fix a variable-shadowing bug causing ThreadedResolver.resolve
  to return the resolved IP as the hostname in each record, which
  prevented validation of HTTPS connections
- Added annotations to all public attributes
- Fix flaky test_when_timeout_smaller_second
- Ensure sending a zero byte file does not throw an exception
- Fix a bug in web.run_app() about Python version checking on
  Windows

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.6.3.bb => python3-aiohttp_3.7.1.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.6.3.bb => python3-aiohttp_3.7.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
index 824bde5e25..8b5b1dd160 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
@@ -2,10 +2,10 @@ SUMMARY = "Async http client/server framework"
 DESCRIPTION = "Asynchronous HTTP client/server framework for asyncio and Python"
 HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
 
-SRC_URI[md5sum] = "13d02dc8379207dde1f6966d1fc5083d"
-SRC_URI[sha256sum] = "698cd7bc3c7d1b82bb728bae835724a486a8c376647aec336aa21a60113c3645"
+SRC_URI[md5sum] = "ed78633cc420b29d3b61c7d877dc0901"
+SRC_URI[sha256sum] = "04f9d70f6c4d089be5068d7df6281e638f6820d4f1b1ec3dc012b0b43fa997d2"
 
 PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
-- 
2.17.1

