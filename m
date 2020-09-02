Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.2876.1599035633601866007
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46602 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDODD-0004fH-7M; Wed, 02 Sep 2020 11:33:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-meh: Upgrade 0.48 -> 0.49
Date: Wed,  2 Sep 2020 11:33:38 +0300
Message-Id: <20200902083342.22101-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.49:

- Fix make archive command after pot file removal
- Add Readme with description and translation badge
- Add pot file to the git ignore
- Pause release when making bumpver to check and solve
  translations
- Remove unused PREFIX from Makefile
- Remove Zanata
- Push translations to our translation repository
- Download translations from Weblate
- Remove pot file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python-meh/{python3-meh_0.48.bb => python3-meh_0.49.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.48.bb => python3-meh_0.49.bb} (90%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.48.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
similarity index 90%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.48.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
index 9ca7a56bd..7fba21f7d 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.48.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
@@ -3,6 +3,7 @@ DESCRIPTION = "The python-meh package is a python library for handling, saving,
 exceptions."
 HOMEPAGE = "http://git.fedorahosted.org/git/?p=python-meh.git"
 LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit setuptools3
 
@@ -10,8 +11,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
 "
-SRCREV = "760f78a634ecf0e2380abcbd751bc233d29300ef"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+SRCREV = "50c09e5c4c76757099d686c316b4bf42f72db71b"
 
 FILES_${PN} += "${datadir}/*"
 
-- 
2.17.1

