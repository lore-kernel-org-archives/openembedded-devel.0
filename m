Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFE77F7D7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:25:51 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id g6so10849770plp.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EWPfz74sm8O4P1Fuk/TMvTOv5CRDhHfsqwK8YKGqBZQ=;
	b=aUDVlZL5EvUnFOeGWZul0h1ByVapcf11HPPwOzOFwBV0ENCpSqWsqmQMbqWjByw5M9
	lv1j5DhgBKAQyHwQKGCzP1am3BN3bj6aBwT8Av+ju4a1Lj603qpFAw5I6FaaNieWNkD5
	AvHwTkVz/TmMFutw4evqSA68rrZP2RKkmjAE+SF+rfJ1jBnUxNMmmAuQ+kKxGt86RM4L
	ORxIkhv8jmPYWdx3FLRqeiRzid/SHfLvjG65jQxH/icFUMW0YzwMGXymudGOjg1Mhy7z
	hIb9lOqTPoaOEZ1toMGGlD6PAzmHRfFfl/bto7HH8SjeVqnAodxPBa+VeTWfEwT3gzzr
	vfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EWPfz74sm8O4P1Fuk/TMvTOv5CRDhHfsqwK8YKGqBZQ=;
	b=NnCqZ9hn3+F1B57WusQiAt/cXWEUPfpbJEFoc4cVBpPyPESJHnaqbpuaLfwVok/vW+
	k1XDK/QqmSoEe3tWxqHQI/9lwAdxu7WHt8bpZErDcXh0m2ABBBiHX05mpHPQS6AGz+RE
	NWE0o49uDtOObQU4JuIbnbOz9X5kO4lBya2RyNkrrSZrLR1dMkrdNq5IOU5NmTQSjERT
	17SiXjMcBni1WX46lQhB0Su+2Mx7Waixa88Hh4Z6f9A+yI55vjfx93YNyNxzh0J8zcK3
	hx0sw3hsMdzLNuK6bshJ3yqlYLtrq0pD/exor7S3tUF6ssbDU9yX2EO7sAVZCu3fFzfr
	+wkg==
X-Gm-Message-State: APjAAAVxQVt3ElXUPRGLyJk/iY/iS8SuTQryObvvQ17OMeyyq5d3mdEf
	RrxKC6OVZOchFrGMFY7vAHihrLEb4Gs=
X-Google-Smtp-Source: APXvYqw0TmfEdDErsfIvb2vljmavxnpcjn8fRw/+HNBCXr8g1vulhTLIt9oQ3H/yHJby23eEL9+R6Q==
X-Received: by 2002:a17:90a:aa81:: with SMTP id
	l1mr41379297pjq.62.1577643951720; 
	Sun, 29 Dec 2019 10:25:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	gc1sm21395010pjb.20.2019.12.29.10.25.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:25:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:25:42 -0800
Message-Id: <20191229182544.16104-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229182544.16104-1-raj.khem@gmail.com>
References: <20191229182544.16104-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] mariadb: Upgrade to 10.4.11
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
X-List-Received-Date: Sun, 29 Dec 2019 18:25:51 -0000
Content-Transfer-Encoding: 8bit

Backport a rocksdb patch to fix clang error
Refresh existing patches as needed
Switch SRC_URI to downloads.mariadb.org since archive.mariadb.org is too
slow if no mirrors are used

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e_10.3.18.bb => mariadb-native_10.4.11.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  7 ++--
 ...-breakage-from-lock_guard-error-6161.patch | 32 +++++++++++++++++++
 .../mysql/mariadb/fix-arm-atomic.patch        |  9 ++----
 ...{mariadb_10.3.18.bb => mariadb_10.4.11.bb} |  0
 5 files changed, 38 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.18.bb => mariadb-native_10.4.11.bb} (100%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.18.bb => mariadb_10.4.11.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.18.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.11.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.3.18.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.4.11.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index ec5ac11ef0..1c1b8a0a87 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311"
 
-SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
+SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
            file://my.cnf \
            file://mysqld.service \
            file://install_db.service \
@@ -18,9 +18,10 @@ SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://c11_atomics.patch \
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
+           file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \
           "
-SRC_URI[md5sum] = "b3524c0825c3a1c255496daea38304a0"
-SRC_URI[sha256sum] = "69456ca85bf9d96c6d28b4ade2a9f6787d79a602e27ef941f9ba4e0b55dddedc"
+SRC_URI[md5sum] = "d0de881ab8ead46928cafb7d558535c1"
+SRC_URI[sha256sum] = "4c076232b99433b09eb3c6d62f607192b3474d022703699b8f6aef4e79de3fb9"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
new file mode 100644
index 0000000000..87c70617a1
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
@@ -0,0 +1,32 @@
+Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
+
+Summary:
+This change fixes a source issue that caused compile time error which
+breaks build for many fbcode services in that setup. The size() member
+function of channel is a const member, so member variables accessed
+within it are implicitly const as well. This caused error when clang
+fails to resolve to a constructor that takes std::mutex because the
+suitable constructor got rejected due to loss of constness for its
+argument. The fix is to add mutable modifier to the lock_ member of
+channel.
+
+Pull Request resolved: https://github.com/facebook/rocksdb/pull/6161
+
+Differential Revision: D18967685
+
+Pulled By: maysamyabandeh
+
+Upstream-Status: Backport
+
+fbshipit-source-id:698b6a5153c3c92eeacb842c467aa28cc350d432 
+--- a/storage/rocksdb/rocksdb/util/channel.h
++++ b/storage/rocksdb/rocksdb/util/channel.h
+@@ -60,7 +60,7 @@ class channel {
+ 
+  private:
+   std::condition_variable cv_;
+-  std::mutex lock_;
++  mutable std::mutex lock_;
+   std::queue<T> buffer_;
+   bool eof_;
+ };
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
index 34d31148b4..185b7b77ff 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/fix-arm-atomic.patch
@@ -15,11 +15,9 @@ Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
  storage/rocksdb/build_rocksdb.cmake | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build_rocksdb.cmake
-index c36c761..2b539ff 100644
 --- a/storage/rocksdb/build_rocksdb.cmake
 +++ b/storage/rocksdb/build_rocksdb.cmake
-@@ -424,6 +424,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINARY_DIR}/build_version.cc)
+@@ -470,6 +470,9 @@ list(APPEND SOURCES ${CMAKE_CURRENT_BINA
  
  ADD_CONVENIENCE_LIBRARY(rocksdblib ${SOURCES})
  target_link_libraries(rocksdblib ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
@@ -27,8 +25,5 @@ index c36c761..2b539ff 100644
 +  TARGET_LINK_LIBRARIES(rocksdblib atomic)
 +ENDIF()
  IF(CMAKE_CXX_COMPILER_ID MATCHES "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
-   set_target_properties(rocksdblib PROPERTIES COMPILE_FLAGS "-fPIC -fno-builtin-memcmp -frtti")
+   set_target_properties(rocksdblib PROPERTIES COMPILE_FLAGS "-fPIC -fno-builtin-memcmp")
  endif()
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.4.11.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.4.11.bb
-- 
2.24.1


