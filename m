Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SaFoJ-0008OS-Fd
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 02:33:47 +0200
Received: by wgbdr1 with SMTP id dr1so1311382wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 17:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=u+2BcQRqDNASnQcCaBpblw7u33qF7mePOvfPFpnYwf0=;
	b=AI3RstrEIjs2PuSaFPgnL/H0jd8OpqtkVSMOBzambmgU0p5pPerrxka5YiHsM4De8f
	Jv8dcEQeeDqGtyiujvTOrILNlOGb+qK4MuHf4qph7RT3BcmiqeBj5vZfKMwmAotG2/Va
	KSpw7rIkbdLPKGTKTaBU/Cotx+oqF3H7f1+nA7rv8qzxcWTistcWDafsA8zkE1xxlBrW
	UaanISpazLGiUPTDQVhhPIQYZ8KxPPldr9ShBnyJqTy+SvCYf5V29GgIJoy+RaLw3cHM
	W8eVDDKBS83DEotlH1qreNCDeliimZcr4HAwqCCK8MfE/Q+LJwEDTa9oGTzz73zHbWge
	yQ4w==
Received: by 10.216.50.80 with SMTP id y58mr549344web.106.1338510207164;
	Thu, 31 May 2012 17:23:27 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3C03.dip.t-dialin.net. [91.10.60.3])
	by mx.google.com with ESMTPS id gv4sm1139637wib.8.2012.05.31.17.23.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 17:23:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Jun 2012 02:27:22 +0200
Message-Id: <1338510443-29579-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338510443-29579-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338510443-29579-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, v2 3/4] systemd.bbclass: extract SYSTEMD_SERVICE properly
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
X-List-Received-Date: Fri, 01 Jun 2012 00:33:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To set service files the following syntax is allowed:

SYSTEMD_SERVICE = <service_file>
or
SYSTEMD_SERVICE_{<systemd_package_name>} = <service_file>

A function get_package_var was introduced to handle all use-cases [1]
properly.

Build tested / buildhistory checks

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-May/039870.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 2881abf..00e108e 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -24,6 +24,12 @@ systemd_postrm() {
 systemctl disable ${SYSTEMD_SERVICE}
 }
 
+def get_package_var(d, var, pkg):
+	val = (d.getVar('%s_%s' % (var, pkg), d, 1) or "").strip()
+	if val == "":
+		val = (d.getVar(var, d, 1) or "").strip()
+	return val
+
 def systemd_after_parse(d):
 	def systemd_check_vars():
 		if d.getVar('BB_WORKERCONTEXT', True) is not None:
@@ -155,8 +161,7 @@ python populate_packages_prepend () {
 		systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
 		has_exactly_one_service = len(systemd_packages.split()) == 1
 		if has_exactly_one_service:
-			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + systemd_packages, 1) or d.getVar('SYSTEMD_SERVICE', 1)
-			has_exactly_one_service = len(systemd_services.split()) == 1
+			has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages)) == 1
 
 		keys = 'Also' # Conflicts??
 		if has_exactly_one_service:
@@ -164,8 +169,7 @@ python populate_packages_prepend () {
 			keys = 'Also Conflicts'
 		# scan for all in SYSTEMD_SERVICE[]
 		for pkg_systemd in systemd_packages.split():
-			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1)
-			for service in systemd_services.split():
+			for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
 				path_found = ''
 				for path in searchpaths.split():
 					if os.path.exists('${D}' + path + service):
@@ -196,7 +200,7 @@ python populate_packages_prepend () {
 	# run all modifications once when creating package
 	if os.path.exists('${D}'):
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-			if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
+			if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) != "":
 				systemd_generate_package_scripts(pkg_systemd)
 				systemd_add_rdepends(pkg_systemd)
 		systemd_check_services()
-- 
1.7.4.4



