Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdj-0004lK-5G
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:15 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so506553eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.38.193 as permitted sender)
	client-ip=10.14.38.193; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.38.193 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.38.193])
	by 10.14.38.193 with SMTP id a41mr679217eeb.125.1329999056200 (num_hops
	= 1); Thu, 23 Feb 2012 04:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=r1dbSeFFw0lYKA4BSkMqObKkOJNT8yVaVFKPxV2ZMME=;
	b=H9u1L0BdM0nhl1W7wym+ksWeHkwgPttMpHmHDoaNvNYVKcQcXKcy5Pps3QEfG9gmQ4
	DrkI9AlAM2DJHZdGqLd47zYdOT2K1tXjwfoKSZP2R2nQ1Unzz8ix08MMdT9w4+HWNsD6
	1mkiVEk5oMyNCePvH0A59HHyb9FcFEPvL0X5c=
Received: by 10.14.38.193 with SMTP id a41mr539452eeb.125.1329999056096;
	Thu, 23 Feb 2012 04:10:56 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.10.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:10:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:39 +0100
Message-Id: <1329999054-23112-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 08/23] systemd.bbclass: automatically extend FILES_* for systemd packages
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Add files found in SYSTEMD_SERVICE and add service files referenced by 'Also='
  (and 'Conflicts=' in case of one service for links to /dev/null) recursively.
* For *.socket files the corresponding '*.service' and '*@.service are packed
* In case a file set in SYSTEMD_SERVICE does not exist, build is aborted with an
   error message.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   60 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index e13f09d..c712e17 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -126,9 +126,69 @@ python populate_packages_prepend () {
 		rdepends.append("systemd")
 		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
 
+	# add files to FILES_*-systemd if existent and not already done
+	def systemd_append_file(pkg_systemd, file_append):
+		appended = False
+		if os.path.exists('${D}' + file_append):
+			var_name = "FILES_" + pkg_systemd
+			files = d.getVar(var_name, 0) or ""
+			if file_append not in files.split():
+				d.setVar(var_name, "%s %s" % (files, file_append))
+				appended = True
+		return appended
+
+	# add systemd files to FILES_*-systemd, parse for Also= and follow recursive
+	def systemd_add_files_and_parse(pkg_systemd, path, service, keys):
+		# avoid infinite recursion
+		if systemd_append_file(pkg_systemd, path + service):
+			fullpath = '${D}' + path + service
+			if service.find('.socket') != -1:
+				# for *.socket add *.service and *@.service
+				service_base = service.replace('.socket', '')
+				systemd_add_files_and_parse(pkg_systemd, path, service_base + '.service', keys)
+				systemd_add_files_and_parse(pkg_systemd, path, service_base + '@.service', keys)
+			for key in keys.split():
+				# recurse all dependencies found in keys ('Also';'Conflicts';..) and add to files
+				cmd = "grep %s %s | sed 's,%s=,,g' | tr ',' '\\n'" % (key, fullpath, key)
+				pipe = os.popen(cmd, 'r')
+				line = pipe.readline()
+				while line:
+					line = line.replace('\n', '')
+					systemd_add_files_and_parse(pkg_systemd, path, line, keys)
+					line = pipe.readline()
+				pipe.close()
+
+	# check service-files and call systemd_add_files_and_parse for each entry
+	def systemd_check_services():
+		searchpaths = '/etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/'
+		systemd_packages = d.getVar('SYSTEMD_PACKAGES', 1)
+		has_exactly_one_service = len(systemd_packages.split()) == 1
+		if has_exactly_one_service:
+			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + systemd_packages, 1) or d.getVar('SYSTEMD_SERVICE', 1)
+			has_exactly_one_service = len(systemd_services.split()) == 1
+
+		keys = 'Also' # Conflicts??
+		if has_exactly_one_service:
+			# single service gets also the /dev/null dummies
+			keys = 'Also Conflicts'
+		# scan for all in SYSTEMD_SERVICE[]
+		for pkg_systemd in systemd_packages.split():
+			systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1)
+			for service in systemd_services.split():
+				path_found = ''
+				for path in searchpaths.split():
+					if os.path.exists('${D}' + path + service):
+						path_found = path
+				if path_found != '':
+					systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
+				else:
+					raise bb.build.FuncFailed, "\n\nFor package %s SYSTEMD_SERVICE-entry %s does not exist" % \
+						(pkg_systemd, service)
+
 
 	# run all modifications once when creating package
 	if os.path.exists('${D}'):
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
 			systemd_generate_package_scripts(pkg_systemd)
+		systemd_check_services()
 }
-- 
1.7.6.4



