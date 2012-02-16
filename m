Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm7-00063o-LD
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:47 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479834eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=69QtyLcQ2QcdOf2eAAPzMDrl//dgSFJtX1VlWHAgNmc=;
	b=BBOrNHcxgqf3Lu0IN8e40NomwgUprW/YyHQUCiVwYpFS0lGI4am99yUGhkq3IJCdiJ
	8Nq2mLcVJyNKbfXjm6EbTQQO2VsZzLo4IkAV/jLwHU3hMswKJB6Zwexr2ypi8M+e4Svi
	YnVOf0N7K6qkD54PmqS41UNRDLoUX972VXbo0=
Received: by 10.14.181.193 with SMTP id l41mr356575eem.26.1329357637491;
	Wed, 15 Feb 2012 18:00:37 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:14 +0100
Message-Id: <1329357796-27398-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 20/22] busybox: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/busybox/busybox_1.19.3.bbappend   |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
index 7e72a43..6b62bd7 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
@@ -15,7 +15,6 @@ SYSTEMD_SERVICE_${PN}-syslog-systemd = "busybox-syslog.service"
 do_install_append() {
 	install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/default/busybox-syslog
 
-	install -d ${D}${base_libdir}/systemd/system
 	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-syslog.service.in \
 	     > ${D}${base_libdir}/systemd/system/busybox-syslog.service
 	sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busybox-klogd.service.in \
@@ -24,7 +23,4 @@ do_install_append() {
 	ln -sf /dev/null ${D}${base_libdir}/systemd/system/syslog.service
 }
 
-PACKAGES += "${PN}-syslog-systemd"
-
-RDEPENDS_${PN}-syslog-systemd += "${PN}-syslog"
-FILES_${PN}-syslog-systemd = "${base_libdir}/systemd"
+FILES_${PN}-syslog-systemd += "${base_libdir}/systemd/system/syslog.service"
-- 
1.7.4.4



