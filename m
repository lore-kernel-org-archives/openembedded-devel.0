Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3683.1606389759136033816
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 03:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52394 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiFMD-0005Yd-Cn; Thu, 26 Nov 2020 13:22:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-urllib3: Upgrade 1.25.11 -> 1.26.2
Date: Thu, 26 Nov 2020 13:22:14 +0200
Message-Id: <20201126112215.11451-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201126112215.11451-1-leon.anavi@konsulko.com>
References: <20201126112215.11451-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.26.2:

- NOTE: urllib3 v2.0 will drop support for Python 2.
- Added support for HTTPS proxies contacting HTTPS servers
- Deprecated negotiating TLSv1 and TLSv1.1 by default. Users that
  still wish to use TLS earlier than 1.2 without a deprecation
  warning should opt-in explicitly by setting
  ssl_version=ssl.PROTOCOL_TLSv1_1 Starting in urllib3 v2.0:
  Connections that receive a ``DeprecationWarning`` will fail
- Deprecated Retry options Retry.DEFAULT_METHOD_WHITELIST,
  Retry.DEFAULT_REDIRECT_HEADERS_BLACKLIST and
  Retry(method_whitelist=...) in favor of Retry.DEFAULT_ALLOWED_METHODS,
  Retry.DEFAULT_REMOVE_HEADERS_ON_REDIRECT, and
  Retry(allowed_methods=...)
  Starting in urllib3 v2.0: Deprecated options will be removed
- Added default User-Agent header to every request
- Added urllib3.util.SKIP_HEADER for skipping User-Agent,
  Accept-Encoding, and Host headers from being automatically
  emitted with requests
- Collapse transfer-encoding: chunked request data and framing
  into the same socket.send() call
- Send http/1.1 ALPN identifier with every TLS handshake by default
- Properly terminate SecureTransport connections when CA
  verification fails
- Don't emit an SNIMissingWarning when passing server_hostname=None
  to SecureTransport
- Disabled requesting TLSv1.2 session tickets as they weren't
  being used by urllib3
- Suppress BrokenPipeError when writing request body after the
  server has closed the socket
- Wrap ssl.SSLError that can be raised from reading a socket
  (e.g. "bad MAC") into an urllib3.exceptions.SSLError
- Fixed an issue where two User-Agent headers would be sent if a
  User-Agent header key is passed as bytes

License-Update: Update copyright date

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-urllib3_1.25.11.bb => python3-urllib3_1.26.2.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.11.bb => python3-urllib3_1.26.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
index 980f4c53d2..fcd6709017 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.11.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.2.bb
@@ -1,10 +1,9 @@
 SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
 HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[md5sum] = "d47dd21a6e66a03c3633cac468ffd010"
-SRC_URI[sha256sum] = "8d7eaa5a82a1cac232164990f04874c594c9453ec55eef02eab885aa02fc17a2"
+SRC_URI[sha256sum] = "19188f96923873c92ccb987120ec4acaa12f0461fa9ce5d3d0772bc965a39e08"
 
 inherit pypi setuptools3
 
-- 
2.17.1

