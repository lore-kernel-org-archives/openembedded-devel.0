Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OnNTn-0004yM-7Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 05:13:57 +0200
Received: by pvg6 with SMTP id 6so2160360pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 20:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=y41jcjhVJ/jbel3PNRRx06iXsU/vFgocgayhdO36ab8=;
	b=BEqyK8hans8mZi3L2m93W0H48L3YA6g1ZYR65kZMr26hyMItgGhpgfTF/XRoEbCtfI
	HW6ppNj1c46pSguLo8UX2+XKfX02JKypTrokf/7Jsft8evfHpb3Cz+5zmJvqfptFZGtr
	L4qFKZZKlAYa+/NBxVw3mya3FZoX5T7yDYKPM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=WXB/45uLByltC1Nr2OYp/XKT3UsyzgwWNVmu9VkhKn2mDLhkQ89MfUjiStp+fG/lOI
	m4RCeRlrm8/xdsEEzGXlyknztrK8PY14nPI7mnWbPl+r6akgEJh8Y78KXVyBy0qFX1sw
	Tb4839FkoIN8hHyaXxvXzyBrKew/1fRoKfquA=
Received: by 10.114.127.17 with SMTP id z17mr5239803wac.158.1282533202472;
	Sun, 22 Aug 2010 20:13:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d38sm11586601wam.8.2010.08.22.20.13.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 22 Aug 2010 20:13:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 20:13:09 -0700
Message-Id: <1282533191-11579-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
References: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] efikamx.conf: Add config file for efika MX
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
X-List-Received-Date: Mon, 23 Aug 2010 03:13:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/efikamx.conf |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/efikamx.conf

diff --git a/conf/machine/efikamx.conf b/conf/machine/efikamx.conf
new file mode 100644
index 0000000..eceb87c
--- /dev/null
+++ b/conf/machine/efikamx.conf
@@ -0,0 +1,19 @@
+#@TYPE: Machine
+#@Name: Genisi EFIKA MX Development Platform
+#@DESCRIPTION: Machine configuration for the EFIKA development platform (http://www.powerdeveloper.org/platforms/efikamx)
+
+TARGET_ARCH = "arm"
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-efikamx"
+
+MACHINE_FEATURES = "kernel26 usbhost ext2 alsa"
+
+#don't try to access tty1
+USE_VT = "0"
+
+SERIAL_CONSOLE = "115200 ttymxc0"
+
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-efikamx"
+
+#tune for ARMv7/Cortex A8
+require conf/machine/include/tune-cortexa8.inc
-- 
1.7.1



