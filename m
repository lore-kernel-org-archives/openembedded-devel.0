Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9A0C77D53C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 18:55:38 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id f18so12236773lja.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 11:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jBUKggm3xT1yEEkcZVGqr6e3hPZ1IOwPU2TT/4797QY=;
	b=XD4yuX1FRFxaKVZX7AiIZZrd/DgwimicDhEnpCfMlZULKZPz5GyIVgxhMHc/rHZL2r
	Dmyg+Sd3H17ntS6EzvwPzzFZ1WskQBdDdJ+ffJ3MDAF5yGo+1b8I4JX8yYG2Bk/toeva
	Kxftr3juDRgkh4RBz/72yGgsA6Ofse1sOTkoH6N4sbw7cbXeydeUwTSHLx/D770HrvW3
	MaG1aKhkcBZEqqh00K4DqM2IHXfpeC+5v4mWmPi2owaI7qsKIP44aLA2uz7Ff9IUZ/Ba
	J+L4ZBFC4tZbA0zjfIP4yYwV9KW5Hh7hUFNx3D/WWBGaVoYlxYp/hYJtHwqm6tdrP/RF
	MxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jBUKggm3xT1yEEkcZVGqr6e3hPZ1IOwPU2TT/4797QY=;
	b=mNLVRt6k5UtdaELLQsz4UZIx1wj1/QsprOA7aAoZl7Z+qJHHltdmlIZaWN5gfsDzE9
	Ek75ViJ0yjXAbGNwQWDElD99hY7qZZdBFhP7Hx10UZLGJxQCCbnkAs460oS2rLfoOqzr
	//mMvfoU+cVrRmD0a29YJA1G9g6CLFFw8o/ocBrTA49c40l1P5CEg7AK4OT6eXso23CL
	SOjIs415ksRnylvK8eGByOjiqFgAcrJVci5aHfoMmRgZVN1PrIJ5NBJ2OzNnR2BOaGuW
	+kGCdaxAhi9w/CG4ZexZCl+/QMqkXp4ji+CchTP6/3hYz9NE/+9uOIa3LSl+YTXZfpvA
	JMpQ==
X-Gm-Message-State: APjAAAWUV3pl1QkaBrielzeCmbK+Y9UAjXxNada5DjQIL1CCDQNRg1c0
	hSD09rWiCHp1m+KIs5YrUMP9obrkCV0=
X-Google-Smtp-Source: APXvYqxBpSK+VZ1Qu6pEufK1G918bjypQNkqsnGxgPFMnMlKT+WRqfQl77uDdKMpHH5H7/D9+2bF4Q==
X-Received: by 2002:a2e:5bcc:: with SMTP id m73mr8595166lje.100.1554749738718; 
	Mon, 08 Apr 2019 11:55:38 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id k2sm6105859lfb.62.2019.04.08.11.55.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 11:55:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Apr 2019 20:55:31 +0200
Message-Id: <20190408185531.24570-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-networking] macchanger: update to 1.7.0
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
X-List-Received-Date: Mon, 08 Apr 2019 18:55:39 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../macchanger/0001-fix-build-with-musl.patch | 13 ++++++++++
 .../macchanger/macchanger_1.5.0.bb            | 24 ------------------
 .../macchanger/macchanger_1.7.0.bb            | 25 +++++++++++++++++++
 3 files changed, 38 insertions(+), 24 deletions(-)
 create mode 100644 meta-networking/recipes-support/macchanger/macchanger/0001-fix-build-with-musl.patch
 delete mode 100644 meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
 create mode 100644 meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb

diff --git a/meta-networking/recipes-support/macchanger/macchanger/0001-fix-build-with-musl.patch b/meta-networking/recipes-support/macchanger/macchanger/0001-fix-build-with-musl.patch
new file mode 100644
index 000000000..4a30d5510
--- /dev/null
+++ b/meta-networking/recipes-support/macchanger/macchanger/0001-fix-build-with-musl.patch
@@ -0,0 +1,13 @@
+Index: macchanger-1.7.0/src/netinfo.c
+===================================================================
+--- macchanger-1.7.0.orig/src/netinfo.c
++++ macchanger-1.7.0/src/netinfo.c
+@@ -113,7 +113,7 @@ mc_net_info_get_permanent_mac (const net
+ 	epa->size = IFHWADDRLEN;
+ 
+ 	memcpy(&req, &(net->dev), sizeof(struct ifreq));
+-	req.ifr_data = (caddr_t)epa;
++	req.ifr_data = (char *)epa;
+ 
+ 	if (ioctl(net->sock, SIOCETHTOOL, &req) < 0) {
+ 		perror ("[ERROR] Could not read permanent MAC");
diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
deleted file mode 100644
index a90177f19..000000000
--- a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Tool to view/change network interface MAC addresses"
-DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
-HOMEPAGE = "http://www.alobbs.com/macchanger"
-LICENSE  = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-SECTION = "net"
-
-SRC_URI  = "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
-SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
-
-FILES_${PN} = " \
-    ${bindir}/${BPN} \
-    ${datadir}/${BPN}/wireless.list \
-    ${datadir}/${BPN}/OUI.list \
-"
-
-FILES_${PN}-doc = " \
-    ${datadir}/info \
-    ${datadir}/man \
-"
-
-inherit autotools
diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
new file mode 100644
index 000000000..d4a6e49e5
--- /dev/null
+++ b/meta-networking/recipes-support/macchanger/macchanger_1.7.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Tool to view/change network interface MAC addresses"
+DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
+HOMEPAGE = "https://github.com/alobbs/macchanger"
+LICENSE  = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "net"
+
+SRC_URI = "https://github.com/alobbs/macchanger/releases/download/${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-fix-build-with-musl.patch \
+"
+SRC_URI[md5sum] = "ca56f16142914337391dac91603eb332"
+SRC_URI[sha256sum] = "dae2717c270fd5f62d790dbf80c19793c651b1b26b62c101b82d5fdf25a845bf"
+
+FILES_${PN} = " \
+    ${bindir}/${BPN} \
+    ${datadir}/${BPN}/wireless.list \
+    ${datadir}/${BPN}/OUI.list \
+"
+
+FILES_${PN}-doc = " \
+    ${datadir}/info \
+    ${datadir}/man \
+"
+
+inherit autotools
-- 
2.17.1


