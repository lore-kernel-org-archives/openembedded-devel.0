Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.718.1603907195146142900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 10:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51340 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kXpWr-0001ga-E3; Wed, 28 Oct 2020 19:46:34 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-aiohttp: Upgrade 3.7.1 -> 3.7.2
Date: Wed, 28 Oct 2020 19:46:21 +0200
Message-Id: <20201028174622.7515-2-leon.anavi@konsulko.com>
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

Upgrade to release 3.7.2:

- Fixed static files handling for loops without .sendfile()
  support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.7.1.bb => python3-aiohttp_3.7.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.1.bb => python3-aiohttp_3.7.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
index 8b5b1dd160..178e68bd97 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
 
-SRC_URI[md5sum] = "ed78633cc420b29d3b61c7d877dc0901"
-SRC_URI[sha256sum] = "04f9d70f6c4d089be5068d7df6281e638f6820d4f1b1ec3dc012b0b43fa997d2"
+SRC_URI[md5sum] = "dcf770341241aa09340653a1562ca816"
+SRC_URI[sha256sum] = "c6da1af59841e6d43255d386a2c4bfb59c0a3b262bdb24325cc969d211be6070"
 
 PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
-- 
2.17.1

