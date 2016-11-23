Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A252371A7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id e9so668372pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E2S52HJJ+klGbwokmNhvp+0aswd4goC2un5K0gIlQnE=;
	b=J2jEh1AC9hKJOxVtf8bFW4F6oKQLrKV57cVYTF6bIXxevbHaaoW1tIB/cVK7G4Up2R
	v8RoxCkMM425UUkvBdzre0zQC8BDcVuFty+e/NEqbpZE2jx39mfY7msB20z5o+W+kwyD
	cFcLA4cUoLBFkFjETasXnCg7h7nGR3EUd8fV5mJtMcqqloMRjf6PPuJXNBiyQ3rns+ZV
	HiZ1YBuXmapNLE6jKXLkE/dXiZR3H6Y1sJL6vPCiYuvXsTAhB8xdJ0NIsdpQhHmMbbo7
	gKUlc1t5QL7VTyAgkOld4Pf3hQ/jnkZmQg/8MGa0aM6tb1GHe2crJvEMlIwD+ILxyEVk
	VSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E2S52HJJ+klGbwokmNhvp+0aswd4goC2un5K0gIlQnE=;
	b=dRD23jRXTkwsE9zjUyO0g6KWZpcAbpD+6j20XPBCgKrqXM81I3a7FmezY9f+jLqt+e
	kdnRST6rxAlPZ76MXF+ilg/0I72wzm2cLkwsurSUPrFbw2SC1/6KDCIivgUjjCY4Z6Ti
	ojS0v0/HYl3QhGwsoJgmcTHP8Ud/vYTLzitsE2QG7JNBFYOKFI73Ga1PQrE/ryIPqLpV
	B7z4nIUVX4pHMekGMb1wDDxN867kNTA5SLLF8QRRNemB15TzSdUtVPzHxe+RKTYDLFYG
	JZH+mf4owWXs9DBOWmLQAQjwmPdHW2z83XxqYP8gk6hhOqxa/kbczgAImqttFBpGE5fw
	CDKQ==
X-Gm-Message-State: AKaTC01J1j6TWunVwLPH/FsLacrrVvXbPEw2CSB4H6a/FPPJ+kvhzFTQzk8gJgMkJngk/g==
X-Received: by 10.98.75.157 with SMTP id d29mr1927096pfj.14.1479892952215;
	Wed, 23 Nov 2016 01:22:32 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:40 -0800
Message-Id: <20161123092209.23699-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 20/49] arno-iptables-firewall: Add recipe
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../arno-iptables-firewall_2.0.1g.bb               | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.1g.bb

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.1g.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.1g.bb
new file mode 100644
index 0000000..6fd0aff
--- /dev/null
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.1g.bb
@@ -0,0 +1,35 @@
+SUMMARY = "IPTables based firewall scripts"
+HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&view=article&id=45&Itemid=63"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
+
+SRC_URI = "http://rocky.eld.leidenuniv.nl/arno-iptables-firewall/${BPN}_${PV}.tar.gz \
+          "
+SRC_URI[md5sum] = "77eba7f148bf2840a3e35a6f50c9c353"
+SRC_URI[sha256sum] = "0bafd85ddc235752250eaec0c7fdb21e530912483f6807a97f86158ed2d301f7"
+
+S = "${WORKDIR}/${BPN}_${PV}"
+
+inherit systemd
+
+do_install() {
+	install -d ${D}${sysconfdir} ${D}${sbindir} ${D}${bindir} ${D}${systemd_unitdir}/system ${D}${sysconfdir}/init.d
+	install -d ${D}${datadir}/arno-iptables-firewall ${D}${sysconfdir}/arno-iptables-firewall
+	cp -r ${S}${sysconfdir}/arno-iptables-firewall ${D}${sysconfdir}/
+	install -m 0755 ${S}${sysconfdir}/init.d/arno-iptables-firewall ${D}${bindir}
+	install -m 0755 ${S}/bin/arno-iptables-firewall ${D}${sbindir}
+	install -m 0755 ${S}/bin/arno-fwfilter ${D}${bindir}
+	cp -r ${S}/share/arno-iptables-firewall/* ${D}${datadir}/arno-iptables-firewall
+	cp -r ${S}/etc/arno-iptables-firewall/* ${D}${sysconfdir}/arno-iptables-firewall
+	install -m 0644 ${S}/${systemd_unitdir}/system/arno-iptables-firewall.service ${D}${systemd_unitdir}/system
+	sed -i -e 's%/usr/local/sbin%${bindir}%g' ${D}${systemd_unitdir}/system/arno-iptables-firewall.service
+	sed -i -e 's%/usr/local/sbin%${sbindir}%g' ${D}${bindir}/arno-iptables-firewall
+	sed -i -e 's%/usr/local%${exec_prefix}%g' ${D}${sysconfdir}/arno-iptables-firewall/firewall.conf
+	sed -i -e 's%#!/bin/bash%#!/bin/sh%g' ${D}${bindir}/arno-fwfilter
+	sed -i -e 's%#!/bin/bash%#!/bin/sh%g' ${D}${datadir}/arno-iptables-firewall/plugins/traffic-accounting-helper
+	sed -i -e 's%#!/bin/bash%#!/bin/sh%g' ${D}${datadir}/arno-iptables-firewall/plugins/dyndns-host-open-helper
+}
+
+SYSTEMD_SERVICE_${PN} = "arno-iptables-firewall.service"
+FILES_${PN} += "${systemd_unitdir}/system/arno-iptables-firewall.service"
-- 
2.10.2


