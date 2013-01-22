Received: from mail-ie0-f169.google.com ([209.85.223.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1Txmjw-0004P0-8p
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 23:54:49 +0100
Received: by mail-ie0-f169.google.com with SMTP id c14so12625649ieb.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 14:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=VzvXPddnL0YwhS0EB5r9mIMyIdcL4GeACDdJ11eiBR8=;
	b=hD0jVcdPWkKwO9P+FSnnTiRp8qvsmKBEp3kQ+hBN3vZgx8kmFC6guJMaALiZ63Stja
	jUCxFoPgQfXgqvdAYyOhvdwY9iISdcS131marMhWpAWxkUTokILxZIblzv/EVQoSJHT/
	mmCnROAHgty95ueF/4cHxM3BRUDPvwykuyWv8xx81q9zgd3r0EfuIHYT/8WHd/1vq3Jr
	M0dbXmElqYxQW9j9TxdWIoah0nEua8GcczYI+b8uCUTpmTUbcP++r0gscSVmWhaMJTu9
	peK9PBbStNs19PRbmBAyvTe0D/mFcDCRnD1aU9A7DRPNRacXqvpmYH88oXFCSDZUz2bS
	/ckQ==
X-Received: by 10.50.91.168 with SMTP id cf8mr13437883igb.20.1358894357248;
	Tue, 22 Jan 2013 14:39:17 -0800 (PST)
Received: from mars.hq.bec-systems.com (oh-69-34-21-229.sta.embarqhsd.net.
	[69.34.21.229])
	by mx.google.com with ESMTPS id u4sm12994943igw.6.2013.01.22.14.39.14
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 14:39:15 -0800 (PST)
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 17:39:08 -0500
Message-Id: <1358894348-10416-1-git-send-email-cliff.brake@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [PATCH] beagleboard.conf: add additional sound modules
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
X-List-Received-Date: Tue, 22 Jan 2013 22:54:49 -0000

From: Cliff Brake <cbrake@bec-systems.com>

require for audio to function

Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
---
 conf/machine/beagleboard.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index b3604a5..8f84c6c 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -48,4 +48,5 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512"
 MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
 
 # For a modularized kernel we want to drag in networking, sound, rtc etc."
-MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl"
+MACHINE_EXTRA_RRECOMMENDS = "kernel-module-smsc95xx kernel-module-snd-soc-twl4030 kernel-module-rtc-twl \
+  kernel-module-snd-soc-omap kernel-module-snd-soc-omap-mcbsp kernel-module-snd-soc-omap3beagle"
-- 
1.8.1.1



