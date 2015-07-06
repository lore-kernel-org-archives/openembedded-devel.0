Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id B9DC66E5F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2015 15:23:05 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so97078391pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jul 2015 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MzjZMMqp8Nvc3rnlGaGhNTBF15jov0bnQk+cZZ79gvg=;
	b=ukVqBqXZ2lAkRYaDN2Hnv7rFWpE+5h68i4oU3AkyJgifQZpsy6mTT09kiCfUTPceey
	Sh5ParUKkE9mYS4eHyWxFPToybxjmmrnGs4DEnWGMCVJBUUI+VehxfAvMCXv7m3DMSuS
	nlLg29VOLXagip4YofW7im2UMaUuu7335/EKdbkf7fMXJ9SWZwKbh9hwnaZaqC5X0c8D
	ih7LVUWCZ9Ix9GaxIOzIPf9pyA85XCXC1DkDMRSf7EzeMzoSsPl3DiiPjVDkEsCUQ/Kx
	EyPt90We1rhLN5ZUUWBJCycLlAdeVt9u8hCfWh5+Jpa6gfeFj5KIOHHoFPa41X97T8Ip
	XYWA==
X-Received: by 10.66.216.161 with SMTP id or1mr106356533pac.34.1436196185660; 
	Mon, 06 Jul 2015 08:23:05 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ug1sm18618066pbc.39.2015.07.06.08.23.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 08:23:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	joe_macdonald@mentor.com
Date: Mon,  6 Jul 2015 08:22:57 -0700
Message-Id: <1436196177-23145-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH] nbd: Add new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jul 2015 15:23:05 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-networking/recipes-support/nbd/nbd_3.11.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-networking/recipes-support/nbd/nbd_3.11.bb

diff --git a/meta-networking/recipes-support/nbd/nbd_3.11.bb b/meta-networking/recipes-support/nbd/nbd_3.11.bb
new file mode 100644
index 0000000..70dc7e9
--- /dev/null
+++ b/meta-networking/recipes-support/nbd/nbd_3.11.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Network Block Device"
+HOMEPAGE = "http://nbd.sourceforge.net"
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://depcomp;beginline=6;endline=26;md5=3a3627e6495e2ff2a3316bcdaad91e9c"
+
+DEPENDS = "glib-2.0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "73d11644a28b9f335292cdb3bdc4b74b"
+SRC_URI[sha256sum] = "14420f74cb16dc609a9302ed1efd653064bed7a8357e9d73daabc33608e3f2a0"
+
+inherit autotools pkgconfig
+
+PACKAGES = "${PN}-client ${PN}-server ${PN}-dbg ${PN}-trdump ${PN}-doc"
+
+FILES_${PN}-client = "${sbindir}/${PN}-client"
+FILES_${PN}-server = "${bindir}/${PN}-server"
+FILES_${PN}-trdump = "${bindir}/${PN}-trdump"
-- 
2.3.5


