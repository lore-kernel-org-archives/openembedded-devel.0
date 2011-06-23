Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QZc9L-0008Bd-UP
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 07:08:20 +0200
Received: by ywa12 with SMTP id 12so648093ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 22:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=Av33Z+BjlHsG6m9ZYlcKsEh8ypiZBw83FsLw6t6g7rM=;
	b=EFCFKKVJdzdct8IAdoL3pk9uRvCaDwlUpk30U31Iopdh98UG6JXAJTDPonln7lREZM
	pw3yyupzwTT0g3emOlBEGii7Y2/PcqO+ze0CR+YnfK/IrzMn0470se5UIVn+IMjdSAAp
	31VSyJ9hYq5kYiN4YJC8o8OywOPKqtxjA1Fmg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=jY+6M6R+j7VwMzBT0VKmK/9NR8Q50+d0/4VV8ZrRo8OWl4xVUPEZtBVEte0y//I6IU
	cHacwmeb1hU7o+bXKpvUtOtU7CxPZC+/hDlHBP1IAxmyqPNrjwh1quxSC7kb9KHeoONf
	r5PMOCCCKXANT8N/a2DP+IikrVccAvvS/JOu0=
Received: by 10.101.211.16 with SMTP id n16mr1180384anq.100.1308805483466;
	Wed, 22 Jun 2011 22:04:43 -0700 (PDT)
Received: from [192.168.1.101] (cpe-76-184-244-226.tx.res.rr.com
	[76.184.244.226])
	by mx.google.com with ESMTPS id r4sm1215271ann.1.2011.06.22.22.04.41
	(version=SSLv3 cipher=OTHER); Wed, 22 Jun 2011 22:04:42 -0700 (PDT)
Message-ID: <4E02C968.9010308@gmail.com>
Date: Thu, 23 Jun 2011 00:04:40 -0500
From: Joel A Fernandes <agnel.joel@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] linux-omap: Disable UART sleep timeout to avoid serial port problems on wakeup.
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
X-List-Received-Date: Thu, 23 Jun 2011 05:08:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

linux-omap: Disable UART sleep timeout to avoid serial port problems on wakeup.
    
Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 ...0046-ARM-OMAP-beagle-disable-uart-timeout.patch |   21 ++++++++++++++++++++
 recipes/linux/linux-omap-psp_2.6.32.bb             |    1 +
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/recipes/linux/linux-omap-psp-2.6.32/0046-ARM-OMAP-beagle-disable-uart-timeout.patch b/recipes/linux/linux-omap-psp-2.6.32/0046-ARM-OMAP-beagle-disable-uart-timeout.patch
new file mode 100644
index 0000000..b0c0d0b
--- /dev/null
+++ b/recipes/linux/linux-omap-psp-2.6.32/0046-ARM-OMAP-beagle-disable-uart-timeout.patch
@@ -0,0 +1,21 @@
+commit 06a8d6478752403a617ed9fb9f6b78c31ad25020
+Author: Joel A Fernandes <agnel.joel@gmail.com>
+Date:   Tue Jun 21 17:31:13 2011 -0500
+
+    omap: Disable UART sleep timeout to avoid serial port problems on wakeup.
+    
+    Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
+
+diff --git a/arch/arm/mach-omap2/serial.c b/arch/arm/mach-omap2/serial.c
+index 19805a7..35a24af 100644
+--- a/arch/arm/mach-omap2/serial.c
++++ b/arch/arm/mach-omap2/serial.c
+@@ -36,7 +36,7 @@
+ #define UART_OMAP_NO_EMPTY_FIFO_READ_IP_REV	0x52
+ #define UART_OMAP_WER		0x17	/* Wake-up enable register */
+ 
+-#define DEFAULT_TIMEOUT (5 * HZ)
++#define DEFAULT_TIMEOUT 0
+ 
+ struct omap_uart_state {
+ 	int num;
diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
index da2e943..11e1f06 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -58,6 +58,7 @@ SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=http;br
            file://0043-MTD-silence-ecc-errors-on-mtdblock0.patch \
            file://0044-ARM-OMAP-beagle-every-known-beagle-except-revB-uses-.patch \
            file://0045-ARM-OMAP-beagle-add-support-for-beagleFPGA-expansion.patch \
+           file://0046-ARM-OMAP-beagle-disable-uart-timeout.patch \
            file://cam/0001-mt9t111-first-stab-at-merging-sensor-driver-based-on.patch \
            file://cam/0002-mt9t111-Fix-all-checkpatch-errors.patch \
            file://cam/0003-mt9t111-Pass-v4l2_int_device-data.patch \


