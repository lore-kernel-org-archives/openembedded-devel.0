Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1Olrfb-0006oA-Pr
	for Openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 01:03:45 +0200
Received: by pxi11 with SMTP id 11so438485pxi.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 16:03:23 -0700 (PDT)
Received: by 10.142.68.15 with SMTP id q15mr7374953wfa.181.1282172603397;
	Wed, 18 Aug 2010 16:03:23 -0700 (PDT)
Received: from [172.22.3.240] (ip65-44-204-2.z204-44-65.customer.algx.net
	[65.44.204.2])
	by mx.google.com with ESMTPS id t11sm889935wfc.16.2010.08.18.16.03.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 16:03:22 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Wed, 18 Aug 2010 16:03:17 -0700
Message-Id: <811234B8-DFDF-42A4-9064-757210CE3CE5@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] Add falconwing machine config
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Aug 2010 23:03:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Sean Cross <sean@chumby.com>
---
 conf/machine/chumby-falconwing.conf |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/chumby-falconwing.conf
diff --git a/conf/machine/chumby-falconwing.conf =
b/conf/machine/chumby-falconwin
g.conf
new file mode 100644
index 0000000..ed48cdb
--- /dev/null
+++ b/conf/machine/chumby-falconwing.conf
@@ -0,0 +1,24 @@
+#@TYPE: Machine
+#@Name: chumby Falconwing machine config.+#@DESCRIPTION: Machine =
configuration for chumby Falconwing-based boards, such a
s the chumby One
+
+TARGET_ARCH =3D "arm"
+
+MACHINE_GUI_CLASS =3D "smallscreen"
+MACHINE_DISPLAY_WIDTH_PIXELS =3D "320"
+MACHINE_DISPLAY_HEIGHT_PIXELS =3D "240"
+
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-chumby-falconwing"
+PREFERRED_PROVIDER_virtual/bootloader =3D =
"bootstream-chumby-falconwing"
+
+require conf/machine/include/tune-arm926ejs.inc
+
+# used by sysvinit_2
+SERIAL_CONSOLE =3D "115200 ttyAM0"
+
+ROOT_FLASH_SIZE =3D "128"
+
+MACHINE_FEATURES =3D "kernel26 usbhost touchscreen ext2 ext3 vfat =
keyboard alsa"
+IMAGE_FSTYPES =3D "ext3.gz tar.gz"
+
+#MACHINE_ESSENTIAL_EXTRA_RDEPENDS =3D "virtual/bootloader"
--=20
1.7.0.4




