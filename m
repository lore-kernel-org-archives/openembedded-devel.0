Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8C46D6B205
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 22:09:55 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so1342647eaj.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/jNiiB41mNCbI7zNzSBaoLZ9QBWrVS3wYep3dVQUBZM=;
	b=BFEk3x/y9k4vOBLH9nGKc8e4QWZ55c+WDe19drBYqN89iihX4xaVgV866StgdpPZAE
	6GuF0OmKy263ETW1Njm/t9xD1ztgnMvPBkiBsBFSBI308J6ZNoGB448hQLUbMYtbAxM9
	f8S2wf6tDQaON17Slv8fybIqUtYSYBZOkfhmConccOj3oL43BXBKn+UOUikP/uTZb4c0
	4vpJz0jSzIXqFHyzxaMmyQZf+wCrMQnoOo1vyBZoM323xGR/smT/MO3Xp9a2PR8VwZ/7
	l1v1s9xcUz62mrPEzq1mRYENPNf7/mXK9h0sHCRpF62V5Vfnit8jF20AkUqF8gTUCbXk
	uOYA==
X-Received: by 10.14.47.196 with SMTP id t44mr8375289eeb.18.1374098995302;
	Wed, 17 Jul 2013 15:09:55 -0700 (PDT)
Received: from mizar.localdomain
	(host96-245-dynamic.48-82-r.retail.telecomitalia.it. [82.48.245.96])
	by mx.google.com with ESMTPSA id
	e44sm14149036eeh.11.2013.07.17.15.09.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Jul 2013 15:09:54 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jul 2013 00:09:50 +0200
Message-Id: <1374098990-4909-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs] Pull request 20130717
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
X-List-Received-Date: Wed, 17 Jul 2013 22:09:55 -0000

The following changes since commit 8f2bec330b1463dc39d35769214cb324a1d4fdc9:

  linux-yocto-tiny-kexecboot_3.8: use 'require' instead of 'include' for compliance (2013-07-08 13:36:04 +0100)

are available in the git repository at:

  https://github.com/andrea-adami/meta-handheld master

for you to fetch changes up to e71e1528062c6b24ee1f93e69b1f529b15edd919:

  linux-yocto-tiny-kexecboot_3.8: tosa-tiny.scc: reflect last patchset changes (2013-07-17 23:19:43 +0200)

----------------------------------------------------------------
Andrea Adami (22):
      linux-yocto_3.8: pxamci-regulator.patch: refactor headers
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
 .../patches/patches-pxa/pxamci-regulator.patch     | 13 ++++--
 .../patches/patches-pxa/sharpsl_param.patch        | 25 +++++++----
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
 .../patches/patches-pxa/pxamci-regulator.patch     | 13 ++++--
 .../patches/patches-pxa/sharpsl_param.patch        | 25 +++++++----
 .../tosa/tosa-tiny.scc                             |  1 +
 23 files changed, 402 insertions(+), 120 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/ucb1x00-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/collie_battery-dev-pm.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/ucb1x00-device.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/collie_battery-dev-pm.patch
 create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch

