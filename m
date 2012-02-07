Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqr-0001KV-AB
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:01 +0100
Received: by eaal10 with SMTP id l10so1955924eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=BAEFdm1s3v/DRTXi3GN9HOcmv5843WA0oE2tUeaa4tg=;
	b=uXfK80cGhIC806gwaFCS9p5qC0VwP55xikjpbR9YTFkWWJvvXhZuNzsgYLUVriWdyP
	TojCY2nBVQ+29uUqe8fdanESWDwMqaBUUkrhQ1jsbGnyDiCmivojDi4JbM0I/3/vcfmf
	BjEknEbNfSI6JDy+m6r8rltL6QnjavwOkR6Xg=
Received: by 10.213.17.19 with SMTP id q19mr3707679eba.85.1328627579084;
	Tue, 07 Feb 2012 07:12:59 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.12.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:12:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:33 +0100
Message-Id: <1328627573-5217-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 07/27] gateone: remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/gateone/gateone_git.bb    |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 4f9684c..e54acf6 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=07d5a2790569bd3e3b422b69ccd43bec"
 
-PR = "r15"
+PR = "r16"
 
 PV = "0.9"
 SRCREV = "a68444610efa2892842893dae828a28527e64a6e"
@@ -20,14 +20,11 @@ export prefix = "${localstatedir}/lib"
 do_install_append() {
 	install -d ${D}${localstatedir}/log/${BPN}
 
-	install -m 0755 -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/gateone.service ${D}${base_libdir}/systemd/system/
-
 	install -m 0755 -d ${D}${sysconfdir}/avahi/services/
 	install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
 }
 
-SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "gateone.service"
 
 FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${base_libdir} ${sysconfdir}"
-- 
1.7.6.4



