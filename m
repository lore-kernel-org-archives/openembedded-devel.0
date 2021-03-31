Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.4238.1617182294183853870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 02:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56348 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRWzL-0002MF-UK; Wed, 31 Mar 2021 12:18:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-httplib2: Upgrade 0.19.0 -> 0.19.1
Date: Wed, 31 Mar 2021 12:17:59 +0300
Message-Id: <20210331091801.17047-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331091801.17047-1-leon.anavi@konsulko.com>
References: <20210331091801.17047-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.19.1:

- auth header parsing performance optimizations
- Use mock from the standard library on Python>=3.3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-httplib2_0.19.0.bb => python3-httplib2_0.19.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.19.0.bb => python3-httplib2_0.19.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
index f720723a6..a16f8d9d2 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "e0d428dad43c72dbce7d163b7753ffc7a39c097e6788ef10f4198db69b92f08e"
+SRC_URI[sha256sum] = "0b12617eeca7433d4c396a100eaecfa4b08ee99aa881e6df6e257a7aad5d533d"
 
 inherit pypi setuptools3
-- 
2.17.1

