Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzez-0006vv-Bq
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:26 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:04 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:04 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18IIWp3w9wIFZSJb7cCxN94+ruewxB1aWV8ZvhZYP
	H55NKTQDHq/doR
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:39 +0200
Message-Id: <1312232577-7948-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 01/19] meta-xfce: Add layer information
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:26 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 meta-xfce/conf/layer.conf |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/conf/layer.conf

diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
new file mode 100644
index 0000000..d669e4e
--- /dev/null
+++ b/meta-xfce/conf/layer.conf
@@ -0,0 +1,9 @@
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "xfce-layer"
+BBFILE_PATTERN_xfce-layer := "^${LAYERDIR}/"
+BBFILE_PRIORITY_xfce-layer = "7"
-- 
1.7.4.4



