Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.3720.1606389744815317650
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 03:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52394 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kiFLw-0005Yd-LF; Thu, 26 Nov 2020 13:22:21 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-luma-core: Upgrade 1.17.3 -> 2.0.1
Date: Thu, 26 Nov 2020 13:22:09 +0200
Message-Id: <20201126112215.11451-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.1:

- Improved diff_to_previous framebuffer performance
- Add Linux framebuffer pseudo-device
- Allow a wider range of SPI bus speeds
- Fix to allow cmdline args to dynamically create a full_frame()
  instance

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-luma-core_1.17.3.bb => python3-luma-core_2.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.17.3.bb => python3-luma-core_2.0.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb b/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
index 8301d7f77a..fad7432132 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.17.3.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_2.0.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=db07e3d471938ea7d7fd2135f88ac9a1"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "c13303a123c32c1a8dc5bc089a920822"
-SRC_URI[sha256sum] = "1c928ad8e42af5fd395260176f89eb68a8af61911971f94124fabc9c6b550689"
+SRC_URI[sha256sum] = "a0bc18c03cfb293c9c1b1d8883c2ec7c29d167e4af99f795b5698c8a864332df"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

