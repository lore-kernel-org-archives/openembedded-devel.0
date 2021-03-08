Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.38460.1615220301282141135
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35290 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lJIaK-0005d6-9E; Mon, 08 Mar 2021 18:18:21 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pychromecast: Upgrade 8.1.0 -> 9.1.1
Date: Mon,  8 Mar 2021 18:18:09 +0200
Message-Id: <20210308161810.21582-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210308161810.21582-1-leon.anavi@konsulko.com>
References: <20210308161810.21582-1-leon.anavi@konsulko.com>
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

Upgrade to release 9.1.1:

- BREAKING CHANGE: Update discovery to support a list of known
  hosts
- Add HostBrowser.update_hosts
- Handle audio groups removed from known host
- Bump pylint from 2.7.1 to 2.7.2
- Remove useless pylint and flake8 directives

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pychromecast_8.1.0.bb => python3-pychromecast_9.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_8.1.0.bb => python3-pychromecast_9.1.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
index 7b2b5142e..3d0b84cf0 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "df0295f653cee752de38cf8ef09f13ad9782c53924dfbaa191ca62bd5e1dce14"
+SRC_URI[sha256sum] = "ab9da1d2ef424b1fc755f6436f545a56056ec6de24075e93f369eac8eb821837"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

