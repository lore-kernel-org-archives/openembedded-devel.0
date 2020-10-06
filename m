Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10120.1601975137752359432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 02:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59138 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPiua-0007g5-9p; Tue, 06 Oct 2020 12:05:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cmd2: Upgrade 1.3.10 -> 1.3.11
Date: Tue,  6 Oct 2020 12:05:22 +0300
Message-Id: <20201006090526.24310-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.3.11:

- Fixed issue where quoted redirectors and terminators in aliases
  and macros were not being restored when read from a startup
  script.
- Fixed issue where instantiating more than one cmd2-based class
  which uses the @as_subcommand_to decorator resulted in
  duplicated help text in the base command the subcommands belong
  to.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.3.10.bb => python3-cmd2_1.3.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.10.bb => python3-cmd2_1.3.11.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
index 7b74187838..3b2aa5b744 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.11.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "39258e1af392e0bcefceb1982d7716bd"
-SRC_URI[sha256sum] = "960d8288c8e3a093d04975e3dd8461ce2e43c1d0c70e54873f622f8f0b77d6f5"
+SRC_URI[md5sum] = "7e3dbe0aefa331e80f515d3c41cc3b8c"
+SRC_URI[sha256sum] = "826a288ee6d9c4ec1184e64e9566c09d3b73be8f4283c1898fa4332f1daf8dbf"
 
 inherit pypi setuptools3
 
-- 
2.17.1

