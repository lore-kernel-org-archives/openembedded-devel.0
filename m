Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.1143.1609970836479562061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxP-0004lA-5c; Thu, 07 Jan 2021 00:07:12 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-sympy: Upgrade 1.6.2 -> 1.7.1
Date: Thu,  7 Jan 2021 00:06:53 +0200
Message-Id: <20210106220702.10483-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.7.1:

- There was a regression in 1.7 that meant that __slots__ would
  not work correctly for Basic instances and they would end up
  having __dict__. This also made it possible to set arbitrary
  attributes on Basic instances such as symbols which breaks
  immutability. This was fixed in 1.7.1 to ensure that Basic
  instances do not have __dict__ and it is not possible to set
  attributes on them.
- Fixed lazy iteration of series with expr.series(x, n=None)
  which was broken in the 1.7 release.
- Updated documentation for sympy.stats.sample for seed argument.
- sympy.stats.sample now has an optional seed argument.
- Random failures with sympy.stats.sample have now been fixed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sympy_1.6.2.bb => python3-sympy_1.7.1.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.6.2.bb => python3-sympy_1.7.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb b/meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
index 428b40c3b7..d4508689f6 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.7.1.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4"
 
-SRC_URI[md5sum] = "50d6b69b1de36b757484b9ff833a9e0a"
-SRC_URI[sha256sum] = "1cfadcc80506e4b793f5b088558ca1fcbeaec24cd6fc86f1fdccaa3ee1d48708"
+SRC_URI[sha256sum] = "a3de9261e97535b83bb8607b0da2c7d03126650fafea2b2789657b229c246b2e"
 
 inherit pypi setuptools3
 
-- 
2.17.1

