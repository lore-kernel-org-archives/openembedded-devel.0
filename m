Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.9072.1594826714563016807
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 08:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jvjHU-0006eC-Nk; Wed, 15 Jul 2020 18:25:13 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-bitarray: Upgrade 1.2.2 -> 1.4.1
Date: Wed, 15 Jul 2020 18:24:50 +0300
Message-Id: <20200715152450.29018-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715152450.29018-1-leon.anavi@konsulko.com>
References: <20200715152450.29018-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.1:

* add `.clear()` method (Python 3.3 added this method to lists)
* avoid overallocation when bitarray objects are initially created
* raise BufferError when resizing bitarrays which is exporting
  buffers
* add example to study the resize() function
* improve some error messages
* add more tests
* raise `NotImplementedError` with (useful message) when trying to
  call the `.fromstring()` or `.tostring()` methods, which have
  been removed in the last release
* add official Python 3.9 support
* improve many docstrings
* add DeprecationWarning for bitdiff()
* add more tests
* C-level:
  - simplify pack/unpack code
  - fix memory leak in '~' operation (bitarray_cpinvert)

Use the exact line for the license in PKG-INFO.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-bitarray_1.2.2.bb | 11 -----------
 .../recipes-devtools/python/python3-bitarray_1.4.1.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
deleted file mode 100644
index c495738c4..000000000
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.2.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
-HOMEPAGE = "https://github.com/ilanschnell/bitarray"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=d331e1d54f5e78247388f5416c2ab928"
-
-SRC_URI[md5sum] = "81c48852b0bc538ac3ed25fae020360c"
-SRC_URI[sha256sum] = "27a69ffcee3b868abab3ce8b17c69e02b63e722d4d64ffd91d659f81e9984954"
-
-inherit setuptools3 pypi
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
new file mode 100644
index 000000000..4866e8464
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.4.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
+HOMEPAGE = "https://github.com/ilanschnell/bitarray"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
+
+SRC_URI[md5sum] = "dfb3fe66ae989e4724747fcb0f704f56"
+SRC_URI[sha256sum] = "9e26d3dc7fad932fed66e08da3fcf93dd15e8402aa84e764e1e2a9e1b6ae2b7f"
+
+inherit setuptools3 pypi
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

