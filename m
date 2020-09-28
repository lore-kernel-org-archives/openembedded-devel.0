Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.31547.1601280077197671128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 01:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40866 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kMo5x-0001Xq-C4; Mon, 28 Sep 2020 11:01:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-pychromecast: Upgrade 7.3.0 -> 7.5.0
Date: Mon, 28 Sep 2020 11:00:54 +0300
Message-Id: <20200928080059.18929-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.5.0:

- Allow passing additional media information through to play_media
- Add support for lists, playQueues, and playlists on Plex
  controller
- Misc spelling changes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_7.3.0.bb => python3-pychromecast_7.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.3.0.bb => python3-pychromecast_7.5.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
index b444df05d8..adfdbb17b8 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "7ab862743ff33dafc93206c1435abc5e"
-SRC_URI[sha256sum] = "f594231efb34b86eeb463611662bca21a6962793885d3ad68195286940f7473d"
+SRC_URI[md5sum] = "d35c610f57cae909348ff6c60e5e9256"
+SRC_URI[sha256sum] = "2f346a88ddc27a19cc68bc2d3e8929d89276298cb1c11871b82a87fbdafb95a8"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

