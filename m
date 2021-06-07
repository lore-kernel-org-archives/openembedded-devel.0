Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.36330.1623073923326904704
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 06:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57048 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lqFfY-0004lo-UF; Mon, 07 Jun 2021 16:52:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-humanize: Upgrade 3.6.0 -> 3.7.1
Date: Mon,  7 Jun 2021 16:51:49 +0300
Message-Id: <20210607135151.15783-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.7.1:

- Include generated translation binaries in release
- Update release checklist so translation binaries aren't
  forgotten
- Add missing strings for Persian

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.6.0.bb => python3-humanize_3.7.1.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.6.0.bb => python3-humanize_3.7.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.6.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.7.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-humanize_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.7.1.bb
index 1c269bac92..977b6ebfec 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.7.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "a31704cf41f023e268032c4813c6482573320150a0d986f76b245e0451bb89e1"
+SRC_URI[sha256sum] = "b8e7878f3063174b212bb82b9e5bee3b24bc47931e44df0bd34bcb1d8e0acf2f"
 
 inherit pypi setuptools3
 
@@ -15,6 +15,7 @@ DEPENDS += "\
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-setuptools \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

