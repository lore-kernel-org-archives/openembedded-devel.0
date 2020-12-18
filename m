Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.663.1608328081887344632
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 13:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45218 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kqNbR-00048f-3d; Fri, 18 Dec 2020 23:47:59 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pychromecast: Upgrade 7.5.1 -> 7.6.0
Date: Fri, 18 Dec 2020 23:47:45 +0200
Message-Id: <20201218214748.14563-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218214748.14563-1-leon.anavi@konsulko.com>
References: <20201218214748.14563-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.6.0:

- Spotify quick play (again)
- Fix next/previous track
- Add support for BubbleUPNP

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-pychromecast_7.5.1.bb => python3-pychromecast_7.6.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.5.1.bb => python3-pychromecast_7.6.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
index b7796251ec..52803744f9 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.6.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "9dee7207b7a5c73ebf8fad64be137f27"
-SRC_URI[sha256sum] = "cf2e9fa795ea1e9d0d180adfbdccefd6b4f532eae56f41f15d1a75b323096f51"
+SRC_URI[sha256sum] = "998851e615e41ff436780867de84adea0f1720b7a73822451bd9ff9a00c0e255"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

