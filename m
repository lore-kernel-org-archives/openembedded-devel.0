Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.9020.1606413844937120561
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 10:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54480 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiLcd-0008NL-1r; Thu, 26 Nov 2020 20:04:00 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pyrad: Upgrade 2.3 -> 2.4
Date: Thu, 26 Nov 2020 20:03:45 +0200
Message-Id: <20201126180347.13763-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4:

- Support poetry for for building this project
- Use secrets.SysRandom instead of random.SystemRandom if possible
- .get on Packets has an optional default parameter (to mimic
  dict.get())
- Fix: digestmod is not optional in python3.8 anymore
- Fix: authenticator was refreshed before the packet was generated
- Fix bug causing Message-Authenticator verification to fail if
  multiple instances of an attribute do not appear sequentially in
  the attributes list
- Fixed VerifyReply broken when multiple instances of same
  attribute are not adjacent on reply
- Fixed Missing send_packet for async Client
- Fixed python3 support for SaltCrypt (was previously broken)

License-Update: Use file PKG-INFO.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb | 9 ---------
 meta-python/recipes-devtools/python/python3-pyrad_2.4.bb | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyrad_2.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
deleted file mode 100644
index 3b38fb3a4b..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "RADIUS tools"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=debd8dc49cd9a7d58c7fffc771efed4f"
-
-PYPI_PACKAGE = "pyrad"
-SRC_URI[sha256sum] = "89c4d9b2cab1746c48dc0d93898d278e34a40acedf6f511aeaa748bcd4490295"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
new file mode 100644
index 0000000000..86a95a4aa4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
@@ -0,0 +1,9 @@
+SUMMARY = "RADIUS tools"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665b9a75d6afb7709"
+
+PYPI_PACKAGE = "pyrad"
+SRC_URI[sha256sum] = "057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a69beaff15c47e30d9"
+
+inherit pypi setuptools3
-- 
2.17.1

