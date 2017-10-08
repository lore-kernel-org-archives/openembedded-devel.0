Return-Path: <danwalkes@trellis-logic.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 083B671A9D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Oct 2017 19:10:50 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 97so7283968iok.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Oct 2017 12:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=trellis-logic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=okUVB4i+agUhQmdsS1tCvjh3OnLulzo/gqZHV2Jjnpg=;
	b=q+DZacmySknZ8FrHKEVABhhRtqmUxuawlEGIUf4m1JLVyTp8huA5LAV8enuXXQ/3PL
	NBsk5L+uT4ZOVeb0SdEcaGxjgwXd2+/c1VMJQoxHfLrZaHcsn42dZdHWOI4UHrJnIsDj
	c7+s9R5JXEIsUKweWiMHA4nvKEAepLasSADjHMb4JwVyn6NxNXho0NUTWXE24a/fvZBU
	jCTnBVvlcGn4E8ypLNCz/sqqNqqSmqDZWn6iBsimR3ogyErqhgGLm8eNK7U865f60FOw
	c8rMlPOO//mpm9uic5Pwy0SHGEmfv782Trg/DaOlztXyas0moTshcrj0wTTNn5HWDFfh
	G4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=okUVB4i+agUhQmdsS1tCvjh3OnLulzo/gqZHV2Jjnpg=;
	b=XyefqA/ZPbSY/AFkZ/hHQOmTKV5K3gLomO62qe48pavxJQj/CqSFX/wqjTLsXsm5dw
	elSQ3T5/BvtHbtfFeA3i0qPVpc5dbiG/BNq4A3i953lgR1brFsdc0DiXxAHWC2/jKrS5
	cTdpGUw6R6DNYrUmYJodwEpH9qjOGmQ2fhRBuSQakA13KyGmffoHI90dmfHYK7kJa/Kf
	ooCAERL2hDXFrIPUF3wmp6WEGnrnMAtQiHiEKxsI865ZEA8RbKNhUPQ6jMbxVuzcK6AP
	Bs7LfbmTA+TD9aeVDi1AE66JeJVxi/Bxtq2+X0k/Ohgl7wLRNn5C6LFu9a/+JnFuMosN
	mHfg==
X-Gm-Message-State: AMCzsaVno8A82cgrNHnibwBb68oPlRUCLE7oz+kltph4mGRivYMT1uy8
	FdTgZv7PySW3vu/YS9C/r2q6g7CoO9s=
X-Google-Smtp-Source: AOwi7QDPWr5PM8J862B1YN97md0hjLSgmsqK7X/+yL++aTDp/O4gsY9V5VDogKHaMCzKQfVYRXE62Q==
X-Received: by 10.107.131.85 with SMTP id f82mr10787479iod.215.1507489851542; 
	Sun, 08 Oct 2017 12:10:51 -0700 (PDT)
Received: from dan-latm1.asdi.com (c-73-14-165-32.hsd1.co.comcast.net.
	[73.14.165.32]) by smtp.gmail.com with ESMTPSA id
	j83sm2995541ioi.57.2017.10.08.12.10.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Oct 2017 12:10:50 -0700 (PDT)
From: Dan Walkes <danwalkes@trellis-logic.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Oct 2017 13:05:23 -0600
Message-Id: <1507489523-13556-1-git-send-email-danwalkes@trellis-logic.com>
X-Mailer: git-send-email 2.7.4
Cc: Dan Walkes <danwalkes@trellis-logic.com>
Subject: [meta-oe][PATCH] Fix gpsd Yocto pyro build for read only rootfs
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
X-List-Received-Date: Sun, 08 Oct 2017 19:10:51 -0000

Attempting to include gpsd on Yocto pyro with IMAGE_FEATURES including
read-only-rootfs results in an error:
"The following packages could not be configured offline and rootfs is
read-only"

This stems from a failure during the do_rootfs steps where the /etc/init.d/gpsd
file is missing during the call to update-rc.d.

This happens because the /etc/init.d/gpsd file is installed during
package install for gpsd-conf instead of gpsd, and the default value for
INITSCRIPT_PACKAGES is PN.  To resolve, specify INITSCRIPT_PACKAGES as
gpsd-conf instead.

Also, as suggested on the Yocto mailing list, refactor to inherit
update-alternatives and use this to replace the postinst and postrm
steps.

Signed-off-by: Dan Walkes <danwalkes@trellis-logic.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
index 27a600f..f8e6a2b 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
@@ -19,8 +19,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "68691b5de4c94f82ec4062b042b5eb63"
 SRC_URI[sha256sum] = "03579af13a4d3fe0c5b79fa44b5f75c9f3cac6749357f1d99ce5d38c09bc2029"
 
-inherit scons update-rc.d python-dir pythonnative systemd bluetooth
+inherit scons update-rc.d python-dir pythonnative systemd bluetooth update-alternatives
 
+INITSCRIPT_PACKAGES = "gpsd-conf"
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
 
@@ -86,14 +87,6 @@ do_install_append() {
     install -m 0644 ${S}/systemd/${BPN}.socket ${D}${systemd_unitdir}/system/${BPN}.socket
 }
 
-pkg_postinst_${PN}-conf() {
-    update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
-}
-
-pkg_postrm_${PN}-conf() {
-    update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default
-}
-
 PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
 
 FILES_${PN}-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc \
@@ -133,3 +126,9 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.socket"
+
+
+ALTERNATIVE_${PN} = "gpsd-defaults"
+ALTERNATIVE_PATH = "${sysconfdir}/default/gpsd.default"
+ALTERNATIVE_LINK = "${sysconfdir}/default/gpsd"
+ALTERNATIVE_TARGET = "${sysconfdir}/default/gpsd.default"
-- 
2.7.4


