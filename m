Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5wy3-0004Fp-Ql
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 11:22:35 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so1016539wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 02:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=PWOmalJxfiI43/HlgzipvbjxiZLN75YCemw+jiy+uUQ=;
	b=TkVQlGSy/JEvt3qDMYpC9j4xTNd5mI0iE+ODZgq/NCqmb4wsn90L1pR+VT/ydKN6jZ
	GOSUsa0t0uOXZ61uvnjwA2dQpnf1N9sZjf0TCZDULA1CtQiCmLbwWP3sppmahd5zOrOm
	4N3i6Z+f3LtO2XD0qBpTU9P9ZNtI8iekXEbOP0v7Q5w8le464QU+3F9pQ4q8wLJVbrjD
	PMz4oWs8e9zkZszxrtUA8XhncaURFmy2HAGtYOYOcvF2EEuLieBautMl3jvdVeTb4I1n
	lBLQpvbQC0XYS5A6aqxksGSt+Bgj4BaI7fPVBUXGvK8LhQkj6S14LJfooMIj2jhCs6KQ
	uQGg==
Received: by 10.216.136.100 with SMTP id v78mr1036802wei.88.1331288038933;
	Fri, 09 Mar 2012 02:13:58 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id bg3sm3899212wib.10.2012.03.09.02.13.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 02:13:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 11:13:52 +0100
Message-Id: <1331288035-9678-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
References: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 3/6] cherokee: complete systemd native support
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
X-List-Received-Date: Fri, 09 Mar 2012 10:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../cherokee/cherokee_1.2.98.bb                    |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
index 93bb191..0080195 100644
--- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
+++ b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
@@ -5,7 +5,7 @@ SECTION = "network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "r1"
+PR = "r3"
 
 DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -15,7 +15,7 @@ SRC_URI = "http://www.cherokee-project.com/download/1.2/${PV}/cherokee-${PV}.tar
 SRC_URI[md5sum] = "21b01e7d45c0e82ecc0c4257a9c27feb"
 SRC_URI[sha256sum] = "042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a078b7d"
 
-inherit autotools pkgconfig binconfig update-rc.d
+inherit autotools pkgconfig binconfig update-rc.d systemd
 
 EXTRA_OECONF = "--disable-static \
                 --disable-nls \
@@ -26,9 +26,6 @@ do_install_append () {
 	install -m 0755 -d ${D}${sysconfdir}/init.d
 	install -m 755 ${WORKDIR}/cherokee.init ${D}${sysconfdir}/init.d/cherokee
 
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/*.service ${D}${base_libdir}/systemd/system/
-
 	# clean up .la files for plugins
 	rm -f ${D}${libdir}/cherokee/*.la
 }
@@ -36,7 +33,6 @@ do_install_append () {
 # Put -dev near the front so we can move the .la files into it with a wildcard
 PACKAGES =+ "libcherokee-server libcherokee-client libcherokee-base cget"
 
-FILES_${PN} += "${base_libdir}/systemd"
 FILES_cget = "${bindir}/cget"
 FILES_libcherokee-server = "${libdir}/libcherokee-server${SOLIBS}"
 FILES_libcherokee-client = "${libdir}/libcherokee-client${SOLIBS}"
@@ -49,3 +45,6 @@ CONFFILES_${PN} = " \
 
 INITSCRIPT_NAME = "cherokee"
 INITSCRIPT_PARAMS = "defaults 91 91"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "cherokee.service"
-- 
1.7.6.4



