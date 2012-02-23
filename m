Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdk-0004lJ-1c
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:16 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506551eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:57 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.120.201 as permitted sender)
	client-ip=10.14.120.201; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.120.201 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.120.201])
	by 10.14.120.201 with SMTP id p49mr707048eeh.74.1329999057088 (num_hops
	= 1); Thu, 23 Feb 2012 04:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=HP7KhjGA2GIxQhwquZ6IVPyWuWxSj4vMTgklXUPGT0Q=;
	b=Y0LrrGJVhAVnAOVouqJemhKa+5pRT5S27PsU0+5mHdybbNv5pLvjCoMR4Zz82SyINW
	BxCo/76H1/0qyz6dYyD1D6nF3WAQI0LPsZpp43lJpUmGT7+nftfSX4Hs06AwVSsm3pWs
	uYGunYgoVvXBX4W/dKyviV5WAtFo0N857+JKY=
Received: by 10.14.120.201 with SMTP id p49mr557593eeh.74.1329999057014;
	Thu, 23 Feb 2012 04:10:57 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:40 +0100
Message-Id: <1329999054-23112-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 09/23] systemd.bbclass: automatically extend RDEPENDS for *-systemd packages
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* append systemd functionalty moved into systemd_add_rdepends
* append base-pgk in case receipe does not set RDEPENDS for *-systemd package

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   21 +++++++++++++++++----
 1 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index c712e17..dd423b5 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -122,10 +122,6 @@ python populate_packages_prepend () {
 		postrm += bb.data.getVar('systemd_postrm', localdata, 1)
 		bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
 
-		rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
-		rdepends.append("systemd")
-		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
-
 	# add files to FILES_*-systemd if existent and not already done
 	def systemd_append_file(pkg_systemd, file_append):
 		appended = False
@@ -185,10 +181,27 @@ python populate_packages_prepend () {
 					raise bb.build.FuncFailed, "\n\nFor package %s SYSTEMD_SERVICE-entry %s does not exist" % \
 						(pkg_systemd, service)
 
+	# *-systemd packages get RDEPENDS to systemd and their base package
+	def systemd_add_rdepends(pkg_systemd):
+		# RDEPENDS_${pkg_systemd} += pkg_systemd_base systemd
+		rdepends = d.getVar('RDEPENDS_' + pkg_systemd, 1) or ""
+		rdepends_arr = rdepends.split()
+		if not 'systemd' in rdepends_arr:
+			rdepends = '%s %s' % (rdepends, 'systemd')
+		pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+		# no automatism for:
+		# recipes setting rdepends themselves AND
+		# not rdepending myself AND
+		# avoid double entries
+		if len(rdepends_arr) == 0 and pkg_systemd != '${PN}' and not pkg_systemd_base in rdepends:
+			rdepends = '%s %s' % (rdepends, pkg_systemd_base)
+		d.setVar('RDEPENDS_' + pkg_systemd, rdepends)
+
 
 	# run all modifications once when creating package
 	if os.path.exists('${D}'):
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
 			systemd_generate_package_scripts(pkg_systemd)
+			systemd_add_rdepends(pkg_systemd)
 		systemd_check_services()
 }
-- 
1.7.6.4



