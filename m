Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5613.1593170995005250749
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYJ-000568-Mb; Fri, 26 Jun 2020 14:29:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/12] python3-pyro4: Upgrade 4.77 -> 4.80
Date: Fri, 26 Jun 2020 14:29:33 +0300
Message-Id: <20200626112944.25569-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.80:

- fix possible race condition when creating instances with
  instancemode "single"
- cython compatibility fix
- removed explicit version checks of dependencies such as serpent.
  This fixes crash error when dealing with prerelease versions
  that didn't match the pattern.
- stick to an older serpent library version to install as a
  dependency when installing on old python versions
- explain the delay and threading in the distributed-computing2
  example

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyro4_4.77.bb => python3-pyro4_4.80.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python3-pyro4_4.77.bb => python3-pyro4_4.80.bb} (66%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
similarity index 66%
rename from meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
rename to meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
index ffe58ee9c..dfea67368 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.80.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc"
 
-SRC_URI[md5sum] = "21f015ae93cf9ea2bbbc418a2267e9fb"
-SRC_URI[sha256sum] = "2bfe12a22f396474b0e57c898c7e2c561a8f850bf2055d8cf0f7119f0c7a523f"
+SRC_URI[md5sum] = "e31fc077e06de9fc0bb061e357401954"
+SRC_URI[sha256sum] = "46847ca703de3f483fbd0b2d22622f36eff03e6ef7ec7704d4ecaa3964cb2220"
 
 PYPI_PACKAGE = "Pyro4"
 
-- 
2.17.1

