Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 42FCD601A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 01:34:04 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 145so360830pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2016 18:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lfpMA7mmWdDGQzLjtdeJsNkk41QIuQHIEd8MstARZSA=;
	b=WeEPlWwMmwsknMW7yEMwx58ISl+c++Y/ThYcz5NPfnHxQq+tLaVzhwYkBJHqzOU6Gg
	c0dg4ZWU9WGPOBqJHHksLWZkqf4YSDNFU710yQt224WlTDy3B/ykqvbh9/UCJevWw4bN
	atUVZbcy9NeBgY/uSzQyFNvJiw9Usu69P5JsNPPY+NSoDoD6Os6rKn5aSKG5xKm4daUz
	68kwMVe/z16GlZT6MA/IOQuvp4A5zsljWscGUhjLGqlqANHqMI3oyaf+j+WqDK5m4T1T
	PTNurW9Yk2iqJStAqIIW2WO2x1uT+1q2te8Qg9xSBmpJzVnxQimSueVFzT/J2zDikxij
	wF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lfpMA7mmWdDGQzLjtdeJsNkk41QIuQHIEd8MstARZSA=;
	b=ZdK9qlp9ULD/oFlKdeITmlJmn9NZKkwHnBD//gciBUuY+aO08uGUKT9CnkBvdAPjaZ
	35gUvKYL4a3CtYGSrIO6w9QFFphQtreIL88Rb7adQO6/dQr00xanFzmnvmGROWYKECV0
	r8Th3p2V3im1r8f0bo+5zsFzqxAAiOGWmXxe7P+TdxFhNdv094qTetnIy3Enu5g5ypzR
	nCUCDKASYrw4EvBmm9+yUCrj66yoB+v40YKwBEpB1b+cc9JpnhrkWVLlZjACUZ29EjLE
	8EWELFKZCdg2nIFoFm3lhKpnjKoFdANE6DnCrhlbu5elVQJWDUo11NczeMtuoqWe21tt
	v7Xw==
X-Gm-Message-State: ALyK8tI1M0zXEyzu4ZL4C4GUaKrJDyLmwDL7+A71W2sSDSiA9M2fX5rwLsj4ckq2kw6Wkg==
X-Received: by 10.98.58.156 with SMTP id v28mr2652899pfj.137.1464053644730;
	Mon, 23 May 2016 18:34:04 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	n190sm49499103pfn.23.2016.05.23.18.34.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 May 2016 18:34:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Mon, 23 May 2016 18:34:00 -0700
Message-Id: <1464053640-24977-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] opensaf: update to 5.0.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 01:34:06 -0000

clean up to meet style guide

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../opensaf/{opensaf_4.7.0.bb => opensaf_5.0.0.bb} | 37 ++++++++++------------
 1 file changed, 17 insertions(+), 20 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_4.7.0.bb => opensaf_5.0.0.bb} (94%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
similarity index 94%
rename from meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
index 42e883a..f687378 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.7.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
@@ -10,22 +10,21 @@ an informal group of supporters of the OpenSAF initiative. The OpenSAF \
 Foundation was founded on January 22nd 2008 with Emerson Network Power, \
 Ericsson, Nokia Siemens Networks, HP and Sun Microsystems as founding members."
 HOMEPAGE = "http://www.opensaf.org"
+SECTION = "admin"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
 
-inherit autotools useradd systemd pkgconfig
+DEPENDS = "libxml2 python"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://install-samples-from-srcdir.patch \
            file://0001-plmcd-error-fix.patch \
            "
 
-SRC_URI[md5sum] = "82dd2777a672140e22b8205f10aa55d3"
-SRC_URI[sha256sum] = "da9e138650b835728ad51d99268d3a31419b254c4cb4e87c6ec90bc45266d7d2"
-
-SECTION = "admin"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
+SRC_URI[md5sum] = "94cd1a4c0406e6a45bb04c003f8690e7"
+SRC_URI[sha256sum] = "4b4188a0f3d0ed1ed0e3d77de27c45e2c96b437401de08e7df2ed9ecd54bb999"
 
-DEPENDS = "libxml2 python"
+inherit autotools useradd systemd pkgconfig
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-f -r opensaf"
@@ -37,22 +36,14 @@ SYSTEMD_AUTO_ENABLE = "disable"
 PACKAGECONFIG[systemd] = "--enable-systemd-daemon"
 PACKAGECONFIG[openhpi] = "--with-hpi-interface=B03 --enable-ais-plm,,openhpi"
 
-do_configure_prepend () {
-        ( cd ${S}; autoreconf -f -i -s )
-}
-
 EXTRA_OECONF += " --libdir=${libdir}/opensaf "
 EXTRA_OEMAKE += " -Wl,-rpath,${libdir}/opensaf "
 
 PKGLIBDIR="${libdir}/opensaf/opensaf"
 
-FILES_${PN} += "${localstatedir}/run"
-
-FILES_${PN}-staticdev += "${PKGLIBDIR}/*.a"
-
-RDEPENDS_${PN} += "bash python"
-
-INSANE_SKIP_${PN} = "dev-so"
+do_configure_prepend () {
+        ( cd ${S}; autoreconf -f -i -s )
+}
 
 do_install_append() {
     rm -fr "${D}${localstatedir}/lock"
@@ -62,5 +53,11 @@ do_install_append() {
     install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
         ${D}${systemd_unitdir}/system
     install -m 0644 ${B}/contrib/plmc/config/*.service ${D}/${systemd_unitdir}/system
-
 }
+
+FILES_${PN} += "${localstatedir}/run"
+FILES_${PN}-staticdev += "${PKGLIBDIR}/*.a"
+
+INSANE_SKIP_${PN} = "dev-so"
+
+RDEPENDS_${PN} += "bash python"
-- 
2.3.5


