Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.98.1616173997222527134
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37638 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lNIgS-0002xc-Eg; Fri, 19 Mar 2021 19:13:14 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-soupsieve: Upgrade 2.2 -> 2.2.1
Date: Fri, 19 Mar 2021 19:13:02 +0200
Message-Id: <20210319171304.28090-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.1:

- Fix an issue with namespaces when one of the keys is self.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_2.2.bb => python3-soupsieve_2.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.2.bb => python3-soupsieve_2.2.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
index 9507f60d7..93ef04f14 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67"
 
-SRC_URI[sha256sum] = "407fa1e8eb3458d1b5614df51d9651a1180ea5fedf07feb46e45d7e25e6d6cdd"
+SRC_URI[sha256sum] = "052774848f448cf19c7e959adf5566904d525f33a3f8b6ba6f6f8f26ec7de0cc"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

