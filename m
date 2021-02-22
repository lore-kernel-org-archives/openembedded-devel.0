Received: from mailrelay3-2.pub.mailoutpod1-cph3.one.com (mailrelay3-2.pub.mailoutpod1-cph3.one.com [46.30.212.2])
 by mx.groups.io with SMTP id smtpd.web08.32583.1613983036330079082
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 00:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bsorensen.net header.s=20191106 header.b=IXr0zphI;
 spf=none, err=permanent DNS error (domain: bsorensen.net, ip: 46.30.212.2, mailfrom: yocto@bsorensen.net)
Received: from mailrelay1.pub.mailoutpod2-cph3.one.com (mailrelay1.pub.mailoutpod2-cph3.one.com [104.37.34.6])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
	id 299b92d6-74e9-11eb-8cc9-d0431ea8bb03;
	Mon, 22 Feb 2021 08:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bsorensen.net; s=20191106;
	h=content-transfer-encoding:content-type:mime-version:message-id:date:subject:
	 cc:to:from:from;
	bh=4FnYfRVv/r6A3LsmTWuAE7vZsPoE14qSzTOxU2vf914=;
	b=IXr0zphIVkht8pfxawwDsNI0SdgdTfTIx1MlXhXL2baJ8pC2XXXkTBDRklR9/7ZNvRAjpu90SSiCO
	 sEl9LEmPs+0GWpO2jMqbxyaelepgfkYUGlWrjMCxlKSPTH5W1YHELcMJ4nVCRpv+tFQ6MXqbAaFaot
	 +tM4m+cTLhhvZaOQbAnzINX52WQUbbQaoYDjsZyyUOTV6wMUqj/7PZSmjuY/2CakfzO+pesiGniSuY
	 tSgxUvbfU4WP2U4hpcB7tKPlabVkfMC8QgmUJxPS9WdteR9evYj0lxWtOde552f/Px1Lil6WpJSxR8
	 gMlLgr5hvTwz+hAwFgh9AYs8QhLrWAQ==
X-HalOne-Info: /vSL2UdlFhowSDAh6RHi94MgkiwXdPGUNe7X+Fsy2Lu9yVd6hHIyZdRj1UXTkXtI
 rCribYf5pseoXfb9mt/xFnLS6If335w3idc5hYHvld7p7o111+UQfecODAISRU1R
X-HalOne-ID: 2878128c-74e9-11eb-82bc-bfe844bf1d4a
Received: from pc.prevas.se (unknown [81.216.59.226])
	by mailrelay1 (Halon) with ESMTPSA
	id 2878128c-74e9-11eb-82bc-bfe844bf1d4a;
	Mon, 22 Feb 2021 08:37:13 +0000 (UTC)
From: =?UTF-8?B?Q2hyaXN0aWFuIEIuIFPDuHJlbnNlbg==?= <yocto@bsorensen.net>
To: openembedded-devel@lists.openembedded.org
Cc: chbs@prevas.dk,
	=?UTF-8?q?Christian=20Br=C3=A4uner=20S=C3=B8rensen?= <yocto@bsorensen.net>
Subject: [meta-oe][PATCH v2] libgpiod: packageqa problem => static python lib to ${PN}-staticdev
Date: Mon, 22 Feb 2021 09:37:11 +0100
Message-Id: <20210222083711.412474-1-yocto@bsorensen.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Problem:
QA Issue: non -staticdev package contains static .a library

Reason:
Both /usr/lib/python3.8/site-packages/gpiod.a and
/usr/lib/python3.8/site-packages/gpiod.so are in ${PN}-python.

Signed-off-by: Christian Bräuner Sørensen <yocto@bsorensen.net>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
index aec50e7e6..96ed3f18f 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
@@ -28,6 +28,7 @@ FILES_${PN}-tools = "${bindir}/*"
 FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 
 PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
 RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
-- 
2.25.1

