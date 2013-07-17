Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id DE0736B205
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 22:24:00 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id z5so1940997lbh.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 15:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ODmxmWo32U+7pSUy5ZUVeGlcmeyCTt1yKZBv0x2XL8Y=;
	b=sPFNRim+q/1Gq+bKVZKL0l9UeEvk22DGKUJxp04vQ9UEm2z9MkSKgSsN/dkNOiocoP
	OAo8vAfFAfq0ns2hi0v/aFEGebdnPZwJOSFYkGi2pR7NZNzs4QI6/pKA6JS93n6iDPGl
	TU5gAC90qiDJefyglmqkHg+RYxKTzoYG3ZgbW0xNzPZpWYGk3Hj+pdE0eJpeziHVWCbI
	zp+F53UM6pEu7aXGYC33ay2Jsli8zuFERMvoYOYxXpQ2kO4R8Wy+Kdo4xif1nljGZRsY
	o3rYLR6M0UByuYGvdsGRLNEpARuMpxT14rm6ABe6ZD6nNpJpbg7A/5CRCIeLxhfePHSE
	nrfw==
MIME-Version: 1.0
X-Received: by 10.152.28.6 with SMTP id x6mr3846409lag.41.1374099840591; Wed,
	17 Jul 2013 15:24:00 -0700 (PDT)
Received: by 10.112.168.161 with HTTP; Wed, 17 Jul 2013 15:24:00 -0700 (PDT)
In-Reply-To: <1374099561-25624-1-git-send-email-andrea.adami@gmail.com>
References: <1374099561-25624-1-git-send-email-andrea.adami@gmail.com>
Date: Thu, 18 Jul 2013 00:24:00 +0200
Message-ID: <CAAQYJAsJGZJK6VpGkr_0hPvWawt40zJLu1UGKSYWN_OUy-qz9w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-initramfs] Pull request 20130717
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
X-List-Received-Date: Wed, 17 Jul 2013 22:24:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please discard this request, wrong subject line...intended for [meta-handheld]


On Thu, Jul 18, 2013 at 12:09 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> The following changes since commit 8f2bec330b1463dc39d35769214cb324a1d4fdc9:
>
>   linux-yocto-tiny-kexecboot_3.8: use 'require' instead of 'include' for compliance (2013-07-08 13:36:04 +0100)
>
> are available in the git repository at:
>
>   https://github.com/andrea-adami/meta-handheld master
>
> for you to fetch changes up to e71e1528062c6b24ee1f93e69b1f529b15edd919:
>
>   linux-yocto-tiny-kexecboot_3.8: tosa-tiny.scc: reflect last patchset changes (2013-07-17 23:19:43 +0200)
>
> ----------------------------------------------------------------
> Andrea Adami (22):
>       linux-yocto_3.8: pxamci-regulator.patch: refactor headers
>       linux-yocto_3.8: sharpsl_param.patch: refactor for upstream submission
>       linux-yocto_3.8: collie-eraseinfo.patch: refactor for upstream submission
>       linux-yocto_3.8: collie-jedec-probe.patch: refactor for upstream submission
>       linux-yocto_3.8: locomo_kbd_tweak-r2.patch: refactor header and footer
>       linux-yocto_3.8: ucb1x00-device.patch: refactor for upstream submission
>       linux-yocto_3.8: add ucb1x00-device.patch
>       linux-yocto_3.8: add collie_battery-dev-pm.patch
>       linux-yocto_3.8: collie.scc: reflect last patchset changes
>       linux-yocto_3.8: tosa.scc: add tosa_battery_irq_to_gpio.patch
>       linux-yocto_3.8: tosa.cfg: add ts WM97XX and tosa_battery modules
>       linux-yocto-tiny-kexecboot_3.8: resync locomo_kbd_tweak-r2.patch with linux-yocto_3.8
>       linux-yocto-tiny-kexecboot_3.8: resync collie-eraseinfo.patch with linux-yocto_3.8
>       linux-yocto-tiny-kexecboot_3.8: resync collie-jedec-probe.patch with linux-yocto_3.8
>       linux-yocto-tiny-kexecboot_3.8: resync pxamci-regulator.patch with linux-yocto_3.8
>       linux-yocto-tiny-kexecboot_3.8: resync sharpsl_param.patch with linux-yocto_3.8
>       linux-yocto-tiny-kexecboot_3.8: resync mcp-device.patch with linux-yocto_3.8
>       linux-yocto-tiny-kexecboot_3.8: add ucb1x00.patch from linux-yocto_3.8
>       linux-yocto-tiny-kexecboot_3.8: add collie_battery-dev-pm.patch from linux-yocto_3.8
>       linux-yocto-tiny-kexecboot_3.8: collie-tiny.scc: reflect last patchset changes
>       linux-yocto-tiny-kexecboot_3.8: add tosa_battery_irq_to_gpio.patch from linux-yocto_3.8
>       linux-yocto-tiny-kexecboot_3.8: tosa-tiny.scc: reflect last patchset changes
>
>  .../linux/linux-yocto-3.8/collie/collie.scc        |  2 +
>  .../patches-locomokbd/locomo_kbd_tweak-r2.patch    | 12 ++++--
>  .../patches/patches-mfd/mcp-device.patch           | 48 +++++++---------------
>  .../patches/patches-mfd/ucb1x00-device.patch       | 28 +++++++++++++
>  .../patches/patches-mtd/collie-eraseinfo.patch     | 25 ++++++++---
>  .../patches/patches-mtd/collie-jedec-probe.patch   | 25 ++++++++---
>  .../patches-power/collie_battery-dev-pm.patch      | 39 ++++++++++++++++++
>  .../patches-power/tosa_battery_irq_to_gpio.patch   | 39 ++++++++++++++++++
>  .../patches/patches-pxa/pxamci-regulator.patch     | 13 ++++--
>  .../patches/patches-pxa/sharpsl_param.patch        | 25 +++++++----
>  recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.cfg |  8 ++++
>  recipes-kernel/linux/linux-yocto-3.8/tosa/tosa.scc |  1 +
>  .../collie/collie-tiny.scc                         |  2 +
>  .../patches-locomokbd/locomo_kbd_tweak-r2.patch    | 12 ++++--
>  .../patches/patches-mfd/mcp-device.patch           | 48 +++++++---------------
>  .../patches/patches-mfd/ucb1x00-device.patch       | 28 +++++++++++++
>  .../patches/patches-mtd/collie-eraseinfo.patch     | 25 ++++++++---
>  .../patches/patches-mtd/collie-jedec-probe.patch   | 25 ++++++++---
>  .../patches-power/collie_battery-dev-pm.patch      | 39 ++++++++++++++++++
>  .../patches-power/tosa_battery_irq_to_gpio.patch   | 39 ++++++++++++++++++
>  .../patches/patches-pxa/pxamci-regulator.patch     | 13 ++++--
>  .../patches/patches-pxa/sharpsl_param.patch        | 25 +++++++----
>  .../tosa/tosa-tiny.scc                             |  1 +
>  23 files changed, 402 insertions(+), 120 deletions(-)
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-mfd/ucb1x00-device.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/collie_battery-dev-pm.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-mfd/ucb1x00-device.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/collie_battery-dev-pm.patch
>  create mode 100644 recipes-kernel/linux/linux-yocto-tiny-kexecboot-3.8/patches/patches-power/tosa_battery_irq_to_gpio.patch

