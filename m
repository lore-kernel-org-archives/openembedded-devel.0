Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6841.1593768644066619774
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1p-0007av-TH; Fri, 03 Jul 2020 12:30:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-pychromecast: Upgrade 7.0.1 -> 7.1.0
Date: Fri,  3 Jul 2020 12:30:17 +0300
Message-Id: <20200703093020.3514-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.1.0:

- Report host+port for discovered casts
- Fix plex controller
- Update list_chromecasts example

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_7.0.1.bb => python3-pychromecast_7.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.0.1.bb => python3-pychromecast_7.1.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
index d21bb5f3ac..12076adcd4 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "519d928bf3bdc8adb4dff1ad0e9de6ff"
-SRC_URI[sha256sum] = "85112a0f39727636e35a0e1b633cc55a90a17bfc06be0a9a9bea5e46ac603cf1"
+SRC_URI[md5sum] = "10483fca4ffa0381c0c49f3647827179"
+SRC_URI[sha256sum] = "30e18e7d79b6ce2097e630d3cab6e6503f759808ae1ae592bec0a8a7591534f3"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

