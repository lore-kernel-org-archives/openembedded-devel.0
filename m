Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.18249.1596201787064709138
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V05-000741-AT; Fri, 31 Jul 2020 16:23:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/15] python3-cffi: Upgrade 1.14.0 -> 1.14.1
Date: Fri, 31 Jul 2020 16:22:27 +0300
Message-Id: <20200731132230.20031-12-leon.anavi@konsulko.com>
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

* CFFI source code is now `hosted on Heptapod`_.
* Improved support for ``typedef int my_array_t[...];`` with an
  explicit dot-dot-dot in API mode
* Windows (32 and 64 bits): multiple fixes for ABI-mode call to
  functions that return a structure.
* Experimental support for MacOS 11 on aarch64.
* Other minor changes and bug fixes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cffi_1.14.0.bb => python3-cffi_1.14.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.0.bb => python3-cffi_1.14.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
index 53c8ee265..59b99dd71 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "74845f8d2b7b583dd9a3574f402edf39"
-SRC_URI[sha256sum] = "2d384f4a127a15ba701207f7639d94106693b6cd64173d6c8988e2c25f3ac2b6"
+SRC_URI[md5sum] = "1dac3d20d5602829dfaa7026658b7795"
+SRC_URI[sha256sum] = "b2a2b0d276a136146e012154baefaea2758ef1f56ae9f4e01c612b0831e0bd2f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

