Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8647.1603207571406022607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 08:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33424 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kUtWb-0007NG-Sv; Tue, 20 Oct 2020 18:26:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-colorama: Upgrade 0.4.3 -> 0.4.4
Date: Tue, 20 Oct 2020 18:26:00 +0300
Message-Id: <20201020152601.26261-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020152601.26261-1-leon.anavi@konsulko.com>
References: <20201020152601.26261-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.4.4:

- Re-org of README, to put the most insteresting parts near
  the top.
- Added Linux makefile targets and Windows powershell scripts to
  automate bootstrapping a development environment, and automate
  the process of testing wheels before they are uploaded to PyPI.
- Use stdlib unittest.mock where available
- Travis CI now also builds on arm64
- Demo06 demonstrates existing cursor positioning feature
- Fix OSC regex & handling to prevent hang or crash
- Document enterprise support by Tidelift

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-colorama_0.4.3.bb => python3-colorama_0.4.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorama_0.4.3.bb => python3-colorama_0.4.4.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
rename to meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
index 31a523b0c1..54640de04e 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "02daee502863d24112a8c05a5d69a612"
-SRC_URI[sha256sum] = "e96da0d330793e2cb9485e9ddfd918d456036c7149416295932478192f4436a1"
+SRC_URI[md5sum] = "57b22f2597f63df051b69906fbf310cc"
+SRC_URI[sha256sum] = "5941b2b48a20143d2267e95b1c2a7603ce057ee39fd88e7329b0c292aa16869b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

