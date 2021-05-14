Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9413.1621002231821315978
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhYjG-0005Cr-Ij; Fri, 14 May 2021 17:23:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-pyroute2: Upgrade 0.5.18 -> 0.5.19
Date: Fri, 14 May 2021 17:23:39 +0300
Message-Id: <20210514142341.22666-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514142341.22666-1-leon.anavi@konsulko.com>
References: <20210514142341.22666-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.5.19:

- ndb: fix default routes keys
- mptcp: basic support
- netlink: ext_ack support fix
- tc: netem rate setting
- NSPopen: fix fd leak

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyroute2_0.5.18.bb => python3-pyroute2_0.5.19.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.18.bb => python3-pyroute2_0.5.19.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.18.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.18.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
index 439d383f86..903bd6459c 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.18.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "08ac40cad52c0bb2e0f20087520599aa91fcce0b221dd26e9042330428810bc5"
+SRC_URI[sha256sum] = "45460d12ed2a5caf272a357a3360b36d1e346f17afe1425b66fc21d70f462b29"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1

