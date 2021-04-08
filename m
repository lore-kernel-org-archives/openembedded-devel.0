Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6779.1617882820727828289
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 04:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35416 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUTEA-0002Qi-HD; Thu, 08 Apr 2021 14:53:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-decorator: Upgrade 5.0.5 -> 5.0.6
Date: Thu,  8 Apr 2021 14:53:29 +0300
Message-Id: <20210408115330.7708-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210408115330.7708-1-leon.anavi@konsulko.com>
References: <20210408115330.7708-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.6:

- The decorator module was not copying the module attribute anymore

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-decorator_5.0.5.bb => python3-decorator_5.0.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-decorator_5.0.5.bb => python3-decorator_5.0.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb b/meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
rename to meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
index 47daba8a0..9e837b719 100644
--- a/meta-python/recipes-devtools/python/python3-decorator_5.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-decorator_5.0.6.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=be2fd2007972bf96c08af3293d728b22"
 
-SRC_URI[sha256sum] = "acda948ffcfe4bd0c4a57834b74ad968b91925b8201b740ca9d46fb8c5c618ce"
+SRC_URI[sha256sum] = "f2e71efb39412bfd23d878e896a51b07744f2e2250b2e87d158e76828c5ae202"
 
 inherit pypi setuptools3
 
-- 
2.17.1

