Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8648.1603207572267350927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 08:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33424 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kUtWc-0007NG-P8; Tue, 20 Oct 2020 18:26:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-zipp: Upgrade 3.3.0 -> 3.3.1
Date: Tue, 20 Oct 2020 18:26:01 +0300
Message-Id: <20201020152601.26261-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020152601.26261-1-leon.anavi@konsulko.com>
References: <20201020152601.26261-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.1:

- bpo-42043: Add tests capturing subclassing requirements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-zipp_3.3.0.bb => python3-zipp_3.3.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zipp_3.3.0.bb => python3-zipp_3.3.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
index 746f9cea52..1cb4c2aa88 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "87a53f0bf48671f6bf6d3e9938218509"
-SRC_URI[sha256sum] = "64ad89efee774d1897a58607895d80789c59778ea02185dd846ac38394a8642b"
+SRC_URI[md5sum] = "8bc697a6f65b8e2f75bcadfb90e98e58"
+SRC_URI[sha256sum] = "c1532a8030c32fd52ff6a288d855fe7adef5823ba1d26a29a68fd6314aa72baa"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1

