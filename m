Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5wy4-0004Fq-OG
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 11:22:37 +0100
Received: by wera1 with SMTP id a1so1016550wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 02:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=92W2FINmtNwbICAkKEvRNzeYVg1EuJ6krvCEGYuYEfk=;
	b=CxQyqpB5V65PppoDq9wGCy132uVVhFp0j6e8enMEOE/PwIrFabR/aV8ohrLwA6kVUN
	oWDzSkF3vZUsnkC/y4LIdolz3r5ueXDsCeHl2txw08zhlOuu4xm5vbHGKcnWhAuK3wAA
	7Vo84MjSChfEgFyjfaijNZSFSAauIFcpjkb9srPVH969qIjwxiRRTHzpCrU6ulvrUifL
	7dbXEeITeiinSWOflLrgrh8HQmA3ZojJQp+5JTyl29duNFLvvnrvMrgwb/QqFe7c0mrB
	Mgam51xUajPpnENi5v9CaVCZwhJlFe6VALROBF74Z6hkxr+gA0CVs7RH+g8idE9hv7Ha
	W6bw==
Received: by 10.180.95.74 with SMTP id di10mr4419918wib.1.1331288037699;
	Fri, 09 Mar 2012 02:13:57 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id bg3sm3899212wib.10.2012.03.09.02.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 02:13:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 11:13:51 +0100
Message-Id: <1331288035-9678-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
References: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/6] cherokee: no need for cherokee.inc since it is used only once
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
X-List-Received-Date: Fri, 09 Mar 2012 10:22:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/cherokee/cherokee.inc |   50 --------------------
 .../cherokee/cherokee_1.2.98.bb                    |   49 ++++++++++++++++++-
 2 files changed, 47 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/cherokee/cherokee.inc

diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee.inc b/meta-oe/recipes-connectivity/cherokee/cherokee.inc
deleted file mode 100644
index 1e09dbf..0000000
--- a/meta-oe/recipes-connectivity/cherokee/cherokee.inc
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION = "Cherokee Web Server fast and secure"
-DESCRIPTION_cget = "Small downloader based in the Cherokee client library"
-HOMEPAGE = "http://www.cherokee-project.com/"
-SECTION = "network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-INC_PR = "r0"
-
-DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SRC_URI = "http://www.cherokee-project.com/download/1.2/${PV}/cherokee-${PV}.tar.gz \
-           file://cherokee.init \
-           file://cherokee.service"
-
-
-inherit autotools pkgconfig binconfig update-rc.d
-
-EXTRA_OECONF = "--disable-static \
-                --disable-nls \
-               ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
-               "
-
-do_install_append () {
-	install -m 0755 -d ${D}${sysconfdir}/init.d
-	install -m 755 ${WORKDIR}/cherokee.init ${D}${sysconfdir}/init.d/cherokee
-
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/*.service ${D}${base_libdir}/systemd/system/
-
-	# clean up .la files for plugins
-	rm -f ${D}${libdir}/cherokee/*.la
-}
-
-# Put -dev near the front so we can move the .la files into it with a wildcard
-PACKAGES =+ "libcherokee-server libcherokee-client libcherokee-base cget"
-
-FILES_${PN} += "${base_libdir}/systemd"
-FILES_cget = "${bindir}/cget"
-FILES_libcherokee-server = "${libdir}/libcherokee-server${SOLIBS}"
-FILES_libcherokee-client = "${libdir}/libcherokee-client${SOLIBS}"
-FILES_libcherokee-base = "${libdir}/libcherokee-base${SOLIBS}"
-
-CONFFILES_${PN} = " \
-                   ${sysconfdir}/cherokee/cherokee.conf \
-                   ${sysconfdir}/init.d/cherokee \
-                  "
-
-INITSCRIPT_NAME = "cherokee"
-INITSCRIPT_PARAMS = "defaults 91 91"
diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
index 86b3721..93bb191 100644
--- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
+++ b/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
@@ -1,6 +1,51 @@
-require cherokee.inc
+DESCRIPTION = "Cherokee Web Server fast and secure"
+DESCRIPTION_cget = "Small downloader based in the Cherokee client library"
+HOMEPAGE = "http://www.cherokee-project.com/"
+SECTION = "network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-PR = "${INC_PR}.0"
+PR = "r1"
 
+DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SRC_URI = "http://www.cherokee-project.com/download/1.2/${PV}/cherokee-${PV}.tar.gz \
+           file://cherokee.init \
+           file://cherokee.service"
 SRC_URI[md5sum] = "21b01e7d45c0e82ecc0c4257a9c27feb"
 SRC_URI[sha256sum] = "042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a078b7d"
+
+inherit autotools pkgconfig binconfig update-rc.d
+
+EXTRA_OECONF = "--disable-static \
+                --disable-nls \
+               ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+               "
+
+do_install_append () {
+	install -m 0755 -d ${D}${sysconfdir}/init.d
+	install -m 755 ${WORKDIR}/cherokee.init ${D}${sysconfdir}/init.d/cherokee
+
+	install -d ${D}${base_libdir}/systemd/system
+	install -m 0644 ${WORKDIR}/*.service ${D}${base_libdir}/systemd/system/
+
+	# clean up .la files for plugins
+	rm -f ${D}${libdir}/cherokee/*.la
+}
+
+# Put -dev near the front so we can move the .la files into it with a wildcard
+PACKAGES =+ "libcherokee-server libcherokee-client libcherokee-base cget"
+
+FILES_${PN} += "${base_libdir}/systemd"
+FILES_cget = "${bindir}/cget"
+FILES_libcherokee-server = "${libdir}/libcherokee-server${SOLIBS}"
+FILES_libcherokee-client = "${libdir}/libcherokee-client${SOLIBS}"
+FILES_libcherokee-base = "${libdir}/libcherokee-base${SOLIBS}"
+
+CONFFILES_${PN} = " \
+                   ${sysconfdir}/cherokee/cherokee.conf \
+                   ${sysconfdir}/init.d/cherokee \
+                  "
+
+INITSCRIPT_NAME = "cherokee"
+INITSCRIPT_PARAMS = "defaults 91 91"
-- 
1.7.6.4



