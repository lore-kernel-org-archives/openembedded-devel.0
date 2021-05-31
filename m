Received: from mailrelay1-3.pub.mailoutpod1-cph3.one.com (mailrelay1-3.pub.mailoutpod1-cph3.one.com [46.30.212.10])
 by mx.groups.io with SMTP id smtpd.web12.47255.1622483633089198392
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 10:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embexus.com header.s=20191106 header.b=C9soDlzV;
 spf=none, err=permanent DNS error (domain: embexus.com, ip: 46.30.212.10, mailfrom: ayoub.zaki@embexus.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=message-id:date:subject:cc:to:from:from;
	bh=eMGVaeP/gDFgNHjT9LMPAiaJ0baD9I2F6i2RfDxSVGk=;
	b=C9soDlzVcaewFzBm+PJc5Ck2UA0XqsS9moqG4iAa7y6RTA27jtyzg06LNIqon0v2lw+IQPPcV9bIX
	 CGIZS7OBC5HW9+2A7REgbzxi5xgLsjLPk9WtfmmBelvEarUE1JUOmnEehjE2ql+2ezsaHs2/n6emZE
	 YefgcspzZ9w9HsteKOqX+L6Cymb2VL2o5/DM/rOTD6nJaVl0zOCTvIsEH/k3Ad/pp2b6WDxgxAcBFB
	 //ziNUwm9PClHcrn5tTrms8slP8DIp3XocIDdnGQk7NgrEI09BYMFNI0QO2RhWqGVQ8hUs6GSTNGPT
	 ildD/X8erebcAwLCTn8mFg1XP8kryEA==
X-HalOne-Cookie: fc309ce55d26d6bcc03e704d431c94171c664a4c
X-HalOne-ID: 27b8dd3d-c239-11eb-9255-d0431ea8a283
Received: from xps.fritz.box (x4dbd064c.dyn.telefonica.de [77.189.6.76])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 27b8dd3d-c239-11eb-9255-d0431ea8a283;
	Mon, 31 May 2021 17:53:50 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embexus.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embexus.com>
Subject: [meta-oe][PATCH v2] evemu-tools: Add initial recipe
Date: Mon, 31 May 2021 19:53:48 +0200
Message-Id: <20210531175348.20120-1-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Ayoub Zaki <ayoub.zaki@embexus.com>
---
 .../evemu-tools/evemu-tools_git.bb            | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb

diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
new file mode 100644
index 000000000..c9a382ad4
--- /dev/null
+++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Kernel evdev device emulation"
+DESCRIPTION = "The evemu library and tools are used to describe devices, record data, create devices and replay data from kernel evdev devices."
+HOMEPAGE = "https://www.freedesktop.org/wiki/Evemu"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+DEPENDS = "libevdev"
+
+SRCREV = "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
+SRC_URI = "git://git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+PV = "gitr${SRCPV}"
+
+inherit autotools pkgconfig
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${libdir}/python*/site-packages/*"
+RDEPENDS_${PN}-python = "python3"
+
-- 
2.17.1

