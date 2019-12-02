Return-Path: <jacopo.dallaglio@kynetics.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 119167F367
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 10:20:07 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so16645282wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 02:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=bHQiMVke7TZ4vJu6UkSpbZHshKOPJ5mSPGg0pTNatiQ=;
	b=qgZpV7EVT8Y6ZcozCEbJHmK58sbohmhbz+CtlwAuKRo4DeCKfH5XpiA2W1aynTYUId
	yYvgbcLIa6V2s8p3ColusbcILhBuKavLt4jA7UNaUxHY2OIwiXzYs/z8JvMWhZIS18UT
	FkxbdwyTPAjFcxl79TfTczoUYg5f4kL3ABOYOxWb459RPHwYUjSomidmcHY5/lZROQL5
	9Mto1O2KL5abRQATfI7j4XILF96wYSFQ2TYaGpFcCyvlLzaNoZDBAV4vUrlzsjnHO24R
	VK1wDQbxoDbsRMK7RpHTg3VyYEKveJLUYpYR7C9yqIY9G3XjAEz4ptmZXqdojjbqgRxF
	Vbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bHQiMVke7TZ4vJu6UkSpbZHshKOPJ5mSPGg0pTNatiQ=;
	b=CRg3MajTPZZD8+ITR5GcWUUN1ltsVBFwdqEMUTcjNTq1yn17nOAcMofJV791e0TnYh
	5lCxLPBhgwB6+CEmCmkn7lMgApxd9TH3c9LIeL401GUjkuA/iZEs9SQRE7f6uCH42AGT
	autDflmXflblA52TgY71Ye9MjK0QcRC0rYkF2p19Dx+XZdTr5XuIRCUqrd7prGSrC9iR
	ak9Ft74cJmH+fXYaeNOAyx84A3kavPG1ofoybote6I0f9D9JnczBvaOZl0iIk5PE85IZ
	PTB5l7jElOht5crSVi/3Xjt9GzIH/REiJb8KB0tqZ0+n7ku5NWMlPj9xyLm1yBa7Oa1q
	Bjeg==
X-Gm-Message-State: APjAAAXhCK2Mi4irBUW3RkQtk0NDbhuUo25b3usObYl8aaX8CnSQSVCa
	2c3xv5qx46qWWKciqdSJ/5B/pDEOR49LKlw=
X-Google-Smtp-Source: APXvYqwdENoLtJd421slPgQktGhnaYcCbvpgZmmeWFdwxq60ez9uCOjol8D4w9dcaCAauzc5tejcXA==
X-Received: by 2002:a1c:964f:: with SMTP id y76mr24540216wmd.62.1575282008442; 
	Mon, 02 Dec 2019 02:20:08 -0800 (PST)
Received: from ip-172-31-10-74.eu-west-1.compute.internal
	(ec2-34-254-186-126.eu-west-1.compute.amazonaws.com.
	[34.254.186.126]) by smtp.gmail.com with ESMTPSA id
	f67sm23579349wme.16.2019.12.02.02.20.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Dec 2019 02:20:07 -0800 (PST)
From: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 10:20:03 +0000
Message-Id: <1575282003-22023-1-git-send-email-jacopo.dallaglio@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
Subject: [meta-networking][v2] netplan: add recipe
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
X-List-Received-Date: Mon, 02 Dec 2019 10:20:08 -0000

Canonical's Netplan is a network configuration abstraction renderer written in
Python. It's compatible with NetworkManager and systemd-networkd.

Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
---
 .../recipes-connectivity/netplan/netplan_0.98.bb   | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan_0.98.bb

diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
new file mode 100644
index 0000000..860762c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
@@ -0,0 +1,58 @@
+SUMMARY = "The network configuration abstraction renderer"
+DESCRIPTION = "Netplan is a utility for easily configuring networking on a \
+linux system. You simply create a YAML description of the required network \
+interfaces and what each should be configured to do. From this description \
+Netplan will generate all the necessary configuration for your chosen renderer \
+tool."
+HOMEPAGE = "https://netplan.io"
+SECTION = "net/misc"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+S = "${WORKDIR}/git"
+SRCREV = "5d22e9d22c4a3724d27b80b0cd9b898ae8f59d2b"
+PV = "0.98+git${SRCPV}"
+
+SRC_URI = " \
+        git://github.com/CanonicalLtd/netplan.git \
+"
+
+DEPENDS = "glib-2.0 libyaml"
+RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python-pyflakes util-linux-libuuid"
+
+inherit pkgconfig systemd
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+EXTRA_OEMAKE = "generate"
+EXTRA_OEMAKE =+ "${@bb.utils.contains('DISTRO_FEATURES','systemd','netplan-dbus dbus/io.netplan.Netplan.service','',d)}"
+
+do_install() {
+	install -d ${D}${sbindir} ${D}${base_libdir}/netplan ${D}${datadir}/netplan/netplan/cli/commands ${D}${sysconfdir}/netplan
+	install -m 755 ${S}/generate ${D}${base_libdir}/netplan/
+	install -m 644 ${S}/netplan/*.py ${D}${datadir}/netplan/netplan
+	install -m 644 ${S}/netplan/cli/*.py ${D}${datadir}/netplan/netplan/cli
+	install -m 644 ${S}/netplan/cli/commands/*.py ${D}${datadir}/netplan/netplan/cli/commands
+	install -m 755 ${S}/src/netplan.script ${D}${datadir}/netplan/
+	ln -srf ${D}${datadir}/netplan/netplan.script ${D}${sbindir}/netplan
+
+	install -d ${D}/${systemd_unitdir}/system ${D}${systemd_unitdir}/system-generators
+	install -m 644 ${S}/src/netplan-wpa@.service ${D}${systemd_unitdir}/system/
+	ln -srf ${D}/${base_libdir}/netplan/generate ${D}${systemd_unitdir}/system-generators
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}${datadir}/dbus-1/system.d ${D}${datadir}/dbus-1/system-services
+		install -m 755 ${S}/netplan-dbus ${D}${base_libdir}/netplan
+		install -m 644 ${S}/dbus/io.netplan.Netplan.conf ${D}${datadir}/dbus-1/system.d
+		install -m 644 ${S}/dbus/io.netplan.Netplan.service ${D}${datadir}/dbus-1/system-services
+	fi
+}
+
+SYSTEMD_SERVICE_${PN} = "netplan-wpa@.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+PACKAGES += "${PN}-dbus"
+
+FILES_${PN} = "${sbindir} ${base_libdir}/netplan/generate ${datadir}/netplan ${sysconfdir}/netplan ${systemd_unitdir}"
+FILES_${PN}-dbus = "${base_libdir}/netplan/netplan-dbus ${datadir}/dbus-1"
-- 
2.7.4


