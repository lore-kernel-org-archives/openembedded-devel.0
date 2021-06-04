Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.705.1622820732525842710
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 08:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53150 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lpBnr-0008SE-0w; Fri, 04 Jun 2021 18:32:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-aiohue: Upgrade 2.5.0 -> 2.5.1
Date: Fri,  4 Jun 2021 18:31:56 +0300
Message-Id: <20210604153200.20570-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.5.1:

- Use event source for streaming events
- Bump black from 21.5b1 to 21.5b2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiohue_2.5.0.bb => python3-aiohue_2.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_2.5.0.bb => python3-aiohue_2.5.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.5.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.5.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aiohue_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_2.5.1.bb
index a29625acc5..4a203ccc63 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_2.5.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "e2ae49be45261283a899cc1b95786f07fe5076be9a311d250dbe2de1b8c38f0f"
+SRC_URI[sha256sum] = "3ee8e857b07364516f8b9f0e5c52d4cd775036f3ace37c2769de1e8579f4dc07"
 
 inherit pypi setuptools3
 
-- 
2.17.1

