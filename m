Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13510.1598362014890922143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAYyT-0001xr-2j; Tue, 25 Aug 2020 16:26:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-flask: Upgrade 1.1.1 -> 1.1.2
Date: Tue, 25 Aug 2020 16:26:33 +0300
Message-Id: <20200825132633.875-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825132633.875-1-leon.anavi@konsulko.com>
References: <20200825132633.875-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.2:

- Work around an issue when running the flask command with an
  external debugger on Windows.
- The static route will not catch all URLs if the Flask
  static_folder argument ends with a slash.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-flask_1.1.1.bb => python3-flask_1.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask_1.1.1.bb => python3-flask_1.1.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb b/meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
index fbe1ca00e..23799617f 100644
--- a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[md5sum] = "0e3ed44ece1c489ed835d1b7047e349c"
-SRC_URI[sha256sum] = "13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52"
+SRC_URI[md5sum] = "0da4145d172993cd28a6c619630cc19c"
+SRC_URI[sha256sum] = "4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.17.1

