Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.14977.1611782048261224328
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 13:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1BFCF24000B;
	Wed, 27 Jan 2021 21:14:04 +0000 (UTC)
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [meta-oe][PATCH] meta-oe: fix native inheritance order in recipes
Date: Wed, 27 Jan 2021 22:13:56 +0100
Message-Id: <20210127211356.2341996-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Classes native/nativesdk must be inherited last to prevent unexpected
behaviour.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb | 2 +-
 meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb        | 2 +-
 .../xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
index a54a7331df2d..604135839a7b 100644
--- a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
+++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/${BPN}"
 SRC_URI[md5sum] = "9de56d4a161a723228220b0f425dc711"
 SRC_URI[sha256sum] = "f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e"
 
-inherit native texinfo
+inherit texinfo native
 
 DEPENDS += "m4-native gnu-config-native"
 RDEPENDS_${PN} = "m4-native gnu-config-native"
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
index 4305e3b4086e..4641b0181aef 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util-native_0.10.bb
@@ -1,6 +1,6 @@
 require dfu-util_${PV}.bb
 
-inherit native deploy
+inherit deploy native
 
 DEPENDS = "libusb1-native"
 
diff --git a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
index 170e0bf785e4..becf9914884e 100644
--- a/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
+++ b/meta-oe/recipes-support/xserver-xorg-cvt/xserver-xorg-cvt-native_1.20.10.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 B = "${WORKDIR}/build"
 
-inherit native pkgconfig
+inherit pkgconfig native
 
 do_configure[noexec] = "1"
 
-- 
2.29.2

