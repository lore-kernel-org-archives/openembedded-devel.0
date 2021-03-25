Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8128.1616679287934626398
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8I-0007lW-LU; Thu, 25 Mar 2021 15:34:45 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/11] python3-configshell-fb: Upgrade 1.1.28 -> 1.1.29
Date: Thu, 25 Mar 2021 15:34:26 +0200
Message-Id: <20210325133436.18328-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.29:

- setup.py: specify a version range for pyparsing
- Don't warn if prefs file doesn't exist

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...onfigshell-fb_1.1.28.bb => python3-configshell-fb_1.1.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configshell-fb_1.1.28.bb => python3-configshell-fb_1.1.29.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.28.bb b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-configshell-fb_1.1.28.bb
rename to meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
index 2d9ec079a..70e67a1a7 100644
--- a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.28.bb
+++ b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
 SRC_URI = "git://github.com/open-iscsi/configshell-fb.git;protocol=https;branch=master"
-SRCREV = "da8f0cef114e7343a7ae96ff1db7c8c574f819be"
+SRCREV = "d74a33b69f688ed9b8b28033835303604639d4eb"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

