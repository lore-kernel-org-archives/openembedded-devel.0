Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N2ks1-0002Pn-Og
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 13:09:53 +0100
Received: by ewy5 with SMTP id 5so76676ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=x6LEI+KTo5oPC13WqzHi2zaUVP9aW+dEJpokrL9mQrw=;
	b=sfnlqN5nfa5McQz/fomNggegQtF2OLBCSeU/Zn2NAAgxwu1H3F1LHBtiodvGfp64jh
	+D4zZ125FEa/BjqDUw2IBYKyJj2JoiXF2tW3XO6xmSBjjZoykHc6YahTxlGUwii0Ec/V
	2BZnLJ5FEC8ut1hp3IwxD7B5LVGdSDcFGQgzc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YTAER3LlrohQlEmUYOb3OpWJq5M4RYunGtE4nERFnytQ8ZAV2l4qUW3IDN05xA1V8g
	O1HMg/55p0JH5RdwdGt/dx/fQhkRZLNq0Sogqt3TzM4oLs8iEoFcZ+lvIbO1akz4QG9a
	QDnqq3b8DAIIyS9g5iSH5LrOy+4TD2Uc8Njk4=
Received: by 10.210.9.18 with SMTP id 18mr6589265ebi.34.1256645323794;
	Tue, 27 Oct 2009 05:08:43 -0700 (PDT)
Received: from localhost.localdomain (248.Red-213-97-239.staticIP.rima-tde.net
	[213.97.239.248])
	by mx.google.com with ESMTPS id 5sm2206947eyf.9.2009.10.27.05.08.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 27 Oct 2009 05:08:41 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Oct 2009 13:08:43 +0100
Message-Id: <1256645324-3210-1-git-send-email-eballetbo@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [PATCH v2 1/2] linux-igep2: Fix audio capture, the capture result is always silence
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
X-List-Received-Date: Tue, 27 Oct 2009 12:09:53 -0000

From: Enric Balletbo i Serra <eballetbo@iseebcn.com>


Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 conf/machine/include/omap3.inc                     |    2 +-
 .../twl-asoc-fix-record.diff                       |   34 ++++++++++++++++++++
 recipes/linux/linux-igep2_2.6.28.10-0.bb           |    4 ++
 3 files changed, 39 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-igep2-2.6.28.10-0/twl-asoc-fix-record.diff

diff --git a/conf/machine/include/omap3.inc b/conf/machine/include/omap3.inc
index 675249a..bb750aa 100644
--- a/conf/machine/include/omap3.inc
+++ b/conf/machine/include/omap3.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r47" 
+MACHINE_KERNEL_PR = "r48"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes/linux/linux-igep2-2.6.28.10-0/twl-asoc-fix-record.diff b/recipes/linux/linux-igep2-2.6.28.10-0/twl-asoc-fix-record.diff
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
diff --git a/recipes/linux/linux-igep2_2.6.28.10-0.bb b/recipes/linux/linux-igep2_2.6.28.10-0.bb
index ebe2918..c346da7 100644
--- a/recipes/linux/linux-igep2_2.6.28.10-0.bb
+++ b/recipes/linux/linux-igep2_2.6.28.10-0.bb
@@ -10,4 +10,8 @@ DEFAULT_PREFERENCE_igep0020 = "1"
 SRC_URI = "http://downloads.myigep.com/sources/kernel/linux-omap-2.6.28.10-igep0020b-0.tar.gz \
 	   file://defconfig"
 
+SRC_URI_append = " \
+	file://twl-asoc-fix-record.diff;patch=1 \
+"
+
 S = "${WORKDIR}/linux-omap-2.6.28.10-igep0020b-0"
-- 
1.5.4.3



