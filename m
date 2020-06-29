Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.494.1593451161243954812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 10:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpxR9-0000w7-FT; Mon, 29 Jun 2020 20:19:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-pychromecast: Upgrade 4.2.3 -> 7.0.1
Date: Mon, 29 Jun 2020 20:18:50 +0300
Message-Id: <20200629171853.18608-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629171853.18608-1-leon.anavi@konsulko.com>
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.0.1:

- BREAKING CHANGE Track services based on UUID instead of mDNS
  service name
- Correct version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-pychromecast_4.2.3.bb => python3-pychromecast_7.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_4.2.3.bb => python3-pychromecast_7.0.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
index f561753a1..d21bb5f3a 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.0.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[md5sum] = "56632e0d94f2648a29d89affddddaaec"
-SRC_URI[sha256sum] = "d7b7b35254203ab4617389061bee25b0fa67c6628c48bd6a75ccfefef74f1edb"
+SRC_URI[md5sum] = "519d928bf3bdc8adb4dff1ad0e9de6ff"
+SRC_URI[sha256sum] = "85112a0f39727636e35a0e1b633cc55a90a17bfc06be0a9a9bea5e46ac603cf1"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

