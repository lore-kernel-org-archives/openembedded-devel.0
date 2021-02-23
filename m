Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11145.1614093748968465273
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZW5-00022z-Pl; Tue, 23 Feb 2021 17:22:26 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-pkgconfig: Upgrade 1.5.1 -> 1.5.2
Date: Tue, 23 Feb 2021 17:22:11 +0200
Message-Id: <20210223152219.32129-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223152219.32129-1-leon.anavi@konsulko.com>
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.2:

- Added Support for Linux On Power
- Use poetry_core as build backend

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pkgconfig_1.5.1.bb => python3-pkgconfig_1.5.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pkgconfig_1.5.1.bb => python3-pkgconfig_1.5.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pkgconfig_1.5.2.bb
index 05ca3beecd..7a98ef2884 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.2.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc"
 
-SRC_URI[md5sum] = "9f9cdb224ec0a1e59efcc7cac4b91972"
-SRC_URI[sha256sum] = "97bfe3d981bab675d5ea3ef259045d7919c93897db7d3b59d4e8593cba8d354f"
+SRC_URI[sha256sum] = "38d612488f0633755a2e7a8acab6c01d20d63dbc31af75e2a9ac98a6f638ca94"
 
 RDEPENDS_${PN} = "pkgconfig \
                  ${PYTHON_PN}-shell \
-- 
2.17.1

