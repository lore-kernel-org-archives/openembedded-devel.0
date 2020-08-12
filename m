Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11840.1597228058571309302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 03:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53212 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5nyq-0001gR-N3; Wed, 12 Aug 2020 13:27:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-cmd2: Upgrade 1.3.1 -> 1.3.2
Date: Wed, 12 Aug 2020 13:27:25 +0300
Message-Id: <20200812102726.4376-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812102726.4376-1-leon.anavi@konsulko.com>
References: <20200812102726.4376-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.2:

- Added functions to fetch registered CommandSets by type and
  command name.
- Fixed prog value of subcommands added with as_subcommand_to()
  decorator.
- Fixed missing settings in subcommand parsers created with
  as_subcommand_to() decorator. These settings include things
  like description and epilog text.
- Fixed issue with CommandSet auto-discovery only searching
  direct sub-classes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.3.1.bb => python3-cmd2_1.3.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.1.bb => python3-cmd2_1.3.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
index 15b10d0f5..f5d6099dd 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "9f0af0810da98a30ac92f1e4e7a8c8ab"
-SRC_URI[sha256sum] = "c86f3b8348798732759c9d53cbcb6258a8f21f60c1a1268e942d24c9dc50b4c6"
+SRC_URI[md5sum] = "ee7199d76f75bf01d8a162db6b696662"
+SRC_URI[sha256sum] = "645792972e1c0475b03fd575d8ca95c526db970d886669a399307eb52fddd7bd"
 
 inherit pypi setuptools3
 
-- 
2.17.1

