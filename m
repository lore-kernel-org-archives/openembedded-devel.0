Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3647.1592905908152347140
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfak-0006Iq-6o; Tue, 23 Jun 2020 12:51:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/11] python3-certifi: Upgrade 2019.11.28 -> 2020.6.20
Date: Tue, 23 Jun 2020 12:51:28 +0300
Message-Id: <20200623095136.24854-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
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

Upgrade to release 2020.6.20:

- Add python3.8 tag on setup.py
- Add a "contents" function that returns the content of the
  cert chain.
- Fix docs URL
- Use resources loader to handle non-filesystem situations
- Fix where() so that it works with importlib.resources when
  available
- Clarify trust origin is Mozilla

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-certifi_2019.11.28.bb => python3-certifi_2020.6.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-certifi_2019.11.28.bb => python3-certifi_2020.6.20.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb b/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
index c9e945f27..817420141 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2019.11.28.bb
+++ b/meta-python/recipes-devtools/python/python3-certifi_2020.6.20.bb
@@ -7,8 +7,8 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "4d5229c4d9f0a4a79106f9e2c2cfd381"
-SRC_URI[sha256sum] = "25b64c7da4cd7479594d035c08c2d809eb4aab3a26e5a990ea98cc450c320f1f"
+SRC_URI[md5sum] = "89525ece725d674d91b0c43007d2a47e"
+SRC_URI[sha256sum] = "5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

