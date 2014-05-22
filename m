Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C33465EE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2014 20:45:15 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4MKjF64002186
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 22 May 2014 13:45:16 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.82)
	(envelope-from <amy.fong@windriver.com>)
	id 1WnZrX-0007e2-67; Thu, 22 May 2014 16:45:15 -0400
Date: Thu, 22 May 2014 16:45:14 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140522204514.GA29369@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-ruby] [PATCH] ruby overwrites configuration files in ruby-native
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
X-List-Received-Date: Thu, 22 May 2014 20:45:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 11b1e17a6dfdd84b3969c17b1b85b3b9bb934d11 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Thu, 22 May 2014 16:43:40 -0400
Subject: [PATCH] ruby overwrites configuration files in ruby-native

ruby's install rule is calling install-cross, this overwrites files installed
by ruby-native causing build failures with ruby apps, specifically where gems
are involved, especially on hosts where there is no host ruby:

(from sysroot-native's gem)
gem env
 RubyGems Environment:
   - RUBYGEMS VERSION: 1.8.23
   - RUBY VERSION: 1.9.3 (2012-04-20 patchlevel 194) [x86_64-linux]
   - INSTALLATION DIRECTORY: /usr/lib64/ruby/gems/1.9.1
   - RUBY EXECUTABLE: /usr/bin/ruby
   - EXECUTABLE DIRECTORY: /usr/bin
   - RUBYGEMS PLATFORMS:
     - ruby
     - x86_64-linux
   - GEM PATHS:
      - /usr/lib64/ruby/gems/1.9.1
      - /folk/afong/.gem/ruby/1.9.1
   - GEM CONFIGURATION:
      - :update_sources => true
      - :verbose => true
      - :benchmark => false
      - :backtrace => false
      - :bulk_threshold => 1000
   - REMOTE SOURCES:
      - http://rubygems.org/

Files affected - fake.rb, rbconfig.rb, config.h, win32.h and ruby libraries.
We should be using the versions from ruby-native.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
index 883bb98..bb4bab8 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
@@ -28,11 +28,7 @@ EXTRA_OEMAKE = " \
 "
 
 do_install() {
-    if [ ${PN} = "ruby" ]; then
-        oe_runmake 'DESTDIR=${D}' install install-cross
-    else
-        oe_runmake 'DESTDIR=${D}' install
-    fi
+    oe_runmake 'DESTDIR=${D}' install
 }
 
 FILES_${PN} += "${datadir}/rubygems \
-- 
2.0.0.rc0


