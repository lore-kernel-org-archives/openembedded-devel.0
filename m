Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5867.1618819061037751959
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 00:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lYOmm-0004td-6e; Mon, 19 Apr 2021 10:57:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-portion: Upgrade 2.1.5 -> 2.1.6
Date: Mon, 19 Apr 2021 10:57:26 +0300
Message-Id: <20210419075726.2396-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419075726.2396-1-leon.anavi@konsulko.com>
References: <20210419075726.2396-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.6:

- from_stringraises a ValueError if given string cannot be parsed
  to an interval
- Drop official support for Python 3.5
- Use black as official code formatting

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-portion_2.1.5.bb => python3-portion_2.1.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.1.5.bb => python3-portion_2.1.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.1.5.bb b/meta-python/recipes-devtools/python/python3-portion_2.1.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.1.6.bb
index 0fa107c33e..a1076f9f0c 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.1.6.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ed62fd1450336026f55c7d40b92b7159efd81d1420c778dd1b592bb634b14b4c"
+SRC_URI[sha256sum] = "725b65da806fb79df05c0b6383b01631c510f371d9bc0ece93a996b4260ba085"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

