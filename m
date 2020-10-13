Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7577.1602579563512072019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 01:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSG9P-0002BF-R2; Tue, 13 Oct 2020 11:59:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-aiohttp: Upgrade 3.6.2 -> 3.6.3
Date: Tue, 13 Oct 2020 11:59:08 +0300
Message-Id: <20201013085914.31580-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.6.3:

- Pin yarl to <1.6.0 to avoid buggy behavior that will be fixed
  by the next aiohttp release.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.6.2.bb => python3-aiohttp_3.6.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.6.2.bb => python3-aiohttp_3.6.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
index 121447cdb7..824bde5e25 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.3.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[md5sum] = "ca40144c199a09fc1a141960cf6295f0"
-SRC_URI[sha256sum] = "259ab809ff0727d0e834ac5e8a283dc5e3e0ecc30c4d80b3cd17a4139ce1f326"
+SRC_URI[md5sum] = "13d02dc8379207dde1f6966d1fc5083d"
+SRC_URI[sha256sum] = "698cd7bc3c7d1b82bb728bae835724a486a8c376647aec336aa21a60113c3645"
 
 PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
-- 
2.17.1

