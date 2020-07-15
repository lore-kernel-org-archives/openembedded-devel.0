Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9202.1594826705593572434
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 08:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jvjHK-0006eC-7N; Wed, 15 Jul 2020 18:25:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cbor2: Upgrade 5.1.0 -> 5.1.1
Date: Wed, 15 Jul 2020 18:24:46 +0300
Message-Id: <20200715152450.29018-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.1.1:

- Build system: Making C lib optional if it fails to compile
- Build system: Better Glibc version detection
- Tests: Positive and negative bignums
- Bugfix: Fractional seconds parsing in datetimes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cbor2_5.1.0.bb => python3-cbor2_5.1.1.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.1.0.bb => python3-cbor2_5.1.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
index 812539941..6b26da2a6 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.1.1.bb
@@ -4,7 +4,8 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "43ce11e8c2fe4971d386d1a60cf83bfa0a4a667b97668ba76acbf5e6398821aa"
+SRC_URI[sha256sum] = "09e9607ea50e2ebb718791d475f11620cb244b0cc3758ce2e76cf36e8372ad64"
+SRC_URI[md5sum] = "b034d7edfd22c1f98e600aaedbd90f39"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

