Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10436.1591794962526422215
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 06:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40010 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jj0aG-0005hT-KW; Wed, 10 Jun 2020 16:16:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-nmap: Upgrade 1.4.1 -> 1.4.7
Date: Wed, 10 Jun 2020 16:15:35 +0300
Message-Id: <20200610131536.31426-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610131536.31426-1-leon.anavi@konsulko.com>
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.7:

* Minor bug fixes
* Documentation updates
* Added support for UDP
* Hostdiscovery and major code refactor

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-nmap_1.4.1.bb => python3-nmap_1.4.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.4.1.bb => python3-nmap_1.4.7.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb b/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
index 80384845d..5ebd75711 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
@@ -8,8 +8,8 @@ DEPENDS += "${PYTHON_PN}-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
 
-SRC_URI[md5sum] = "64a382c870e14b53f2f52b7455996321"
-SRC_URI[sha256sum] = "9b64c5956789f4cac9e8ea2e0de6763dea1cecde1a20ae50a4b4dc5ab0ab6e42"
+SRC_URI[md5sum] = "4dce15e7889b1e9bfa8e1e2e0904795c"
+SRC_URI[sha256sum] = "127b7ad604a3fd34578a6ad848a603ccf1608c607577eb3bba097a1e2fc8f48a"
 
 inherit pypi setuptools3
 
-- 
2.17.1

