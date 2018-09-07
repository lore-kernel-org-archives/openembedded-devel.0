Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A2EB960596
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 16:44:23 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id t25-v6so15219659wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 09:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C8slR+hCfie2hwVgEz295vZe4PLs54ldNGCOGq+oElM=;
	b=FiF+RKKkymLU4ulNXXx2JIHCRCoygTTXyMQggJiavjx2vIotzGV41IuSwff8A9GiXe
	c4yrqUgcGzDukShiMQWZM4CsJa0Cta5B1TKFKaRrkHyLHva0Dmyx4xxSjW1WiLHBfB3b
	CeqVyVKsOGdU7zFWKRblZxHHiPwRw+2OvwD2YTo/CR43JLS8Rh0+EmzQ4Dda61Z/fgnB
	JU/umyMATtVmBt792NCv21PjSH689dxhy5fkljF92wJSdd7olvZH1DhOuZ8mJIX5BcRF
	+qubMykyQN8oeiUUY3pjQxMAEJlorzYB1ctmaKL5w07cdB1onvoSXFiv6Dd/dLsfOfNm
	aKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C8slR+hCfie2hwVgEz295vZe4PLs54ldNGCOGq+oElM=;
	b=tEimgRGDFycHBX3/oRyf0VDH+PJlt4W47Uf1FycAvtgXFqnR0UpFBMMN4OHarVW1wy
	WOcz0UuR6gOMz17pHH3qTUPrG/ZeGZIN8sUc0vvat+rWbzj2XUAkcAo6r+xyrtSUZeK6
	SJAH23/PdVCW5batmlgV4UfremDGLiM0B5pK4raNkMeOa0epi8Nc+xuLysWUPTmMp95O
	SpqoejO5bz+d+DSPCzFHvM5TM1pfdmT3/m2yfQ674+rtb0zjEjhcW1m1oP0PUA1Op5Wt
	iYp2UCU7Z09fFagsmygHQiXN5wzUiokwYHFaB3cTnZYfniV7VlH8tVNWjkynjqN0UpQ0
	9KiQ==
X-Gm-Message-State: APzg51CWoNSEyWZSBBiTZpR3sjRY+Azm3TccpY+tni7ZaADDy/jC6pSd
	VXslKJ+opldU3/aB5tRHdu9Ca841
X-Google-Smtp-Source: ANB0VdbeJeMVwhEyNpMkx3ezpnck84Q160/feNIuHMxPEboANX7J2a7CsYQ1CgBQeJv3rkxG4i8dgA==
X-Received: by 2002:a1c:cc0e:: with SMTP id h14-v6mr6032039wmb.2.1536338664038;
	Fri, 07 Sep 2018 09:44:24 -0700 (PDT)
Received: from localhost.localdomain
	(host215-117-dynamic.54-82-r.retail.telecomitalia.it.
	[82.54.117.215]) by smtp.gmail.com with ESMTPSA id
	75-v6sm16418787wml.21.2018.09.07.09.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Sep 2018 09:44:23 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 18:44:20 +0200
Message-Id: <1536338660-3264-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld][PATCH kexecboot-handhelds: catch up with kexecboot upgrades (add --atags)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2018 16:44:25 -0000

With the actual kexec-tools-klibc > 2.0.17 in meta-initramfs we can use the
newly added fast reboot option (--no-checks).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/kexecboot/kexecboot-handhelds.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/kexecboot/kexecboot-handhelds.inc b/recipes-bsp/kexecboot/kexecboot-handhelds.inc
index f7f9a37..06bf96d 100644
--- a/recipes-bsp/kexecboot/kexecboot-handhelds.inc
+++ b/recipes-bsp/kexecboot/kexecboot-handhelds.inc
@@ -1,6 +1,6 @@
-EXTRA_OECONF_akita = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480 --enable-bpp=16"
-EXTRA_OECONF_c7x0 = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480 --enable-bpp=16"
-EXTRA_OECONF_spitz = "--enable-delay=3 --enable-evdev-rate=1000,250 --enable-fbui-width=480 --enable-bpp=16"
-EXTRA_OECONF_poodle = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-bpp=16"
-EXTRA_OECONF_tosa = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-bpp=16"
-EXTRA_OECONF_collie = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-bpp=16"
+EXTRA_OECONF_akita = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480 --enable-bpp=16 --enable-atags --enable-no-checks"
+EXTRA_OECONF_c7x0 = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-fbui-width=480 --enable-bpp=16 --enable-atags  --enable-no-checks"
+EXTRA_OECONF_spitz = "--enable-delay=3 --enable-evdev-rate=1000,250 --enable-fbui-width=480 --enable-bpp=16 --enable-atags  --enable-no-checks"
+EXTRA_OECONF_poodle = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-bpp=16 --enable-atags  --enable-no-checks"
+EXTRA_OECONF_tosa = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-bpp=16 --enable-atags  --enable-no-checks"
+EXTRA_OECONF_collie = "--enable-delay=2 --enable-evdev-rate=1000,250 --enable-bpp=16 --enable-atags  --enable-no-checks"
-- 
2.7.4


