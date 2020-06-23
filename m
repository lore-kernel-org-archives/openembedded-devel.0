Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3729.1592905919080872653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfav-0006Iq-Ey; Tue, 23 Jun 2020 12:51:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/11] python3-xxhash: Upgrade 1.4.3 -> 1.4.4
Date: Tue, 23 Jun 2020 12:51:36 +0300
Message-Id: <20200623095136.24854-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623095136.24854-1-leon.anavi@konsulko.com>
References: <20200623095136.24854-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.4:

- Upgrade xxHash to v0.7.3
- Stop using PEP393 deprecated APIs
- Use XXH(32|64)_canonicalFromHash to replace u2bytes and
  ull2bytes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-xxhash_1.4.3.bb => python3-xxhash_1.4.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_1.4.3.bb => python3-xxhash_1.4.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb b/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
index c114a6c8b..97f4e358b 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_1.4.4.bb
@@ -3,8 +3,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5a8d76283514a1b7e6a414aba38629b5"
 
-SRC_URI[md5sum] = "ce9cbbcc89620fd47a2468badd08dcf0"
-SRC_URI[sha256sum] = "8b6b1afe7731d7d9cbb0398b4a811ebb5e6be5c174f72c68abf81f919a435de9"
+SRC_URI[md5sum] = "0194cc926dd7676d27aba0f89da9798b"
+SRC_URI[sha256sum] = "7d6df9d217977d085b8abd74b61efa40405ac416f2d8bdacc40826bd5cb1b746"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

