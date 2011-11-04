Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMNd0-0007o7-5N
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 18:32:30 +0100
Received: by ggnj1 with SMTP id j1so2600797ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 10:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=Ye/l3HVfo9vN8wYWNWfe2zRscrt8YZu9T8iKXLGgbJ4=;
	b=PO3RSG/Wq+DA8eUya7/IptTD1bwlGBUM2tvulR9sBF0hopjQO9jTyMLl0xjJT6TJbl
	5zCkaRenXKYWVS9f0pfCSJoVFoMp2IirbDoztvP+1Z/2tC5mIndxb5cODAPjFqRbQV2p
	FYr7a11wfuEx36jqctY9iyBKiuda/4EdwjDKM=
Received: by 10.236.195.4 with SMTP id o4mr22421630yhn.6.1320427576951;
	Fri, 04 Nov 2011 10:26:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id y58sm6548572yhi.17.2011.11.04.10.26.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 10:26:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:25:59 +0000
Message-Id: <0f0df5c5955b59354aee70079353dffd43c3a7af.1320427498.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320427498.git.otavio@ossystems.com.br>
References: <cover.1320427498.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320427498.git.otavio@ossystems.com.br>
References: <cover.1320427498.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/3] systemd.bbclass: make easier handle service enabling
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
X-List-Received-Date: Fri, 04 Nov 2011 17:32:30 -0000

This generates the postinst/prerm/postrm routines for the package
specified in SYSTEMD_PACKAGES avoding code duplication and
centralizing the handling of it for easy maintainence work.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |   78 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/classes/systemd.bbclass

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
new file mode 100644
index 0000000..83833db
--- /dev/null
+++ b/meta-oe/classes/systemd.bbclass
@@ -0,0 +1,78 @@
+SYSTEMDPN ?= "${PN}"
+
+DEPENDS_append = " systemd-systemctl-native"
+RDEPENDS_${SYSTEMDPN}_append = " systemd"
+
+systemd_postinst() {
+OPTS=""
+
+if [ -n "$D" ]; then
+    OPTS="--root=$D"
+fi
+
+systemctl $OPTS enable ${SYSTEMD_SERVICE}
+
+if [ -z "$D" ]; then
+    systemctl start ${SYSTEMD_SERVICE}
+fi
+}
+
+systemd_prerm() {
+if [ -z "$D" ]; then
+    systemctl stop ${SYSTEMD_SERVICE}
+fi
+}
+
+systemd_postrm() {
+systemctl disable ${SYSTEMD_SERVICE}
+}
+
+def systemd_after_parse(d):
+    if bb.data.getVar('SYSTEMD_PACKAGES', d) == None:
+        if bb.data.getVar('SYSTEMD_SERVICE', d) == None:
+            raise bb.build.FuncFailed, "%s inherits systemd but doesn't set SYSTEMD_SERVICE" % bb.data.getVar('FILE', d)
+
+python __anonymous() {
+    systemd_after_parse(d)
+}
+
+python populate_packages_prepend () {
+	def systemd_package(pkg):
+		bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
+		localdata = bb.data.createCopy(d)
+		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
+		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
+		bb.data.update_data(localdata)
+
+		"""
+		systemd postinst is appended here because pkg_postinst may require to
+		execute on the target. Not doing so may cause systemd postinst invoked
+		twice to cause unwanted warnings.
+		""" 
+		postinst = bb.data.getVar('pkg_postinst', localdata, 1)
+		if not postinst:
+			postinst = '#!/bin/sh\n'
+		postinst += bb.data.getVar('systemd_postinst', localdata, 1)
+		bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
+
+		prerm = bb.data.getVar('pkg_prerm', localdata, 1)
+		if not prerm:
+			prerm = '#!/bin/sh\n'
+		prerm += bb.data.getVar('systemd_prerm', localdata, 1)
+		bb.data.setVar('pkg_prerm_%s' % pkg, prerm, d)
+
+	        postrm = bb.data.getVar('pkg_postrm', localdata, 1)
+	        if not postrm:
+	                postrm = '#!/bin/sh\n'
+                postrm += bb.data.getVar('systemd_postrm', localdata, 1)
+		bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
+
+	pkgs = bb.data.getVar('SYSTEMD_PACKAGES', d, 1)
+	if pkgs == None:
+		pkgs = bb.data.getVar('SYSTEMDPN', d, 1)
+		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
+		if not pkgs in packages and packages != []:
+			pkgs = packages[0]
+	for pkg in pkgs.split():
+		systemd_package(pkg)
+}
-- 
1.7.2.5



