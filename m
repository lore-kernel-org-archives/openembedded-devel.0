Return-Path: <jason.liu@gumstix.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4B9E9782BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:31:59 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 123so18832862pgj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gumstix.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=wBLUB90dinPw2SIxb91Qd1JFEHAb7ns6dztbZaeo54M=;
	b=GNnCSenCMZa4tCrpFjM3DIv4GsRMzYvdKOD6Z6nTfDkC6497/s0R1FrPDP0x32MhSg
	Sd11s0aHCwJRRuRN/6f6bPuKUBXUVfNw+T8PgRNvP8HPFQ2/kwbBQgTfycb/8AlEovP0
	qIobaF817K1EYA9hRHrtTCOHaO/vSft9jMsWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wBLUB90dinPw2SIxb91Qd1JFEHAb7ns6dztbZaeo54M=;
	b=hQ9LtTyNYhwZqgQNYzdkmT2HUjeBy5HyxPyo201wZkOFZtdCvTIc8LF/fx2XMt4nH1
	V6OxPWo+2zCfPn6vPO+PqfLzm+xIGmizEeTlp0RRN9Z1c1NLg6Gunderr527YgQH9v3p
	Jgno9lgiAWiUe9lQdLraWHCl9S+Ku6eVHRrk04hmp6GQT6BCZ4Jh1DP35pVfSvY9dfHF
	nuWRiSilSOySJ1IHvjUB0F0uNygVWP0UIDmXuf/FBX91r56yrYQPEQzcEFs+ybWD34bh
	WHftsFV5EpswZYnpPQS84E2+H5xEfDaLzVZg5lPfK8TQwig5BwrLxSV9tDhYtMULapAo
	p2Tg==
X-Gm-Message-State: AIVw112IzV55n56DEmrP+TAAW09P8fyD1fFePbAfCYYGqV8e/vXILCuj
	GcFTEEU8DR3R9TOY2ys=
X-Received: by 10.98.153.76 with SMTP id d73mr4981221pfe.14.1500579120527;
	Thu, 20 Jul 2017 12:32:00 -0700 (PDT)
Received: from localhost.localdomain ([209.121.22.40])
	by smtp.gmail.com with ESMTPSA id
	n80sm5942756pfj.118.2017.07.20.12.31.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Jul 2017 12:32:00 -0700 (PDT)
From: Jason Liu <jason.liu@gumstix.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 12:31:33 -0700
Message-Id: <1500579093-29708-1-git-send-email-jason.liu@gumstix.com>
X-Mailer: git-send-email 2.7.4
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][morty][PATCH] libvdpau: Add recipe
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
X-List-Received-Date: Thu, 20 Jul 2017 19:31:59 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Needed for x86 machines

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
new file mode 100644
index 0000000..31f4df4
--- /dev/null
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Video Decode and Presentation API for UNIX"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
+
+DEPENDS = "virtual/libx11 libxext dri2proto"
+
+PV = "1.1.1+git${SRCPV}"
+
+SRCREV = "a21bf7aa438f5dd40d0a300a3167aa3d6f26dccc"
+SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    rm -f ${D}${libdir}/*/*.la
+}
+
+FILES_${PN}-dbg += "${libdir}/vdpau/.debug"
+FILES_${PN}-dev += "${libdir}/vdpau/lib*${SOLIBSDEV}"
+FILES_${PN} += "${libdir}/vdpau/lib*${SOLIBS}"
-- 
2.7.4


