Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13116.1597146304209157866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5SiE-0004It-RG; Tue, 11 Aug 2020 14:45:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-parse: Upgrade 1.15.0 -> 1.16.0
Date: Tue, 11 Aug 2020 14:44:28 +0300
Message-Id: <20200811114430.27916-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811114430.27916-1-leon.anavi@konsulko.com>
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 1.16.0:

Make compiled parse objects pickleable

License-Update: Use file LICENSE.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-parse_1.15.0.bb => python3-parse_1.16.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.15.0.bb => python3-parse_1.16.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
index bff41449c..a1e945276 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.16.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Parse strings using a specification based on the Python format() syntax"
 HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://parse.py;beginline=1325;endline=1345;md5=3d987b2e73881bbce768a80f9cdd23d9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[md5sum] = "a5aa82b2b8b4d733d227e3c99d7d01b4"
-SRC_URI[sha256sum] = "a6d4e2c2f1fbde6717d28084a191a052950f758c0cbd83805357e6575c2b95c0"
+SRC_URI[md5sum] = "ba263b3143e9528ae960bbba4d56bf25"
+SRC_URI[sha256sum] = "cd89e57aed38dcf3e0ff8253f53121a3b23e6181758993323658bffc048a5c19"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

