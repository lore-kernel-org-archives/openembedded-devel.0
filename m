Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com (mailrelay2-3.pub.mailoutpod1-cph3.one.com [46.30.212.11])
 by mx.groups.io with SMTP id smtpd.web08.34066.1622395291266408131
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 10:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embexus.com header.s=20191106 header.b=PIMmqAVc;
 spf=none, err=permanent DNS error (domain: embexus.com, ip: 46.30.212.11, mailfrom: ayoub.zaki@embexus.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=message-id:date:subject:cc:to:from:from;
	bh=GzK2bE5g/igqimiwrYf+wV5HcqVq0ZaBZaD9OQBaBOk=;
	b=PIMmqAVciBQsq6Fn9vxUiwX5trxVCUohTmDetGZGLK7M0gQN80S1ka7IILvmTSAARL33MsKQejrVS
	 5U3NppF+ARTeT9+qy9PcyMDxGjQnn9Rdp/Qc1pisn+MPN1vpBzeqm4qrPfBAsNWZhYC4gGz0e0E2X8
	 /4QywNc1k90EN1E2OAOyV6Lm9zDivCJckexFTaQTyodFjSxdIEokePqBLHzXXV6LO7a0q/vXpeGDU3
	 YRZsOa/GoOkT7fzOFCEfgQOE2zPuE4eG4NenvUl0Rq6T/RhXj1OfBjntuRYrog/c2M3HeIndz+t2/G
	 57eRR6hYFn5tzxG7hc+M7CjTY4q77Aw==
X-HalOne-Cookie: be863ec20ba9bb17b2b922a40b9ed748fe93cee8
X-HalOne-ID: 776ebeab-c16b-11eb-b56c-d0431ea8a290
Received: from xps.fritz.box (x4db6006d.dyn.telefonica.de [77.182.0.109])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 776ebeab-c16b-11eb-b56c-d0431ea8a290;
	Sun, 30 May 2021 17:21:28 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embexus.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embexus.com>
Subject: [meta-oe][PATCH] evemu-tools: Add initial recipe
Date: Sun, 30 May 2021 19:21:25 +0200
Message-Id: <20210530172125.16258-1-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.17.1

---
 .../evemu-tools/evemu-tools_git.bb            | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb

diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
new file mode 100644
index 000000000..f1172b0ef
--- /dev/null
+++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
@@ -0,0 +1,23 @@
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
+EXTRA_OECONF_append = " --prefix=/usr"
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${libdir}/python*/site-packages/*"
+RDEPENDS_${PN}-python = "python3"
+
-- 
2.17.1

