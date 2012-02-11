Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rw2L7-0002Gd-NI
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 03:05:30 +0100
Received: by eekd41 with SMTP id d41so937544eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 17:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=FaenYVHAFW1XYl2VLQg8dktZDK0HRa81Qqs+HCpbsic=;
	b=QIHUltBlxdagMNNZ3aiIhagzr3/y2pUVNjj1P3HJwvBtEl1R3SBgclPNL3z+1MPmbS
	ULZXQBrenee0ChxqP0EmYVuSLFnGcT5IRAmDi1R2qDuP4laCZrTWJ4kq2WGNSHvC5p3U
	TuO16Bo+Oaggjx39zsMP8ZxJgYLdwbH81rY7U=
Received: by 10.213.101.20 with SMTP id a20mr680311ebo.83.1328925437882;
	Fri, 10 Feb 2012 17:57:17 -0800 (PST)
Received: from localhost.localdomain (p5B0A16A6.dip.t-dialin.net.
	[91.10.22.166])
	by mx.google.com with ESMTPS id n17sm29065006eei.3.2012.02.10.17.57.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 17:57:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2012 03:00:02 +0100
Message-Id: <1328925603-2967-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328925603-2967-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 6/7] systemd.bbclass: automatically extend FILES_* for systemd packages
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

In case SYSTEMD_SERVICE contains only one *.service file, the whole folder
${base_libdir}/systemd/system/ is added to FILES_* otherwise only the *.service
files found in SYSTEMD_SERVICE.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/systemd.bbclass |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index 3c1ed14..8927980 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -120,7 +120,23 @@ python populate_packages_prepend () {
 		rdepends.append("systemd")
 		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
 
+	# add systemd files to FILES_*-systemd
+	def systemd_add_files(pkg_systemd):
+		systemd_services = d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) or d.getVar('SYSTEMD_SERVICE', 1)
+		files_append = ""
+		if len(systemd_services.split()) == 1:
+			# distribute complete ${base_libdir}/systemd/system/ to ${SYSTEMD_PACKAGES}
+			files_append = '${base_libdir}/systemd/system/'
+		else:
+			# distribute files set in SYSTEMD_SERVICE to ${SYSTEMD_PACKAGES}
+			for service in systemd_services.split():
+				files_append += ' ${base_libdir}/systemd/system/' + service
+
+		var_name = "FILES_" + pkg_systemd
+		files = d.getVar(var_name, 0) or ""
+		d.setVar(var_name, "%s %s" % (files, files_append))
 
 	for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
 		systemd_prepost_instrm(pkg_systemd)
+		systemd_add_files(pkg_systemd)
 }
-- 
1.7.4.4



