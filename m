Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PcKYc-0005R5-PR
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 17:25:22 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PcKY4-0005wG-O8 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 08:24:48 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 10 Jan 2011 08:24:48 -0800
Received: from localhost.localdomain ([134.86.97.1]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 10 Jan 2011 09:24:47 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 09:24:56 -0700
Message-Id: <1294676696-13896-2-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1294676696-13896-1-git-send-email-tom_rini@mentor.com>
References: <1294676696-13896-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 10 Jan 2011 16:24:47.0454 (UTC)
	FILETIME=[E5CA77E0:01CBB0E2]
Subject: [PATCH 2/2] qemu.inc: Switch to xserver-xorg
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
X-List-Received-Date: Mon, 10 Jan 2011 16:25:23 -0000

Keeping with xserver-kdrive means that we have a sometimes race
in that xserver-kdrive is too old for the other xorg components that
are built (with X11R7.5) to build.  So we switch to xserver-xorg and
appropriate modules.  Tested on qemux86 and x11-image.

Acked-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 conf/machine/include/qemu.inc |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/qemu.inc b/conf/machine/include/qemu.inc
index 852c12a..83bd67f 100644
--- a/conf/machine/include/qemu.inc
+++ b/conf/machine/include/qemu.inc
@@ -1,5 +1,11 @@
 PCMCIA_MANAGER = "pcmciautils"
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-tslib \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard"
 GUI_MACHINE_CLASS = "bigscreen"
 
 MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen keyboard touchscreen"
-- 
1.7.0.2



