Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.373.1611588227685788404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 07:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58482 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l43iT-00057d-DV; Mon, 25 Jan 2021 17:23:47 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pymisp: Upgrade 2.4.135.3 -> 2.4.137.1
Date: Mon, 25 Jan 2021 17:23:34 +0200
Message-Id: <20210125152337.20937-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210125152337.20937-1-leon.anavi@konsulko.com>
References: <20210125152337.20937-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.137.1:

- Fail if a duplicate object is added to an event.
- Add test case for page/limit in logs search.
- Improve docstring for get_event.
- Better warning if lief is outdated.
- Update minimal dependency for lief in setup.py.

Fetch source from the git repository to avoid extras_require issue
in setup.py from the archive for this release in PyPI.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pymisp_2.4.135.3.bb => python3-pymisp_2.4.137.1.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.135.3.bb => python3-pymisp_2.4.137.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
index bbfc0459d..9b2efa2cd 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.135.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.137.1.bb
@@ -3,9 +3,11 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "f0bbdd77358223ba75c9cc40f192c7a2a7a5838bdd08b28381f71d220151ea8a"
+SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
+SRCREV = "7b64c1c9a4fec8ed37c1522b31ab56f30b83f0e1"
+S = "${WORKDIR}/git"
 
-inherit pypi setuptools3
+inherit setuptools3
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-dateutil \
-- 
2.17.1

