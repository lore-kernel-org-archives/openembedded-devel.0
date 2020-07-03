Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6913.1593768647299995304
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1t-0007av-4Q; Fri, 03 Jul 2020 12:30:46 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-sympy: Upgrade 1.6 -> 1.6.1
Date: Fri,  3 Jul 2020 12:30:20 +0300
Message-Id: <20200703093020.3514-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.1:

- functions: Fixes AttributeError in limit evaluation
- matrices: Disabled default matrix intermediate product
  simplification and changed it to enable via context manager.
- simplify: Fixes a bug in collect when collected symbols appear
  in the factorized expression.
- solvers: Fixed exception handling in solveset's secondary
  trigonometric solver.
- SymPy is importable again in Python 3.5.1 (imports of
  typing.Type are removed)
- Fix the sphinx docs build for sphinx 3.1.1

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sympy_1.6.bb => python3-sympy_1.6.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.6.bb => python3-sympy_1.6.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.6.bb b/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-sympy_1.6.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
index feb9e10e52..fafd591a8a 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.6.1.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4"
 
-SRC_URI[md5sum] = "dbb7b21d2972c41f37d48f744b6189a3"
-SRC_URI[sha256sum] = "9769e3d2952e211b1245f1d0dfdbfbdde1f7779a3953832b7dd2b88a21ca6cc6"
+SRC_URI[md5sum] = "8bdf8473751722fd1714aa7125b1478b"
+SRC_URI[sha256sum] = "7386dba4f7e162e90766b5ea7cab5938c2fe3c620b310518c8ff504b283cb15b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

