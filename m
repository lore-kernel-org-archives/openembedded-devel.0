Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.14633.1592822156473510673
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 03:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43452 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnJnt-0005ty-94; Mon, 22 Jun 2020 13:35:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-cheetah: Upgrade 3.2.4 -> 3.2.5
Date: Mon, 22 Jun 2020 13:35:34 +0300
Message-Id: <20200622103542.27830-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622103542.27830-1-leon.anavi@konsulko.com>
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
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

Add homepage and upgrade to release 3.2.5:

- Tests(tox): Refactor `tox.ini`: remove spaces
- Setup: add markdown as an optional dependency
- Build: Install `wheel` and `auditwheel` that correspond to
  each other
- Style: Fix flake8 E741 ambiguous variable name 'l'

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cheetah_3.2.4.bb => python3-cheetah_3.2.5.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cheetah_3.2.4.bb => python3-cheetah_3.2.5.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
index 05882d087..6fa088f59 100644
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.2.5.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Python template engine and code generation tool"
+HOMEPAGE = "https://cheetahtemplate.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=15e13a4ed0e5880e3e55ec88b0921181"
 
@@ -10,5 +11,5 @@ RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "8c0ac643263ffc3454fb321342284d0a"
-SRC_URI[sha256sum] = "caabb9c22961a3413ac85cd1e5525ec9ca80daeba6555f4f60802b6c256e252b"
+SRC_URI[md5sum] = "fc735d4ca7997df2a2da1cae0cf89a1e"
+SRC_URI[sha256sum] = "ececc9ca7c58b9a86ce71eb95594c4619949e2a058d2a1af74c7ae8222515eb1"
-- 
2.17.1

