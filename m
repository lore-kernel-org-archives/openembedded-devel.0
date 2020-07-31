Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.18252.1596201788664120153
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V06-000741-UW; Fri, 31 Jul 2020 16:23:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 14/15] python3-luma-core: Upgrade 1.14.0 -> 1.14.1
Date: Fri, 31 Jul 2020 16:22:29 +0300
Message-Id: <20200731132230.20031-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.14.1:

- Pin spidev at v3.4 or lower; v3.5 seems to cause SystemException
  running on latest linux kernel
- Fix bug in snapshot: should always redraw on startup

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-luma-core_1.14.0.bb => python3-luma-core_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.14.0.bb => python3-luma-core_1.14.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
index 503acc824..d532405cc 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "c049eabcdd50c4c1e630282c058e18f8"
-SRC_URI[sha256sum] = "1501901f08c279abb9a5f1b76347955d6a15238c1e86e055aef96acd3e2e4215"
+SRC_URI[md5sum] = "a738326f46c860acf6a4a9b2ec36ba73"
+SRC_URI[sha256sum] = "972dc312b2831fe4c6b51943cc36903a9508cab8d9f2631a7ee485695924d34b"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

