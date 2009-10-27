Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N2hqv-0000UV-Li
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 09:56:32 +0100
Received: by mail-ew0-f209.google.com with SMTP id 5so8624074ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=gLnWCKSs5qrSnacJU76aZ/FiXFvPfIcE6JUangJ0mgU=;
	b=G28ZDXFKrV4gxbZvGtvaQAbkwC6Mgh4U0XVzICLRuS88oDzYadiKPrO1xbkIlF9Frd
	BilkPyqq1YzBzoyCLWO4ACWugOrVEoJ28iYA+ZP5ApiPk/ZqQZcStQHvG4L+MgqVD/BZ
	k5j/vMOITNMwt/rnaKkAGVqD7Zonu0z8R5764=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=iwP99nZGhHhc6+XHUlyRFquInOpHw7G+5SxAyxze3JdNG+8MHNVaFVoPiapsdCYAr+
	JuFAh6NYhHq7wHeR9XZhnEu2oGOCbU9VLdYoXipf3aVn5Pfrl4kkFIVO7tHp023ip7E6
	N2iRaOxz9ZFdyjOctNR5IGmKO5cXADl3iRdzI=
MIME-Version: 1.0
Received: by 10.216.88.8 with SMTP id z8mr1392981wee.109.1256633725542; Tue, 
	27 Oct 2009 01:55:25 -0700 (PDT)
Date: Tue, 27 Oct 2009 09:55:25 +0100
Message-ID: <70c9a9110910270155icf53d8ch58eb11ae9b3f890f@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/5] linux-igep2: Fix audio capture, the capture result is 	always silence
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
X-List-Received-Date: Tue, 27 Oct 2009 08:56:32 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 conf/machine/include/omap3.inc                     |    2 +-
 .../twl-asoc-fix-record.diff                       |   34 ++++++++++++++++++++
 recipes/linux/linux-igep2_2.6.28.10-0.bb           |    4 ++
 3 files changed, 39 insertions(+), 1 deletions(-)
 create mode 100644
recipes/linux/linux-igep2-2.6.28.10-0/twl-asoc-fix-record.diff

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 675249a..aee61a1 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r47"
+MACHINE_KERNEL_PR = "r48"

 KERNEL_IMAGETYPE = "uImage"

diff --git a/recipes/linux/linux-igep2-2.6.28.10-0/twl-asoc-fix-record.diff
b/recipes/linux/linux-igep2-2.6.28.10-0/twl-asoc-fix-record.diff
new file mode 100644
index 0000000..9c0ceaa
--- /dev/null
+++ b/recipes/linux/linux-igep2-2.6.28.10-0/twl-asoc-fix-record.diff
@@ -0,0 +1,34 @@
+From linux-omap-owner@vger.kernel.org Sat Dec 06 02:14:21 2008
+Date: 	Fri, 5 Dec 2008 16:46:34 -0800
+From: "Steve Sakoman" <sakoman@gmail.com>
+To: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
+Subject: [FYI PATCH] ASOC:TWL4030 Audio capture fix
+
+A couple of folks have noticed an issue with audio capture -- the
+capture result is always silence.
+
+The patch below is a quick fix for those with this issue.  There are
+substantial changes to the codec driver that will be trickling down
+from ASoC, and they deal with this issue differently.
+
+So consider this as a bandaid for those who don't want to wait for the
+trickle down :-)
+
+Steve
+
+
+diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
+index ee2f0d3..8b4aafb 100644
+--- a/sound/soc/codecs/twl4030.c
++++ b/sound/soc/codecs/twl4030.c
+@@ -45,8 +45,8 @@ static const u8 twl4030_reg[TWL4030_CACHEREGNUM] = {
+ 	0xc3, /* REG_OPTION		(0x2)	*/
+ 	0x00, /* REG_UNKNOWN		(0x3)	*/
+ 	0x00, /* REG_MICBIAS_CTL	(0x4)	*/
+-	0x24, /* REG_ANAMICL		(0x5)	*/
+-	0x04, /* REG_ANAMICR		(0x6)	*/
++	0x34, /* REG_ANAMICL		(0x5)	*/
++	0x14, /* REG_ANAMICR		(0x6)	*/
+ 	0x0a, /* REG_AVADC_CTL		(0x7)	*/
+ 	0x00, /* REG_ADCMICSEL		(0x8)	*/
+ 	0x00, /* REG_DIGMIXING		(0x9)	*/
diff --git a/recipes/linux/linux-igep2_2.6.28.10-0.bb
b/recipes/linux/linux-igep2_2.6.28.10-0.bb
index ebe2918..8904724 100644
--- a/recipes/linux/linux-igep2_2.6.28.10-0.bb
+++ b/recipes/linux/linux-igep2_2.6.28.10-0.bb
@@ -10,4 +10,8 @@ DEFAULT_PREFERENCE_igep0020 = "1"
 SRC_URI = "http://downloads.myigep.com/sources/kernel/linux-omap-2.6.28.10-igep0020b-0.tar.gz
\
 	   file://defconfig"

+SRC_URI_append = "\
+	   file://twl-asoc-fix-record.diff;patch=1 \
+	"
+
 S = "${WORKDIR}/linux-omap-2.6.28.10-igep0020b-0"
-- 
1.5.4.3


