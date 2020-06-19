Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3187.1592560014082158489
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 02:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53780 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmDqK-0001eB-WB; Fri, 19 Jun 2020 13:02:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-booleanpy: Upgrade 3.7 to 3.8
Date: Fri, 19 Jun 2020 12:46:36 +0300
Message-Id: <20200619094638.7116-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 3.8:

- Add support for evaluation of boolean expression.
- Fix parsing of tokens that have a number as the first character.
- Restore proper Python 2 compatibility.
- Add pointers to Linux distro packages.

Change LICENSE.txt md5 checksum because the year has been updated.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-booleanpy_3.7.bb => python3-booleanpy_3.8.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-booleanpy_3.7.bb => python3-booleanpy_3.8.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb b/meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
rename to meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
index ebf7ba4e7..a1ce7eafc 100644
--- a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-booleanpy_3.8.bb
@@ -2,10 +2,10 @@ SUMMARY = "Define boolean algebras, create and parse boolean expressions and cre
 HOMEPAGE = "https://github.com/bastikr/boolean.py"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e319747a5eb94cddf646037c01ddba47"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9b58494d4f385978ca5a7ef4f6abca53"
 
-SRC_URI[md5sum] = "1189d115a38f84f5df743014926a9159"
-SRC_URI[sha256sum] = "bd19b412435611ecc712603d0fd7d0e280e24698e7a6e3d5f610473870c5dd1e"
+SRC_URI[md5sum] = "83ccc145ba74a585637124c8bc648333"
+SRC_URI[sha256sum] = "cc24e20f985d60cd4a3a5a1c0956dd12611159d32a75081dabd0c9ab981acaa4"
 
 PYPI_PACKAGE = "boolean.py"
 
-- 
2.17.1

