Return-Path: <jacopo.dallaglio@kynetics.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 08C587FC03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:14:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so3120886wro.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=DTZCuvHWbVVdHqi6iwHm1t4xzJmbsDOuciEM9evEq4s=;
	b=yCGkPpou59Njo7WpgEaZaUDn/7BUrLlJ0s1oCbDjF5J4SCDWRfGgDRIafgbyNKgWHh
	JlNC+H4teFrePi36/F8+iEI7uC+KL7L59EbYxbPOElR5l3vxGIAsDtYePUjULrtUHap7
	OEFW8FqrNjWI8yQWqDg1e1G7t0qEJ2GrhDWU6ZN/UUKmUMSJClfHndvcnpjZuDPf6a1X
	9erW57QmngLaOc1AhB1TznnuI9PzHFkVEkUvd6Y+nAqZ8yPd/NQpOpb1yYY3qzG6uwl7
	c8Y0jn5byYVPFBeoYzNamUSYn2l5mWNv4bXoFq5B2WG+wSMfj0KHcOiru5Maor5TVGWR
	+tFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DTZCuvHWbVVdHqi6iwHm1t4xzJmbsDOuciEM9evEq4s=;
	b=eVOOCw6ijxumlFsbTt0ZcyCF+iNJuZdyg+flWm4iwtP5huL4nZMjkGna8n3Cn6Z52F
	lJ5xDU3d/4jQraIZ3tP1Ac6p4jV0H/HwOvPP0tXqYflXQ9PsDpV0eTzREMFCm/+OFzGp
	+8RlKXZW607EOvNdUflG+QOJLc9HBiKDMcL90qHrLCwkO3y+rQeSb3D0mBDpJot5m8XZ
	89UxDW7iew3+rXxjbBCrR4s0IUobxpM0XlwpN92y+WPyNgrm+sYDENZVq1ldd07kM5Ol
	92qg1EQPcYZSx3LI4SadueBOIk4n3cbl3K44fdy45Sy14RaIWenV3GZEPTHoH2jNyQDc
	KUlA==
X-Gm-Message-State: APjAAAX3l91q9QG/zb6r7DeK+Atu49Z5jVJ6gUozN2Y0o8ZWS78cgczc
	hTcj3MgV3vfCJp6HiBnS6Cj8/MMmV1C2pMM=
X-Google-Smtp-Source: APXvYqzHI9CXuB3BC0ZtIbSN2JaCwufuDIHURxfSOOrRRvSU3BPlh7fZbOufM/VyN5qbB1/sRjzLBQ==
X-Received: by 2002:adf:ef4e:: with SMTP id c14mr19600564wrp.142.1575033281520;
	Fri, 29 Nov 2019 05:14:41 -0800 (PST)
Received: from ip-172-31-10-74.eu-west-1.compute.internal
	(ec2-34-244-239-45.eu-west-1.compute.amazonaws.com. [34.244.239.45])
	by smtp.gmail.com with ESMTPSA id i8sm4719296wro.47.2019.11.29.05.14.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Nov 2019 05:14:40 -0800 (PST)
From: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Nov 2019 13:14:36 +0000
Message-Id: <1575033276-1496-1-git-send-email-jacopo.dallaglio@kynetics.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] netplan: add recipe
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
X-List-Received-Date: Fri, 29 Nov 2019 13:14:41 -0000

Canonical's Netplan is a network configuration abstraction renderer written in
Python. It's compatible with NetworkManager and systemd-networkd.

Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
---
Resending patch to correct mailing-list. This patch depends on
"[meta-python][PATCH] python-netifaces: add recipes".
---
 .../recipes-connectivity/netplan/netplan_0.98.bb   | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/netplan/netplan_0.98.bb

diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
new file mode 100644
index 0000000..1251de3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
@@ -0,0 +1,55 @@
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
+EXTRA_OEMAKE = "generate netplan-dbus dbus/io.netplan.Netplan.service"
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
+	install -d ${D}${datadir}/dbus-1/system.d ${D}${datadir}/dbus-1/system-services
+	install -m 755 ${S}/netplan-dbus ${D}${base_libdir}/netplan
+	install -m 644 ${S}/dbus/io.netplan.Netplan.conf ${D}${datadir}/dbus-1/system.d
+	install -m 644 ${S}/dbus/io.netplan.Netplan.service ${D}${datadir}/dbus-1/system-services
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


