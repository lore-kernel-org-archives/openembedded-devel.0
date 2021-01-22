Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.7140.1611310301033723547
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52170 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2tPh-0000CW-52; Fri, 22 Jan 2021 12:11:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-ujson: Upgrade 4.0.1 -> 4.0.2
Date: Fri, 22 Jan 2021 12:11:22 +0200
Message-Id: <20210122101126.25982-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0.2:

- Travis CI: Test on 3.9 final, remove 3.8
- Toward matching Python standard library output for float
- Fix errors on reading long decimal floats
- Make empty dict/list indented serialization match stdlib json
- Fix dealing with None types

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ujson_4.0.1.bb => python3-ujson_4.0.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_4.0.1.bb => python3-ujson_4.0.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
index 2475306f9..d79206fe6 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
@@ -4,8 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[md5sum] = "c8030a62912c3be18ff99fa5b25258b8"
-SRC_URI[sha256sum] = "26cf6241b36ff5ce4539ae687b6b02673109c5e3efc96148806a7873eaa229d3"
+SRC_URI[sha256sum] = "c615a9e9e378a7383b756b7e7a73c38b22aeb8967a8bfbffd4741f7ffd043c4d"
 
 inherit pypi ptest setuptools3
 
-- 
2.17.1

