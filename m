Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.38427.1599227243290749582
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2020 06:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38492 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kEC3l-0000aK-Kl; Fri, 04 Sep 2020 16:47:22 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-cmd2: Upgrade 1.3.8 -> 1.3.9
Date: Fri,  4 Sep 2020 16:47:05 +0300
Message-Id: <20200904134713.13164-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904134713.13164-1-leon.anavi@konsulko.com>
References: <20200904134713.13164-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.9:

Breaking Changes:
- CommandSet.on_unregister() is now called as first step in
  unregistering a CommandSet and not the last.
  CommandSet.on_unregistered() is now the last step.

Enhancements:
- Added CommandSet.on_registered(). This is called by cmd2.Cmd
  after a CommandSet is registered and all its commands have been
  added to the CLI.
- Added CommandSet.on_unregistered(). This is called by cmd2.Cmd
  after a CommandSet is unregistered and all its commands have
  been removed from the CLI.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_1.3.8.bb => python3-cmd2_1.3.9.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.8.bb => python3-cmd2_1.3.9.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
index 9fc7b95e2..e677a6962 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "255ba85d8aaa9f00d84917be38b11a86"
-SRC_URI[sha256sum] = "b6f6254def8ba479088702f97bca1b999c12e0c38ac5d82dc50a44db93c7108c"
+SRC_URI[md5sum] = "f5fbd528e7b5977ad71466947af61f99"
+SRC_URI[sha256sum] = "7f8035faafda15d26098bf2ffe16aaba1c78511ce13e0815d2efe58ba392b501"
 
 inherit pypi setuptools3
 
-- 
2.17.1

