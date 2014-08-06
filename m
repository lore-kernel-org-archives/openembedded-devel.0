Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC6EF65CC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 06:44:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s766iJQx001676
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Aug 2014 23:44:19 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 5 Aug 2014 23:44:18 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Aug 2014 14:44:27 +0800
Message-ID: <1407307467-7559-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-ruby] ruby: fix a parallel building issue
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
X-List-Received-Date: Wed, 06 Aug 2014 06:44:25 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../ruby/ruby/remove-the-dependency-on-dir.patch   |   37 ++++++++++++++++++++
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb |    1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch

diff --git a/meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch b/meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
new file mode 100644
index 0000000..a4ac3ea
--- /dev/null
+++ b/meta-ruby/recipes-devtools/ruby/ruby/remove-the-dependency-on-dir.patch
@@ -0,0 +1,37 @@
+remove a duplicate dependency
+
+Upstream-status: Pending
+
+The install-rb-default dependency is as below:
+
+pre-install-rb-default:
+	mkdir -p $(RUBYLIBDIR)/bigdecimal
+
+install-rb-default: pre-install-rb-default $(RUBYLIBDIR)/bigdecimal
+
+In fact, dependency on $(RUBYLIBDIR)/bigdecimal is duplicate, and not rule
+for $(RUBYLIBDIR)/bigdecimal, once $(RUBYLIBDIR)/bigdecimal is checked before
+pre-install-rb-default, the below error will happen
+	*** No rule to make target `../../.ext/common/yaml', needed by `install-rb-default'.  Stop
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ lib/mkmf.rb |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/mkmf.rb b/lib/mkmf.rb
+index 1f5ed76..556684c 100644
+--- a/lib/mkmf.rb
++++ b/lib/mkmf.rb
+@@ -2054,7 +2054,7 @@ static: $(STATIC_LIB)#{$extout ? " install-rb" : ""}
+       end
+       for f in files
+         dest = "#{dir}/#{File.basename(f)}"
+-        mfile.print("install-rb#{sfx}: #{dest} #{dir}\n")
++        mfile.print("install-rb#{sfx}: #{dest}\n")
+         mfile.print("#{dest}: #{f}\n")
+         mfile.print("\t$(Q) $(#{$extout ? 'COPY' : 'INSTALL_DATA'}) #{f} $(@D#{sep})\n")
+         if defined?($installed_list) and !$extout
+-- 
+1.7.10.4
+
diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
index 2404a5f..24bacdc 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p547.bb
@@ -10,6 +10,7 @@ SRC_URI += "\
     file://rubygems-1.8.11-binary-extensions.patch \
     file://ruby-1.9.3-mkmf-verbose.patch \
     file://ruby-1.9.3-install-cross.patch \
+    file://remove-the-dependency-on-dir.patch \
 "
 SRC_URI[md5sum] = "7531f9b1b35b16f3eb3d7bea786babfd"
 SRC_URI[sha256sum] = "9ba118e4aba04c430bc4d5efb09b31a0277e101c9fd2ef3b80b9c684d7ae57a1"
-- 
1.7.10.4


