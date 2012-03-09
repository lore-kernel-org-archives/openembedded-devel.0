Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5wy6-0004Fp-RJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 11:22:38 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so1016539wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 02:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=yOJ46hlt3RRmwxIcUArNvv/5C4M3taD1yq8uuzk0oho=;
	b=ScLrvaNJcMh1z13b/hZP/0sKboJS4eOQey2vZh9VcGuK7F6nHFJEcJq6zu+y6ZqE4P
	OQCZw0/2jqFCTY8C1Cg21dWC0KMlchYSkGJElJgVwpiIFXZQR5YIFgaVLijdHaweJfgs
	4h9lDj9gz+kul8y5gYEkyU7jtQ2FHsC5qNqKHGCxox70w50/CRNyz2VmSY0ACS+HN1zy
	/E0L7vBpHL0O0eilXjVz7ypCLmC5XanU0jW2aHP5jH45bLYGW/Ndyz5SZKI3yB8q6Djy
	f9GQghEyE6mzZBsCEuB5VestDa6A8ySyPm7b1KwhHWfpqUj2HUhKt94iRGt4TT4vWJbp
	NsXw==
Received: by 10.180.91.10 with SMTP id ca10mr3285105wib.17.1331288040701;
	Fri, 09 Mar 2012 02:14:00 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id bg3sm3899212wib.10.2012.03.09.02.13.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 02:13:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 11:13:53 +0100
Message-Id: <1331288035-9678-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
References: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 4/6] gdm: inherit systemd / remove unneeded systemd code
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
X-List-Received-Date: Fri, 09 Mar 2012 10:22:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb |   29 +++------------------------
 1 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 684e7f7..d71c7d8 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r6"
+PR = "r7"
 
-inherit gnome update-rc.d
+inherit gnome update-rc.d systemd
 
 SRC_URI += " \
             file://cross-xdetection.diff \
@@ -46,31 +46,10 @@ do_install_append() {
 	install -d ${D}/${sysconfdir}/gdm/Init
 	install -m 0755 ${WORKDIR}/Default ${D}/${sysconfdir}/gdm/Init
 
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/gdm.service ${D}${base_libdir}/systemd/system/ 
 }
 
-PACKAGES =+ "gdm-systemd"
-FILES_gdm-systemd = "${base_libdir}/systemd"
-RDEPENDS_gdm-systemd = "gdm"
-
-pkg_postinst_gdm-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-	
-	systemctl enable gdm.service
-}
-
-pkg_postrm_gdm-systemd() {
-	# can't do this offline
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	systemctl disable gdm.service
-}
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "gdm.service"
 
 FILES_${PN} += "${datadir}/icon* \
 		${datadir}/xsession* \
-- 
1.7.6.4



