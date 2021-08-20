Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.81482.1629448956239598721
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 01:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59332 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mH06X-0004p8-6H; Fri, 20 Aug 2021 11:42:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-qrcode: Upgrade 7.2 -> 7.3
Date: Fri, 20 Aug 2021 11:42:14 +0300
Message-Id: <20210820084216.23017-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.3:

- Skip color mask if QR is black and white

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-qrcode_7.2.bb => python3-qrcode_7.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qrcode_7.2.bb => python3-qrcode_7.3.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.2.bb b/meta-python/recipes-devtools/python/python3-qrcode_7.3.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-qrcode_7.2.bb
rename to meta-python/recipes-devtools/python/python3-qrcode_7.3.bb
index c9e9ebf097..f195f47177 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_7.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
 PYPI_PACKAGE = "qrcode"
-SRC_URI[sha256sum] = "153ad96f5892e6fe2f3699296240976ac3a6d068e2eb48bbfc64b4c4c4d675ea"
+SRC_URI[sha256sum] = "d72861b65e26b611609f0547f0febe58aed8ae229d6bf4e675834f40742915b3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

