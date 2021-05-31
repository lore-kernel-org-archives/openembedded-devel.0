Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.46861.1622481252267937950
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 10:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37512 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lnlUO-00054C-5u; Mon, 31 May 2021 20:14:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-certifi: Upgrade 2020.12.5 -> 2021.5.30
Date: Mon, 31 May 2021 20:13:50 +0300
Message-Id: <20210531171350.11059-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210531171350.11059-1-leon.anavi@konsulko.com>
References: <20210531171350.11059-1-leon.anavi@konsulko.com>
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

Upgrade to release 2021.5.30:

- Update certificates
- Fix typos

License-Update: Fix typos

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-certifi_2020.12.5.bb => python3-certifi_2021.5.30.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-certifi_2020.12.5.bb => python3-certifi_2021.5.30.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb b/meta-python/recipes-devtools/python/python3-certifi_2021.5.30.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2021.5.30.bb
index dd2f6a2f6..ef2c66b14 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2020.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-certifi_2021.5.30.bb
@@ -5,9 +5,9 @@ which ships with the Requests codebase, and is derived from Mozilla Firefox's ca
 HOMEPAGE = " http://certifi.io/"
 
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8"
 
-SRC_URI[sha256sum] = "1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c"
+SRC_URI[sha256sum] = "2bbf76fd432960138b3ef6dda3dde0544f27cbf8546c458e60baf371917ba9ee"
 
 inherit pypi setuptools3
 
-- 
2.17.1

