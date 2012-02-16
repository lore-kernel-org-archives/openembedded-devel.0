Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqlv-00063p-Mn
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:35 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479837eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=pdyseh/6plA34ysYQU1zQLZApe4h6g1RFVTsE2gahk4=;
	b=XWCBfUfwmg3TDVu8bCuB1i0tWIx+/0vkaD75dmrciux9yddoYuPN27UKJOUo2pX1T1
	44plsBZzmqXmjXHmUUAGuETcUTPmwDGfTWjaTxmUVieuRKJ8qxwYkzS/8/6Pi6pGlqT6
	fQVlPhWSjrR2xW6x+YAXlVD3U8K5cvObAnjI8=
Received: by 10.14.131.13 with SMTP id l13mr339748eei.45.1329357625536;
	Wed, 15 Feb 2012 18:00:25 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:00 +0100
Message-Id: <1329357796-27398-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 06/22] systemd.bbclass: automatically extend FILES_* for systemd packages
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add files found in SYSTEMD_SERVICE and add service files found at 'Also='
recursively. In case a file set in SYSTEMD_SERVICE build is aborted with an
error message.
For recipes with one *-systemd package and one service additional files are
packed:

* all *@.service
* some recipes add links to /dev/null. These are found by parsing also for
  'Conflicts='

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   64 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 64 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index b2cf775..1e0f3e0 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -124,7 +124,71 @@ python populate_packages_prepend () {
 		rdepends.append("systemd")
 		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
 
+	# add files to FILES_*-systemd if not already done
+	def systemd_append_file(pkg_systemd, file_append):
+		if os.path.exists(d.getVar('D', 1) + file_append):
+			var_name = "FILES_" + pkg_systemd
+			files = d.getVar(var_name, 0) or ""
+			d.setVar(var_name, "%s %s" % (files, file_append))
+		else:
+			bb.debug(1, '%s is not appended to package %s' % (file_append, pkg_systemd))
+
+	# add systemd files to FILES_*-systemd, parse for Also= and follow recursive
+	def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
+		systemd_append_file(pkg_systemd, path + service)
+		fullpath = d.getVar('D', 1) + path + service
+		for key in keys.split():
+			# recurse all 'also' dependencies and add to files
+			cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, fullpath, key)
+			pipe = os.popen(cmd, 'r')
+			line = pipe.readline()
+			while line:
+				line = line.replace('\n', '')
+				systemd_add_files_and_parse(pkg_systemd, path, line, keys)
+				line = pipe.readline()
+			pipe.close()
+
+	# check service-files and call systemd_add_files_and_parse for each entry
+	def systemd_check_services():
+		root = d.getVar('D', 1)
+		searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
+		systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
+		has_exactly_one_service = len(systemd_packages.split()) == 1
+		if has_exactly_one_service:
+			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + systemd_packages, 1) or d.getVar('SYSTEMD_SERVICE', 1)
+			has_exactly_one_service = len(systemd_services.split()) == 1
+
+		keys = 'Also' # Conflicts??
+		# to match more cases, single service get's more
+		if has_exactly_one_service:
+			# single service gets also the /dev/null dummies
+			keys = 'Also Conflicts'
+			# parse *@.service files for recipes with one service
+			for path in searchpaths.split():
+				cmd = "find ${D}/%s -maxdepth 1 -name '*@.service'" % path
+				pipe = os.popen(cmd, 'r')
+				line = pipe.readline()
+				while line:
+					line = os.path.basename(line.replace('\n', ''))
+					systemd_add_files_and_parse(systemd_packages, path, line, keys)
+					line = pipe.readline()
+				pipe.close()
+		# scan for all in SYSTEMD_SERVICE[]
+		for pkg_systemd in systemd_packages.split():
+			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1)
+			for service in systemd_services.split():
+				path_found = ''
+				for path in searchpaths.split():
+					if os.path.exists(root + path + service):
+						path_found = path
+				if path_found != '':
+					systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
+				else:
+					raise bb.build.FuncFailed, "\n\nFor package %s SYSTEMD_SERVICE-entry %s does not exist" % \
+						(pkg_systemd, service)
+
 
 	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
 		systemd_generate_package_scripts(pkg_systemd)
+	systemd_check_services()
 }
-- 
1.7.4.4



