Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6811.1618307332462832500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 02:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41218 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWFex-0007BP-J6; Tue, 13 Apr 2021 12:48:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-pyroute2: Upgrade 0.5.17 -> 0.5.18
Date: Tue, 13 Apr 2021 12:48:32 +0300
Message-Id: <20210413094835.20465-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.5.18:

- netlink: support zero length lladdr

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyroute2_0.5.17.bb => python3-pyroute2_0.5.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.17.bb => python3-pyroute2_0.5.18.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.17.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.18.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.17.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.18.bb
index 1d3d5a253a..439d383f86 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.17.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.18.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "12d51066ea5628a6fa76fc244f301a8eea5d25d71a9d664016976edfa3889733"
+SRC_URI[sha256sum] = "08ac40cad52c0bb2e0f20087520599aa91fcce0b221dd26e9042330428810bc5"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1

