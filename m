Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.13189.1620912225912533366
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 06:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhBJW-0004kU-L5; Thu, 13 May 2021 16:23:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-itsdangerous: Upgrade 1.1.0 -> 2.0.0
Date: Thu, 13 May 2021 16:23:25 +0300
Message-Id: <20210513132332.3745-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513132332.3745-1-leon.anavi@konsulko.com>
References: <20210513132332.3745-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 2.0.0:

- Drop support for Python 2 and 3.5.
- JWS support (JSONWebSignatureSerializer,
  TimedJSONWebSignatureSerializer) is deprecated. Use a dedicated
  JWS/JWT library such as authlib instead.
- Importing itsdangerous.json is deprecated. Import Python’s json
  module instead.
- Simplejson is no longer used if it is installed. To use a
  different library, pass it as Serializer(serializer=...).
- datetime values are timezone-aware with timezone.utc. Code using
  TimestampSigner.unsign(return_timestamp=True) or
  BadTimeSignature.date_signed may need to change.
- If a signature has an age less than 0, it will raise
  SignatureExpired rather than appearing valid. This can happen if
  the timestamp offset is changed.
- BadTimeSignature.date_signed is always a datetime object rather
  than an int in some cases.
- Added support for key rotation. A list of keys can be passed as
  secret_key, oldest to newest. The newest key is used for
  signing, all keys are tried for unsigning.
- Removed the default SHA-512 fallback signer from
  default_fallback_signers.
- Add type information for static typing tools.

License-Update: standardize license

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-itsdangerous_1.1.0.bb => python3-itsdangerous_2.0.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-itsdangerous_1.1.0.bb => python3-itsdangerous_2.0.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-itsdangerous_2.0.0.bb
index 7f50641c89..ddcc5d9dd4 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.0.bb
@@ -1,10 +1,9 @@
 SUMMARY = "Various helpers to pass trusted data to untrusted environments and back."
 HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=370799bf709a1e4a6a369fa089ac73a6"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4cda9a0ebd516714f360b0e9418cfb37"
 
-SRC_URI[md5sum] = "9b7f5afa7f1e3acfb7786eeca3d99307"
-SRC_URI[sha256sum] = "321b033d07f2a4136d3ec762eac9f16a10ccd60f53c0c91af90217ace7ba1f19"
+SRC_URI[sha256sum] = "99b1053ccce68066dfc0b4465ef8779027e6d577377c8270e21a3d6289cac111"
 
 inherit pypi setuptools3
 
-- 
2.17.1

