Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1903.1610101707600113505
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 02:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44762 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxp0J-0000kU-5a; Fri, 08 Jan 2021 12:28:24 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-aiohttp: Upgrade 3.7.2 -> 3.7.3
Date: Fri,  8 Jan 2021 12:28:10 +0200
Message-Id: <20210108102814.9560-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.7.3:

- Use Brotli instead of brotlipy
- Made exceptions pickleable. Also changed the repr of some
  exceptions.
- Raise a ClientResponseError instead of an AssertionError for
  a blank HTTP Reason Phrase.
- Fix web_middlewares.normalize_path_middleware behavior for
  patch without slash.
- Fix overshadowing of overlapped sub-applications prefixes.
- Make BaseConnector.close() a coroutine and wait until the client
  closes all connections. Drop deprecated "with Connector():"
  syntax.
- Reset the sock_read timeout each time data is received for a
  aiohttp.client response.
- Fixed type annotation for add_view method of UrlDispatcher to
  accept any subclass of View
- Fixed querying the address families from DNS that the current
  host supports.
- Change return type of MultipartReader.aiter() and
  BodyPartReader.aiter() to AsyncIterator.
- Provide x86 Windows wheels.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.7.2.bb => python3-aiohttp_3.7.3.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.2.bb => python3-aiohttp_3.7.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
index c98e3aee7..bccbd4b0e 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
 
-SRC_URI[md5sum] = "dcf770341241aa09340653a1562ca816"
-SRC_URI[sha256sum] = "c6da1af59841e6d43255d386a2c4bfb59c0a3b262bdb24325cc969d211be6070"
+SRC_URI[sha256sum] = "9c1a81af067e72261c9cbe33ea792893e83bc6aa987bfbd6fdc1e5e7b22777c4"
 
 PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
-- 
2.17.1

