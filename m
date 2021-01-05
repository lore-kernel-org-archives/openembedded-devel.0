Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6671.1609859816067642863
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 07:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41868 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwo4n-0007qz-KR; Tue, 05 Jan 2021 17:16:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-multidict: Upgrade 5.0.0 -> 5.1.0
Date: Tue,  5 Jan 2021 17:16:32 +0200
Message-Id: <20210105151638.15700-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105151638.15700-1-leon.anavi@konsulko.com>
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.1.0:

- Support GenericAliases (MultiDict[str]) for Python 3.9+
- Synchronize the declared supported Python versions in setup.py
  with actually supported and tested ones.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-multidict_5.0.0.bb => python3-multidict_5.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_5.0.0.bb => python3-multidict_5.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb b/meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
index 676fbae7ed..b960affac4 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
 
-SRC_URI[md5sum] = "c2c3311e25636a6f213e998cd1e80d72"
-SRC_URI[sha256sum] = "1b324444299c3a49b601b1bf621fc21704e29066f6ac2b7d7e4034a4a18662a1"
+SRC_URI[sha256sum] = "25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

