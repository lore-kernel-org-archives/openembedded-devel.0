Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.56285.1629300142350188278
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 08:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59570 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mGNOS-0005Z4-3k; Wed, 18 Aug 2021 18:22:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-astroid: Upgrade 2.7.0 -> 2.7.1
Date: Wed, 18 Aug 2021 18:22:03 +0300
Message-Id: <20210818152203.2165-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818152203.2165-1-leon.anavi@konsulko.com>
References: <20210818152203.2165-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.7.1:

- When processing dataclass attributes, only do typing inference
  on collection types. Support for instantiating other typing
  types is left for the future, if desired.
- Fixed LookupMixIn missing from ``astroid.node_classes``.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.7.0.bb => python3-astroid_2.7.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.7.0.bb => python3-astroid_2.7.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.7.0.bb b/meta-python/recipes-devtools/python/python3-astroid_2.7.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.7.1.bb
index f95c5138cc..4ed051d22d 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.7.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1472a98322b64869b9dc95007a0fbbaa71d580e3c8abf73c989b740873c673f3"
+SRC_URI[sha256sum] = "f3083366b7bb8b3a72c0e12841ab07f14b0d7ff5cc1c89676b84d8f5832e4b61"
 
 inherit pypi setuptools3
 
-- 
2.17.1

