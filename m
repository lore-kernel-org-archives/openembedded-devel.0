Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.660.1603907195870608774
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 10:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51340 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kXpWt-0001ga-3q; Wed, 28 Oct 2020 19:46:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-aiofiles: Upgrade 0.5.0 -> 0.6.0
Date: Wed, 28 Oct 2020 19:46:22 +0200
Message-Id: <20201028174622.7515-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201028174622.7515-1-leon.anavi@konsulko.com>
References: <20201028174622.7515-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.6.0:

- aiofiles is now tested on ppc64le.
- Added name and mode properties to async file objects.
- Fixed a DeprecationWarning internally.
- Python 3.9 support and tests.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiofiles_0.5.0.bb => python3-aiofiles_0.6.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_0.5.0.bb => python3-aiofiles_0.6.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
index 0559c01e41..89157b504f 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "2243eff06072115e8afe8907677ca51d"
-SRC_URI[sha256sum] = "98e6bcfd1b50f97db4980e182ddd509b7cc35909e903a8fe50d8849e02d815af"
+SRC_URI[md5sum] = "3b7ba03babd3d3a6101524469358843e"
+SRC_URI[sha256sum] = "e0281b157d3d5d59d803e3f4557dcc9a3dff28a4dd4829a9ff478adae50ca092"
 
 PYPI_PACKAGE = "aiofiles"
 
-- 
2.17.1

