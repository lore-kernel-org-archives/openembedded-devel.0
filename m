Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.1969.1593537126670344521
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46852 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqJnh-0004sv-Mn; Tue, 30 Jun 2020 20:12:06 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-pywbem: Upgrade 0.17.2 -> 0.17.3
Date: Tue, 30 Jun 2020 20:11:17 +0300
Message-Id: <20200630171119.25540-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630171119.25540-1-leon.anavi@konsulko.com>
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.17.3:

- Improved support for array-typed elements in ValueMapping
- Accomodated the newly released flake8 version 3.8.1 by removing
  the pinning of pyflakes to <2.2.0, and adjusting the source
  code of pywbem to get around the new flake8 messages E123, E124,
  E402.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pywbem_0.17.2.bb => python3-pywbem_0.17.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_0.17.2.bb => python3-pywbem_0.17.3.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
index ce63822b4..930f04896 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.2.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.17.3.bb
@@ -16,8 +16,8 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[md5sum] = "6100157c720ba272895b3f79a05c8dc3"
-SRC_URI[sha256sum] = "84dac33f77d5ff2c3d8eb42fc7de2ffb6d33f5e4954ef89db0dbf3fe646a2809"
+SRC_URI[md5sum] = "9fbee6b4327f035eb212017b6cd84309"
+SRC_URI[sha256sum] = "1de9963adda97d89d191d027ddc64167699a11ac42ecc3ea35dddf7679ac2441"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.17.1

