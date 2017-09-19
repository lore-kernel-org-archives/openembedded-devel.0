Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 043F6780C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:12:12 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f24so2384353qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZRNyfCYN5ja6akXjaCAyD7EMEqDk/8kr3Jrr96qEAC4=;
	b=nCF/2Eh+x7mKSa+a9p4/NJJHiaRQda3WVMqqd3txyww2SBwYAzoev/Thp86/Xpz8Ys
	bmWb1I3duDBBnb9GuDGjXTYxnqLA6+9sLAL/mGZmXPAc/HCKiKiJRkpPtlby7CB6ZFPq
	wXCwCQw2BXFhulam4Ua61fuZf/sE+rPPTM2VmHd+QDL7cbi3cePwI60euVlEySSRC8U3
	blLmJAHj1r3X5B1E0lygtrOrI6viZgUFJ+/kS0HD3Ao9ixsV4W3EEo8TYSlFnP9T8mYs
	wdbpdn6zrmdXM3DiuQ4GbW6sL6sUZvE6mAhK4MBRTOMAxy4tpv9Jt0FZ0prMRLlYBX5i
	ytZg==
X-Gm-Message-State: AHPjjUjq1oIRVXqln16j1Fb+BSp5QubA4iIEHlDwv6a41RX2H+Msny4B
	/7ZVLiML+9jrh9zIOdcDdEODxtz4
X-Google-Smtp-Source: AOwi7QC1OyayIHW8pzS+XatGkOAyqquhh7K9SmkjnnMLNTvR/emhxPGefJFtWg6eJMmitrbZWllQNg==
X-Received: by 10.200.53.58 with SMTP id y55mr2165071qtb.83.1505830333658;
	Tue, 19 Sep 2017 07:12:13 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id 16sm6755088qkd.30.2017.09.19.07.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 07:12:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 10:12:06 -0400
Message-Id: <1505830326-23786-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-grpcio: update to version 1.6.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 14:12:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch         | 4 ++--
 .../python/{python-grpcio_1.4.0.bb => python-grpcio_1.6.0.bb}       | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-grpcio_1.4.0.bb => python-grpcio_1.6.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 3686144..3abbc6d 100644
--- a/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -26,8 +26,8 @@ index cb85273..f79878d 100644
    elif 'win32' in sys.platform:
      EXTRA_ENV_COMPILE_ARGS += ' -D_PYTHON_MSVC'
    elif "linux" in sys.platform:
--    EXTRA_ENV_COMPILE_ARGS += ' -std=c++11 -std=gnu99 -fvisibility=hidden -fno-wrapv'
-+    EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv'
+-    EXTRA_ENV_COMPILE_ARGS += ' -std=c++11 -std=gnu99 -fvisibility=hidden -fno-wrapv -fno-exceptions'
++    EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
    elif "darwin" in sys.platform:
      EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv'
  
diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb b/meta-python/recipes-devtools/python/python-grpcio_1.6.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb
rename to meta-python/recipes-devtools/python/python-grpcio_1.6.0.bb
index 2446411..7155f42 100644
--- a/meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.6.0.bb
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi setuptools
 
-SRC_URI[md5sum] = "d882ae4eeef4f32ac9c1d32052bf05ad"
-SRC_URI[sha256sum] = "a3a213a4c24b5c572b386d752e3b74a3f1b8fa5d03c07b6166fa39f3a6cdef34"
+SRC_URI[md5sum] = "c91b8c105ff4163b41790f3b63db92e1"
+SRC_URI[sha256sum] = "6cd793d515ec53587a8968f2a53647f1449763ad06be0d287e3c1e47418e1e50"
 
-# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
+# For usage in other recipes when compiling protobuf files (e.g. by grpcio-tools)
 BBCLASSEXTEND = "native"
-- 
2.7.4


