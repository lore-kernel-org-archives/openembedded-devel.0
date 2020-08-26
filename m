Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.15258.1598456437646002365
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 08:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAxXP-0002yf-1J; Wed, 26 Aug 2020 18:40:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-cmd2: Upgrade 1.3.4 -> 1.3.5
Date: Wed, 26 Aug 2020 18:40:16 +0300
Message-Id: <20200826154020.29208-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826154020.29208-1-leon.anavi@konsulko.com>
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.5:

- Fixed RecursionError when printing an argparse.Namespace caused
  by custom attribute cmd2 was adding
- Added get_statement() function to argparse.Namespace which
  returns __statement__ attribute

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.3.4.bb => python3-cmd2_1.3.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.4.bb => python3-cmd2_1.3.5.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
index ab05b82e1..c0daec42a 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "6b746468d1fd606b5dd96058dde0c5ac"
-SRC_URI[sha256sum] = "b56f82f3ef3c9a0aa08423e25a97516a3e19239b051426be5686611786fd6032"
+SRC_URI[md5sum] = "a4a35ebe43179bf071430e2e8c7963e7"
+SRC_URI[sha256sum] = "d9ef1d657e98b1c6898bca75019fd661db410f81febe6e1aedded9667f39f37e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

