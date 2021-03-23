Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.205.1616517224178885082
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjyR-0000KS-8O; Tue, 23 Mar 2021 18:33:44 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-humanize: Upgrade 3.2.0 -> 3.3.0
Date: Tue, 23 Mar 2021 18:33:13 +0200
Message-Id: <20210323163317.26664-6-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.0:

- Add humanize.number.clamp

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.2.0.bb => python3-humanize_3.3.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.2.0.bb => python3-humanize_3.3.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.2.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.3.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-humanize_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.3.0.bb
index 646e20f7d..3d54cf0c4 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.3.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "ab69004895689951b79f2ae4fdd6b8127ff0c180aff107856d5d98119a33f026"
+SRC_URI[sha256sum] = "8bf7abd672b867f38b8b04593829b85b9b6199a61ef6586bf3629cc06458ff35"
 
 inherit pypi setuptools3
 
-- 
2.17.1

