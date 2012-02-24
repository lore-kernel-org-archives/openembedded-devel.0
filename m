Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S12Iz-0002Ly-Bd
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 22:03:53 +0100
Received: by yenr5 with SMTP id r5so1359671yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:55:30 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.72.230 as permitted sender) client-ip=10.236.72.230; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.72.230 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.72.230])
	by 10.236.72.230 with SMTP id t66mr7891866yhd.45.1330116930178
	(num_hops = 1); Fri, 24 Feb 2012 12:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=fu8M0jDlYY0SmhsuTdi9cjRzgCmDNx2nWx5QLxkIC08=;
	b=rm1NUSN1Gng1BO3XMTH32Vkioa/8UCy7V/+W0JpC7OSgjSSJYfI0tsIJRKbthEvUfa
	gG1AEkMkR2AZNybnvJ6JOYpgHB3AR2lem9TyloMqxTBBVxTlF02OZbEnFtoeescwNaRv
	NYkrgNY2ZOU62I4GzMGjY2GomgrH7vgA8Xlkg=
Received: by 10.236.72.230 with SMTP id t66mr5984719yhd.45.1330116930139;
	Fri, 24 Feb 2012 12:55:30 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d66sm15203291yhh.12.2012.02.24.12.55.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:55:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 20:55:17 +0000
Message-Id: <6dcaffb8068eb5a1d62c00c44f93e37a070c6065.1330116875.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330116875.git.otavio@ossystems.com.br>
References: <cover.1330116875.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330116875.git.otavio@ossystems.com.br>
References: <cover.1330116875.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 2/2] systemd.bbclass: do not mangle PACKAGES variable in native, nativesdk and cross
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
X-List-Received-Date: Fri, 24 Feb 2012 21:03:53 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |   72 +++++++++++++++++++-------------------
 1 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index dd423b5..0329b90 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -28,40 +28,34 @@ systemctl disable ${SYSTEMD_SERVICE}
 
 def systemd_after_parse(d):
 	def systemd_check_vars():
-		bpn = d.getVar('BPN', 1)
-		# not for native / only at parse time
-		if d.getVar('BB_WORKERCONTEXT', True) is None and \
-		bpn + "-native" != d.getVar('PN', 1) and \
-		bpn + "-cross" != d.getVar('PN', 1) and \
-		bpn + "-nativesdk" != d.getVar('PN', 1):
-			bb_filename = d.getVar('FILE')
-			packages = d.getVar('PACKAGES', 1)
-
-			# check SYSTEMD_PACKAGES
-			systemd_pkgs = d.getVar('SYSTEMD_PACKAGES', 1) or ""
-			if systemd_pkgs == "":
-				raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_PACKAGES" % bb_filename
-			for pkg_systemd in systemd_pkgs.split():
-				if pkg_systemd.find("-systemd") == -1:
-					if pkg_systemd != d.getVar('PN', 1):
-						raise bb.build.FuncFailed, \
-							"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
-							(bb_filename, pkg_systemd)
-					else:
-						bb.warn("%s: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd" % bb_filename)
+		bb_filename = d.getVar('FILE')
+		packages = d.getVar('PACKAGES', 1)
+
+		# check SYSTEMD_PACKAGES
+		systemd_pkgs = d.getVar('SYSTEMD_PACKAGES', 1) or ""
+		if systemd_pkgs == "":
+			raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_PACKAGES" % bb_filename
+		for pkg_systemd in systemd_pkgs.split():
+			if pkg_systemd.find("-systemd") == -1:
+				if pkg_systemd != d.getVar('PN', 1):
+					raise bb.build.FuncFailed, \
+						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
+						(bb_filename, pkg_systemd)
 				else:
-					pkg_systemd_base = pkg_systemd.replace('-systemd', '')
-					if pkg_systemd_base not in packages:
-						raise bb.build.FuncFailed, \
-							"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
-							( bb_filename, pkg_systemd)
-
-			# check SYSTEMD_SERVICE
-			for pkg_systemd in systemd_pkgs.split():
-				service_pkg = 'SYSTEMD_SERVICE' + "_" + pkg_systemd
-				systemd_services = d.getVar(service_pkg, 1) or d.getVar('SYSTEMD_SERVICE', 1) or ""
-				if systemd_services == "":
-					raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_SERVICE / %s" % (bb_filename, service_pkg)
+					bb.warn("%s: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd" % bb_filename)
+			else:
+				pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+				if pkg_systemd_base not in packages:
+					raise bb.build.FuncFailed, \
+						"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
+						( bb_filename, pkg_systemd)
+
+		# check SYSTEMD_SERVICE
+		for pkg_systemd in systemd_pkgs.split():
+			service_pkg = 'SYSTEMD_SERVICE' + "_" + pkg_systemd
+			systemd_services = d.getVar(service_pkg, 1) or d.getVar('SYSTEMD_SERVICE', 1) or ""
+			if systemd_services == "":
+				raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_SERVICE / %s" % (bb_filename, service_pkg)
 
 	# prepend systemd-packages not already included
 	def systemd_create_package(pkg_systemd):
@@ -71,9 +65,15 @@ def systemd_after_parse(d):
 			d.setVar('PACKAGES', packages)
 
 
-	systemd_check_vars()
-	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-		systemd_create_package(pkg_systemd)
+	bpn = d.getVar('BPN', 1)
+	# not for native / only at parse time
+	if d.getVar('BB_WORKERCONTEXT', True) is None and \
+	bpn + "-native" != d.getVar('PN', 1) and \
+	bpn + "-cross" != d.getVar('PN', 1) and \
+	bpn + "-nativesdk" != d.getVar('PN', 1):
+		systemd_check_vars()
+		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
+			systemd_create_package(pkg_systemd)
 
 
 python __anonymous() {
-- 
1.7.2.5



