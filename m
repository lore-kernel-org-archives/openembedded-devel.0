Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6877.1618307330762496783
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 02:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41218 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWFf2-0007BP-2k; Tue, 13 Apr 2021 12:48:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-humanize: Upgrade 3.4.0 -> 3.4.1
Date: Tue, 13 Apr 2021 12:48:35 +0300
Message-Id: <20210413094835.20465-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413094835.20465-1-leon.anavi@konsulko.com>
References: <20210413094835.20465-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.4.1:

- Add Catalan binary translation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.4.0.bb => python3-humanize_3.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.4.0.bb => python3-humanize_3.4.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.4.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.4.1.bb
index f9c22e8914..5ffc2b5938 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.4.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "096b9ae6d1d56321d3d81f17117c2068179d7b4f7f73ba4baf302726923b48ec"
+SRC_URI[sha256sum] = "6e04cdd75d66074c34ff93c30a2ad6d19d91202a65c1bd400b2edeedae399bda"
 
 inherit pypi setuptools3
 
-- 
2.17.1

