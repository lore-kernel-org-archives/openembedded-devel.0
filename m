Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11062.1619092274289344477
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 04:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59522 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZXrS-0003Zx-UP; Thu, 22 Apr 2021 14:51:13 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-python-vlc: Upgrade 3.0.12117 -> 3.0.12118
Date: Thu, 22 Apr 2021 14:50:58 +0300
Message-Id: <20210422115100.28615-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.12118:

- strip prefixes from struct fieldnames
- use pydoctor for doc generation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-python-vlc_3.0.12117.bb => python3-python-vlc_3.0.12118.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.12117.bb => python3-python-vlc_3.0.12118.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12117.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.12117.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb
index 5d9dde9d29..3e799cf622 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12117.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.12118.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "dd512f8438c1bba032fe9d22a7f8f98423a537992141ce2d1b28e29aff30381d"
+SRC_URI[sha256sum] = "566f2f7c303f6800851cacc016df1c6eeec094ad63e0a49d87db9d698094f1fb"
 
 inherit pypi setuptools3
-- 
2.17.1

