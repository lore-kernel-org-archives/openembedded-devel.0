Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCD877E22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 07:23:11 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id 30so18200582wrk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OkPaUnlzKdEgcIKkSHv+7CkJqqf4Rn/xmrChhqLuzvE=;
	b=vAOjzm7AwTHjCvR16IDaupQCdZcAldgawsicl5FeelXvqYS4CCn74Q0z0ZCT0sWc/c
	GBDZDW7de1oX7VZWi+M/PK/mzdHS+PdIcmuh/3q9NSMnQA2QXAnXJ+54ttqCpeGs7nic
	tlhcwyhMAhJLXklrBu/EJTC9tZ85K+f++Z3sjJRszeI3wLmGD7gn18lbF6L8PA2dXdZv
	D2Ju0THo9gURAvq8zTJElWv1IBBMSpjiWkKqVQAX8W/lSGvpS1JPB4qhmU3kNC3+qY67
	WvbUBrWnfC9o2hJXMzLgz3zxyiGpIbdp0odohEimxnpdHVdD0RK61w93R/HEe3mdCM9Q
	F0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OkPaUnlzKdEgcIKkSHv+7CkJqqf4Rn/xmrChhqLuzvE=;
	b=Enz/PxnEXoTWxBahgIY1Ws+TL9cknccXKfC790+v0WKFpb8qIBQIJZRTFqYVL4hcyd
	O8Gqx92Ngyo9wm8Jyod2O+GdcOnj9cuacBdQBNBPx2aWkbNBJiAwxDARTEfuBNFLqwbq
	Yi+I0xXxcfOo4zchQhtNp21iS2wQ/WddOMQ5uTXxf/X8vgWXqUh8+jBHHNkgqOA0WKy8
	QcCR0IidmwtLK/5rJcXNfCLGLCcnsfFceMPCWxfVMD15YR7w0+mmRObwAGUgAoNgUiR3
	YazFQWA1UT/V2XbKLSG4vhkDrjNth9dvtC0N0PMWFUcel7kGCpS9iat8PqPzbKwCGNzt
	Xmng==
X-Gm-Message-State: AHYfb5gmZjHl9D8R8Dg7xHjVbhNF59WRr2ffCMxdEkG9g4yc1JAQ22E2
	WGfD3EAZ0/f20mfl
X-Received: by 10.223.170.2 with SMTP id p2mr11411537wrd.22.1503300191780;
	Mon, 21 Aug 2017 00:23:11 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w73sm5851979wmw.20.2017.08.21.00.23.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 00:23:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Aug 2017 09:24:49 +0200
Message-Id: <20170821072449.14633-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [meta-ruby][PATCH] meta-ruby: remove this now pretty empty layer
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
X-List-Received-Date: Mon, 21 Aug 2017 07:23:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/COPYING.MIT          |  17 ------
 meta-ruby/README               |  16 -----
 meta-ruby/classes/ruby.bbclass | 131 -----------------------------------------
 meta-ruby/conf/layer.conf      |  15 -----
 4 files changed, 179 deletions(-)
 delete mode 100644 meta-ruby/COPYING.MIT
 delete mode 100644 meta-ruby/README
 delete mode 100644 meta-ruby/classes/ruby.bbclass
 delete mode 100644 meta-ruby/conf/layer.conf

