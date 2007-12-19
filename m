Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4wbv-0005CH-6d
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2007 11:57:11 +0100
Received: by fg-out-1718.google.com with SMTP id 22so435277fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2007 02:52:11 -0800 (PST)
Received: by 10.86.78.4 with SMTP id a4mr8781302fgb.0.1198061531312;
	Wed, 19 Dec 2007 02:52:11 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id o11sm20776883fkf.2007.12.19.02.52.09
	(version=SSLv3 cipher=OTHER); Wed, 19 Dec 2007 02:52:10 -0800 (PST)
Date: Wed, 19 Dec 2007 12:57:27 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1194968499.20071219125727@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] Remove machine-unspecific modules from fic-gta*.conf
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2007 10:57:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  Following discussion of introduction of task-base's "vfat" feature
and situation when some machines still don't use task-base's power to
easy feature selection and facilitating maintenance, there're patches
to cleanup fic-gta*.conf to the state most other machines have
already. I submit this patch for pre-review, as I'm not sure if
fic-gta builds some non-task-base-based images which may start to lack
the removed modules (in this case, those modules should be added as
RRECOMMENDS to that image as, again, those modules are not machine-specific).


============================================================
--- conf/machine/fic-gta01.conf f27cbc4ecf805a9d8cb70b26d9922a2880880dfc
+++ conf/machine/fic-gta01.conf a22cc548559eb5dd955c13162775e39704964189
@@ -11,7 +11,7 @@ UBOOT_ENTRYPOINT = "30008000"
 PREFERRED_PROVIDER_virtual/kernel = "linux-openmoko"
 UBOOT_ENTRYPOINT = "30008000"
 
-MACHINE_FEATURES = "kernel26 apm alsa bluetooth gps usbgadget usbhost phone vfat"
+MACHINE_FEATURES = "kernel26 apm alsa bluetooth gps usbgadget usbhost phone vfat ext2"
 MACHINE_DISPLAY_WIDTH_PIXELS = "480"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
 MACHINE_DISPLAY_ORIENTATION = "0"
@@ -25,12 +25,8 @@ MACHINE_EXTRA_RRECOMMENDS = "\
   kernel-module-gta01-pm-gsm \
   kernel-module-gta01kbd \
   kernel-module-s3cmci \
-  kernel-module-ext2 \
-  kernel-module-vfat \
   kernel-module-snd-soc-neo1973-wm8753 \
   kernel-module-snd-soc-smdk2440 \
-  kernel-module-nls-iso8859-1 \
-  kernel-module-nls-cp437 \
 "
 
 # do not outcomment, we bypass the sysvinit.bb logic here -- see FIC GTA01 inittab
============================================================
--- conf/machine/fic-gta02.conf ccf9b87c36d24e1c3e118f08f60012f6c27e2dd8
+++ conf/machine/fic-gta02.conf 426ff7023d259a58a2b2d1d4e019468d2a171a6e
@@ -11,7 +11,7 @@ UBOOT_ENTRYPOINT = "30008000"
 PREFERRED_PROVIDER_virtual/kernel = "linux-openmoko"
 UBOOT_ENTRYPOINT = "30008000"
 
-MACHINE_FEATURES = "kernel26 apm alsa bluetooth gps usbgadget usbhost phone wifi vfat"
+MACHINE_FEATURES = "kernel26 apm alsa bluetooth gps usbgadget usbhost phone wifi vfat ext2"
 MACHINE_DISPLAY_WIDTH_PIXELS = "480"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
 MACHINE_DISPLAY_ORIENTATION = "0"
@@ -25,12 +25,8 @@ MACHINE_EXTRA_RRECOMMENDS = "\
   kernel-module-gta01-pm-gsm \
   kernel-module-gta01kbd \
   kernel-module-s3cmci \
-  kernel-module-ext2 \
-  kernel-module-vfat \
   kernel-module-snd-soc-neo1973-gta02-wm8753 \
   kernel-module-snd-soc-smdk2440 \
-  kernel-module-nls-iso8859-1 \
-  kernel-module-nls-cp437 \
 "


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



