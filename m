Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumr6-0001JM-FH
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:17 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181062eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=JigjtWoyJTPDTYCk0LZrQ72CQxGpXgplSS2xDCdoFLY=;
	b=VgOPdcB3ejK5VSz4ohPVdf3/ejkxldW9WtKThK2goyze4Aes3fPlok96faxccUwZwR
	adbdzHjSsDW5jEUWfDXC5SwmcDgB5ohAzo16QzdRaOPh/WWfePo7ungeMsrnRwsFfakX
	FeAfTSfAp5bhMerjIDeeq0yipvHwa1wc8bYH4=
Received: by 10.14.52.7 with SMTP id d7mr7170772eec.80.1328627596427;
	Tue, 07 Feb 2012 07:13:16 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:48 +0100
Message-Id: <1328627573-5217-23-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 22/27] cherokee: inherit systemd / added systemd native support / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/cherokee/cherokee.inc |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee.inc b/meta-oe/recipes-connectivity/cherokee/cherokee.inc
index 114dbba..b9a0533 100644
--- a/meta-oe/recipes-connectivity/cherokee/cherokee.inc
+++ b/meta-oe/recipes-connectivity/cherokee/cherokee.inc
@@ -5,7 +5,7 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 DEPENDS = "libpcre openssl ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -14,7 +14,7 @@ SRC_URI = "http://www.cherokee-project.com/download/1.2/${PV}/cherokee-${PV}.tar
            file://cherokee.service"
 
 
-inherit autotools pkgconfig binconfig update-rc.d
+inherit autotools pkgconfig binconfig update-rc.d systemd
 
 EXTRA_OECONF = "--disable-static \
                 --disable-nls \
@@ -25,9 +25,6 @@ do_install_append () {
 	install -m 0755 -d ${D}${sysconfdir}/init.d
 	install -m 755 ${WORKDIR}/cherokee.init ${D}${sysconfdir}/init.d/cherokee
 
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/*.service ${D}${base_libdir}/systemd/system/
-
 	# clean up .la files for plugins
 	rm -f ${D}${libdir}/cherokee/*.la
 }
@@ -35,7 +32,6 @@ do_install_append () {
 # Put -dev near the front so we can move the .la files into it with a wildcard
 PACKAGES =+ "libcherokee-server libcherokee-client libcherokee-base cget"
 
-FILES_${PN} += "${base_libdir}/systemd"
 FILES_cget = "${bindir}/cget"
 FILES_libcherokee-server = "${libdir}/libcherokee-server${SOLIBS}"
 FILES_libcherokee-client = "${libdir}/libcherokee-client${SOLIBS}"
@@ -48,3 +44,6 @@ CONFFILES_${PN} = " \
 
 INITSCRIPT_NAME = "cherokee"
 INITSCRIPT_PARAMS = "defaults 91 91"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "cherokee.service"
-- 
1.7.6.4



