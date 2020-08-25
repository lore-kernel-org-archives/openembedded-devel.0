Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13392.1598362012218718509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 06:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAYyQ-0001xr-Pz; Tue, 25 Aug 2020 16:26:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-cmd2: Upgrade 1.3.3 -> 1.3.4
Date: Tue, 25 Aug 2020 16:26:30 +0300
Message-Id: <20200825132633.875-4-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.4:

- Fixed AttributeError when CommandSet that uses
  as_subcommand_to decorator is loaded during cmd2.Cmd.__init__()
- Improved exception messages when using mock without spec=True

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.3.3.bb => python3-cmd2_1.3.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.3.bb => python3-cmd2_1.3.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
index a44f02f00..ab05b82e1 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.4.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "c8ffa926c50673f00fd8ff8533e9f959"
-SRC_URI[sha256sum] = "38015008ff4639edfd66591063a0e9bb75a62dccb14ee3ec7bf3a6cb130de5cf"
+SRC_URI[md5sum] = "6b746468d1fd606b5dd96058dde0c5ac"
+SRC_URI[sha256sum] = "b56f82f3ef3c9a0aa08423e25a97516a3e19239b051426be5686611786fd6032"
 
 inherit pypi setuptools3
 
-- 
2.17.1

