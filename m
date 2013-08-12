Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id C1C9F6B5F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 04:35:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7C4Zmvv029126
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 00:35:48 -0400 (EDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 11 Aug 2013 21:35:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Aug 2013 12:35:38 +0800
Message-ID: <b924f5411208349fcab702a887b1bfd30a182fd7.1376281943.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376281943.git.hongxu.jia@windriver.com>
References: <cover.1376281943.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-cpan 1/3] meta-cpan creation
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
X-List-Received-Date: Mon, 12 Aug 2013 04:35:49 -0000
Content-Type: text/plain

---
 COPYING.MIT     | 17 +++++++++++
 README          | 88 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 conf/layer.conf | 10 +++++++
 3 files changed, 115 insertions(+)
 create mode 100644 COPYING.MIT
 create mode 100644 README
 create mode 100644 conf/layer.conf

diff --git a/COPYING.MIT b/COPYING.MIT
new file mode 100644
index 0000000..89de354
--- /dev/null
+++ b/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+THE SOFTWARE.
diff --git a/README b/README
new file mode 100644
index 0000000..091da85
--- /dev/null
+++ b/README
@@ -0,0 +1,88 @@
+meta-cpan
+=========
+This layer provides commonly-used perl libraries in the Comprehensive
+Perl Archive Network.
+
+Contents and Help
+-----------------
+
+In this section the contents of the layer is listed, along with a short
+help for each package.
+
+         -- libdbi-perl --
+         The DBI is a database access module for the Perl programming language.
+         It defines a set of methods, variables, and conventions that provide
+         a consistent database interface, independent of the actual database
+         being used.
+                      |<- Scope of DBI ->|
+                           .-.   .--------------.   .-------------.
+           .-------.       | |---| XYZ Driver   |---| XYZ Engine  |
+           | Perl  |       | |   `--------------'   `-------------'
+           | script|  |A|  |D|   .--------------.   .-------------.
+           | using |--|P|--|B|---|Oracle Driver |---|Oracle Engine|
+           | DBI   |  |I|  |I|   `--------------'   `-------------'
+           | API   |       | |...
+           |methods|       | |... Other drivers
+           `-------'       | |...
+                           `-'
+
+        -- libdbd-sqlite-perl --
+        DBD::SQLite is a Perl DBI driver for SQLite, that includes the entire
+        thing in the distribution. So in order to get a fast transaction capable
+        RDBMS working for your perl project you simply have to install this
+        module, and nothing else.
+
+        usage: there is a test case to show you how it works
+
+        1) vim local.conf:
+        ...
+        IMAGE_INSTALL_append = " libdbd-sqlite-perl"
+        PERL_DBM_TEST = "1"
+        ...
+        2) build core-image-sato and boot the target
+
+        3) run "sqlite-perl-test.pl" on target. This script includes five
+           operations create/insert/update/delete/select to do with a table.
+
+        More information can be found in the recipe's git log.
+
+Dependencies
+------------
+
+This layer depends on:
+
+  URI: git://git.openembedded.org/openembedded-core
+  branch: master
+  revision: HEAD
+  prio: default
+
+Adding the meta-cpan layer to your build
+---------------------------------------
+
+In order to use this layer, you need to make the build system aware of
+it.
+
+Assuming the meta-cpan layer exists at the top-level of your
+yocto build tree, you can add it to the build system by adding the
+location of the meta-cpan layer to bblayers.conf, along with any
+other layers needed. e.g.:
+
+  BBLAYERS ?= " \
+    /path/to/oe-core/meta \
+    /path/to/layer/meta-cpan \
+
+Maintenance
+-----------
+
+Send patches / pull requests to openembedded-devel@lists.openembedded.org with
+'[meta-cpan]' in the subject.
+
+Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
+
+License
+-------
+
+All metadata is MIT licensed unless otherwise stated. Source code included
+in tree for individual recipes is under the LICENSE stated in each recipe
+(.bb file) unless otherwise stated.
+
diff --git a/conf/layer.conf b/conf/layer.conf
new file mode 100644
index 0000000..11da11f
--- /dev/null
+++ b/conf/layer.conf
@@ -0,0 +1,10 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+	${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "perl"
+BBFILE_PATTERN_perl = "^${LAYERDIR}/"
+BBFILE_PRIORITY_perl = "6"
-- 
1.8.1.2


