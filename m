Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1OlyYV-0007Vv-9n
	for Openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 08:25:03 +0200
Received: by pxi11 with SMTP id 11so572481pxi.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 23:24:20 -0700 (PDT)
Received: by 10.142.212.6 with SMTP id k6mr8100112wfg.94.1282199060653;
	Wed, 18 Aug 2010 23:24:20 -0700 (PDT)
Received: from [192.168.10.101] ([75.85.181.233])
	by mx.google.com with ESMTPS id y16sm1295976wff.14.2010.08.18.23.24.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 23:24:19 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Wed, 18 Aug 2010 23:24:13 -0700
Message-Id: <21FFFB05-40FD-4187-9FBB-F8FA6BB18C5E@chumby.com>
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
Subject: [PATCH 1/3][v2] chumby-falconwing: Create chumby-falconwing machine
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
X-List-Received-Date: Thu, 19 Aug 2010 06:25:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sean Cross <sean@chumby.com>
---
 conf/machine/chumby-falconwing.conf |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/chumby-falconwing.conf

diff --git a/conf/machine/chumby-falconwing.conf =
b/conf/machine/chumby-falconwing.conf
new file mode 100644
index 0000000..ed48cdb
--- /dev/null
+++ b/conf/machine/chumby-falconwing.conf
@@ -0,0 +1,24 @@
+#@TYPE: Machine
+#@Name: chumby Falconwing machine config.
+#@DESCRIPTION: Machine configuration for chumby Falconwing-based =
boards, such as the chumby One
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



