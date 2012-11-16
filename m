Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TZPeg-0006fG-G6
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 18:24:40 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so1245622bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2012 09:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=W4yNfssAPU3hFbPXCcLDx43kXtyo/xEMDTfVxYmZ2H8=;
	b=h5Ka/7mHuY/vLjLpHMSwQCT1++02aD5p6NFfe/qgSa1HtEYQQ5NfFZiVtu/5yXkTUL
	DNnZ+izaz9V1N6bEmlt44R8TFGOdykCUGpjwDamP2bciT6dn/SwmMWYU7pc26QCsO6W0
	RuI7MrtrNo4LbleuGqs/FO5UFTfUVPFNHLqSt0O0tyrLnSKIsTxdP38ikC2EItpgQzuz
	uY84KSJ5CGacejHRADcNnGU5llpQrBN205ZpdXWRbimfWSS/PSU15kj35UWmj0g6U5GZ
	RNl+ddQvTH5HpOgZFKYauVmEFGqoRarcXc3pKBcGY35UA7TXfEqBKkvyFUoLNAizx2I8
	6Wuw==
Received: by 10.204.150.210 with SMTP id z18mr2236276bkv.53.1353085833764;
	Fri, 16 Nov 2012 09:10:33 -0800 (PST)
Received: from localhost.localdomain (93-136-14-159.adsl.net.t-com.hr.
	[93.136.14.159])
	by mx.google.com with ESMTPS id v14sm1662308bkv.10.2012.11.16.09.10.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 09:10:32 -0800 (PST)
From: dromede@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Nov 2012 18:10:42 +0100
Message-Id: <1353085842-4528-1-git-send-email-dromede@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] [meta-handheld] kexecboot-handhelds.inc: Add explicit support for 16 bit displays.
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
X-List-Received-Date: Fri, 16 Nov 2012 17:24:41 -0000

From: Marko Katic <dromede.gmail.com>

All machines referenced in kexecboot-handhelds.inc have 16 bit displays.
Kexecboot will by default enable support for 1,2,4,16,18,24 and 32 bit displays.

Add compile time options that only enable 16 bit support for these machines.
This should slightly reduce the size of the kexecboot binary.

Signed-off-by: Marko Katic <dromede.gmail.com>
---
 recipes-bsp/kexecboot/kexecboot-handhelds.inc |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/kexecboot/kexecboot-handhelds.inc b/recipes-bsp/kexecboot/kexecboot-handhelds.inc
index ab3deca..9030797 100644
--- a/recipes-bsp/kexecboot/kexecboot-handhelds.inc
+++ b/recipes-bsp/kexecboot/kexecboot-handhelds.inc
@@ -1,6 +1,6 @@
-EXTRA_OECONF_akita = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
-EXTRA_OECONF_c7x0 = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
-EXTRA_OECONF_spitz = "--enable-zaurus --enable-delay=3 --enable-evdev-rate=1000,250 --enable-fbui-width=480"
-EXTRA_OECONF_poodle = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250"
-EXTRA_OECONF_tosa = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250"
-EXTRA_OECONF_collie = "--enable-delay=2 --enable-evdev-rate=1000,250"
+EXTRA_OECONF_akita = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480 --enable-bpp=16"
+EXTRA_OECONF_c7x0 = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480 --enable-bpp=16"
+EXTRA_OECONF_spitz = "--enable-zaurus --enable-delay=3 --enable-evdev-rate=1000,250 --enable-fbui-width=480 --enable-bpp=16"
+EXTRA_OECONF_poodle = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 ---enable-bpp=16"
+EXTRA_OECONF_tosa = "--enable-zaurus --enable-delay=2 --enable-evdev-rate=1000,250 --enable-bpp=16"
+EXTRA_OECONF_collie = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-bpp=16"
-- 
1.7.9.5



