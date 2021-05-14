Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.9406.1621002230267867504
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhYjF-0005Cr-1X; Fri, 14 May 2021 17:23:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-pymisp: Upgrade 2.4.142 -> 2.4.143
Date: Fri, 14 May 2021 17:23:37 +0300
Message-Id: <20210514142341.22666-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514142341.22666-1-leon.anavi@konsulko.com>
References: <20210514142341.22666-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.143:

- Method to get the raw object template.
- Bump version, deps.
- First-seen and last-seen on attributes and objects were not
  checked for sanity.
- Remove search_all example, use search instead.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pymisp_2.4.142.bb => python3-pymisp_2.4.143.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.142.bb => python3-pymisp_2.4.143.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.142.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.143.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.142.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.143.bb
index a644978e40..1e3ef27a79 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.142.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.143.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "357096f24c4f8d7dac87dfe0b9edad4f924f27a3"
+SRCREV = "c2e9663765e83f1a4aa70099546bec653ed770e7"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
@@ -15,6 +15,8 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-jsonschema \
     ${PYTHON_PN}-requests \
     ${PYTHON_PN}-six \
+    ${PYTHON_PN}-deprecated \
+    ${PYTHON_PN}-wrapt \
 "
 
 # Fixes: python3-pymisp requires /bin/bash, but no
-- 
2.17.1

