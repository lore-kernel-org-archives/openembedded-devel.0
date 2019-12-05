Return-Path: <jacopo.dallaglio@kynetics.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E7B9C7F88D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 16:14:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y23so7715305wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 08:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=q4pdypClNDKGUZysZ4fZUE1ZATEfESO4W0H7eCgYC3s=;
	b=oqoRSbQJi90H4Boeijp2gn/U5b8BUjlH+aJOFzRoIiKui8paYEPkcXx4nluOFfvthz
	hkRCddxqdxNyjAkyHezGNAh9DV9xnNGmcchrR17w7v72ajG5ZynYrOXQ28j53PYF94CX
	NZ8Y9hwLwAw1w9KDyZJmkF+HpSh8ZyWyQVaVwqbNEtwgMm99Qfs6mvxewPLcuOpw8Joj
	cjw/Aw3rtD1zk5jrv2KDj6anGwVijgK+9dyuD8OC4qCNJuleTD592UboQz81Oe3j/msw
	iwxAg3DHEfMe5CLpFJc8+4r5OCMoTvn9rHJubqV5AQYERrAXjfXBL4ReJN55scx8F7HC
	a4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q4pdypClNDKGUZysZ4fZUE1ZATEfESO4W0H7eCgYC3s=;
	b=H4yfO11qbCbG1JchYpnT8FruMbMwhQ0FHbr7ZyBMapsCK8RJE/ycsi70PRRSV4bXaV
	a6HkZ8Od3hhckBYdFr3izyViNh/VHXlV+1mgOhinpTFvFis/xKH8rbjCBK7jMub8f23z
	bixuyI4o9+PF8KJEdNGxZqxYeTwJBXo/QKCccSVHsfRKRxQk3RCV+RBUBmGqDzpQYyIz
	wyi+0jQNgcUC7JJtkFfZ+ZGytk0Xd5VKxhfIrU0ORRm/ukGqDb1oGjXosHdhgWpEMch6
	97X0f9DyL0NH8TvXO41UFSvAA/j7jKrXmr7DOz5Ybt/x0B3TiMsSZJTs8y18VG8juiSB
	nRpA==
X-Gm-Message-State: APjAAAXaWepZipruxSdIzEVb+4OQX529Qf7jkNf0kaw4+PM4cheCIASn
	kkLrafFmzD3e6/o+SDw21lcMw7TbQzU0uDc=
X-Google-Smtp-Source: APXvYqwzikCHtAtKqDi+6aiSAr8CHZc+tRnRYctczp8aBiGDihpQkEYqHjPHUlfkqEQ+IxVlgxCzpw==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr6065362wmj.117.1575562487933; 
	Thu, 05 Dec 2019 08:14:47 -0800 (PST)
Received: from ip-172-31-10-74.eu-west-1.compute.internal
	(ec2-54-171-197-126.eu-west-1.compute.amazonaws.com.
	[54.171.197.126])
	by smtp.gmail.com with ESMTPSA id 5sm13189717wrh.5.2019.12.05.08.14.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Dec 2019 08:14:47 -0800 (PST)
From: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:14:35 +0000
Message-Id: <1575562475-1830-1-git-send-email-jacopo.dallaglio@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
Subject: [meta-networking][PATCH v2] netplan: add recipe
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
X-List-Received-Date: Thu, 05 Dec 2019 16:14:48 -0000

Canonical's Netplan is a network configuration abstraction renderer written in
Python. It's compatible with NetworkManager and systemd-networkd.

Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
---
Resending patch with correct header and with correction applied for building
with sysV init manager. This patch depends on "[meta-python][PATCH]
python-netifaces: add recipes".
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


