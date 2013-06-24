Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6BAE46ABBB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 07:44:12 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro2so10584373pbb.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 00:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=eJaHnoaXfUNnTzaiegasQdEPE5ISOTdi/18vDzAlBeo=;
	b=j3CoRRSEO3m9XBf16KjEwVHFElUp02meEOyDX7AP4awgQywvveJ34Frzdp+OlQubIQ
	GwHmNKAgVMIj8VV0Dmmpb3O2W6YyJQNm70nx4tCLZQ4Fv5qD+bn+crwgirl0AwipFN2x
	bc3+dqHKK6q93T1VGoCnu4bnW9Oj4IpNToWHMXcRnmQOP0aTFCKCU9mDCvv05jPLaQOX
	u15VMT276EhnLkv035AswgZLkVv3ET/dledZDqnmUWS86YhyYLRi7tY9s19Ox+A8L1wM
	yWujtK6hi1rCoByc8IGvMJZkpKSACe4YtqKP/CMKPG+KeFlOLdv2uHrgIb5xOhArOTJJ
	ZTHA==
X-Received: by 10.66.82.69 with SMTP id g5mr25910170pay.179.1372059853254;
	Mon, 24 Jun 2013 00:44:13 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	xl3sm16957589pbb.17.2013.06.24.00.44.12 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Jun 2013 00:44:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jun 2013 00:44:04 -0700
Message-Id: <1372059844-12315-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-ruby][PATCH] ruby: Upgrade from 1.9.3-p194 -> 1.9.3-p429
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jun 2013 07:44:12 -0000

Old recipe was having od_install failures
this fixes those too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby.inc           |    2 +-
 .../ruby/ruby/ruby-1.9.3-bignum-test-fix.patch     |   31 --------------------
 .../ruby/ruby/ruby-1.9.3-webrick-test-fix.patch    |   24 ---------------
 .../{ruby_1.9.3-p194.bb => ruby_1.9.3-p429.bb}     |    7 ++---
 4 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch
 rename meta-ruby/recipes-devtools/ruby/{ruby_1.9.3-p194.bb => ruby_1.9.3-p429.bb} (83%)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
index becf64c..18fcb9c 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby.inc
+++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
     file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \
     file://BSDL;md5=3949e007205deef714bd225e1ee4a8ea \
     file://GPL;md5=393a5ca445f6965873eca0259a17f833 \
-    file://LEGAL;md5=e88686821918c0b6d2b1b8328116cec5 \
+    file://LEGAL;md5=3ce1fae39fe573b818c0af162bce6579 \
 "
 
 DEPENDS = "ruby-native zlib openssl tcl"
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch
deleted file mode 100644
index cb3682d..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-bignum-test-fix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
---- ruby-1.9.3-p0/test/ruby/test_bignum.rb.orig	2011-11-10 09:52:59.101925465 +0100
-+++ ruby-1.9.3-p0/test/ruby/test_bignum.rb	2011-11-10 09:54:14.580798826 +0100
-@@ -378,7 +378,7 @@
-     assert_equal(true, (2**32).even?)
-   end
- 
--  def interrupt
-+  def assert_interrupt
-     time = Time.now
-     start_flag = false
-     end_flag = false
-@@ -387,14 +387,16 @@
-       yield
-       end_flag = true
-     end
--    sleep 1
-+    Thread.pass until start_flag
-     thread.raise
-     thread.join rescue nil
--    start_flag && !end_flag && Time.now - time < 10
-+    time = Time.now - time
-+    assert_equal([true, false], [start_flag, end_flag])
-+    assert_operator(time, :<, 10)
-   end
- 
-   def test_interrupt
--    assert(interrupt { (65536 ** 65536).to_s })
-+    assert_interrupt {(65536 ** 65536).to_s}
-   end
- 
-   def test_too_big_to_s
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch
deleted file mode 100644
index c6eb3fa..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-webrick-test-fix.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-diff --git a/test/webrick/test_cgi.rb b/test/webrick/test_cgi.rb
-index 1185316..0ef1b37 100644
---- a/test/webrick/test_cgi.rb
-+++ b/test/webrick/test_cgi.rb
-@@ -14,6 +14,7 @@ class TestWEBrickCGI < Test::Unit::TestCase
-         def req.meta_vars
-           meta = super
-           meta["RUBYLIB"] = $:.join(File::PATH_SEPARATOR)
-+          meta[RbConfig::CONFIG['LIBPATHENV']] = ENV[RbConfig::CONFIG['LIBPATHENV']]
-           return meta
-         end
-       },
-diff --git a/test/webrick/test_filehandler.rb b/test/webrick/test_filehandler.rb
-index bcdb3df..f78ba5c 100644
---- a/test/webrick/test_filehandler.rb
-+++ b/test/webrick/test_filehandler.rb
-@@ -252,6 +252,7 @@ class WEBrick::TestFileHandler < Test::Unit::TestCase
-         def req.meta_vars
-           meta = super
-           meta["RUBYLIB"] = $:.join(File::PATH_SEPARATOR)
-+          meta[RbConfig::CONFIG['LIBPATHENV']] = ENV[RbConfig::CONFIG['LIBPATHENV']]
-           return meta
-         end
-       },
diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
similarity index 83%
rename from meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
rename to meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
index 6611ce1..7c5be36 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
@@ -9,16 +9,13 @@ SRC_URI += "\
     file://ruby-1.9.3-disable-versioned-paths.patch \
     file://ruby-1.9.3-fix-s390x-build.patch \
     file://ruby-1.9.3-rubygems-1.8.11-uninstaller.patch \
-    file://ruby-1.9.3-webrick-test-fix.patch \
-    file://ruby-1.9.3-bignum-test-fix.patch \
     file://ruby-1.9.3-custom-rubygems-location.patch \
     file://rubygems-1.8.11-binary-extensions.patch \
     file://ruby-1.9.3-mkmf-verbose.patch \
     file://ruby-1.9.3-install-cross.patch \
 "
-
-SRC_URI[md5sum] = "bc0c715c69da4d1d8bd57069c19f6c0e"
-SRC_URI[sha256sum] = "46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb"
+SRC_URI[md5sum] = "993c72f7f805a9eb453f90b0b7fe0d2b"
+SRC_URI[sha256sum] = "d192d1afc46a7ef27b9d0a3c7a67b509048984db2c38907aa82641bdf980acf4"
 
 EXTRA_OECONF = "\
     --enable-wide-getaddrinfo \
-- 
1.7.9.5


