Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.18223.1596201766084127044
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1Uzh-000741-Po; Fri, 31 Jul 2020 16:22:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/15] python3-pywbem: Upgrade 0.17.3 -> 0.17.4
Date: Fri, 31 Jul 2020 16:22:16 +0300
Message-Id: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.4 with the following bug fixes:

- Test: On Python 3.8, upgraded the minimum version of lxml from
  4.4.1 to 4.4.3, in order to fix an XMLSyntaxError raised when
  encountering UCS-4 characters.
- Test: Fixed issue with Swig when installing M2Crypto on native
  Windows in the Appveyor CI, reporting mssing files swig.swg and
  python.swg. This was fixed by pinning the swig version to 4.0.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pywbem_0.17.3.bb => python3-pywbem_0.17.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.17.3.bb => python3-pywbem_0.17.4.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
index 930f04896..a804b0cc0 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.4.bb
@@ -16,8 +16,8 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[md5sum] = "9fbee6b4327f035eb212017b6cd84309"
-SRC_URI[sha256sum] = "1de9963adda97d89d191d027ddc64167699a11ac42ecc3ea35dddf7679ac2441"
+SRC_URI[md5sum] = "b65c03026bf2174e58e3e47a5e7e4825"
+SRC_URI[sha256sum] = "5b54b65a5434bb16432415743c0d154feee0c6d7a8a2fee208719c67d6d24c97"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.17.1

