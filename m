Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9983.1618389334391731230
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 01:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lWazi-00040c-Jl; Wed, 14 Apr 2021 11:35:31 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-decorator: Upgrade 5.0.6 -> 5.0.7
Date: Wed, 14 Apr 2021 11:35:22 +0300
Message-Id: <20210414083525.10948-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.7:

- The decorator module was not passing correctly the defaults
  inside the *args tuple
- Fixed some mispellings in the documentation
- Integrated codespell in the CI

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-decorator_5.0.6.bb => python3-decorator_5.0.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.0.6.bb => python3-decorator_5.0.7.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb b/meta-python/recipes-devtools/python/python3-decorator_5.0.7.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.0.7.bb
index 9e837b719e..3131b2bc0b 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.0.7.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[sha256sum] = "f2e71efb39412bfd23d878e896a51b07744f2e2250b2e87d158e76828c5ae202"
+SRC_URI[sha256sum] = "6f201a6c4dac3d187352661f508b9364ec8091217442c9478f1f83c003a0f060"
 
 inherit pypi setuptools3
 
-- 
2.17.1

