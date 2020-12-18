Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.627.1608328090295755426
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 13:48:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45218 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kqNbZ-00048f-TZ; Fri, 18 Dec 2020 23:48:07 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-luma-core: Upgrade 2.0.1 -> 2.2.0
Date: Fri, 18 Dec 2020 23:47:48 +0200
Message-Id: <20201218214748.14563-5-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.0:

- Linux framebuffer: Support BGR, RGBA & BGRA colorspace displays
- Linux framebuffer pseudo-device uses diff-to-previous algorithm
- Change order of namepaces cmdline, so SSD1306 is default

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-luma-core_2.0.1.bb => python3-luma-core_2.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_2.0.1.bb => python3-luma-core_2.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
index fad7432132..b181e09861 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a0bc18c03cfb293c9c1b1d8883c2ec7c29d167e4af99f795b5698c8a864332df"
+SRC_URI[sha256sum] = "62a24518d3aa084d75206a19056eb8aa71b5a3d0c159d2e95b388cb3150a7b1c"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

