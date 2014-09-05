Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 91C31713C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 15:07:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s85F7UrK009155
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Sep 2014 08:07:31 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 5 Sep 2014 08:07:30 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <Martin.Jansa@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Sep 2014 11:07:13 -0400
Message-ID: <1409929633-12730-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1409929633-12730-1-git-send-email-mark.asselstine@windriver.com>
References: <1409929633-12730-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.18]
Subject: [meta-ruby][PATCH] ruby.bbclass: introduce a class to assist in building gems
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
X-List-Received-Date: Fri, 05 Sep 2014 15:07:42 -0000
Content-Type: text/plain

In order to allow the building of gems we have created a
ruby.bbclass. The building of gems is much like the building of python
packages in that we rely on building up -native gems in order to
facilitate the cross compiling of the gems that will be built for the
target. When dependencies exist between gems they must be satisfied by
the -native gems installed in the host sysroot. This approach is
feasible since the build process is able to query installed gems
without being affected by the ARCH they were built for. At this point
I have yet to come across a situation where the assumption associated
with this approach have failed but so far focus has only been on x86
and x86-64 builds.

The recipes which inherit the ruby.bbclass can optionally define a BPV
in the case where the gemspec version doesn't always map 1:1 to the
PV. This situation has only been encountered on a few occasions so
the class has been made to default BPV to PV.

To demonstrate the ruby.bbclass in use we have included a recipe to
build the bundler gem. Bundler can be used on a running target to
install gems from rubygems.org, which can be useful in itself when you
don't have recipes available for gems but want to try installing and
running pre-built gems.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-ruby/classes/ruby.bbclass                 | 125 +++++++++++++++++++++++++
 meta-ruby/recipes-devtools/ruby/bundler_git.bb |  29 ++++++
 2 files changed, 154 insertions(+)
 create mode 100644 meta-ruby/classes/ruby.bbclass
 create mode 100644 meta-ruby/recipes-devtools/ruby/bundler_git.bb

diff --git a/meta-ruby/classes/ruby.bbclass b/meta-ruby/classes/ruby.bbclass
new file mode 100644
index 0000000..9c4fcf9
--- /dev/null
+++ b/meta-ruby/classes/ruby.bbclass
@@ -0,0 +1,125 @@
+BPV ?= "${PV}"
+
+DEPENDS += " \
+    ruby-native \
+"
+RDEPENDS_${PN} += " \
+    ruby \
+"
+
+def get_rubyversion(p):
+    import re
+    from os.path import isfile
+    import subprocess
+    found_version = "SOMETHING FAILED!"
+
+    cmd = "%s/ruby" % p
+
+    if not isfile(cmd):
+       return found_version
+
+    version = subprocess.Popen([cmd, "--version"], stdout=subprocess.PIPE).communicate()[0]
+    
+    r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
+    m = r.match(version)
+    if m:
+        found_version = m.group(1)
+
+    return found_version
+
+def get_rubygemslocation(p):
+    import re
+    from os.path import isfile
+    import subprocess
+    found_loc = "SOMETHING FAILED!"
+
+    cmd = "%s/gem" % p
+
+    if not isfile(cmd):
+       return found_loc
+
+    loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0]
+
+    r = re.compile(".*\- (/usr.*/ruby/gems/.*)")
+    for line in loc.split('\n'):
+        m = r.match(line)
+        if m:
+            found_loc = m.group(1)
+            break
+
+    return found_loc
+
+def get_rubygemsversion(p):
+    import re
+    from os.path import isfile
+    import subprocess
+    found_version = "SOMETHING FAILED!"
+
+    cmd = "%s/gem" % p
+
+    if not isfile(cmd):
+       return found_version
+
+    version = subprocess.Popen([cmd, "env", "gemdir"], stdout=subprocess.PIPE).communicate()[0]
+    
+    r = re.compile(".*([0-9]+\.[0-9]+\.[0-9]+)$")
+    m = r.match(version)
+    if m:
+        found_version = m.group(1)
+
+    return found_version
+
+RUBY_VERSION ?= "${@get_rubyversion("${STAGING_BINDIR_NATIVE}")}"
+RUBY_GEM_DIRECTORY ?= "${@get_rubygemslocation("${STAGING_BINDIR_NATIVE}")}"
+RUBY_GEM_VERSION ?= "${@get_rubygemsversion("${STAGING_BINDIR_NATIVE}")}"
+
+export GEM_HOME = "${STAGING_DIR_NATIVE}/usr/lib/ruby/gems/${RUBY_GEM_VERSION}"
+
+RUBY_BUILD_GEMS ?= "${BPN}.gemspec"
+RUBY_INSTALL_GEMS ?= "${BPN}-${BPV}.gem"
+
+RUBY_COMPILE_FLAGS ?= 'LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8"'
+
+ruby_do_compile() {
+	for gem in ${RUBY_BUILD_GEMS}; do
+		${RUBY_COMPILE_FLAGS} gem build $gem
+	done
+}
+
+
+ruby_do_install() {
+	for gem in ${RUBY_INSTALL_GEMS}; do
+		gem install --ignore-dependencies --local --env-shebang --install-dir ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/ $gem
+	done
+
+	# create symlink from the gems bin directory to /usr/bin
+	for i in ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/*; do
+		if [ -e "$i" ]; then
+			if [ ! -d ${D}/${bindir} ]; then mkdir -p ${D}/${bindir}; fi
+			b=`basename $i`
+			ln -sf ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/$b ${D}/${bindir}/$b
+		fi
+	done
+}
+
+EXPORT_FUNCTIONS do_compile do_install
+
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev"
+
+FILES_${PN}-dbg += " \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
+        "
+
+FILES_${PN} += " \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/cache \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/specifications \
+        "
+
+FILES_${PN}-doc += " \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/doc \
+        "
diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
new file mode 100644
index 0000000..2adde4d
--- /dev/null
+++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Makes sure Ruby applications run the same code on every machine."
+DESCRIPTION = "Bundler makes sure Ruby applications run the same code \
+on every machine. It does this by managing the gems that the \
+application depends on. Given a list of gems, it can automatically \
+download and install those gems, as well as any other gems needed by \
+the gems that are listed. Before installing gems, it checks the \
+versions of every gem to make sure that they are compatible, and can \
+all be loaded at the same time. After the gems have been installed, \
+Bundler can help you update some or all of them when new versions \
+become available. Finally, it records the exact versions that have \
+been installed, so that others can install the exact same gems."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=196bb963e601609817d7e9ac9a64a867"
+
+PR = "r0"
+
+PV = "1.6.2"
+SRCREV = "06e3647c117da210ffd15a174624497830addd7b"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = " \
+    git://github.com/bundler/bundler.git \
+    "
+
+inherit ruby
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.2


