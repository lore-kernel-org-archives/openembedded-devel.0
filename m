Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 25B646DF9B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2013 10:13:29 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u57so424173wes.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2013 02:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Cgql6ItO6+FsVeITfFEa+hot+zVN4gxKLaGSznxyf0I=;
	b=T1B1C6llgXxZuGt7kgNyalswc92Yh5PGQpwPMwn84GTuxCSaVvOMm8d3kdw2qT1UaH
	QBxHLlwc8fnfvtiS02BRIRQ7Ny0GLKrlGiMVlsS24Xo7WOiXDEot2Ifk9nmLyOo+ZlZA
	5vpYF43SKS5Fja3aHq03wAea9dTPmPXRh8xHDqWS/BqmrPCJhTP0A5OOmVCTHJAduNnH
	SY9aLcKMkK0/4QOcxmqIGW1UAOwyKHSDEqRBLSy/0u7UZxV0OA/rMfjo1QRm/vIvJP+/
	3240M83bK4hbL+C9dKnE7r5kr5kfhqLESVyzeYRMZxCaZDg67TDqTvJq1wxFRJEoinz+
	Tcsg==
X-Gm-Message-State: ALoCoQmjpkR13Lbitn5xL0kZMNUSUwO425VE8otXiBuge8JPaxoPIQzXDhmJ8T5LuA1KijBCPMfG
X-Received: by 10.180.189.68 with SMTP id gg4mr1717376wic.46.1386324809055;
	Fri, 06 Dec 2013 02:13:29 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id fu1sm4741887wib.8.2013.12.06.02.13.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Dec 2013 02:13:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2013 11:13:19 +0100
Message-Id: <1386324799-30305-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH] transmission: add 3.82
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Dec 2013 10:13:31 -0000

Transmission is a cross-platform BitTorrent client.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../transmission/transmission_2.82.bb              | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/transmission/transmission_2.82.bb

diff --git a/meta-networking/recipes-protocols/transmission/transmission_2.82.bb b/meta-networking/recipes-protocols/transmission/transmission_2.82.bb
new file mode 100644
index 0000000..3ca6c5a
--- /dev/null
+++ b/meta-networking/recipes-protocols/transmission/transmission_2.82.bb
@@ -0,0 +1,52 @@
+DESCRIPTION = "Transmission is a BitTorrent client w/ a built-in Ajax-Powered Webif GUI."
+SECTION = "network"
+
+HOMEPAGE = "www.transmissionbt.com/"
+
+DEPENDS = "libevent gnutls openssl libtool intltool-native curl"
+
+LICENSE = "MIT & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7ee657ac1dce0e7353033fc06c8087d2"
+
+SRC_URI = "http://download.transmissionbt.com/files/transmission-${PV}.tar.xz"
+SRC_URI[md5sum] = "a5ef870c0410b12d10449c2d36fa4661"                                                                   
+SRC_URI[sha256sum] = "3996651087df67a85f1e1b4a92b1b518ddefdd84c654b8df6fbccb0b91f03522" 
+
+inherit autotools gettext useradd systemd
+
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
+                 ${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+
+PACKAGECONFIG[gtk] = " --with-gtk,--without-gtk,gtk+,"
+PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd,"
+
+# Configure aborts with:
+# config.status: error: po/Makefile.in.in was not created by intltoolize.
+do_configure_prepend() {
+    sed -i /AM_GLIB_GNU_GETTEXT/d ${S}/configure.ac
+    intltoolize --copy --force --automake
+}
+
+do_install_append() {
+	install -d ${D}${nonarch_base_libdir}/systemd/system
+	install -m 0644 ${S}/daemon/transmission-daemon.service ${D}${nonarch_base_libdir}/systemd/system
+}
+
+PACKAGES += "${PN}-gui ${PN}-client"
+
+FILES_${PN}-client = "${bindir}/transmission-remote ${bindir}/transmission-cli ${bindir}/transmission-create ${bindir}/transmission-show ${bindir}/transmission-edit"
+FILES_${PN}-gui += "${bindir}/transmission-gtk ${datadir}/icons ${datadir}/applications ${datadir}/pixmaps"
+
+FILES_${PN} = "${bindir}/transmission-daemon ${datadir}/transmission ${sysconfdir}"
+
+SYSTEMD_SERVICE_${PN} = "transmission-daemon.service"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system transmission"
+USERADD_PARAM_${PN} = "--home ${localstatedir}/lib/transmission-daemon --create-home \
+                       --gid transmission \
+                       --shell ${base_bindir}/false \
+                       --system \
+                       transmission"
+
+
-- 
1.8.4.2


