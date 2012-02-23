Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xde-0004lJ-Ka
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:10 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506551eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.37.203 as permitted sender)
	client-ip=10.14.37.203; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.37.203 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.37.203])
	by 10.14.37.203 with SMTP id y51mr717778eea.61.1329999051675 (num_hops
	= 1); Thu, 23 Feb 2012 04:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=xUOUAsyuGUastOU2w12BRuyxvOk/OOIo8aZk9ONJQkU=;
	b=DEx2nuIXQBzZP+K948suaJyiG5VAfrDS39DUOwwQgXC8SE5faA4EhG1gSypj7GUsu1
	kzt4XtZRiAFJ67hAYSEVngSRRVB9zTvYiFuKUuBpcVruN30rOC7OOi1OMO9UyIbL71bG
	xZ7YhzsS6tsQRvagIVaFZpNRlKctD8cW2Gx54=
Received: by 10.14.37.203 with SMTP id y51mr567901eea.61.1329999051597;
	Thu, 23 Feb 2012 04:10:51 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:34 +0100
Message-Id: <1329999054-23112-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 03/23] systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

after recipe parsing the following plausibilities are checked:
* ERROR if empty SYSTEMD_PACKAGES
* ERROR if SYSTEMD_PACKAGES entry does not contain '-systemd' AND
  package_name != ${PN}
* ERROR if SYSTEMD_PACKAGES entry contains '-systemd' but entry without
  '-systemd' (base pkg) does not exist
* WARNING if SYSTEMD_PACKAGES containing ${PN} to force package maintainers to
  split out systemd-specific files into *-systemd
* error if SYSTEMD_SERVICE(_<systemd-package>) is empty for one or more entries
  in SYSTEMD_PACKAGES

The code in populate_packages_prepend to set SYSTEMD_PACKAGES to ${PN} as
default was removed.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/classes/systemd.bbclass |   47 ++++++++++++++++++++++++++++++++------
 1 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 91faab9..a99036c 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -27,9 +27,45 @@ systemctl disable ${SYSTEMD_SERVICE}
 }
 
 def systemd_after_parse(d):
-    if bb.data.getVar('SYSTEMD_PACKAGES', d) == None:
-        if bb.data.getVar('SYSTEMD_SERVICE', d) == None:
-            raise bb.build.FuncFailed, "%s inherits systemd but doesn't set SYSTEMD_SERVICE" % bb.data.getVar('FILE', d)
+	def systemd_check_vars():
+		bpn = d.getVar('BPN', 1)
+		# not for native / only at parse time
+		if d.getVar('BB_WORKERCONTEXT', True) is None and \
+		bpn + "-native" != d.getVar('PN', 1) and \
+		bpn + "-cross" != d.getVar('PN', 1) and \
+		bpn + "-nativesdk" != d.getVar('PN', 1):
+			bb_filename = d.getVar('FILE')
+			packages = d.getVar('PACKAGES', 1)
+
+			# check SYSTEMD_PACKAGES
+			systemd_pkgs = d.getVar('SYSTEMD_PACKAGES', 1) or ""
+			if systemd_pkgs == "":
+				raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_PACKAGES" % bb_filename
+			for pkg_systemd in systemd_pkgs.split():
+				if pkg_systemd.find("-systemd") == -1:
+					if pkg_systemd != d.getVar('PN', 1):
+						raise bb.build.FuncFailed, \
+							"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
+							(bb_filename, pkg_systemd)
+					else:
+						bb.warn("%s: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd" % bb_filename)
+				else:
+					pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+					if pkg_systemd_base not in packages:
+						raise bb.build.FuncFailed, \
+							"\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN} (deprecated)" % \
+							( bb_filename, pkg_systemd)
+
+			# check SYSTEMD_SERVICE
+			for pkg_systemd in systemd_pkgs.split():
+				service_pkg = 'SYSTEMD_SERVICE' + "_" + pkg_systemd
+				systemd_services = d.getVar(service_pkg, 1) or d.getVar('SYSTEMD_SERVICE', 1) or ""
+				if systemd_services == "":
+					raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_SERVICE / %s" % (bb_filename, service_pkg)
+
+
+	systemd_check_vars()
+
 
 python __anonymous() {
     systemd_after_parse(d)
@@ -72,11 +108,6 @@ python populate_packages_prepend () {
 
 
 	pkgs = bb.data.getVar('SYSTEMD_PACKAGES', d, 1)
-	if pkgs == None:
-		pkgs = bb.data.getVar('PN', d, 1)
-		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
-		if not pkgs in packages and packages != []:
-			pkgs = packages[0]
 	for pkg in pkgs.split():
 		systemd_package(pkg)
 }
-- 
1.7.6.4



