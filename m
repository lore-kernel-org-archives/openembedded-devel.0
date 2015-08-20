Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1955665CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 20:29:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7KKSxWg004844
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Aug 2015 13:28:59 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 20 Aug 2015 13:28:59 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <akuster808@gmail.com>, <Martin.Jansa@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Aug 2015 16:28:57 -0400
Message-ID: <1440102538-1561-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [[meta-ruby][PATCH 1/2] ruby.bbclass: handle new installation directories
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
X-List-Received-Date: Thu, 20 Aug 2015 20:29:02 -0000
Content-Type: text/plain

It appears that newer versions of ruby produce additional directories
which were not previously handled by the ruby bbclass, specifically
'build_info' and 'extensions'. This is currently resulting in QA
errors/warnings such as:

ERROR: QA Issue: puppet: Files/directories were installed but not shipped in any package:
  /usr/lib64/ruby/gems/2.2.0/build_info
  /usr/lib64/ruby/gems/2.2.0/extensions
Please set FILES such that these items are packaged. Alternatively if they are unneeded,
avoid installing them or delete them within do_install. [installed-vs-shipped]

Add these to our FILES in the bbclass such that they will packaged.

NOTE: several files may exist in the extensions directory such as
gem.build_complete and mkmf.log that we can most likely remove during
do_install. Since ruby installs these by default they have been left
in case their existence is used as some type of stampfile or similar.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-ruby/classes/ruby.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ruby/classes/ruby.bbclass b/meta-ruby/classes/ruby.bbclass
index 9c4fcf9..ef844f2 100644
--- a/meta-ruby/classes/ruby.bbclass
+++ b/meta-ruby/classes/ruby.bbclass
@@ -111,6 +111,10 @@ FILES_${PN}-dbg += " \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
         "
 
 FILES_${PN} += " \
@@ -118,6 +122,8 @@ FILES_${PN} += " \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/cache \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/specifications \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/build_info \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions \
         "
 
 FILES_${PN}-doc += " \
-- 
2.1.4


