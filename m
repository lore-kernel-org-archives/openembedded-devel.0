Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.46327.1597070613591664058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59248 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k591Q-0008Tw-Uj; Mon, 10 Aug 2020 17:43:33 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-cmd2: Upgrade 1.2.1 -> 1.3.1
Date: Mon, 10 Aug 2020 17:43:18 +0300
Message-Id: <20200810144318.17106-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810144318.17106-1-leon.anavi@konsulko.com>
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.1:

- Fixed issue determining whether an argparse completer function
  required a reference to a containing CommandSet. Also resolves
  issues determining the correct CommandSet instance when calling
  the argparse argument completer function. Manifested as a
  TypeError when using cmd2.Cmd.path_complete as a completer for
  an argparse-based command defined in a CommandSet.
- Added CommandSet - Enables defining a separate loadable module
  of commands to register/unregister with your cmd2 application.
- Marked with_argparser_and_unknown_args pending deprecation and
  consolidated implementation into with_argparser

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.2.1.bb => python3-cmd2_1.3.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.2.1.bb => python3-cmd2_1.3.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
index cb52ecfbb..15b10d0f5 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "0ab5f4d8ad6a9099202ed887358102f2"
-SRC_URI[sha256sum] = "5a5d3361fadada16cae0c99b65eba5d49d587fc2e02b3afb058da1872871e7a9"
+SRC_URI[md5sum] = "9f0af0810da98a30ac92f1e4e7a8c8ab"
+SRC_URI[sha256sum] = "c86f3b8348798732759c9d53cbcb6258a8f21f60c1a1268e942d24c9dc50b4c6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

