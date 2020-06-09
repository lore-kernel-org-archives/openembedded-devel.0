Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7489.1591710210119501398
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 06:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38336 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jieXI-0005lr-Il; Tue, 09 Jun 2020 16:43:29 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-bitarray: Upgrade 1.2.1 -> 1.2.2
Date: Tue,  9 Jun 2020 16:43:10 +0300
Message-Id: <20200609134311.13299-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609134311.13299-1-leon.anavi@konsulko.com>
References: <20200609134311.13299-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.2. Change license checksum because of the
updated metadata stored in PKG-INFO. The license remains PSF.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-bitarray_1.2.1.bb | 11 -----------
 .../recipes-devtools/python/python3-bitarray_1.2.2.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
deleted file mode 100644
index 2bf2937d1..000000000
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.2.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
-HOMEPAGE = "https://github.com/ilanschnell/bitarray"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=dc301a25ebe210dcc53b0a2d5a038eae"
-
-SRC_URI[md5sum] = "a46bf869f6adf34f5b0dc82b469793b7"
-SRC_URI[sha256sum] = "2ed675f460bb0d3d66fd8042a6f1f0d36cf213e52e72a745283ddb245da7b9cf"
-
-inherit setuptools3 pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
new file mode 100644
index 000000000..c495738c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
+HOMEPAGE = "https://github.com/ilanschnell/bitarray"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d331e1d54f5e78247388f5416c2ab928"
+
+SRC_URI[md5sum] = "81c48852b0bc538ac3ed25fae020360c"
+SRC_URI[sha256sum] = "27a69ffcee3b868abab3ce8b17c69e02b63e722d4d64ffd91d659f81e9984954"
+
+inherit setuptools3 pypi
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

