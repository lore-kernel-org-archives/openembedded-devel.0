Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.219.1616517228108969611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjyS-0000KS-1W; Tue, 23 Mar 2021 18:33:47 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-regex: Upgrade 2020.11.13 -> 2021.3.17
Date: Tue, 23 Mar 2021 18:33:14 +0200
Message-Id: <20210323163317.26664-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323163317.26664-1-leon.anavi@konsulko.com>
References: <20210323163317.26664-1-leon.anavi@konsulko.com>
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

Upgrade to release 2021.3.17:

- Fuzzy matching with wrong distance (unnecessary substitutions)
- Missing wheel for macosx and the new M1 chip (arm64 arch)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-regex_2020.11.13.bb => python3-regex_2021.3.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.11.13.bb => python3-regex_2021.3.17.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb b/meta-python/recipes-devtools/python/python3-regex_2021.3.17.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
rename to meta-python/recipes-devtools/python/python3-regex_2021.3.17.bb
index b5f714397..a3cb80413 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.11.13.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2021.3.17.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "83d6b356e116ca119db8e7c6fc2983289d87b27b3fac238cfe5dca529d884562"
+SRC_URI[sha256sum] = "4b8a1fb724904139149a43e172850f35aa6ea97fb0545244dc0b805e0154ed68"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

