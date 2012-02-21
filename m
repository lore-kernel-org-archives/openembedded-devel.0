Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rzdcc-0004Pd-Ot
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 01:30:23 +0100
Received: from mizar.localdomain (87.5.51.74) by smtp207.alice.it (8.6.023.02)
	id 4F05A6650581A81E; Tue, 21 Feb 2012 01:22:06 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Feb 2012 01:21:52 +0100
Message-Id: <1329783724-10816-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1329780628.git.andrea.adami@gmail.com>
References: <cover.1329780628.git.andrea.adami@gmail.com>
Subject: [meta-oe][PATCH] meta-initramfs: initial layer commit
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
X-List-Received-Date: Tue, 21 Feb 2012 00:30:23 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/README          |   14 ++++++++++++++
 meta-initramfs/conf/layer.conf |   11 +++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-initramfs/README
 create mode 100644 meta-initramfs/conf/layer.conf

diff --git a/meta-initramfs/README b/meta-initramfs/README
new file mode 100644
index 0000000..4daa206
--- /dev/null
+++ b/meta-initramfs/README
@@ -0,0 +1,14 @@
+This layer depends on:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: master
+revision: HEAD
+
+Send pull requests to openembedded-devel@lists.openembedded.org with
+'[meta-initramfs]' in the subject.
+
+When sending single patches, please using something like
+'git send-email -1 --to openembedded-devel@lists.openembedded.org \
+  --subject-prefix meta-initramfs'
+
+Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
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



