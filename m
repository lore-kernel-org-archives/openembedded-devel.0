Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.24571.1605708158367191173
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 06:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kfO2e-0005MS-8x; Wed, 18 Nov 2020 16:02:37 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-certifi: Upgrade 2020.6.20 -> 2020.11.8
Date: Wed, 18 Nov 2020 16:02:20 +0200
Message-Id: <20201118140220.29364-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118140220.29364-1-leon.anavi@konsulko.com>
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.11.8:

- Declare support for Python 3.9

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-certifi_2020.6.20.bb => python3-certifi_2020.11.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-certifi_2020.6.20.bb => python3-certifi_2020.11.8.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb b/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
index 8174201416..b680fade6c 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
+++ b/meta-python/recipes-devtools/python/python3-certifi_2020.11.8.bb
@@ -7,8 +7,8 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "89525ece725d674d91b0c43007d2a47e"
-SRC_URI[sha256sum] = "5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3"
+SRC_URI[md5sum] = "b25267355218d11652c707e46accd059"
+SRC_URI[sha256sum] = "f05def092c44fbf25834a51509ef6e631dc19765ab8a57b4e7ab85531f0a9cf4"
 
 inherit pypi setuptools3
 
-- 
2.17.1

