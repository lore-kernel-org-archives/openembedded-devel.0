Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.36020.1623073925016524402
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 06:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57048 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lqFff-0004lo-9Z; Mon, 07 Jun 2021 16:52:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pythonping: Upgrade 1.0.16 -> 1.1.0
Date: Mon,  7 Jun 2021 16:51:51 +0300
Message-Id: <20210607135151.15783-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210607135151.15783-1-leon.anavi@konsulko.com>
References: <20210607135151.15783-1-leon.anavi@konsulko.com>
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

- Add a linux-like interval option to set the time to wait between
  pings, in seconds

This is a BREAKING change to some extent. If you are using
positional parameters, the interval option was added BEFORE some
existing parameters, so you would end up filling the wrong
parameter with your data.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-pythonping_1.0.16.bb => python3-pythonping_1.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pythonping_1.0.16.bb => python3-pythonping_1.1.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb b/meta-python/recipes-devtools/python/python3-pythonping_1.1.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
rename to meta-python/recipes-devtools/python/python3-pythonping_1.1.0.bb
index 5affb934ca..fd66a6ffd7 100644
--- a/meta-python/recipes-devtools/python/python3-pythonping_1.0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-pythonping_1.1.0.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=12;endline=12;md5=2d33c00f47720c7e35e1fdb4b9fab027"
 
-SRC_URI[md5sum] = "9b505ad8a5b8a6a8e57ccf75098ea364"
-SRC_URI[sha256sum] = "d025c8b25952580dea47bc241421e17a5a97f97f50098e1096dd10d845d0f156"
+SRC_URI[sha256sum] = "71199bdeee942ba1258b65f88ca5624278e63b31e7643ee8ca7292d2f5f77e99"
 
 inherit pypi setuptools3
 
-- 
2.17.1

