Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by mx.groups.io with SMTP id smtpd.web09.11736.1607447063084131501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Dec 2020 09:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@phytec.de header.s=a1 header.b=aGHnoCzA;
 spf=pass (domain: phytec.de, ip: 195.145.39.210, mailfrom: r.karszniewicz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1607447061; x=1610039061;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZZo+qnb0PZgasIwfwb9k0XaKjw34VKubFYHHmBLFNpI=;
	b=aGHnoCzAza5G+hAE8Bg0tukmjVvQOHoe0ytVwNPuFEZqrsLLQa9Y3lx4eiIDVkm/
	c1GnzWC7AtMbvlU5XBw37jLfyJnGzgZTw2tJ9iFl7Ip2Rut4S3Gq4Nszt5kkSQgG
	gg1PMg7FBjr3NPl/Al+AZTIJsIOvERycrhuEJUG8OHw=;
X-AuditID: c39127d2-981ff70000006435-38-5fcfb215e476
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id DE.53.25653.512BFCF5; Tue,  8 Dec 2020 18:04:21 +0100 (CET)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020120818042090-940945 ;
          Tue, 8 Dec 2020 18:04:20 +0100 
From: "Robert Karszniewicz" <r.karszniewicz@phytec.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] firmwared: add recipe
Date: Tue, 8 Dec 2020 18:04:20 +0100
Message-Id: <1607447060-235494-1-git-send-email-r.karszniewicz@phytec.de>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.12.2020 18:04:21,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.12.2020 18:04:21,
	Serialize complete at 08.12.2020 18:04:21
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJMWRmVeSWpSXmKPExsWyRoCBS1d00/l4gx9TuC0uHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujE+HN7EULJCsODl7P3sD4x7RLkZODgkBE4mrZ9YydzFycQgJ
	bGWUWHh+KTuEc45R4vaWCywgVWxAVbubbzGD2CICuhIfP8xlBLGFBYwkdv7uZQOxWQRUJHq6
	r4HZvAKeEtO+TmeC2CAncfNcJ9gGCYFGJon7vxaxQiSEJE4vPss8gZF7ASPDKkah3Mzk7NSi
	zGy9gozKktRkvZTUTYxADx6eqH5pB2PfHI9DjEwcjIcYJTiYlUR41aTOxgvxpiRWVqUW5ccX
	leakFh9ilOZgURLn3cBbEiYkkJ5YkpqdmlqQWgSTZeLglGpgnNSeeu9G9GHfTbNezsvfdfOx
	vUZhX4DuTT2f1G1G558e/vzsvcKr/w90MgxYbSZnTAw/9qV8ptOLlviFP1bvjG99dktc8PMk
	3XVPZX5trb95XmuuubX1oQO7PVWbj2sxSsr+Td6SsSho2lXll8e+6Rl/VlMsU7C4rW7wacvC
	95XcifkTO/5vPK7EUpyRaKjFXFScCACP8j5czgEAAA==

This program is needed for loading external firmware via Linux' fallback
mechanism.

Signed-off-by: Robert Karszniewicz <r.karszniewicz@phytec.de>
---
Changes from v1:
- remove PR setting
- set PV to 0, not 1
- inherit features_check and require systemd
- use ${systemd_system_unitdir} instead of ${systemd_unitdir}/system
- add firmwared to packagegroup-meta-oe
- add do_configure_prepend() (I had made a mistake in testing earlier)

Thank you all for your reviews earlier.

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
index 000000000000..74341d80d38d
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
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/firmwared.service ${D}${systemd_system_unitdir}
+    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/firmwared.service
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

