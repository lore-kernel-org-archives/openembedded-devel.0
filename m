Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Td0PI-000053-RI
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 16:15:36 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qAQF1I48029499
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 26 Nov 2012 16:01:19 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Td0BS-0003yp-Hd; Mon, 26 Nov 2012 16:01:18 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2012 16:01:16 +0100
Message-Id: <1353942076-15233-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] meta-systemd: select recipes based on active collections
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
X-List-Received-Date: Mon, 26 Nov 2012 15:15:36 -0000

Recipes of inactivate layers must been BBMASK'ed to prevent build errors.
This is very unflexible and causes high maintenance effort for keeping
the project configuration in sync with the actual meta-systemd layout.

With this patch, the .bbappend files within the meta-* directories are
ignored unless the corresponding collection has been selected.  As it
relies on the order of BBFILES and BBFILE_COLLECTIONS expansion, a
sanity check has been added which aborts the build when assumptions do
not apply anymore.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta-systemd/conf/layer.conf | 16 +++++++++++++++-
 meta-systemd/invalid.bb      |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-systemd/invalid.bb

diff --git a/meta-systemd/conf/layer.conf b/meta-systemd/conf/layer.conf
index 3310abc..e8fd5ca 100644
--- a/meta-systemd/conf/layer.conf
+++ b/meta-systemd/conf/layer.conf
@@ -12,7 +12,21 @@
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/*/recipes-*/*/*.bbappend"
+BBFILES += "\
+  ${LAYERDIR}/recipes-*/*/*.bb \
+  ${LAYERDIR}/oe-core/recipes-*/*.bbappend \
+  ${LAYERDIR}/meta-oe/recipes-*/*/*.bbappend \
+  ${@base_contains('BBFILE_COLLECTIONS', 'systemd-layer',\
+                   '', '${LAYERDIR}/invalid.bb', d)} \
+  ${@base_contains('BBFILE_COLLECTIONS', 'gnome-layer',\
+                   '${LAYERDIR}/meta-gnome/recipes-*/*/*.bbappend', '', d)} \
+  ${@base_contains('BBFILE_COLLECTIONS', 'efl-layer',\
+                   '${LAYERDIR}/meta-efl/recipes-*/*/*.bbappend', '', d)} \
+  ${@base_contains('BBFILE_COLLECTIONS', 'multimedia-layer',\
+                   '${LAYERDIR}/meta-multimedia/recipes-*/*/*.bbappend', '', d)} \
+  ${@base_contains('BBFILE_COLLECTIONS', 'networking',\
+                   '${LAYERDIR}/meta-networking/recipes-*/*/*.bbappend', '', d)} \
+"
 
 BBFILE_COLLECTIONS += "systemd-layer"
 BBFILE_PATTERN_systemd-layer := "^${LAYERDIR}/"
diff --git a/meta-systemd/invalid.bb b/meta-systemd/invalid.bb
new file mode 100644
index 0000000..b16787b
--- /dev/null
+++ b/meta-systemd/invalid.bb
@@ -0,0 +1,2 @@
+Content of this file is invalid and is used by conf/layer.conf to
+ensure that BBFILES is expanded after BBFILE_COLLECTIONS.
-- 
1.7.11.7



