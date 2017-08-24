Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2723478397
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 15:51:51 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a70so7834418wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Fo1nlY1Qh9VmbveNAoXy4/I18C3Tnq6FJgUESxn8vdY=;
	b=hnWOJfOeM0Dm96FwpEOVJUZy8bMm6k28wQaCODD+UxdJG0LH6ItJli1O4rZEo3tZeV
	IpAVLDy4DUbSDNnZ8UY50+vaSZ5yO3DyZLhs0+UUA7nPBGWSA1+bL7d2t4p9eJaHvv2Q
	2ZV7KO1BgcFgG8WaV/JLFgnZBhQDHMCeQrQSsJPQqvkJEjARK0ndDkPX87KKC9EmJZQ/
	avxl+DUXwQPQKMpp5oV25Nibgj3rX/rH7mDAGn85Eo8TmpUiZ0pRwO0X7Mcy5haCphQB
	fEldNjbLgOSnxcskKzlLzaeUotns9S+B2oes/u9rOH3D9T+kuxYs1TMQrUnzdt1st5a5
	BiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Fo1nlY1Qh9VmbveNAoXy4/I18C3Tnq6FJgUESxn8vdY=;
	b=fzwdpUyXRXfswD6JXgwIPeSQyKDdZSOIc1/yMbkBhVMSLg8Odqza/VIRnYCk6KSqHz
	zrxVB8kD0/jRDXQPV6rCVgXWBNtRy/D4CaniFUMTpCnP5vCqZf0pA52GZg/WjZiyaoF2
	aNGpq2aq76HmmzLNll/SbMxIa+QjKz4QI6jTUkEUWSKS2BnOPiqLOoldyDQ0n/5Q9hzI
	r5KU8+qukeEj2dgomFCLMdZS4HLA4N4xFUCJyhdE8PUUR9Dmd8UUqmag22qQeVLcgJbX
	EkR92XA1+FLHtV30WpzRopcArirZqN8LyDaisIXTgfFwkf5jWW78zXKBwZ9Fyl5RGTe/
	GZaQ==
X-Gm-Message-State: AHYfb5i0PjutDgBTjhqk9jYEa9rkjcGMqEF0NPnlaOAFrLDIwlX+cMNx
	RfeZPjiqHgeNnFKs
X-Received: by 10.28.56.67 with SMTP id f64mr4087150wma.101.1503589911269;
	Thu, 24 Aug 2017 08:51:51 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q16sm3424827wrg.44.2017.08.24.08.51.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 08:51:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 17:53:29 +0200
Message-Id: <20170824155332.18313-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824155332.18313-1-Martin.Jansa@gmail.com>
References: <20170824155332.18313-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/5] meta-ruby: remove this now pretty empty layer
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
X-List-Received-Date: Thu, 24 Aug 2017 15:51:52 -0000

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
2.14.1


