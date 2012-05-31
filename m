Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sa3G1-0000sk-Tw
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 13:09:34 +0200
Received: by mail-bk0-f47.google.com with SMTP id jm2so710494bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=T7pHXMXi0dohpNxlSz1atTRVN5HbMCrTa8Npa3xGWwk=;
	b=MYVOahdK67kRBEas7JyEarU8Pv1ocbnKxYOnMvW3VIP6Etyb+KergOd9LP9OBEjhcb
	Xj0YVQHtk4mOMP8QEmWs4fG5R2A2fGyvMuIgb8FvhwF3Y6LUJcOvPDMcWHHidyFfIDv+
	qj2KA++0/A2wEPgz5HYZduG9Cc0dWDqoerxD4p942V6wjaPvKa8YLI85wQ1Q8iKX8HbA
	qQWxq+rwIEblQigQGDgunzfLTakxGF/DmjFmPRFi9zuKH8DsW5QhE1dCwwAdSwlA2iAr
	HLiNvEVV+LnvlfkDYiXHQX+64BvwR/oJzjHRecz8mQ0AXBmLK0Ntj01IGFxO2Gu5zc5H
	KrWQ==
Received: by 10.204.156.209 with SMTP id y17mr11386109bkw.113.1338461956500;
	Thu, 31 May 2012 03:59:16 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ig1sm2794600bkc.4.2012.05.31.03.59.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 03:59:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 12:58:59 +0200
Message-Id: <1338461940-3040-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 3/4] systemd.bbclass: extract SYSTEMD_SERVICE properly
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
X-List-Received-Date: Thu, 31 May 2012 11:09:34 -0000
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
 meta-oe/classes/systemd.bbclass |   22 +++++++++++++++++-----
 1 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 2881abf..976346f 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -24,6 +24,20 @@ systemd_postrm() {
 systemctl disable ${SYSTEMD_SERVICE}
 }
 
+def get_package_var(d, var, pkg):
+	val = d.getVar('%s_%s' % (var, pkg), d, 1)
+	if val:
+		val = val.strip()
+	else:
+		val = ""
+	if val == "":
+		val = bb.data.getVar(var, d, 1)
+		if val:
+			val = val.strip()
+		else:
+			val = ""
+	return val
+
 def systemd_after_parse(d):
 	def systemd_check_vars():
 		if d.getVar('BB_WORKERCONTEXT', True) is not None:
@@ -155,8 +169,7 @@ python populate_packages_prepend () {
 		systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
 		has_exactly_one_service = len(systemd_packages.split()) == 1
 		if has_exactly_one_service:
-			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + systemd_packages, 1) or d.getVar('SYSTEMD_SERVICE', 1)
-			has_exactly_one_service = len(systemd_services.split()) == 1
+			has_exactly_one_service = len(get_package_var(d, 'SYSTEMD_SERVICE', systemd_packages)) == 1
 
 		keys = 'Also' # Conflicts??
 		if has_exactly_one_service:
@@ -164,8 +177,7 @@ python populate_packages_prepend () {
 			keys = 'Also Conflicts'
 		# scan for all in SYSTEMD_SERVICE[]
 		for pkg_systemd in systemd_packages.split():
-			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1)
-			for service in systemd_services.split():
+			for service in get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd).split():
 				path_found = ''
 				for path in searchpaths.split():
 					if os.path.exists('${D}' + path + service):
@@ -196,7 +208,7 @@ python populate_packages_prepend () {
 	# run all modifications once when creating package
 	if os.path.exists('${D}'):
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-			if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
+			if get_package_var(d, 'SYSTEMD_SERVICE', pkg_systemd) != "":
 				systemd_generate_package_scripts(pkg_systemd)
 				systemd_add_rdepends(pkg_systemd)
 		systemd_check_services()
-- 
1.7.6.5



