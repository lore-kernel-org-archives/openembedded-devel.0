Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16985.1593432769663800157
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpseV-0001kP-B4; Mon, 29 Jun 2020 15:12:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-pywbem: Upgrade 0.15.0 -> 0.17.2
Date: Mon, 29 Jun 2020 15:12:27 +0300
Message-Id: <20200629121233.27026-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 0.17.2:

- Test: Fixed virtualenv related failures during install test.
- Dev: Increased the versions of the base packages ‘pip’,
  ‘setuptools’ and ‘wheel’ to the content of Ubuntu 18.04 as
  a minimum, and to the lowest versions that support a particular
  Python versions beyond that. This only affects development of
  pywbem.
- Setup: Added the scripts for installing OS-level dependencies
  (pywbem_os_setup.sh/.bat) to the source distribution archive.
  Note that starting with the upcoming pywbem 1.0.0, these scripts
  are no longer needed, so this change will not be rolled forward
  into 1.0.0.
- Increased the version of ‘PyYAML’ from 5.1 to 5.3 on Python 2.7,
  to pick up a fix for dealing with Unicode characters above U+FFFF
  in narrow Python builds. This could not be fixed for Python 2.6
  since PyYAML 3.12 dropped support for Python 2.6
- Fixed raise error for invalid reference_direction in
  WBEMServer.get_central_instances().
- Fixed raise error for missing ports in WBEMListener.__init__().

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pywbem_0.15.0.bb => python3-pywbem_0.17.2.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.15.0.bb => python3-pywbem_0.17.2.bb} (91%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
similarity index 91%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
index cbb55b8f7..ce63822b4 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.15.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
@@ -16,12 +16,10 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-inherit pypi setuptools3 update-alternatives
-
-SRCREV = "b3386b3bee8876d15f0745147c0b08937d8ab18e"
-PYPI_SRC_URI = "git://github.com/pywbem/pywbem;protocol=https;branch=stable_0.15"
+SRC_URI[md5sum] = "6100157c720ba272895b3f79a05c8dc3"
+SRC_URI[sha256sum] = "84dac33f77d5ff2c3d8eb42fc7de2ffb6d33f5e4954ef89db0dbf3fe646a2809"
 
-S = "${WORKDIR}/git"
+inherit pypi setuptools3 update-alternatives
 
 DEPENDS += " \
     ${PYTHON_PN}-ply-native \
-- 
2.17.1

