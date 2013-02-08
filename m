Received: from mail-we0-f173.google.com ([74.125.82.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3wwq-0002HC-4z
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Feb 2013 00:01:41 +0100
Received: by mail-we0-f173.google.com with SMTP id r5so3317769wey.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=zhFLVUN0xDliG4TnnT7kLm4CL/VpuJwNDsrUjzwLeiQ=;
	b=dQWIE74gRRDZhkybv3O4/mTSHlLRNXggZtQjOAkHvS5sDxTU6COzyJRZ95Ga9GAmtr
	dOdksqvhoSD6N8zwpZJeuyvWJdJEzNEmbaX1cQ+2WOCMfM97Yuuu71XyVeD4kDDcT5nT
	NVqMwE+a10VAbAt/bjxq+4WcB3rtO3E10yIXgapc0AQb+XLpBX1puFuE8T3jCWSL/RJ0
	yL8s3yEfmac5hY0Eiand3iquMvtYXAg9ckwPGQwEa8WZ+iotYbBWiVUWfGttq4Of8x8e
	cGOMpnSEqoQip5uFxDwEGLjP9GLXnItYABHpvqTssTHeXSUm81DQz3H6ZNkS8dgPkujy
	3uGA==
X-Received: by 10.180.95.166 with SMTP id dl6mr5290900wib.9.1360363541738;
	Fri, 08 Feb 2013 14:45:41 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm18190386wiz.1.2013.02.08.14.45.40
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 14:45:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 22:43:19 +0000
Message-Id: <cba1dc1c04201b8f08fca587a7433238a5ddaa33.1360360346.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
In-Reply-To: <cover.1360360346.git.ross.burton@intel.com>
References: <cover.1360360346.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnL0xbpWrrNBLKWORmUskkkMVHvnb1JYzF8HVdjSfgV5Gok4AjfV+VGfFBHayqtwQAvVmgL
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] wpa-supplicant: Enabling with systemd
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
X-List-Received-Date: Fri, 08 Feb 2013 23:01:47 -0000

From: Radu Moisan <radu.moisan@intel.com>

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../wpa-supplicant/wpa-supplicant-2.0.inc                 |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 89910a0..75e85ae 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -9,6 +9,11 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
 DEPENDS = "gnutls dbus libnl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service wpa_supplicant-nl80211@.service wpa_supplicant-wired@.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://defconfig-gnutls \
            file://wpa-supplicant.sh \
@@ -21,7 +26,7 @@ S = "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
 PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
-FILES_${PN} += "${datadir}/dbus-1/system-services/* ${systemd_unitdir}/system/*"
+FILES_${PN} += "${datadir}/dbus-1/system-services/*"
 CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
@@ -63,8 +68,10 @@ do_install () {
 	install -d ${D}/${datadir}/dbus-1/system-services
 	install -m 644 ${S}/dbus/*.service ${D}/${datadir}/dbus-1/system-services
 
-	install -d ${D}/${systemd_unitdir}/system
-	install -m 644 ${S}/systemd/wpa_supplicant.service ${D}/${systemd_unitdir}/system
+	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}/${systemd_unitdir}/system
+		install -m 644 ${S}/systemd/*.service ${D}/${systemd_unitdir}/system
+	fi
 
 	install -d ${D}/etc/default/volatiles
 	install -m 0644 ${WORKDIR}/99_wpa_supplicant ${D}/etc/default/volatiles
-- 
1.7.10.4



