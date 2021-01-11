Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.36059.1610378729697105297
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 07:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kyz4S-0006IU-MR; Mon, 11 Jan 2021 17:25:29 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-certifi: Upgrade 2020.11.8 -> 2020.12.5
Date: Mon, 11 Jan 2021 17:25:10 +0200
Message-Id: <20210111152512.23506-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111152512.23506-1-leon.anavi@konsulko.com>
References: <20210111152512.23506-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.12.5:

- Add 2 basic unit tests
- Add Github workflow for pytest run
- Various cleanups

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-certifi_2020.11.8.bb => python3-certifi_2020.12.5.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-certifi_2020.11.8.bb => python3-certifi_2020.12.5.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb b/meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
index b680fade6..dd2f6a2f6 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
+++ b/meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
@@ -7,8 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "b25267355218d11652c707e46accd059"
-SRC_URI[sha256sum] = "f05def092c44fbf25834a51509ef6e631dc19765ab8a57b4e7ab85531f0a9cf4"
+SRC_URI[sha256sum] = "1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

