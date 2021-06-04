Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.702.1622820733889183196
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 08:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53150 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lpBnw-0008SE-EW; Fri, 04 Jun 2021 18:32:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-cbor2: Upgrade 5.3.0 -> 5.4.0
Date: Fri,  4 Jun 2021 18:31:58 +0300
Message-Id: <20210604153200.20570-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604153200.20570-1-leon.anavi@konsulko.com>
References: <20210604153200.20570-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.4.0:

- Added new feature stringrefs, which makes repetitive dictionary
  structures more compact. Use with care since support for this
  is rare in other CBOR implementations.
- Bugfixes around decoding invalid data, which may improve
  security on decoding untrusted data

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cbor2_5.3.0.bb => python3-cbor2_5.4.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.3.0.bb => python3-cbor2_5.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.3.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.4.0.bb
index 32d2016e59..b791588b42 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.0.bb
@@ -4,7 +4,7 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "462b3604d9579458a79e6ca350943c49aabbc98c794c111a79b98720b9164336"
+SRC_URI[sha256sum] = "a7926f7244b08c413f1a4fa71a81aa256771c75bdf1a4fd77308547a2d63dd48"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

