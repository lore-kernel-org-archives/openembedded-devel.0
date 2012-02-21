Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RzxTr-0001Dl-46
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 22:42:39 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp208.alice.it (8.6.023.02)
	id 4F056E850566425F; Tue, 21 Feb 2012 22:34:19 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:33:47 +0100
Message-Id: <1329860027-4598-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1329783724-10816-1-git-send-email-andrea.adami@gmail.com>
References: <1329783724-10816-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][PATCH v2 1/6] meta-initramfs: initial commit
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
X-List-Received-Date: Tue, 21 Feb 2012 21:42:39 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/COPYING.MIT     |   17 +++++++++++++++++
 meta-initramfs/README          |   34 ++++++++++++++++++++++++++++++++++
 meta-initramfs/conf/layer.conf |   11 +++++++++++
 3 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 meta-initramfs/COPYING.MIT
 create mode 100644 meta-initramfs/README
 create mode 100644 meta-initramfs/conf/layer.conf

diff --git a/meta-initramfs/COPYING.MIT b/meta-initramfs/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/meta-initramfs/COPYING.MIT
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
diff --git a/meta-initramfs/README b/meta-initramfs/README
new file mode 100644
index 0000000..2cecff6
--- /dev/null
+++ b/meta-initramfs/README
@@ -0,0 +1,34 @@
+meta-initramfs
+==============
+
+This layer contains the metadata necessary to build the klibc library and
+utilities (shared and static) plus other tools useful for the creation of
+small-sized initramfs.
+
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
+
+Maintenance
+-----------
+
+Send patches / pull requests to openembedded-devel@lists.openembedded.org
+with '[meta-initramfs]' in the subject.
+
+Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
+                   Paul Eggleton <paul.eggleton@linux.intel.com>
+
+
+License
+-------
+
+All metadata is MIT licensed unless otherwise stated. Source code included
+in tree for individual recipes is under the LICENSE stated in each recipe
+(.bb file) unless otherwise stated.
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
new file mode 100644
index 0000000..469cde5
--- /dev/null
+++ b/meta-initramfs/conf/layer.conf
@@ -0,0 +1,11 @@
+# Layer configuration for meta-initramfs layer
+
+# We have a conf and classes directory, prepend to BBPATH to prefer our versions
+BBPATH := "${LAYERDIR}:${BBPATH}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES := "${BBFILES} ${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "meta-initramfs"
+BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-initramfs = "8"
-- 
1.7.3.4



