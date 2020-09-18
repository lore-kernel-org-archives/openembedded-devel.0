Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10974.1600430328413828822
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 04:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59702 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kJF2K-0005BI-Li; Fri, 18 Sep 2020 14:58:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-cmd2: Upgrade 1.3.9 -> 1.3.10
Date: Fri, 18 Sep 2020 14:58:34 +0300
Message-Id: <20200918115835.4742-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.10:

- Added user-settable option called always_show_hint. If True,
  then tab completion hints will always display even when tab
  completion suggestions print. Arguments whose help or hint text
  is suppressed will not display hints even when this setting is
  True.
- argparse tab completion now groups flag names which run the same
  action. Optional flags are wrapped in brackets like it is done
  in argparse usage text.
- default category decorators are now heritable by default and
  will propagate the category down the class hierarchy until
  overridden. There's a new optional flag to set heritable to
  false.
- Added --silent flag to alias/macro create. If used, then no
  confirmation message will be printed when aliases and macros
  are created or overwritten.
- Added --with_silent flag to alias/macro list. Use this option
  when saving to a startup script that should silently create
  aliases and macros.
- Fixed issue where flag names weren't always sorted correctly in
  argparse tab completion

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.3.9.bb => python3-cmd2_1.3.10.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.9.bb => python3-cmd2_1.3.10.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
index e677a69620..7b74187838 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "f5fbd528e7b5977ad71466947af61f99"
-SRC_URI[sha256sum] = "7f8035faafda15d26098bf2ffe16aaba1c78511ce13e0815d2efe58ba392b501"
+SRC_URI[md5sum] = "39258e1af392e0bcefceb1982d7716bd"
+SRC_URI[sha256sum] = "960d8288c8e3a093d04975e3dd8461ce2e43c1d0c70e54873f622f8f0b77d6f5"
 
 inherit pypi setuptools3
 
-- 
2.17.1

