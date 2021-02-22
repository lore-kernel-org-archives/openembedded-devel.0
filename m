Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.98.1614016254943678508
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55530 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEFMD-0008OK-5T; Mon, 22 Feb 2021 19:50:54 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-mpmath: Upgrade 1.1.0 -> 1.2.1
Date: Mon, 22 Feb 2021 19:50:43 +0200
Message-Id: <20210222175043.21231-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210222175043.21231-1-leon.anavi@konsulko.com>
References: <20210222175043.21231-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.1:

- Support @ operator for matrix multiplication
- Add eta() implementing the Dedekind eta function
- Optimized the python_trailing function
- Implement unary plus for matrices
- Improved calculation of gram_index
- Fix a possible division by zero in shanks()
- Fixed indexing errors in deHoog, Knight & Stokes inverse laplace
  transform algorithm
- Corrected branch cuts of the elliprj() function in some cases
- Fix initialization of iv.matrix from non-interval matrix
- Preserve function signatures in PrecisionManager
- Implemented float and complex conversions for ivmpf
- Fixed issue with scalar-matrix multiplication for interval
  matrices
- Fix estimation of quadrature error with multiple subintervals
- Fixed a problem with the defun decorators
- Fix eigenvalue sorting by absolute value

License-Update: Alter the last clause to ensure that Github
recognizes the LICENSE as BSD

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-mpmath_1.1.0.bb => python3-mpmath_1.2.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mpmath_1.1.0.bb => python3-mpmath_1.2.1.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
index 7879a85cdd..51a7c05847 100644
--- a/meta-python/recipes-devtools/python/python3-mpmath_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mpmath_1.2.1.bb
@@ -4,13 +4,13 @@
 SUMMARY = "Python library for arbitrary-precision floating-point arithmetic"
 HOMEPAGE = "https://pypi.org/project/mpmath/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=efe9feb00df0b763941f2b1bbac7c402"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=71970bd3749eebe1bfef9f1efff5b37a"
 
-SRC_URI[md5sum] = "acb1cdddf38e16084628065b174ddbfe"
-SRC_URI[sha256sum] = "fc17abe05fbab3382b61a123c398508183406fa132e0223874578e20946499f6"
+SRC_URI[sha256sum] = "79ffb45cf9f4b101a807595bcb3e72e0396202e0b1d25d689134b48c4216a81a"
 
 inherit pypi setuptools3
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 RDEPENDS_${PN} += "python3-image"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

