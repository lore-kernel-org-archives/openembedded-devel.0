Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RNYXh-0000pm-ON
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 00:23:54 +0100
Received: (qmail invoked by alias); 07 Nov 2011 23:17:40 -0000
Received: from p5B0A3C37.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.60.55]
	by mail.gmx.net (mp062) with SMTP; 08 Nov 2011 00:17:40 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/bo0gWA7nbD/3rnPM9uR5PhngJEjMoWIPRUhuIBq
	jipQrzZSanRBOH
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Nov 2011 00:22:35 +0100
Message-Id: <1320708155-13730-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] task-xfce-extended: initial add task for full featured XFCE
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
X-List-Received-Date: Mon, 07 Nov 2011 23:23:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
new file mode 100644
index 0000000..122252f
--- /dev/null
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "All packages for full XFCE installation"
+SECTION = "x11/wm"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+inherit task
+
+# mandatory
+RDEPENDS_${PN} = " \
+    task-xfce-base \
+"
+
+# nice to have
+RRECOMMENDS_${PN} = " \
+    xfwm4-theme-daloa \
+    xfwm4-theme-kokodi \
+    xfwm4-theme-moheli \
+    xfwm4-theme-sassandra \
+    xfwm4-theme-stoneage \
+    xfwm4-theme-therapy \
+    xfwm4-theme-tyrex \
+    xfwm4-theme-wallis \
+    \
+    xfce4-icon-theme \
+    \
+    xfce4-cpufreq-plugin \
+    xfce4-cpugraph-plugin \
+    xfce4-datetime-plugin \
+    xfce4-eyes-plugin \
+    xfce4-clipman-plugin \
+    xfce4-diskperf-plugin \
+    xfce4-netload-plugin \
+    \
+    xfce4-appfinder \
+    xfce4-screenshooter \
+    ristretto \
+"
-- 
1.7.4.4



