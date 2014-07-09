Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD68B7041E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jul 2014 08:47:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s698lC4V012330
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Jul 2014 01:47:12 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 9 Jul 2014 01:47:11 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Jul 2014 16:47:17 +0800
Message-ID: <1404895637-20690-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-ruby] ruby: uprev it to 1.9.3-p547
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
X-List-Received-Date: Wed, 09 Jul 2014 08:47:19 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

remove ruby-1.9.3-fix-s390x-build.patch, it has been merged into p547

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../ruby/ruby/ruby-1.9.3-fix-s390x-build.patch             |   12 ------------
 .../ruby/{ruby_1.9.3-p429.bb => ruby_1.9.3-p547.bb}        |    5 ++---
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch
 rename meta-ruby/recipes-devtools/ruby/{ruby_1.9.3-p429.bb => ruby_1.9.3-p547.bb} (86%)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch
deleted file mode 100644
index d0ade91..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/ruby-1.9.3-fix-s390x-build.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -up ruby-1.9.3-p0/ext/tk/extconf.rb.orig ruby-1.9.3-p0/ext/tk/extconf.rb
---- ruby-1.9.3-p0/ext/tk/extconf.rb.orig	2011-06-29 16:11:19.000000000 +0200
-+++ ruby-1.9.3-p0/ext/tk/extconf.rb	2011-10-18 16:15:59.406299659 +0200
-@@ -114,7 +114,7 @@ def is_macosx?
- end
- 
- def maybe_64bit?
--  /64|universal/ =~ RUBY_PLATFORM
-+  /64|universal|s390x/ =~ RUBY_PLATFORM
- end
- 
- def check_tcltk_version(version)
diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
similarity index 86%
rename from meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
rename to meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
index ddba0da..2404a5f 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
@@ -5,15 +5,14 @@ SRC_URI += "\
     file://0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch \
     file://ruby-1.9.3-always-use-i386.patch \
     file://ruby-1.9.3-disable-versioned-paths.patch \
-    file://ruby-1.9.3-fix-s390x-build.patch \
     file://ruby-1.9.3-rubygems-1.8.11-uninstaller.patch \
     file://ruby-1.9.3-custom-rubygems-location.patch \
     file://rubygems-1.8.11-binary-extensions.patch \
     file://ruby-1.9.3-mkmf-verbose.patch \
     file://ruby-1.9.3-install-cross.patch \
 "
-SRC_URI[md5sum] = "993c72f7f805a9eb453f90b0b7fe0d2b"
-SRC_URI[sha256sum] = "d192d1afc46a7ef27b9d0a3c7a67b509048984db2c38907aa82641bdf980acf4"
+SRC_URI[md5sum] = "7531f9b1b35b16f3eb3d7bea786babfd"
+SRC_URI[sha256sum] = "9ba118e4aba04c430bc4d5efb09b31a0277e101c9fd2ef3b80b9c684d7ae57a1"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
-- 
1.7.10.4


