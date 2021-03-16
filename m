Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5596.1615883878643033407
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:37:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35240 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lM5DA-0006gf-8b; Tue, 16 Mar 2021 10:37:57 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-pastedeploy: Upgrade 2.0.1 -> 2.1.1
Date: Tue, 16 Mar 2021 10:37:44 +0200
Message-Id: <20210316083744.17558-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316083744.17558-1-leon.anavi@konsulko.com>
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 2.1.1:

- Added setuptools as an explicit dependency. This has always been
  required but now that more environments are becoming capable of
  operating without it being installed, we now need to ensure it's
  available.
- pytest-runner removed, use tox to run tests.

License-Update: Use license file from PyPI tarball.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...tedeploy_2.0.1.bb => python3-pastedeploy_2.1.1.bb} | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pastedeploy_2.0.1.bb => python3-pastedeploy_2.1.1.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
index b7c8c61d2..0b82d6bbd 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_2.1.1.bb
@@ -1,13 +1,12 @@
 SUMMARY = "Load, configure, and compose WSGI applications and servers"
 HOMEPAGE = "https://pylonsproject.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=1798f29d55080c60365e6283cb49779c"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/PasteDeploy-license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
 inherit pypi
 PYPI_PACKAGE = "PasteDeploy"
-SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
-SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
-SRC_URI[PasteDeploy-license.txt.md5sum] = "1798f29d55080c60365e6283cb49779c"
+
+SRC_URI[sha256sum] = "6dead6ab9823a85d585ef27f878bc647f787edb9ca8da0716aa9f1261b464817"
 
 S = "${WORKDIR}/PasteDeploy-${PV}"
 
@@ -20,7 +19,3 @@ PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
 
 DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
 RDEPENDS_${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
-
-# PyPI tarball is missing license.txt
-# We will need to keep retrieving this from the online repository until version 2.1.0
-SRC_URI += "https://raw.githubusercontent.com/Pylons/pastedeploy/2.0.1/license.txt;name=PasteDeploy-license.txt;downloadfilename=PasteDeploy-license.txt"
\ No newline at end of file
-- 
2.17.1

