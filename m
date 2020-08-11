Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13115.1597146303347967100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5SiD-0004It-Tj; Tue, 11 Aug 2020 14:45:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-sympy: Upgrade 1.6.1 -> 1.6.2
Date: Tue, 11 Aug 2020 14:44:27 +0300
Message-Id: <20200811114430.27916-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811114430.27916-1-leon.anavi@konsulko.com>
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.2:

- Fixed a bug that made matrix operations fail in a multithreaded
  application
- Using factor with the extension argument no longer hangs in some
  cases
- Calling preview with viewer="file" no longer looks for a file
  executable (a regression in 1.6.0)
- The deprecation of calling preview with viewer="StringIO" is now
  expired instead of forgotten (a regression in 1.6.0)
- intersphinx links to :mod:`sympy` no longer point to the
  documentation for Immutable Matrices

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sympy_1.6.1.bb => python3-sympy_1.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.6.1.bb => python3-sympy_1.6.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
index fafd591a8..428b40c3b 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4"
 
-SRC_URI[md5sum] = "8bdf8473751722fd1714aa7125b1478b"
-SRC_URI[sha256sum] = "7386dba4f7e162e90766b5ea7cab5938c2fe3c620b310518c8ff504b283cb15b"
+SRC_URI[md5sum] = "50d6b69b1de36b757484b9ff833a9e0a"
+SRC_URI[sha256sum] = "1cfadcc80506e4b793f5b088558ca1fcbeaec24cd6fc86f1fdccaa3ee1d48708"
 
 inherit pypi setuptools3
 
-- 
2.17.1

