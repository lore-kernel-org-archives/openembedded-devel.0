Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.15688.1617366902684291574
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 05:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52498 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lSJ0v-0004S7-1y; Fri, 02 Apr 2021 15:35:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-decorator: Upgrade 4.4.2 -> 5.0.1
Date: Fri,  2 Apr 2021 15:34:53 +0300
Message-Id: <20210402123455.23702-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402123455.23702-1-leon.anavi@konsulko.com>
References: <20210402123455.23702-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.1:

- Dropped support for Python < 3.5 with a substantial
  simplification of the code base. Ported CI from Travis to
  GitHub.
- Fixed setup.cfg and python_requires in setup.py

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-decorator_4.4.2.bb => python3-decorator_5.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.4.2.bb => python3-decorator_5.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb b/meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
index 23d0cf218..e9d20379f 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
@@ -9,8 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[md5sum] = "d83c624cce93e6bdfab144821b526e1d"
-SRC_URI[sha256sum] = "e3a62f0520172440ca0dcc823749319382e377f37f140a0b99ef45fecb84bfe7"
+SRC_URI[sha256sum] = "1e53162e016f317a61d93848f00e80e7109ca9ed06846c7f2930cf0ebede7c6c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

