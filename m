Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.32101.1620655665740057561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lg6ZS-000657-JR; Mon, 10 May 2021 17:07:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-greenlet: Upgrade 1.0.0 -> 1.1.0
Date: Mon, 10 May 2021 17:07:18 +0300
Message-Id: <20210510140722.27201-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510140722.27201-1-leon.anavi@konsulko.com>
References: <20210510140722.27201-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.0:

- Add support for Python 3.10. Pre-built binary wheels for 3.10 are
  not currently available for all platforms. The greenlet ABI is
  different on Python 3.10 from all previous versions, but as 3.10
  was never supported before, and the ABI has not changed on other
  Python versions, this is not considered a reason to change
  greenlet's major version.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-greenlet_1.0.0.bb => python3-greenlet_1.1.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_1.0.0.bb => python3-greenlet_1.1.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_1.1.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_1.1.0.bb
index 32194dba78..0f0f18fe35 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_1.1.0.bb
@@ -1,8 +1,9 @@
 SUMMARY = "Python lightweight in-process concurrent programming"
+HOMEPAGE = "https://greenlet.readthedocs.io/en/latest/"
 LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "719e169c79255816cdcf6dccd9ed2d089a72a9f6c42273aae12d55e8d35bdcf8"
+SRC_URI[sha256sum] = "c87df8ae3f01ffb4483c796fe1b15232ce2b219f0b18126948616224d3f658ee"
 
 inherit pypi distutils3 setuptools3
-- 
2.17.1

