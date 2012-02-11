Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rw2L7-0002Ge-NW
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 03:05:30 +0100
Received: by eaal10 with SMTP id l10so900152eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 17:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=aQoNyMqN8FEhRYHhULi2KjtMl3q5pJhC+P43+7FdoeY=;
	b=cFm22EzLGMf/Clhs1LU8jnt/Rw7Dw1+vsojArUdBXtGCwoDFZoJ/Te0LLGTaDpDOs8
	trRB1BI3bfmswQ7MlCFrXgtfLspJ6UniMlXXDUt8KFFINW4x/MDt6vUuctwPEHrP4ykS
	hTcNK2yGSxn0kAubv536s3lP8EAZ/yHoU0coM=
Received: by 10.213.25.215 with SMTP id a23mr1440493ebc.60.1328925438751;
	Fri, 10 Feb 2012 17:57:18 -0800 (PST)
Received: from localhost.localdomain (p5B0A16A6.dip.t-dialin.net.
	[91.10.22.166])
	by mx.google.com with ESMTPS id n17sm29065006eei.3.2012.02.10.17.57.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 17:57:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2012 03:00:03 +0100
Message-Id: <1328925603-2967-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 7/7] systemd.bbclass: automatically extend RDEPENDS for *-systemd packages
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
X-List-Received-Date: Sat, 11 Feb 2012 02:05:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* append systemd (functionalty moved into systemd_add_rdepends)
* append base-pgk

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   19 +++++++++++++++----
 1 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 8927980..edc2872 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -116,10 +116,6 @@ python populate_packages_prepend () {
 		postrm += bb.data.getVar('systemd_postrm', localdata, 1)
 		bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
 
-		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
-		rdepends.append("systemd")
-		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
-
 	# add systemd files to FILES_*-systemd
 	def systemd_add_files(pkg_systemd):
 		systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1)
@@ -136,7 +132,22 @@ python populate_packages_prepend () {
 		files = d.getVar(var_name, 0) or ""
 		d.setVar(var_name, "%s %s" % (files, files_append))
 
+	# *-systemd packages get RDEPENDS to systemd and their base package
+	def systemd_add_rdepends(pkg_systemd):
+		pn_pkg = d.getVar('PN', 1)
+		# RDEPENDS_${pkg_systemd} += pkg_systemd_base systemd
+		rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg_systemd, 1) or "")
+		if not 'systemd' in rdepends:
+			rdepends.append('systemd')
+		pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+		# not rdepending myself / avoid double entries
+		if pkg_systemd != pn_pkg and not pkg_systemd_base in rdepends:
+			rdepends.append(pkg_systemd_base)
+		d.setVar('RDEPENDS_' + pkg_systemd, " " + " ".join(rdepends))
+
+
 	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
 		systemd_prepost_instrm(pkg_systemd)
 		systemd_add_files(pkg_systemd)
+		systemd_add_rdepends(pkg_systemd)
 }
-- 
1.7.4.4



