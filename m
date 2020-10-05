Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.33285.1601898917420413004
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 04:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44266 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPP5H-0004NT-PQ; Mon, 05 Oct 2020 14:55:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-zipp: Upgrade 3.2.0 -> 3.3.0
Date: Mon,  5 Oct 2020 14:55:07 +0300
Message-Id: <20201005115507.11563-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201005115507.11563-1-leon.anavi@konsulko.com>
References: <20201005115507.11563-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.3.0:

- Path objects now expose a .filename attribute and rely on that
  to resolve .name and .parent when the Path object is at the
  root of the zipfile.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-zipp_3.2.0.bb => python3-zipp_3.3.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zipp_3.2.0.bb => python3-zipp_3.3.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
index 59d71500d5..746f9cea52 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_3.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "321a0dfa1080d58e5de0800a26565452"
-SRC_URI[sha256sum] = "b52f22895f4cfce194bc8172f3819ee8de7540aa6d873535a8668b730b8b411f"
+SRC_URI[md5sum] = "87a53f0bf48671f6bf6d3e9938218509"
+SRC_URI[sha256sum] = "64ad89efee774d1897a58607895d80789c59778ea02185dd846ac38394a8642b"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1

