Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5442.1628584273836008890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 01:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53578 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDNA9-0005EL-A9; Tue, 10 Aug 2021 11:31:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-zeroconf: Upgrade 0.33.2 -> 0.34.3
Date: Tue, 10 Aug 2021 11:30:54 +0300
Message-Id: <20210810083058.29524-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.34.3:

- Fix sending immediate multicast responses
- Coalesce aggregated multicast answers
- Ensure ServiceInfo requests can be answered inside the default
  timeout with network protection
- Ensure multicast aggregation sends responses within 620ms
- Implemented Multicast Response Aggregation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-zeroconf_0.33.2.bb => python3-zeroconf_0.34.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.33.2.bb => python3-zeroconf_0.34.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.33.2.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.34.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.33.2.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.34.3.bb
index 242f329dc8..a8b9aeb73b 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.33.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.34.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "5a59425d225a1f5fba0196766fccf856d4686f653037108cbc643a76c1a884fd"
+SRC_URI[sha256sum] = "145e67c182d361b350f057fb9240dedec5e79a7c61f465a01138d4a49a4b87b3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

