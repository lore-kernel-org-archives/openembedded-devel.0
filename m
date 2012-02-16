Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlu-00063q-9z
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:34 +0100
Received: by eekd41 with SMTP id d41so504563eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=iq0sdP5cCNIlBsbqegqUzB2fWnvrwf9TQlum4WR1LaY=;
	b=GFNgW9pOHpqDzukdLflxYoqbfHyjN408irDnYfyyCTTWm+vAySjsgq1lodZoEfKzRN
	K1IMOe1OiT+RPisHFQ9NhU4G7OaPrceWEuIFSnj9QT3xPzy/Wpar8CJqq3piE876OB/d
	qFpowFaibUWY1q/Hu4PDzvK9W5dgsHmxmB1Lc=
Received: by 10.14.126.68 with SMTP id a44mr327690eei.101.1329357622070;
	Wed, 15 Feb 2012 18:00:22 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:02:56 +0100
Message-Id: <1329357796-27398-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 02/22] systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and SYSTEMD_SERVICE
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:34 -0000
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

V1 -> V2: Do not check configuration variables for cross and nativesdk

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   47 ++++++++++++++++++++++++++++++++------
 1 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 094a12c..1dcf27e 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -25,9 +25,45 @@ systemctl disable ${SYSTEMD_SERVICE}
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
@@ -70,11 +106,6 @@ python populate_packages_prepend () {
 
 
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
1.7.4.4



