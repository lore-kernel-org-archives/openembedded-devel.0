Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.17246.1593432773821992485
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpseZ-0001kP-Kp; Mon, 29 Jun 2020 15:12:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-sympy: Upgrade 1.5.1 -> 1.6
Date: Mon, 29 Jun 2020 15:12:32 +0300
Message-Id: <20200629121233.27026-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 1.6 with changes in core, combinatorics,
calculus, assumptions, functions, geometry, holonomic, integrals,
logic, matrices, ntheory, parsing, etc. For more details:
https://github.com/sympy/sympy/wiki/release-notes-for-1.6

The year in file LICENSE was updated and the checksum changed.
The license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sympy_1.5.1.bb => python3-sympy_1.6.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.5.1.bb => python3-sympy_1.6.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.6.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.6.bb
index c0c382a51..feb9e10e5 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.6.bb
@@ -4,10 +4,10 @@
 SUMMARY = "Computer algebra system (CAS) in Python"
 HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=611b41534dbf5aa01d7c827bf667ef66"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ebb06e9df8f57522b72d0edb0fcf83d4"
 
-SRC_URI[md5sum] = "b11b310c3e1642bf66e51038cb3c0021"
-SRC_URI[sha256sum] = "d77901d748287d15281f5ffe5b0fef62dd38f357c2b827c44ff07f35695f4e7e"
+SRC_URI[md5sum] = "dbb7b21d2972c41f37d48f744b6189a3"
+SRC_URI[sha256sum] = "9769e3d2952e211b1245f1d0dfdbfbdde1f7779a3953832b7dd2b88a21ca6cc6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

