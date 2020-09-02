Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5206.1599046103551071669
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 04:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46718 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDQw9-0000FC-AE; Wed, 02 Sep 2020 14:28:22 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-nmap: Upgrade 1.4.7 -> 1.4.8
Date: Wed,  2 Sep 2020 14:28:04 +0300
Message-Id: <20200902112808.18547-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902112808.18547-1-leon.anavi@konsulko.com>
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.8:

- Using of -Pn -sZ options for basic stealth scan
- Refactoring nmap3.py to avoid repetitive code
- Support for nmap stealth scans
- Fix handling of xml.etree.ElementTree.Element with no sub
  elements
- Support for gettings nmap raw outout

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-nmap_1.4.7.bb => python3-nmap_1.4.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-nmap_1.4.7.bb => python3-nmap_1.4.8.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb b/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
rename to meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
index 5ebd75711..2037d496a 100644
--- a/meta-python/recipes-devtools/python/python3-nmap_1.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.4.8.bb
@@ -8,8 +8,8 @@ DEPENDS += "${PYTHON_PN}-wheel-native"
 
 PYPI_PACKAGE = "python3-nmap"
 
-SRC_URI[md5sum] = "4dce15e7889b1e9bfa8e1e2e0904795c"
-SRC_URI[sha256sum] = "127b7ad604a3fd34578a6ad848a603ccf1608c607577eb3bba097a1e2fc8f48a"
+SRC_URI[md5sum] = "e7904b39b64a8a44f275388862659a0d"
+SRC_URI[sha256sum] = "8d7da78142bee665289a243f71c5f48407d8ab7e5a02ee672ded05f339044759"
 
 inherit pypi setuptools3
 
-- 
2.17.1

