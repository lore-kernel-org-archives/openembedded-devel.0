Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.33284.1601898915886498806
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 04:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44266 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPP5G-0004NT-2s; Mon, 05 Oct 2020 14:55:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] beautifulsoup4: Upgrade 4.9.2 -> 4.9.3
Date: Mon,  5 Oct 2020 14:55:05 +0300
Message-Id: <20201005115507.11563-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201005115507.11563-1-leon.anavi@konsulko.com>
References: <20201005115507.11563-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.9.3:

- Implemented a significant performance optimization to the
  process of searching the parse tree.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...eautifulsoup4_4.9.2.bb => python3-beautifulsoup4_4.9.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.9.2.bb => python3-beautifulsoup4_4.9.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
index fb5fb1a6b8..5e03ad5e9e 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.9.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=f2d38d8a40bf73fd4b3d16ca2e5882d1"
 
-SRC_URI[md5sum] = "5672f9b9bdfb0c6ab3ef074396bf59aa"
-SRC_URI[sha256sum] = "1edf5e39f3a5bc6e38b235b369128416c7239b34f692acccececb040233032a1"
+SRC_URI[md5sum] = "57fd468ae3eb055f6871106e8f7813e2"
+SRC_URI[sha256sum] = "84729e322ad1d5b4d25f805bfa05b902dd96450f43842c4e99067d5e1369eb25"
 
 inherit pypi setuptools3
 
-- 
2.17.1

