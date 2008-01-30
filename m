Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <xjqian@gmail.com>) id 1JKAqV-0003uk-Vv
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 12:11:13 +0100
Received: by py-out-1112.google.com with SMTP id y77so219863pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2008 03:11:18 -0800 (PST)
Received: by 10.35.110.13 with SMTP id n13mr695439pym.26.1201691478236;
	Wed, 30 Jan 2008 03:11:18 -0800 (PST)
Received: from ?192.168.1.207? ( [24.107.189.117])
	by mx.google.com with ESMTPS id x48sm683979pyg.34.2008.01.30.03.11.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 30 Jan 2008 03:11:17 -0800 (PST)
Message-ID: <47A05B52.6000202@gmail.com>
Date: Wed, 30 Jan 2008 05:11:14 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: [RFC] add kernel-module-loop to roofs for collie and tosa
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
X-List-Received-Date: Wed, 30 Jan 2008 11:11:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

altboot-console-image needs loopback file support either in the kernel 
or as kernel module. CONFIG_BLK_DEV_LOOP=m were set for both collie and 
tosa. Other Z deviced has loopback file support built into the kernel. 
I would propose the following change [both dev and stable] to pack 
kernel-module-loop into the default rootfs for collie and tosa; and bump 
PR for task-base.

============================================================
--- conf/machine/collie.conf	c23a85835bc13ac978f36742cfc8ccf5880e0ec8
+++ conf/machine/collie.conf	062e7d70c35cf3f4db0e10e8b9f254fd47e39952
@@ -14,5 +14,7 @@ IMAGE_FSTYPES ?= "jffs2 tar.gz"
  IMAGE_LINGUAS = ""
  IMAGE_FSTYPES ?= "jffs2 tar.gz"

+MACHINE_EXTRA_RRECOMMENDS += "kernel-module-loop"
+
  ROOT_FLASH_SIZE = "14"
  # actually 14680064, see EXTRA_IMAGECMD above
============================================================
--- conf/machine/tosa.conf	bdda7deb7ee9f2d950ee255097efcdfa1cf7a39a
+++ conf/machine/tosa.conf	94e6eda28ba66d57c2ef49c6c11c78bf0c311349
@@ -7,6 +7,6 @@ IMAGE_FSTYPES ?= "jffs2"
  IMAGE_FSTYPES ?= "jffs2"

  # wlan-ng Modules
-MACHINE_EXTRA_RRECOMMENDS += "wlan-ng-modules-usb"
+MACHINE_EXTRA_RRECOMMENDS += "wlan-ng-modules-usb kernel-module-loop"

  ROOT_FLASH_SIZE = "28"


Regards
Gordon


