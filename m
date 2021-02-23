Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.11285.1614093755149527434
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZWD-00022z-6f; Tue, 23 Feb 2021 17:22:34 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-autobahn: Upgrade 20.12.3 -> 21.2.1
Date: Tue, 23 Feb 2021 17:22:15 +0200
Message-Id: <20210223152219.32129-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223152219.32129-1-leon.anavi@konsulko.com>
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
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

Upgrade to release 21.2.1:

- new: callback user component function "check_config" on
  container/router components
- fix: support Docker images for ARM (32 bit and 64 bit)
- fix: bake Docker multi-arch images
- fix: PyPy3 CI
- new: enable autobahn client unit tests

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-autobahn_20.12.3.bb => python3-autobahn_21.2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_20.12.3.bb => python3-autobahn_21.2.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb b/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
index 90958dff53..3af81d1dab 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_21.2.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
 
-SRC_URI[md5sum] = "0a465e218d904f63537092b155489468"
-SRC_URI[sha256sum] = "410a93e0e29882c8b5d5ab05d220b07609b886ef5f23c0b8d39153254ffd6895"
+SRC_URI[sha256sum] = "7e6b1bf95196b733978bab2d54a7ab8899c16ce11be369dc58422c07b7eea726"
 
 inherit pypi setuptools3
 
-- 
2.17.1

