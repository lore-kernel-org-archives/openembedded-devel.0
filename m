Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.445.1615566374273067200
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36668 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lKkc2-0007yZ-F4; Fri, 12 Mar 2021 18:26:11 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-waitress: Upgrade 1.4.4 -> 2.0.0
Date: Fri, 12 Mar 2021 18:25:56 +0200
Message-Id: <20210312162600.8335-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.0:

- Fix a crash on startup when listening to multiple interfaces.
- Waitress no longer attempts to guess at what the server_name
  should be for a listen socket, instead it always use a new
  adjustment/argument named server_name.
- Allow tasks to notice if the client disconnected.
- Drop Python 2.7 and 3.5 support
- The server now issues warning output when it there are enough
  open connections (controlled by "connection_limit"), that it is
  no longer accepting new connections. This situation was
  previously difficult to diagnose.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-waitress_1.4.4.bb => python3-waitress_2.0.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_1.4.4.bb => python3-waitress_2.0.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb b/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
index 3e207de4f..490dcee6c 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_2.0.0.bb
@@ -6,7 +6,6 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[md5sum] = "079c3c4902b1cb5d0a917276ee70f1df"
-SRC_URI[sha256sum] = "1bb436508a7487ac6cb097ae7a7fe5413aefca610550baf58f0940e51ecfb261"
+SRC_URI[sha256sum] = "69e1f242c7f80273490d3403c3976f3ac3b26e289856936d1f620ed48f321897"
 
 inherit setuptools3 pypi
-- 
2.17.1

