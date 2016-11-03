Return-Path: <gizero@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 89B777198E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 09:25:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so6987060wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yWKbgxupqFpq7nMJMbIvVckvGdpK0Tc9l6reMRcKNsM=;
	b=W/DsV+JfBsuFLbUT5ljvY2oIAj+VwSJMI3ffkZTNM479n0F2E9GtogLv53BoTVKly6
	dA3EO9RX169KPH6ilrSxNRlt1ywQRLMkcIq3WqvKFBXXvSWxvgvi1C9ep9qgNIPWU7L1
	YOeMwXbO+FjrqxosKPCyhJmSzM/cbML2/bE9w/TqFfQ0D79MpbT6+kODQ+kOB1h1oJmi
	dlcBvgtIgXS63CmGIIIoPWuMb7edBa/tHcWWXel64TFp8OL8Lt7QXE/fKJEsz+MvSBmY
	gvdry9cZkBxymjKbt+cetMRY18cLWyl6e+CVUM03qaZ9QlAQdMClS1L6VrADBzUVtdun
	drBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yWKbgxupqFpq7nMJMbIvVckvGdpK0Tc9l6reMRcKNsM=;
	b=Gzx8F0qBVFLM2NfY6EF4O3wCOAkS+cZ34yPCPD+CA+HmwA92gcnhL24hGRdISHn4Tb
	viubH/exUiGO0G7VbMXFObBVvz3Vvv070G5hiysHjn4oIv0kT8SjvtMcAkeQmhnM2p52
	MMnkUsXuvcumjGAU1r1G917uOKPuL94LKjXNCUwpIMIrEtNcoxgNvSkWVoM2cLinQQdm
	/GqbdabwJ3GCECveH4MvpE5JCe+fdquzj4td/PpLfnHmUf1YVRdNBMhldeZ79Dbczthx
	Qs2q9Nc5l2PefaV2ZsjDZYlleDR09zGu+HwSiv0vfwcBnJm5qe/0mO90NUFJA4cGp7pb
	YfuQ==
X-Gm-Message-State: ABUngvcGucNt1ic50Cn497Ovs5dgteQLAP7SKtByZLV+DiGAFqmWKAJpC7Hl9lzdBucdiw==
X-Received: by 10.194.243.104 with SMTP id wx8mr6484357wjc.229.1478165126078; 
	Thu, 03 Nov 2016 02:25:26 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by smtp.gmail.com with ESMTPSA id 18sm41090941wmr.5.2016.11.03.02.25.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 02:25:25 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 10:25:03 +0100
Message-Id: <1478165103-29946-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v2] libiio: add recipe
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
X-List-Received-Date: Thu, 03 Nov 2016 09:25:25 -0000

libiio is a C library for interfacing with IIO devices. It abstracts
the low-level details of the hardware, and provides a simple yet complete
programming interface.

This recipe provides the following packages:
* libiio: main package with C library
* libiio-iiod: user space daemon providing network backend to iio devices
* libiio-tests: user space test applications using libiio
* libiio-python: python bindings

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---

Changes in V2:
* use normal git checkout instead of Github archives to avoid issues with
checksum changing from time to time.
* while at it, use the latest commit, set PV and rename recipe accordingly.
* review DEPENDS to enable using new features/optional libraries.
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/libiio/libiio_git.bb

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
new file mode 100644
index 0000000..28a1073
--- /dev/null
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Library for interfacing with IIO devices"
+HOMEPAGE = "https://wiki.analog.com/resources/tools-software/linux-software/libiio"
+SECTION = "libs"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
+
+SRCREV = "e0fc3845506ccb19ab02e4b1d81cddeeee0805ab"
+PV = "0.7+git${SRCPV}"
+
+SRC_URI = "git://github.com/analogdevicesinc/libiio.git"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "flex-native bison-native avahi libaio libusb1 libxml2"
+
+inherit cmake pythonnative
+
+PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
+
+RDEPENDS_${PN}-python = "${PN} python-ctypes python-stringold"
+
+FILES_${PN}-iiod = "${sbindir}/iiod"
+FILES_${PN}-tests = "${bindir}"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
-- 
1.9.1


