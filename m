Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3vB-0007v0-BR
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:21 +0200
Received: by mail-yx0-f175.google.com with SMTP id 22so1569081yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=ZzmcN1I/zW63H5Uv6q+RzgyEuaZb3JcwkFbJP/u6OdY=;
	b=l5jsfmcsTnYHjfBGhgoCjW9e8xhI0oY2SO52OeRegh0Dt7WsTensiatAcYHGpyQPCK
	C/iqCaRnFIS9sBCULP/haMM2I9eOworfa9Sk30KADtkpjQc4LrfSYSSeFT90vau0ARUr
	d5sf+ZO8uKYdp7tRKBT26eYzGSA0ob0nW+nKg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=EySRsLZge4qQ/qKcoIG77sayeiGZQ9mwHHwReT7AkEyXsrAkWtvhQxdE9ejVBGWdrM
	1wxVdc12c+iLSCU56olgaRTX/nqIFvMTnhxPqYWjGgFiGa3ekUMFbQOni4vG/GbSXDFP
	vVGAA3HA1VIttTzKmmAgGrW+zYyi5HW5gd3Rw=
Received: by 10.236.180.38 with SMTP id i26mr5842651yhm.205.1306767314754;
	Mon, 30 May 2011 07:55:14 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.55.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:55:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:21 +0000
Message-Id: <1306767263-29895-16-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 15/17] package.bbclass: add Qt translation support into package_do_split_locales
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
X-List-Received-Date: Mon, 30 May 2011 14:58:22 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/package.bbclass |   41 +++++++++++++++++++++++++++++++++++++----
 1 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 2b98049..f45b4d8 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -314,6 +314,8 @@ python package_do_split_locales() {
 		bb.debug(1, "package requested not splitting locales")
 		return
 
+	import re
+
 	packages = (bb.data.getVar('PACKAGES', d, True) or "").split()
 
 	datadir = bb.data.getVar('datadir', d, True)
@@ -329,12 +331,29 @@ python package_do_split_locales() {
 
 	localedir = os.path.join(dvar + datadir, 'locale')
 
-	if not os.path.isdir(localedir):
+	locales = []
+	if os.path.isdir(localedir):
+		locales = os.listdir(localedir)
+
+	# Check of Qt translation files
+	qm_re = re.compile("(.*)\.qm$")
+	qm_files = {}
+	for root, dirs, files in os.walk(dvar):
+		for file in files:
+			qm_file = qm_re.match(file)
+			if qm_file:
+				locale = qm_file.group(1)
+				relpath = os.path.join(root, file).replace(dvar + '/', '', 1)
+				if relpath:
+					if not qm_files.has_key(locale):
+						qm_files[locale] = []
+
+					qm_files[locale].append(relpath)
+
+	if len(locales) == 0 and len(qm_files) == 0:
 		bb.debug(1, "No locale files in this package")
 		return
 
-	locales = os.listdir(localedir)
-
 	# This is *really* broken
 	mainpkg = packages[0]
 	# At least try and patch it up I guess...
@@ -343,11 +362,25 @@ python package_do_split_locales() {
 	if mainpkg.find('-dev'):
 		mainpkg = mainpkg.replace('-dev', '')
 
+	# Queue Qt locales for spliting
+	for l in qm_files.keys():
+		if l not in locales:
+			locales.append(l)
+
 	for l in locales:
 		ln = legitimize_package_name(l)
 		pkg = pn + '-locale-' + ln
 		packages.append(pkg)
-		bb.data.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l), d)
+
+		files = []
+		files.append(os.path.join(datadir, 'locale', l))
+
+		if qm_files.has_key(l):
+			locale_re = re.compile("^.*([a-z]{2}(_[A-Z]{2})?)$")
+			ln = legitimize_package_name(locale_re.match(l).group(1))
+			files += qm_files[l]
+
+		bb.data.setVar('FILES_' + pkg, " ".join(files), d)
 		bb.data.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (mainpkg, ln), d)
 		bb.data.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln), d)
 		bb.data.setVar('DESCRIPTION_' + pkg, '%s translation for %s' % (l, pn), d)
-- 
1.7.1



