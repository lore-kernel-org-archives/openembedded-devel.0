Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10190.1603702956132859554
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 02:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55296 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kWyOg-0003YJ-H8; Mon, 26 Oct 2020 11:02:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-zipp: Upgrade 3.3.1 -> 3.4.0
Date: Mon, 26 Oct 2020 11:02:16 +0200
Message-Id: <20201026090217.21174-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026090217.21174-1-leon.anavi@konsulko.com>
References: <20201026090217.21174-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.4.0:

- Path.joinpath now takes arbitrary positional arguments and no
  longer accepts add as a keyword argument.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-zipp_3.3.1.bb => python3-zipp_3.4.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zipp_3.3.1.bb => python3-zipp_3.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb b/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
index 1cb4c2aa88..97523e8e7c 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "8bc697a6f65b8e2f75bcadfb90e98e58"
-SRC_URI[sha256sum] = "c1532a8030c32fd52ff6a288d855fe7adef5823ba1d26a29a68fd6314aa72baa"
+SRC_URI[md5sum] = "ae81f228995578b840d76d1b7d87fede"
+SRC_URI[sha256sum] = "ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1

