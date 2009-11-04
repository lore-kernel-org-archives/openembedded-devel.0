Received: from [131.111.8.136] (helo=ppsw-6.csi.cam.ac.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jic23@cam.ac.uk>) id 1N5m5Z-0006Qh-7A
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 21:04:20 +0100
X-Cam-AntiVirus: no malware found
X-Cam-SpamDetails: not scanned
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from arcturus.eng.cam.ac.uk ([129.169.154.73]:47075)
	by ppsw-6.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.156]:25)
	with esmtpsa (PLAIN:jic23) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1N5m4Q-0002eg-M4 (Exim 4.70) for
	openembedded-devel@lists.openembedded.org
	(return-path <jic23@cam.ac.uk>); Wed, 04 Nov 2009 20:03:06 +0000
Message-ID: <4AF1DE15.3010307@cam.ac.uk>
Date: Wed, 04 Nov 2009 20:03:33 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
User-Agent: Thunderbird 2.0.0.23 (X11/20091029)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.96.0
X-SA-Exim-Connect-IP: 131.111.8.136
X-SA-Exim-Mail-From: jic23@cam.ac.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] IMote2 variant of angstrom minimalist image
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
X-List-Received-Date: Wed, 04 Nov 2009 20:04:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
---
Changes in here from the normal minimalist image are
mostly to match software on the pre openembedded
imote2-linux distributions (imote2-linux.sourceforge.net).


 recipes/images/imote2-image.bb |   96 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 96 insertions(+), 0 deletions(-)

diff --git a/recipes/images/imote2-image.bb b/recipes/images/imote2-image.bb
new file mode 100644
index 0000000..2d9f36e
--- /dev/null
+++ b/recipes/images/imote2-image.bb
@@ -0,0 +1,96 @@
+#Angstrom minimalist image customized for imote2
+#gives you a small image with ssh access
+
+ANGSTROM_EXTRA_INSTALL ?= ""
+DISTRO_SSH_DAEMON ?= "dropbear"
+
+SPLASH ?= " "
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+SOUND_MODULES = " \
+	      kernel-module-soundcore \
+	      kernel-module-snd \
+	      kernel-module-snd-timer \
+	      kernel-module-snd-soc-pxa2xx \
+	      kernel-module-snd-soc-core \
+	      kernel-module-snd-pxa2xx-lib \
+	      kernel-module-snd-pcm \
+	      kernel-module-snd-page-alloc \
+	    "
+
+SOC_CAMERA_MODULES = " \
+		   kernel-module-i2c-gpio \
+		   kernel-module-i2c-algo-bit \
+		   kernel-module-videobuf-core \
+	    	   kernel-module-v4l2-common \
+	    	   kernel-module-v4l2-int-device \
+	    	   kernel-module-videobuf-dma-sg \
+	    	   kernel-module-videodev \
+	    	   kernel-module-soc-camera \
+		   kernel-module-pxa-camera \
+		   kernel-module-ov7670 \
+		   "  
+
+IIO_MODULES = " \
+	      kernel-module-lis3l02dq \	
+	      kernel-module-sca3000 \	
+	      kernel-module-max1363 \
+	      kernel-module-iio-trig-periodic-rtc \
+	      kernel-module-iio-trig-gpio \
+	      kernel-module-industrialio \
+	      kernel-module-tsl2561 \
+	      kernel-module-ring-sw \
+	      kernel-module-kxsd9 \
+	      "
+SDIO_MODULES =	" \
+	     kernel-module-pxamci \
+	     "
+
+WIRELESS = " \
+	 kernel-module-lib80211 \
+	 kernel-module-cryptomgr \
+	 kernel-module-crypto-wq \
+	 kernel-module-crypto-hash \
+	 kernel-module-crypto-blkcipher \
+	 kernel-module-crypto-algapi \
+	 kernel-module-crc-t10dif \
+	 kernel-module-libertas \
+	 kernel-module-libertas-sdio \
+	 marvell-sdio-fw \
+	 wireless-tools \
+	 "
+
+IMAGE_INSTALL = "task-boot \
+            util-linux-ng-mount util-linux-ng-umount \
+            ${DISTRO_SSH_DAEMON} \
+            ${ANGSTROM_EXTRA_INSTALL} \
+            angstrom-version \
+            ${SPLASH} \
+	    ${SDIO_MODULES} \
+	    ${IIO_MODULES} \
+	    ${SOC_CAMERA_MODULES} \
+	    ${SOUND_MODULES} \
+	    ${WIRELESS} \
+	    kernel-modules \
+	    kernel-module-ssp \
+	    kernel-module-sht15 \
+	    kernel-module-sd-mod \
+	    kernel-module-rtc-core \
+	    kernel-module-pxa2xx-spi \
+	    kernel-module-pcf857x \
+	    kernel-module-mmc-core \
+	    kernel-module-lm75 \
+	    kernel-module-leds-gpio \
+	    kernel-module-led-class \
+	    kernel-module-chainiv \
+	    kernel-module-arc4 \
+	    kernel-module-aead \
+	    chrony \
+	   "
+
+export IMAGE_BASENAME = "imote2-image"
+IMAGE_LINGUAS = ""
+
+inherit image
+
-- 
1.6.0.4



