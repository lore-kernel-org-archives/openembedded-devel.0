Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7296.1594201639326936243
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jt6fd-0007zg-BS; Wed, 08 Jul 2020 12:47:18 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-tinyrecord: Upgrade 0.1.5 -> 0.2.0
Date: Wed,  8 Jul 2020 12:46:56 +0300
Message-Id: <20200708094659.27331-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708094659.27331-1-leon.anavi@konsulko.com>
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade 0.2.0:

- Add LICENSE and MANIFEST.in
- Pin tinydb<4
- Drop support for EOL Python 2.7, 3.3 and 3.4

Use LICENSE for LIC_FILES_CHKSUM.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-tinyrecord_0.1.5.bb => python3-tinyrecord_0.2.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tinyrecord_0.1.5.bb => python3-tinyrecord_0.2.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
rename to meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
index 65df2e1c3..1d99ae2f3 100644
--- a/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
@@ -6,10 +6,10 @@ then execute architecture which allows us to minimize the time \
 that we are within a thread lock."
 HOMEPAGE = "https://github.com/eugene-eeo/tinyrecord"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;md5=31c1dc11b4ae83546538de4c16bceabc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ee157eec4b228c8d5b7a6e0feab2864a"
 
-SRC_URI[md5sum] = "e47dcfe299686cd3fa7ffaa7cb2ee8b1"
-SRC_URI[sha256sum] = "bc7e6a8e78600df234d7a85c2f5d584130f2c6ffd7cd310f9d3a1d976d3373c8"
+SRC_URI[md5sum] = "cbaae3f4599b12e3bea67ca4a75eca99"
+SRC_URI[sha256sum] = "eb6dc23601be359ee00f5a3d31a46adf3bad0a16f8d60af216cd67982ca75cf4"
 
 PYPI_PACKAGE = "tinyrecord"
 inherit pypi setuptools3
-- 
2.17.1

