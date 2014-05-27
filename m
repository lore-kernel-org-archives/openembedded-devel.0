Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 957166FAB7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 16:48:16 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4RGmGcG002690
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 27 May 2014 09:48:17 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.82)
	(envelope-from <amy.fong@windriver.com>)
	id 1WpKXw-0006yW-33; Tue, 27 May 2014 12:48:16 -0400
Date: Tue, 27 May 2014 12:48:15 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140527164815.GA26774@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-oe] [PATCH] nodejs build failure due to execvp arg list too long
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
X-List-Received-Date: Tue, 27 May 2014 16:48:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 4a6b2c2d30c07006be86efc41350030e4b47e307 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Tue, 27 May 2014 12:45:35 -0400
Subject: [PATCH] nodejs build failure due to execvp arg list too long

In builds with really long paths, we'll see this error message.
Modify the way args are passed to ar to avoid this restriction.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 .../recipes-devtools/nodejs/nodejs/fix_ar.patch    | 86 ++++++++++++++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/fix_ar.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/fix_ar.patch b/meta-oe/recipes-devtools/nodejs/nodejs/fix_ar.patch
new file mode 100644
index 0000000..871ad8d
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/fix_ar.patch
@@ -0,0 +1,86 @@
+nodejs build failure due to execvp arg list too long
+    
+In builds with really long paths, we'll see the error message
+"execvp: printf: Argument list too long" when the system is trying
+to generate ar files.
+
+Modify the way args are passed to ar to avoid this restriction.
+		        
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+---
+ deps/npm/node_modules/node-gyp/gyp/pylib/gyp/generator/make.py |   20 +++++++++-
+ tools/gyp/pylib/gyp/generator/make.py                          |   20 +++++++++-
+ 2 files changed, 36 insertions(+), 4 deletions(-)
+
+--- a/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/generator/make.py
++++ b/deps/npm/node_modules/node-gyp/gyp/pylib/gyp/generator/make.py
+@@ -136,6 +136,23 @@
+ quiet_cmd_link = LINK($(TOOLSET)) $@
+ cmd_link = $(LINK.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
+ 
++define xargs
++$(1) $(wordlist 1,1000,$(2))
++$(if $(word 1001,$(2)),$(call xargs,$(1),$(wordlist 1001,$(words $(2)),$(2))))
++endef
++
++define write-to-file
++@: >$(1)
++$(call xargs,@printf "%s\\n" >>$(1),$(2))
++endef
++
++OBJ_FILE_LIST := ar-file-list
++
++create_archive = \\
++        rm -f $(1) $(OBJ_FILE_LIST); mkdir -p `dirname $(1)` \\
++        $(call write-to-file,$(OBJ_FILE_LIST),$(filter %.o,$(2))) \\
++        $(AR.$(TOOLSET)) $(ARFLAGS.$(TOOLSET)) $(1) @$(OBJ_FILE_LIST)
++
+ # We support two kinds of shared objects (.so):
+ # 1) shared_library, which is just bundling together many dependent libraries
+ # into a link line.
+@@ -1546,8 +1563,7 @@
+         self.WriteDoCmd([self.output_binary], link_deps, 'alink_thin',
+                         part_of_all, postbuilds=postbuilds)
+       else:
+-        self.WriteDoCmd([self.output_binary], link_deps, 'alink', part_of_all,
+-                        postbuilds=postbuilds)
++        self.WriteMakeRule([self.output_binary], link_deps, actions = ['$(call create_archive,$@,$^)'])
+     elif self.type == 'shared_library':
+       self.WriteLn('%s: LD_INPUTS := %s' % (
+             QuoteSpaces(self.output_binary),
+--- a/tools/gyp/pylib/gyp/generator/make.py
++++ b/tools/gyp/pylib/gyp/generator/make.py
+@@ -133,6 +133,23 @@
+ quiet_cmd_link = LINK($(TOOLSET)) $@
+ cmd_link = $(LINK.$(TOOLSET)) $(GYP_LDFLAGS) $(LDFLAGS.$(TOOLSET)) -o $@ -Wl,--start-group $(LD_INPUTS) -Wl,--end-group $(LIBS)
+ 
++define xargs
++$(1) $(wordlist 1,1000,$(2))
++$(if $(word 1001,$(2)),$(call xargs,$(1),$(wordlist 1001,$(words $(2)),$(2))))
++endef
++
++define write-to-file
++@: >$(1)
++$(call xargs,@printf "%s\\n" >>$(1),$(2))
++endef
++
++OBJ_FILE_LIST := ar-file-list
++
++create_archive = \\
++        rm -f $(1) $(OBJ_FILE_LIST); mkdir -p `dirname $(1)` \\
++        $(call write-to-file,$(OBJ_FILE_LIST),$(filter %.o,$(2))) \\
++        $(AR.$(TOOLSET)) $(ARFLAGS.$(TOOLSET)) $(1) @$(OBJ_FILE_LIST)
++
+ # We support two kinds of shared objects (.so):
+ # 1) shared_library, which is just bundling together many dependent libraries
+ # into a link line.
+@@ -1517,8 +1534,7 @@
+       for link_dep in link_deps:
+         assert ' ' not in link_dep, (
+             "Spaces in alink input filenames not supported (%s)"  % link_dep)
+-      self.WriteDoCmd([self.output_binary], link_deps, 'alink', part_of_all,
+-                      postbuilds=postbuilds)
++      self.WriteMakeRule([self.output_binary], link_deps, actions = ['$(call create_archive,$@,$^)'])
+     elif self.type == 'shared_library':
+       self.WriteLn('%s: LD_INPUTS := %s' % (
+             QuoteSpaces(self.output_binary),
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
index 996d68e..bf6fb8b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -7,6 +7,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
            file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
+           file://fix_ar.patch \
 "
 SRC_URI[md5sum] = "25ed6aa5710ac46b867ff3f17a4da1d6"
 SRC_URI[sha256sum] = "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda3b71306fe9ae00f9"
-- 
2.0.0.rc0


