Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5566.1621324894016987983
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40250 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1liufR-00068l-Mx; Tue, 18 May 2021 11:01:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cbor2: Upgrade 5.2.0 -> 5.3.0
Date: Tue, 18 May 2021 11:01:21 +0300
Message-Id: <20210518080125.30656-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.3.0:

- Removed support for Python < 3.6

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cbor2_5.2.0.bb => python3-cbor2_5.3.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.2.0.bb => python3-cbor2_5.3.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.3.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.3.0.bb
index cc067c41a9..32d2016e59 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.3.0.bb
@@ -4,8 +4,7 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "a33aa2e5534fd74401ac95686886e655e3b2ce6383b3f958199b6e70a87c94bf"
-SRC_URI[md5sum] = "0940aa8bfd1a07f06a983bb6dc78f1ca"
+SRC_URI[sha256sum] = "462b3604d9579458a79e6ca350943c49aabbc98c794c111a79b98720b9164336"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

