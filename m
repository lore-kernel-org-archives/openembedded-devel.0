Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.29590.1623677104222622997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 06:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38640 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lsmaJ-0004QX-4j; Mon, 14 Jun 2021 16:25:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-humanfriendly: Upgrade 9.1 -> 9.2
Date: Mon, 14 Jun 2021 16:24:37 +0300
Message-Id: <20210614132437.20878-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210614132437.20878-1-leon.anavi@konsulko.com>
References: <20210614132437.20878-1-leon.anavi@konsulko.com>
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

Upgrade to release 9.2:

- Fix several flake8 warnings.
- Mark Python 3.9 support final.
- Help to stabilize the test suite.
- Update the humanfriendly.sphinx module to include Sphinx
  extension metadata that has become mandatory in a recent Sphinx
  release. Add additional metadata including the version.

License-Update: Bump copyright years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-humanfriendly_9.1.bb => python3-humanfriendly_9.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanfriendly_9.1.bb => python3-humanfriendly_9.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
rename to meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
index fb6a7e3b6d..6be27f7606 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Human friendly output for text interfaces using Python"
 HOMEPAGE = "https://humanfriendly.readthedocs.io/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5d178009f806c2bdd498a19be0013a7a"
 
 PYPI_PACKAGE = "humanfriendly"
 
-SRC_URI[sha256sum] = "066562956639ab21ff2676d1fda0b5987e985c534fc76700a19bd54bcb81121d"
+SRC_URI[sha256sum] = "f7dba53ac7935fd0b4a2fc9a29e316ddd9ea135fb3052d3d0279d10c18ff9c48"
 
 inherit pypi setuptools3
 
-- 
2.17.1

