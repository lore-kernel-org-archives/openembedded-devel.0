Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.1142.1616603877741886145
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53316 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lP6W4-0008Nt-Qj; Wed, 24 Mar 2021 18:37:57 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pyperf: Upgrade 2.1.0 -> 2.2.0
Date: Wed, 24 Mar 2021 18:37:44 +0200
Message-Id: <20210324163746.19010-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210324163746.19010-1-leon.anavi@konsulko.com>
References: <20210324163746.19010-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.0:

- --track-memory option now supports macOS by using psutil.
- Added --copy-env command line option that inherits all
  environment variables.
- The development branch master was renamed to main. See
  https://sfconservancy.org/news/2020/jun/23/gitbranchname/
  for the rationale.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyperf_2.1.0.bb => python3-pyperf_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.1.0.bb => python3-pyperf_2.2.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.2.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.2.0.bb
index b57ea16eb..70676b05f 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.2.0.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "1257d673d89fdcdbaec8077afeb365e7a94739c1b263572b09403cac25708ad3"
+SRC_URI[sha256sum] = "498bb4d1fe21350c2b7c1aa8bb3eae9c9979358d0b66327954bc66839fcba8b6"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-- 
2.17.1

