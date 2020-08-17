Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.40992.1597663769684978707
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dKQ-000361-Iw; Mon, 17 Aug 2020 14:29:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-cmd2: Upgrade 1.3.2 -> 1.3.3
Date: Mon, 17 Aug 2020 14:28:58 +0300
Message-Id: <20200817112901.28914-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817112901.28914-1-leon.anavi@konsulko.com>
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.3:

- CommandSet command functions (do_, complete_, help_) will no
  longer have the cmd2 app passed in as the first parameter after
  self since this is already a class member.
- Renamed install_command_set() and uninstall_command_set() to
  register_command_set() and unregister_command_set() for better
  name consistency.
- Fixed help formatting bug in Cmd2ArgumentParser when metavar is
  a tuple.
- Fixed tab completion bug when using CompletionItem on an
  argument whose metavar is a tuple.
- Added explicit testing against python 3.5.2 for Ubuntu 16.04,
  and 3.5.3 for Debian 9.
- Added fallback definition of typing.Deque (taken from 3.5.4)
- Removed explicit type hints that fail due to a bug in 3.5.2
  favoring comment-based hints instead.
- When passing a ns_provider to an argparse command, will now
  attempt to resolve the correct CommandSet instance for self.
  If not, it'll fall back and pass in the cmd2 app.
- Added missing doc-string for new cmd2.Cmd init parameters
  introduced by CommandSet enhancement.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.3.2.bb => python3-cmd2_1.3.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.2.bb => python3-cmd2_1.3.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
index f5d6099dd..a44f02f00 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "ee7199d76f75bf01d8a162db6b696662"
-SRC_URI[sha256sum] = "645792972e1c0475b03fd575d8ca95c526db970d886669a399307eb52fddd7bd"
+SRC_URI[md5sum] = "c8ffa926c50673f00fd8ff8533e9f959"
+SRC_URI[sha256sum] = "38015008ff4639edfd66591063a0e9bb75a62dccb14ee3ec7bf3a6cb130de5cf"
 
 inherit pypi setuptools3
 
-- 
2.17.1