diff --git a/meta-ruby/COPYING.MIT b/meta-ruby/COPYING.MIT
deleted file mode 100644
index fb950dc69..000000000
--- a/meta-ruby/COPYING.MIT
+++ /dev/null
@@ -1,17 +0,0 @@
-Permission is hereby granted, free of charge, to any person obtaining a copy 
-of this software and associated documentation files (the "Software"), to deal 
-in the Software without restriction, including without limitation the rights 
-to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
-copies of the Software, and to permit persons to whom the Software is 
-furnished to do so, subject to the following conditions:
-
-The above copyright notice and this permission notice shall be included in 
-all copies or substantial portions of the Software.
-
-THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
-IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
-FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
-AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
-LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
-OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
-THE SOFTWARE.
diff --git a/meta-ruby/README b/meta-ruby/README
deleted file mode 100644
index 08e0aa7eb..000000000
--- a/meta-ruby/README
+++ /dev/null
@@ -1,16 +0,0 @@
-This layer depends on:
-
-URI: git://github.com/openembedded/oe-core.git
-branch: master
-revision: HEAD
-
-URI: git://github.com/openembedded/meta-oe.git
-branch: master
-revision: HEAD
-
-Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby]' in the subject'
-
-When sending single patches, please using something like:
-'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][PATCH'
-
-Layer maintainer: Armin Kuster <akuster808@gmail.com>
diff --git a/meta-ruby/classes/ruby.bbclass b/meta-ruby/classes/ruby.bbclass
deleted file mode 100644
index 1acf2e0bd..000000000
--- a/meta-ruby/classes/ruby.bbclass
+++ /dev/null
@@ -1,131 +0,0 @@
-BPV ?= "${PV}"
-
-DEPENDS += " \
-    ruby-native \
-"
-RDEPENDS_${PN} += " \
-    ruby \
-"
-
-def get_rubyversion(p):
-    import re
-    from os.path import isfile
-    import subprocess
-    found_version = "SOMETHING FAILED!"
-
-    cmd = "%s/ruby" % p
-
-    if not isfile(cmd):
-       return found_version
-
-    version = subprocess.Popen([cmd, "--version"], stdout=subprocess.PIPE).communicate()[0].decode("utf-8")
-    
-    r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
-    m = r.match(version)
-    if m:
-        found_version = m.group(1)
-
-    return found_version
-
-def get_rubygemslocation(p):
-    import re
-    from os.path import isfile
-    import subprocess
-    found_loc = "SOMETHING FAILED!"
-
-    cmd = "%s/gem" % p
-
-    if not isfile(cmd):
-       return found_loc
-
-    loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0].decode("utf-8")
-
-    r = re.compile(".*\- (/usr.*/ruby/gems/.*)")
-    for line in loc.split('\n'):
-        m = r.match(line)
-        if m:
-            found_loc = m.group(1)
-            break
-
-    return found_loc
-
-def get_rubygemsversion(p):
-    import re
-    from os.path import isfile
-    import subprocess
-    found_version = "SOMETHING FAILED!"
-
-    cmd = "%s/gem" % p
-
-    if not isfile(cmd):
-       return found_version
-
-    version = subprocess.Popen([cmd, "env", "gemdir"], stdout=subprocess.PIPE).communicate()[0].decode("utf-8")
-    
-    r = re.compile(".*([0-9]+\.[0-9]+\.[0-9]+)$")
-    m = r.match(version)
-    if m:
-        found_version = m.group(1)
-
-    return found_version
-
-RUBY_VERSION ?= "${@get_rubyversion("${STAGING_BINDIR_NATIVE}")}"
-RUBY_GEM_DIRECTORY ?= "${@get_rubygemslocation("${STAGING_BINDIR_NATIVE}")}"
-RUBY_GEM_VERSION ?= "${@get_rubygemsversion("${STAGING_BINDIR_NATIVE}")}"
-
-export GEM_HOME = "${STAGING_DIR_NATIVE}/usr/lib/ruby/gems/${RUBY_GEM_VERSION}"
-
-RUBY_BUILD_GEMS ?= "${BPN}.gemspec"
-RUBY_INSTALL_GEMS ?= "${BPN}-${BPV}.gem"
-
-RUBY_COMPILE_FLAGS ?= 'LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8"'
-
-ruby_do_compile() {
-	for gem in ${RUBY_BUILD_GEMS}; do
-		${RUBY_COMPILE_FLAGS} gem build $gem
-	done
-}
-
-
-ruby_do_install() {
-	for gem in ${RUBY_INSTALL_GEMS}; do
-		gem install --ignore-dependencies --local --env-shebang --install-dir ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/ $gem
-	done
-
-	# create symlink from the gems bin directory to /usr/bin
-	for i in ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/*; do
-		if [ -e "$i" ]; then
-			if [ ! -d ${D}/${bindir} ]; then mkdir -p ${D}/${bindir}; fi
-			b=`basename $i`
-			ln -sf ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/$b ${D}/${bindir}/$b
-		fi
-	done
-}
-
-EXPORT_FUNCTIONS do_compile do_install
-
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev"
-
-FILES_${PN}-dbg += " \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/.debug \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
-        "
-
-FILES_${PN} += " \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/cache \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/specifications \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/build_info \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions \
-        "
-
-FILES_${PN}-doc += " \
-        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/doc \
-        "
diff --git a/meta-ruby/conf/layer.conf b/meta-ruby/conf/layer.conf
deleted file mode 100644
index b526a5d39..000000000
--- a/meta-ruby/conf/layer.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-# We have a conf and classes directory, append to BBPATH 
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
-
-BBFILE_COLLECTIONS += "ruby-layer"
-BBFILE_PATTERN_ruby-layer := "^${LAYERDIR}/"
-BBFILE_PRIORITY_ruby-layer = "7"
-
-# This should only be incremented on significant changes that will
-# cause compatibility issues with other layers
-LAYERVERSION_ruby-layer = "1"
-
-LAYERDEPENDS_ruby-layer = "core openembedded-layer"
-- 
2.14.0


