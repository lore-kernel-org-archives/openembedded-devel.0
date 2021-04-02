Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.15687.1617366901687183119
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 05:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52498 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lSJ0t-0004S7-LW; Fri, 02 Apr 2021 15:35:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-contextlib2: Upgrade 0.6.0 -> 0.6.0.post1
Date: Fri,  2 Apr 2021 15:34:51 +0300
Message-Id: <20210402123455.23702-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 0.6.0.post1:

- Correctly update NEWS.rst for the 0.6.0 release.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...contextlib2_0.6.0.bb => python3-contextlib2_0.6.0.post1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-contextlib2_0.6.0.bb => python3-contextlib2_0.6.0.post1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb b/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.post1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.post1.bb
index 6074efa73..2eac0ad27 100644
--- a/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-contextlib2_0.6.0.post1.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
 
-SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
-SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277077ed3"
+SRC_URI[sha256sum] = "01f490098c18b19d2bd5bb5dc445b2054d2fa97f09a4280ba2c5f3c394c8162e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

