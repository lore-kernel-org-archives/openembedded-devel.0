Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC716B3DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2013 21:53:06 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so327956eak.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2013 14:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RVbMo2KmCrBeQ2AX+rpErmi0Oq+9n0SdxoqgYPrFPIo=;
	b=E7Mcfd5e0XcIZI4hAIiNpBM2lSknOlJ1Js7nXztOcJXo0V+Rb9TMmJIb8j2LNrfOeo
	JtiJG0D5TEMIdMccqzigD6lEuJuZtR9X+PiNtQQp7NDAksc/qDybj7B8Lv8oPi4eIhMA
	nq1Ec/nipZcPMiArEJnTClCp+SlIxe+lqBM+TlcGEuPD913BDIB6K5c7uNvDfFEZx4F2
	7h3F1fhr4LNr/w5+CYUyF6GLJ93Ai49K6awpAMoKJHoS8neBPUBk9395YAS5iWgaBCAZ
	RaMqUxnN2X20SzxIMRGrwVVyIrDHBXaprzaXLr9FZD4HlIftAeyTvkr+aRvTknTPmkml
	M2MQ==
X-Received: by 10.14.108.7 with SMTP id p7mr29589196eeg.3.1375134786463;
	Mon, 29 Jul 2013 14:53:06 -0700 (PDT)
Received: from mizar.localdomain
	(host218-250-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.250.218]) by mx.google.com with ESMTPSA id
	bj46sm105000101eeb.13.2013.07.29.14.53.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 14:53:05 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jul 2013 23:52:57 +0200
Message-Id: <1375134777-3053-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld] Pull request 20130729
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jul 2013 21:53:07 -0000

The following changes since commit 8f2bec330b1463dc39d35769214cb324a1d4fdc9:

  linux-yocto-tiny-kexecboot_3.8: use 'require' instead of 'include' for compliance (2013-07-08 13:36:04 +0100)

are available in the git repository at:

  https://github.com/andrea-adami/meta-handheld master

for you to fetch changes up to dac9460bd0b18ac82b852e2827481657b9f24608:

  linux-yocto-tiny-kexecboot_3.8: tosa-tiny.scc: reflect last patchset changes (2013-07-19 00:59:18 +0200)

----------------------------------------------------------------
Andrea Adami (22):
      linux-yocto_3.8: pxamci-regulator.patch: refactor for upstream submission
      linux-yocto_3.8: sharpsl_param.patch: refactor for upstream submission
      linux-yocto_3.8: collie-eraseinfo.patch: refactor for upstream submission
      linux-yocto_3.8: collie-jedec-probe.patch: refactor for upstream submission
      linux-yocto_3.8: locomo_kbd_tweak-r2.patch: refactor header and footer
      linux-yocto_3.8: ucb1x00-device.patch: refactor for upstream submission
      linux-yocto_3.8: add ucb1x00-device.patch
      linux-yocto_3.8: add collie_battery-dev-pm.patch
      linux-yocto_3.8: collie.scc: reflect last patchset changes
      linux-yocto_3.8: tosa.scc: add tosa_battery_irq_to_gpio.patch
      linux-yocto_3.8: tosa.cfg: add ts WM97XX and tosa_battery modules
      linux-yocto-tiny-kexecboot_3.8: resync locomo_kbd_tweak-r2.patch with linux-yocto_3.8
      linux-yocto-tiny-kexecboot_3.8: resync collie-eraseinfo.patch with linux-yocto_3.8
      linux-yocto-tiny-kexecboot_3.8: resync collie-jedec-probe.patch with linux-yocto_3.8
      linux-yocto-tiny-kexecboot_3.8: resync pxamci-regulator.patch with linux-yocto_3.8
      linux-yocto-tiny-kexecboot_3.8: resync sharpsl_param.patch with linux-yocto_3.8
      linux-yocto-tiny-kexecboot_3.8: resync mcp-device.patch with linux-yocto_3.8
      linux-yocto-tiny-kexecboot_3.8: add ucb1x00.patch from linux-yocto_3.8
      linux-yocto-tiny-kexecboot_3.8: add collie_battery-dev-pm.patch from linux-yocto_3.8
      linux-yocto-tiny-kexecboot_3.8: collie-tiny.scc: reflect last patchset changes
      linux-yocto-tiny-kexecboot_3.8: add tosa_battery_irq_to_gpio.patch from linux-yocto_3.8
      linux-yocto-tiny-kexecboot_3.8: tosa-tiny.scc: reflect last patchset changes

 .../linux/linux-yocto-3.8/collie/collie.scc        |  2 +
 .../patches-locomokbd/locomo_kbd_tweak-r2.patch    | 12 ++++--
 .../patches/patches-mfd/mcp-device.patch           | 48 +++++++---------------
 .../patches/patches-mfd/ucb1x00-device.patch       | 28 +++++++++++++
 .../patches/patches-mtd/collie-eraseinfo.patch     | 25 ++++++++---
 .../patches/patches-mtd/collie-jedec-probe.patch   | 25 ++++++++---
 .../patches-power/collie_battery-dev-pm.patch      | 39 ++++++++++++++++++
 .../patches-power/tosa_battery_irq_to_gpio.patch   | 39 ++++++++++++++++++
 .../patches/patches-pxa/pxamci-regulator.patch     | 25 +++++++----
 .../patches/patches-pxa/sharpsl_param.patch        | 29 ++++++++-----
 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg |  8 ++++
 recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc |  1 +
 .../collie/collie-tiny.scc                         |  2 +
 .../patches-locomokbd/locomo_kbd_tweak-r2.patch    | 12 ++++--
 .../patches/patches-mfd/mcp-device.patch           | 48 +++++++---------------
 .../patches/patches-mfd/ucb1x00-device.patch       | 28 +++++++++++++
 .../patches/patches-mtd/collie-eraseinfo.patch     | 25 ++++++++---
 .../patches/patches-mtd/collie-jedec-probe.patch   | 25 ++++++++---
 .../patches-power/collie_battery-dev-pm.patch      | 39 ++++++++++++++++++
 .../patches-power/tosa_battery_irq_to_gpio.patch   | 39 ++++++++++++++++++
 .../patches/patches-pxa/pxamci-regulator.patch     | 25 +++++++----
 .../patches/patches-pxa/sharpsl_param.patch        | 29 ++++++++-----
 .../tosa/tosa-tiny.scc                             |  1 +
 23 files changed, 422 insertions(+), 132 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/ucb1x00-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/collie_battery-dev-pm.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/ucb1x00-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/collie_battery-dev-pm.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch

