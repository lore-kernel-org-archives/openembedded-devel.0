Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.33097.1618236147118712230
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lVx8u-0002MB-3q; Mon, 12 Apr 2021 17:02:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-humanize: Upgrade 3.3.0 -> 3.4.0
Date: Mon, 12 Apr 2021 17:02:07 +0300
Message-Id: <20210412140212.8395-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210412140212.8395-1-leon.anavi@konsulko.com>
References: <20210412140212.8395-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.4.0:

- Add Catalan translation
- Add documentation and release notes to project_urls
- Fix tests for Python 3.10

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.3.0.bb => python3-humanize_3.4.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.3.0.bb => python3-humanize_3.4.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.3.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-humanize_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
index 3d54cf0c4..f9c22e891 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.4.0.bb
@@ -1,10 +1,11 @@
 SUMMARY = "Python humanize utilities"
 HOMEPAGE = "http://github.com/jmoiron/humanize"
+SECTION = "devel/python"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "8bf7abd672b867f38b8b04593829b85b9b6199a61ef6586bf3629cc06458ff35"
+SRC_URI[sha256sum] = "096b9ae6d1d56321d3d81f17117c2068179d7b4f7f73ba4baf302726923b48ec"
 
 inherit pypi setuptools3
 
-- 
2.17.1

