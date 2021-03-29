Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.19126.1617009635966452746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 02:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lQo4W-0002Gp-Tb; Mon, 29 Mar 2021 12:20:33 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-pyroute2: Upgrade 0.5.14 -> 0.5.15
Date: Mon, 29 Mar 2021 12:20:19 +0300
Message-Id: <20210329092024.11922-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329092024.11922-1-leon.anavi@konsulko.com>
References: <20210329092024.11922-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.5.15:

- ndb: don't mess with SQL adapters unless really needed
- ndb: support more virtual interface types
- ndb: support in for views and record sets
- ndb: fix nested fetches from DB
- tests: start migration to pytest

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyroute2_0.5.14.bb => python3-pyroute2_0.5.15.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.14.bb => python3-pyroute2_0.5.15.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.15.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.15.bb
index 84397b65b..ca168b137 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.15.bb
@@ -3,8 +3,7 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "6bde3624a6f22bdfb630bb54243a0d1d"
-SRC_URI[sha256sum] = "774c5ecf05fe40f0f601a7ab33c19ca0b24f00bf4a094e58deaa5333b7ca49b5"
+SRC_URI[sha256sum] = "d730eff091dd5b2b78282bc82ebe6888e7ee4d70b79468b1da58d99fc1a2a2fc"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1

