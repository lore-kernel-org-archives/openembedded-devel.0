Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumr4-0001Jt-Ji
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:14 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1955916eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=VG8T/5FD5ijP1DprEi4zctsEUGoL5eB7fXcOrhcMt9U=;
	b=Msofh1kIn5PVQysR+WVcvPsuGxakamOoI8mQEvP8trGWcI6j+QQBY1wfuC5OHHhNZN
	f4Pgre/swHnf3/aIVi7Gcgcp9xofBTIaLFk4PcnKyk7a23eauniNGlqSvwM3FOVEjOnD
	TzUo2GtjMXYNLyUvfZkHefbRdZz/hn8McnV18=
Received: by 10.213.113.211 with SMTP id b19mr2226136ebq.34.1328627594493;
	Tue, 07 Feb 2012 07:13:14 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:13 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:46 +0100
Message-Id: <1328627573-5217-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 20/27] syslog-ng: conditional --enable-systemd --with-systemdsystemunitdir / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 3bbebec..ddd62b4 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
 # update-rc.d and update-alternatives is important
 RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 inherit autotools systemd
 
@@ -25,8 +25,7 @@ EXTRA_OECONF = " \
   --disable-linux-caps \
   --disable-pcre \
   --disable-sql \
-  --enable-systemd \
-  --with-systemdsystemunitdir=${base_libdir}/systemd/system \
+  ${@base_conditional('INIT_MANAGER', 'systemd', '--enable-systemd --with-systemdsystemunitdir=${base_libdir}/systemd/system', '', d)} \
 "
 
 do_configure_prepend() {
@@ -47,11 +46,6 @@ do_install_append() {
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "${PN}.service"
 
-PACKAGES =+ "${PN}-systemd"
-
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "${PN}"
-
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
-- 
1.7.6.4



