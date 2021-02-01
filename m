Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.33275.1612183530719745903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 04:45:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33634 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6Ya7-0001Fc-T6; Mon, 01 Feb 2021 14:45:28 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cmd2: Upgrade 1.4.0 -> 1.5.0
Date: Mon,  1 Feb 2021 14:45:12 +0200
Message-Id: <20210201124516.30135-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.0:

- Fixed bug where setting always_show_hint=True did not show a
  hint when completing Settables
- Fixed bug in editor detection logic on Linux systems that do not
  have which
- Fixed bug in table creator where column headers with tabs would
  result in an incorrect width calculation
- Fixed FileNotFoundError which occurred when running history
  --clear and no history file existed.
- Added silent_startup_script option to cmd2.Cmd.__init__(). If
  True, then the startup script's output will be suppressed.
  Anything written to stderr will still display.
- cmd2 now uses pyreadline3 when running Python 3.8 or greater
  on Windows
- This is the last release planned to support Python 3.5

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.4.0.bb => python3-cmd2_1.5.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.4.0.bb => python3-cmd2_1.5.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
index dfe493bd2..18c7a6699 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.5.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "520afccc1d46f833d117a23fab76ed8f"
-SRC_URI[sha256sum] = "e59fa932418603af4e046a96c8985812b05af8a73bfd9d7a386cd1b02c6ab687"
+SRC_URI[sha256sum] = "701a8c9975c4abc45e5d13906ab149f959f812869106347323a3f89ac0e82a62"
 
 inherit pypi setuptools3
 
-- 
2.17.1

