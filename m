Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.8713.1610547997889429936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6a-0000Li-Ca; Wed, 13 Jan 2021 16:26:36 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/10] python3-ecdsa: Upgrade 0.16.0 -> 0.16.1
Date: Wed, 13 Jan 2021 16:26:21 +0200
Message-Id: <20210113142626.27599-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113142626.27599-1-leon.anavi@konsulko.com>
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.16.1:

- VerifyingKey.precompute() supports lazy argument to delay
  precomputation to the first time the key is used to verify
  a signature.
- Documentation for the VerifyingKey.precompute() method.
- Make created signatures correct when the hash used is bigger
  than the curve order bit size and the curve order is not a
  multiple of 8 (this affects only users of custom curves or
  hashes with output larger than 512 bits when used with NIST
  P-521 curve).
- Speed up library load time by calculating the generator point
  multiplication tables the first time the points are used, not
  when they are initialised.
- Include Python 3.9 in CI testing.
- Test coverage for the VerifyingKey.precompute() method.
- Small speed-ups for the test suite.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ecdsa_0.16.0.bb => python3-ecdsa_0.16.1.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.16.0.bb => python3-ecdsa_0.16.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
index 36bb246fd..819d41e86 100644
--- a/meta-python/recipes-devtools/python/python3-ecdsa_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.16.1.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
 DEPENDS += "python3-pip python3-pbr"
 
 PYPI_PACKAGE = "ecdsa"
-SRC_URI[md5sum] = "d593df1ab57da611dca76f7328c47b21"
-SRC_URI[sha256sum] = "494c6a853e9ed2e9be33d160b41d47afc50a6629b993d2b9c5ad7bb226add892"
+SRC_URI[sha256sum] = "cfc046a2ddd425adbd1a78b3c46f0d1325c657811c0f45ecc3a0a6236c1e50ff"
 
 inherit pypi setuptools3
 
-- 
2.17.1

