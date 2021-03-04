Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6005.1614863169312521636
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 05:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34576 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lHng8-0000xG-9n; Thu, 04 Mar 2021 15:06:08 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-portion: Upgrade 2.1.4 -> 2.1.5
Date: Thu,  4 Mar 2021 15:05:53 +0200
Message-Id: <20210304130554.32308-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210304130554.32308-1-leon.anavi@konsulko.com>
References: <20210304130554.32308-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.5:

- Getting items from an Interval using a slice does no longer
  return a list but an Interval instance.
- Intervals are properly pretty-printed by pandas.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-portion_2.1.4.bb => python3-portion_2.1.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.1.4.bb => python3-portion_2.1.5.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb b/meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
index d08d3e7255..0fa107c33e 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "58b2792e6e9837a2d55a97d459b940c90fb08b5fba774f524e9359727c80e7b4"
+SRC_URI[sha256sum] = "ed62fd1450336026f55c7d40b92b7159efd81d1420c778dd1b592bb634b14b4c"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

