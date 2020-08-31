Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.48464.1598857414782659193
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57066 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kCdqk-0006cW-N1; Mon, 31 Aug 2020 10:03:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-cmd2: Upgrade 1.3.5 -> 1.3.8
Date: Mon, 31 Aug 2020 10:03:09 +0300
Message-Id: <20200831070318.6573-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.8:

- Fixed issue where subcommand added with
  @as_subcommand_to decorator did not display help when called
  with -h/--help.
- add_help=False no longer has to be passed to parsers used in
  @as_subcommand_to decorator. Only pass this if your subcommand
  should not have the -h/--help help option (as stated in argparse
  documentation).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.3.5.bb => python3-cmd2_1.3.8.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.5.bb => python3-cmd2_1.3.8.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
index c0daec42a..9fc7b95e2 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "a4a35ebe43179bf071430e2e8c7963e7"
-SRC_URI[sha256sum] = "d9ef1d657e98b1c6898bca75019fd661db410f81febe6e1aedded9667f39f37e"
+SRC_URI[md5sum] = "255ba85d8aaa9f00d84917be38b11a86"
+SRC_URI[sha256sum] = "b6f6254def8ba479088702f97bca1b999c12e0c38ac5d82dc50a44db93c7108c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

