Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11159.1617712425446460614
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 05:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55444 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lTktn-0003tX-IZ; Tue, 06 Apr 2021 15:33:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-decorator: Upgrade 5.0.1 -> 5.0.5
Date: Tue,  6 Apr 2021 15:33:29 +0300
Message-Id: <20210406123331.23266-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210406123331.23266-1-leon.anavi@konsulko.com>
References: <20210406123331.23266-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.5:

- Dropped support for Python < 3.5 with a substantial
  simplification of the code base (now building a decorator does
  not require calling "exec").
- Added a way to mimic functools.wraps-generated decorators.
- Ported the Continuous Integration from Travis to GitHub.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-decorator_5.0.1.bb => python3-decorator_5.0.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.0.1.bb => python3-decorator_5.0.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb b/meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
index e9d20379f..47daba8a0 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[sha256sum] = "1e53162e016f317a61d93848f00e80e7109ca9ed06846c7f2930cf0ebede7c6c"
+SRC_URI[sha256sum] = "acda948ffcfe4bd0c4a57834b74ad968b91925b8201b740ca9d46fb8c5c618ce"
 
 inherit pypi setuptools3
 
-- 
2.17.1

