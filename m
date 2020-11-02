Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.29128.1604311395704640720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 02:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52602 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kZWg9-0004Pi-0u; Mon, 02 Nov 2020 12:03:11 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-kiwisolver: Upgrade 1.3.0 -> 1.3.1
Date: Mon,  2 Nov 2020 12:03:01 +0200
Message-Id: <20201102100303.2377-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.1:

- allow to avoid linking against VC2014_1 on windows
- do not mark move constructor / assignment operator of expression
  as noexcept. This is to circumvent a suspected bug in the GCC
  compiler in the manylinux1 image.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-kiwisolver_1.3.0.bb => python3-kiwisolver_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-kiwisolver_1.3.0.bb => python3-kiwisolver_1.3.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
index f499f04530..be60dc20e5 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/nucleic/kiwi"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4"
 
-SRC_URI[md5sum] = "9d1b3e2dd2bbe1a81ffedcc73cab07e0"
-SRC_URI[sha256sum] = "14f81644e1f3bf01fbc8b9c990a7889e9bb4400c4d0ff9155aa0bdd19cce24a9"
+SRC_URI[md5sum] = "81012578317ddcfa3daed806142f8fed"
+SRC_URI[sha256sum] = "950a199911a8d94683a6b10321f9345d5a3a8433ec58b217ace979e18f16e248"
 
 inherit pypi setuptools3
 
-- 
2.17.1

