Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by mx.groups.io with SMTP id smtpd.web11.7830.1607526206151479645
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Dec 2020 07:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@phytec.de header.s=a1 header.b=AYbnG+6z;
 spf=pass (domain: phytec.de, ip: 195.145.39.210, mailfrom: r.karszniewicz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1607526204; x=1610118204;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GR/HTaRrHMZY5qQewiLbVcrR+2s6XE/CcPlOBAXCl5o=;
	b=AYbnG+6zv9uWw0XzLZDXzvobxoCQ+D7c/6CG5idTb3xOMGsKu8hxY3yeHYQgJeM4
	Fy5WTCA6/C3eJIstLNN/uPz7S41smiKm2Kg1k4/Qq4xjxl4J8mn7nQEM/gM8/R1g
	LA/pKEAfKrW1VAuDo0U84t9K690erXdMlWckfNXr+B0=;
X-AuditID: c39127d2-96bff70000006435-c6-5fd0e73bd5eb
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id D1.58.25653.B37E0DF5; Wed,  9 Dec 2020 16:03:23 +0100 (CET)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020120916032358-947468 ;
          Wed, 9 Dec 2020 16:03:23 +0100 
From: "Robert Karszniewicz" <r.karszniewicz@phytec.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3] firmwared: add recipe
Date: Wed, 9 Dec 2020 16:03:23 +0100
Message-Id: <1607526203-308344-1-git-send-email-r.karszniewicz@phytec.de>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.12.2020 16:03:23,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 09.12.2020 16:03:23,
	Serialize complete at 09.12.2020 16:03:23
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJMWRmVeSWpSXmKPExsWyRoCBS9f6+YV4g0tfrSwuHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujCOP/jAWnJKs2L/uL3sD4yPRLkYODgkBE4lj3axdjFwcQgJb
	GSU2HtnP0sXICeScY5Q4cl8FxGYDqtndfIsZxBYR0JX4+GEuI4gtLGAk8X/CBDYQm0VAReLV
	nnfMIDN5BTwl9nzSBglLCMhJ3DzXyQwyX0KgkUli6slDrBAJIYnTi88yT2DkXsDIsIpRKDcz
	OTu1KDNbryCjsiQ1WS8ldRMj0HeHJ6pf2sHYN8fjECMTB+MhRgkOZiURXjWps/FCvCmJlVWp
	RfnxRaU5qcWHGKU5WJTEeTfwloQJCaQnlqRmp6YWpBbBZJk4OKUaGMMaoqZ23frDe81+8n8e
	xm7bws1V/+aGPayyOn6qneVJigU/s7CrcxSj+5+21dkLJDkMhN9GVgv+2KAbN3930Z4/h07n
	TbnxQ7zI0jtm3uTclk3WV/YttDN8yVh9NZu7ZUrTTVZu+6IXy1bahwht2Hd/nt4B3gbtV5x9
	HdtcWA821Pzhr551U4mlOCPRUIu5qDgRAA+vAhrLAQAA

This program is needed for loading external firmware via Linux' fallback
mechanism.

Signed-off-by: Robert Karszniewicz <r.karszniewicz@phytec.de>
---
Changes from v2:
- replace *all* systemd_unitdir with systemd_system_unitdir now

Changes from v1:
- remove PR setting
- set PV to 0, not 1
- inherit features_check and require systemd
- use ${systemd_system_unitdir} instead of ${systemd_unitdir}/system
- add firmwared to packagegroup-meta-oe
- add do_configure_prepend() (I had made a mistake in testing earlier)

 .../firmwared/firmwared/firmwared.service          |  9 ++++++
 meta-oe/recipes-bsp/firmwared/firmwared_git.bb     | 34 ++++++++++++++++++++++
 .../packagegroups/packagegroup-meta-oe.bb          |  1 +
 3 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
 create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared_git.bb

diff --git a/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
new file mode 100644
index 000000000000..c2106a25168c
--- /dev/null
+++ b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Linux Firmware Loader Daemon
+
+[Service]
+Type=simple
+ExecStart=@BINDIR@/firmwared -d /lib/firmware
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
new file mode 100644
index 000000000000..43fc59815471
--- /dev/null
+++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Linux Firmware Loader Daemon"
+DESCRIPTION = "The Linux Firmware Loader Daemon monitors the kernel for \
+firmware requests and uploads the firmware blobs it has via the sysfs \
+interface."
+HOMEPAGE = "https://github.com/teg/firmwared"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=7b486c2338d225a1405d979ed2c15ce8 \
+                    file://COPYING;md5=daa868b8e1ae17d03228a1145b4060da"
+
+SRC_URI = "git://github.com/teg/firmwared.git \
+           file://firmwared.service"
+
+PV = "0+git${SRCPV}"
+SRCREV = "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "glib-2.0 systemd"
+
+inherit pkgconfig autotools systemd features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+SYSTEMD_SERVICE_${PN} = "firmwared.service"
+
+do_configure_prepend() {
+    ${S}/autogen.sh
+}
+
+do_install_append() {
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/firmwared.service ${D}${systemd_system_unitdir}
+    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_system_unitdir}/firmwared.service
+}
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 841e1cd1b3ab..2c46d21b705f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -87,6 +87,7 @@ RDEPENDS_packagegroup-meta-oe-bsp ="\
     acpitool \
     cpufrequtils \
     edac-utils \
+    firmwared \
     flashrom \
     irda-utils \
     lmsensors-config-cgi \
-- 
2.7.4

