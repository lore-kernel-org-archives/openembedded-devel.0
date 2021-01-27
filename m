Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9578.1611762948464559243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49388 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4nAW-0001GX-UZ; Wed, 27 Jan 2021 17:55:46 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-intervals: Upgrade 1.10.0 -> 1.10.0.post1
Date: Wed, 27 Jan 2021 17:55:34 +0200
Message-Id: <20210127155538.12229-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.10.0.post1:

- IntervalDict has a .combine method to merge its keys and values
  with another IntervalDict.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-intervals_1.10.0.bb => python3-intervals_1.10.0.post1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-intervals_1.10.0.bb => python3-intervals_1.10.0.post1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
index 2e8276ec7..14bc9ad25 100644
--- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
@@ -22,7 +22,6 @@ do_install_ptest() {
 	cp -f ${S}/README.md ${D}${PTEST_PATH}
 }
 
-SRC_URI[md5sum] = "8955317ff4e42590c90ba6247b1caaed"
-SRC_URI[sha256sum] = "0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5"
+SRC_URI[sha256sum] = "68a772dc2de6b2b2e83b457329ffa8f9286710994b8070db54348a05762515d2"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

