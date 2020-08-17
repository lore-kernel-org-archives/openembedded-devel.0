Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.40990.1597663767736712147
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 04:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k7dKP-000361-5G; Mon, 17 Aug 2020 14:29:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-cffi: Upgrade 1.14.1 -> 1.14.2
Date: Mon, 17 Aug 2020 14:28:56 +0300
Message-Id: <20200817112901.28914-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817112901.28914-1-leon.anavi@konsulko.com>
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to release 1.14.2:

- CPython 3 on Windows: we again try to compile with
  Py_LIMITED_API by default. This flag is not added if you run the
  compilation with CPython 3.4, as it only works with CPython >=
  3.5, but by now this version of Python is quite old (and we no
  longer distribute cffi wheels for it).
- You can manually disable Py_LIMITED_API by calling
  ffi.set_source(..., py_limited_api=False).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cffi_1.14.1.bb => python3-cffi_1.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.1.bb => python3-cffi_1.14.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
index 59b99dd71..57c28954a 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "1dac3d20d5602829dfaa7026658b7795"
-SRC_URI[sha256sum] = "b2a2b0d276a136146e012154baefaea2758ef1f56ae9f4e01c612b0831e0bd2f"
+SRC_URI[md5sum] = "3cc2f1daf62dd66eda79b4d6281cebfc"
+SRC_URI[sha256sum] = "ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

