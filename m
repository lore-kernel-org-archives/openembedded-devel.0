Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.2094.1626862257386107392
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 03:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36746 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m69Bn-0000aO-HL; Wed, 21 Jul 2021 13:10:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-pkgconfig: Upgrade 1.5.4 -> 1.5.5
Date: Wed, 21 Jul 2021 13:10:51 +0300
Message-Id: <20210721101051.13881-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.5:

- test_configure_extension: sorted expected

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pkgconfig_1.5.4.bb => python3-pkgconfig_1.5.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pkgconfig_1.5.4.bb => python3-pkgconfig_1.5.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.4.bb b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pkgconfig_1.5.4.bb
rename to meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
index 852b27816a..4c0e799ac4 100644
--- a/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pkgconfig_1.5.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faa7f82be8f220bff6156be4790344fc"
 
-SRC_URI[sha256sum] = "c34503829fd226822fd93c902b1cf275516908a023a24be0a02ba687f3a00399"
+SRC_URI[sha256sum] = "deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899"
 
 RDEPENDS_${PN} = "pkgconfig \
                  ${PYTHON_PN}-shell \
-- 
2.17.1

