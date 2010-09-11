Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1OuSHW-0004k0-Fd
	for Openembedded-devel@lists.openembedded.org;
	Sat, 11 Sep 2010 17:46:24 +0200
Received: by pxi11 with SMTP id 11so1527750pxi.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 11 Sep 2010 08:45:36 -0700 (PDT)
Received: by 10.142.148.12 with SMTP id v12mr1235562wfd.21.1284219936573;
	Sat, 11 Sep 2010 08:45:36 -0700 (PDT)
Received: from [192.168.10.100] (cm28.eta34.maxonline.com.sg [116.88.34.28])
	by mx.google.com with ESMTPS id t18sm5096775wfc.23.2010.09.11.08.45.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 11 Sep 2010 08:45:35 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Sat, 11 Sep 2010 23:45:32 +0800
Message-Id: <5877F7DD-4CBA-4BAF-B57C-3468CE5E9784@chumby.com>
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
Subject: [PATCH][v4,1/3] chumby-falconwing: Add machine definition
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
X-List-Received-Date: Sat, 11 Sep 2010 15:46:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Adds the machine definition for chumby Falconwing-based boards

---
 conf/machine/chumby-falconwing.conf |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/chumby-falconwing.conf

diff --git a/conf/machine/chumby-falconwing.conf =
b/conf/machine/chumby-falconwing.conf
new file mode 100644
index 0000000..1e30288
--- /dev/null
+++ b/conf/machine/chumby-falconwing.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@Name: chumby Falconwing i.MX233-based boards
+#@DESCRIPTION: Machine configuration for chumby Falconwing platform=20
+
+TARGET_ARCH =3D "arm"
+
+MACHINE_GUI_CLASS =3D "smallscreen"
+MACHINE_DISPLAY_WIDTH_PIXELS =3D "320"
+MACHINE_DISPLAY_HEIGHT_PIXELS =3D "240"
+
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-imx"
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
--=20
1.7.0.4



