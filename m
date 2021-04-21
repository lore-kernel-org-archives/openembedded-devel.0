Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.9086.1618991940125019628
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 00:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41746 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZ7l3-0002oU-5s; Wed, 21 Apr 2021 10:58:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-hyperframe: Upgrade 6.0.0 -> 6.0.1
Date: Wed, 21 Apr 2021 10:58:39 +0300
Message-Id: <20210421075843.17725-1-leon.anavi@konsulko.com>
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

Upgrade to release 6.0.1 with the following API changes:

- Added support for Python 3.9
- Added type hints

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-hyperframe_6.0.0.bb => python3-hyperframe_6.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-hyperframe/{python3-hyperframe_6.0.0.bb => python3-hyperframe_6.0.1.bb} (61%)

diff --git a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.1.bb
similarity index 61%
rename from meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
rename to meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.1.bb
index 4a936b49af..2d46e96112 100644
--- a/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.0.bb
+++ b/meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_6.0.1.bb
@@ -4,7 +4,6 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5bf1c68e73fbaec2b1687b7e71514393"
 
-SRC_URI[md5sum] = "30136a712e092b1a45ae3cad3ae93131"
-SRC_URI[sha256sum] = "742d2a4bc3152a340a49d59f32e33ec420aa8e7054c1444ef5c7efff255842f1"
+SRC_URI[sha256sum] = "ae510046231dc8e9ecb1a6586f63d2347bf4c8905914aa84ba585ae85f28a914"
 
 inherit pypi setuptools3
-- 
2.17.1

