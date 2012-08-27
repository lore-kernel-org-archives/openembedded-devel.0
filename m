Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.macdonald@windriver.com>) id 1T5nUI-00085J-4T
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Aug 2012 02:47:30 +0200
Received: from yow-assmunch-03.corp.ad.wrs.com (yow-jmacdona-d3.wrs.com
	[128.224.147.66])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7R0ZHqu020660
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2012 17:35:18 -0700 (PDT)
From: Joe MacDonald <joe.macdonald@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Aug 2012 20:35:17 -0400
Message-Id: <1346027717-23136-1-git-send-email-joe.macdonald@windriver.com>
X-Mailer: git-send-email 1.7.11.3
Subject: [meta-oe][PATCH v3] meta-networking: add layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2012 00:47:30 -0000

A home for networking-related packages.  This includes protocol support,
servers / daemons and utilities.

Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 meta-networking/COPYING.MIT     | 17 +++++++++++++++++
 meta-networking/MAINTAINERS     | 31 +++++++++++++++++++++++++++++++
 meta-networking/README          | 28 ++++++++++++++++++++++++++++
 meta-networking/conf/layer.conf | 11 +++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 meta-networking/COPYING.MIT
 create mode 100644 meta-networking/MAINTAINERS
 create mode 100644 meta-networking/README
 create mode 100644 meta-networking/conf/layer.conf

diff --git a/meta-networking/COPYING.MIT b/meta-networking/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/meta-networking/COPYING.MIT
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
diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
new file mode 100644
index 0000000..393f037
--- /dev/null
+++ b/meta-networking/MAINTAINERS
@@ -0,0 +1,31 @@
+This file contains a list of maintainers for the meta-networking layer.
+
+Please submit any patches against meta-networking to the OpenEmbedded
+development mailing list (openembedded-devel@lists.openembedded.org) with
+'[meta-networking]' in the subject.
+
+When sending single patches, please use something like:
+
+   git send-email -1 \
+        --to openembedded-devel@lists.openembedded.org \
+        --subject-prefix=meta-networking][PATCH
+
+You may also contact the maintainers directly.
+
+Descriptions of section entries:
+
+        M: Mail patches to: FullName <address@domain>
+        F: Files and directories with wildcard patterns.
+           A trailing slash includes all files and subdirectory files.
+           F: recipes-devtools/    all files in and below recipes-devtools
+           F: recipes-selinux/*    all files in recipes-selinux, but not below
+           One pattern per line.  Multiple F: lines acceptable.
+
+Please keep this list in alphabetical order.
+
+Maintainers List (try to look for most precise areas first)
+
+COMMON
+M:      Joe MacDonald <joe.macdonald@windriver.com>
+F:      conf
+F:      recipes-*
diff --git a/meta-networking/README b/meta-networking/README
new file mode 100644
index 0000000..438f442
--- /dev/null
+++ b/meta-networking/README
@@ -0,0 +1,28 @@
+meta-networking
+===============
+
+This layer is intended to be a central point for networking-related
+packages and configuration.  It should be useful directly on top of
+oe-core and compliments meta-openembedded.  It should be primarily useful
+to the following groups:
+
+      - Anyone building a small networking device (eg. a home router /
+        bridge / switch).
+
+      - Anyone wanting to add network services to their device (eg.
+        anything that might benefit from a small ftp/tftp server)
+
+Dependencies
+------------
+
+This layer depends on:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: master
+revision: HEAD
+
+Maintenance
+-----------
+
+Please see the MAINTAINERS file for information on contacting the
+maintainers of this layer, as well as instructions for submitting patches. 
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
new file mode 100644
index 0000000..f26a172
--- /dev/null
+++ b/meta-networking/conf/layer.conf
@@ -0,0 +1,11 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH := "${BBPATH}:${LAYERDIR}"
+
+# We have a packages directory, add to BBFILES
+BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb \
+ ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "networking"
+BBFILE_PATTERN_networking := "^${LAYERDIR}/"
+BBFILE_PRIORITY_networking = "5"
+
-- 
1.7.11.3



