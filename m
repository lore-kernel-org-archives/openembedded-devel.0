Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F16D609B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 02:26:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7C2QGLV015111
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 19:26:16 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 11 Aug 2014 19:26:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Aug 2014 22:26:14 -0400
Message-ID: <1407810374-20646-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-ruby][PATCH] ruby: fix race conditions at install-ext
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
X-List-Received-Date: Tue, 12 Aug 2014 02:26:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* lib/mkmf.rb (create_makefile): fix race conditions at install-ext.
  target files need to depend on destination directory timestamp
  files, not phony trgets.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...kmf.rb-fix-race-conditions-at-install-ext.patch | 31 ++++++++++++++++++++++
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch

diff --git a/meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch b/meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
new file mode 100644
index 0000000..5ac5d54
--- /dev/null
+++ b/meta-ruby/recipes-devtools/ruby/ruby/ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch
@@ -0,0 +1,31 @@
+Subject: [PATCH] mkmf.rb: fix race conditions at install-ext
+
+Upstream-Status: backport
+
+* lib/mkmf.rb (create_makefile): fix race conditions at install-ext.
+  target files need to depend on destination directory timestamp
+  files, not phony trgets.
+
+git-svn-id: svn+ssh://ci.ruby-lang.org/ruby/trunk@36863 b2dd03c8-39d4-4d8f-98ff-823fe69b080e
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ lib/mkmf.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/mkmf.rb b/lib/mkmf.rb
+index 556684c..a277354 100644
+--- a/lib/mkmf.rb
++++ b/lib/mkmf.rb
+@@ -2055,7 +2055,7 @@ static: $(STATIC_LIB)#{$extout ? " install-rb" : ""}
+       for f in files
+         dest = "#{dir}/#{File.basename(f)}"
+         mfile.print("install-rb#{sfx}: #{dest}\n")
+-        mfile.print("#{dest}: #{f}\n")
++        mfile.print("#{dest}: #{f} #{timestamp_file(dir)}\n")
+         mfile.print("\t$(Q) $(#{$extout ? 'COPY' : 'INSTALL_DATA'}) #{f} $(@D#{sep})\n")
+         if defined?($installed_list) and !$extout
+           mfile.print("\t@echo #{dest}>>$(INSTALLED_LIST)\n")
+--
+2.0.0
+
diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
index 24bacdc..2d5938f 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
@@ -11,6 +11,7 @@ SRC_URI += "\
     file://ruby-1.9.3-mkmf-verbose.patch \
     file://ruby-1.9.3-install-cross.patch \
     file://remove-the-dependency-on-dir.patch \
+    file://ruby-mkmf.rb-fix-race-conditions-at-install-ext.patch \
 "
 SRC_URI[md5sum] = "7531f9b1b35b16f3eb3d7bea786babfd"
 SRC_URI[sha256sum] = "9ba118e4aba04c430bc4d5efb09b31a0277e101c9fd2ef3b80b9c684d7ae57a1"
-- 
2.0.0


