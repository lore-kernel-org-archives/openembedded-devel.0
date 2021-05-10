Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.32103.1620655670733034186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lg6ZX-000657-KT; Mon, 10 May 2021 17:07:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-websockets: Upgrade 8.1 -> 9.0.1
Date: Mon, 10 May 2021 17:07:20 +0300
Message-Id: <20210510140722.27201-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510140722.27201-1-leon.anavi@konsulko.com>
References: <20210510140722.27201-1-leon.anavi@konsulko.com>
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

Upgrade to release 9.0.1:

- Fixed issues with the packaging of the 9.0 release.
- :class:`~datastructures.Headers` and
  :exc:`~datastructures.MultipleValuesError` were moved from
  websockets.http to :mod:`websockets.datastructures`.
  If you're using them, you should adjust the import path.
- The client, server, protocol, and auth modules were moved from
  the websockets package to websockets.legacy sub-package, as part
  of an upcoming refactoring. Despite the name, they're still
  fully supported. The refactoring should be a transparent upgrade
  for most uses when it's available. The legacy implementation
  will be preserved according to the backwards-compatibility
  policy.
- The framing, handshake, headers, http, and uri modules in the
  websockets package are deprecated. These modules provided
  low-level APIs for reuse by other WebSocket implementations, but
  that never happened. Keeping these APIs public makes it more
  difficult to improve websockets for no actual benefit.
- Added compatibility with Python 3.9.
- Added support for IRIs in addition to URIs.
- Added close codes 1012, 1013, and 1014.
- Raised an error when passing a :class:`dict` to
  :meth:`~legacy.protocol.WebSocketCommonProtocol.send`.
- Fixed sending fragmented, compressed messages.
- Fixed Host header sent when connecting to an IPv6 address.
- Fixed creating a client or a server with an existing Unix socket.
- Aligned maximum cookie size with popular web browsers.
- Ensured cancellation always propagates, even on Python versions
  where :exc:`~asyncio.CancelledError` inherits :exc:`Exception`.
- Improved error reporting.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-websockets_8.1.bb => python3-websockets_9.0.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_8.1.bb => python3-websockets_9.0.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_8.1.bb b/meta-python/recipes-devtools/python/python3-websockets_9.0.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-websockets_8.1.bb
rename to meta-python/recipes-devtools/python/python3-websockets_9.0.1.bb
index b09e978af7..58f4f10ff7 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_9.0.1.bb
@@ -2,12 +2,11 @@ SUMMARY = "An implementation of the WebSocket Protocol (RFC 6455)"
 HOMEPAGE = "https://github.com/aaugustin/websockets"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ad5c6d36b3d0098b2f33a5ab69a9e750"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=78c2cc91e172ca96d6f8e4a76c739ec6"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "f12d7f31fe8d0b3e65c12f845bcd0ad8"
-SRC_URI[sha256sum] = "5c65d2da8c6bce0fca2528f69f44b2f977e06954c8512a952222cea50dad430f"
+SRC_URI[sha256sum] = "2ab64e9fd18e57a66b63a8774e337d81d6366412bef65c7d71f87ad5c4faeed5"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1

