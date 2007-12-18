Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J4QVy-0003xm-Au
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2007 01:40:54 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id C9F917E059;
	Mon, 17 Dec 2007 19:36:02 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 17 Dec 2007 19:36:02 -0500
X-Sasl-enc: Zf6v6yMgqta7/CSSvnDSH39RbAhg28tGlYbGY/dQZnk7 1197938162
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id C04184D97;
	Mon, 17 Dec 2007 19:36:01 -0500 (EST)
Message-ID: <476715B3.9050900@whitby.id.au>
Date: Tue, 18 Dec 2007 11:04:59 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <47671326.3090300@whitby.id.au>
In-Reply-To: <47671326.3090300@whitby.id.au>
X-Enigmail-Version: 0.95.5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: pfalcon: revert r5dc6982e... vfat nls modules are not for task-base-kernel26
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2007 00:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Rod Whitby wrote:
> I expect you to revert this change and do it properly, or not do it at all.

Here's an untested example patch to get you started.  You'll probably
want to change the comments before applying something similar.  Note
again that it is untested - that's your job, not mine.

> #
> # old_revision [bc668ae9f53d5e7dbaeee92daced9790f1be61e0]
> #
> # patch "packages/tasks/task-base.bb"
> #  from [f33c49fb3e3820bd151a0e0035b125643a46b85a]
> #    to [643465073bdf81ce0f09fb63480d026b4c6f3e28]
> #
> ============================================================
> --- packages/tasks/task-base.bb f33c49fb3e3820bd151a0e0035b125643a46b85a
> +++ packages/tasks/task-base.bb 643465073bdf81ce0f09fb63480d026b4c6f3e28
> @@ -15,6 +15,7 @@ PACKAGES = ' \
>              ${@base_contains("MACHINE_FEATURES", "alsa", "task-base-alsa", "", d)} \
>              ${@base_contains("MACHINE_FEATURES", "apm", "task-base-apm", "", d)} \
>              ${@base_contains("MACHINE_FEATURES", "ext2", "task-base-ext2", "", d)} \
> +            ${@base_contains("MACHINE_FEATURES", "vfat", "task-base-vfat", "", d)} \
>              ${@base_contains("MACHINE_FEATURES", "irda", "task-base-irda", "",d)} \
>              ${@base_contains("MACHINE_FEATURES", "keyboard", "task-base-keyboard", "", d)} \
>              ${@base_contains("MACHINE_FEATURES", "pci", "task-base-pci", "",d)} \
> @@ -87,6 +88,7 @@ RDEPENDS_task-base = "\
>      \
>      ${@base_contains('COMBINED_FEATURES', 'alsa', 'task-base-alsa', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'ext2', 'task-base-ext2', '',d)} \
> +    ${@base_contains('COMBINED_FEATURES', 'vfat', 'task-base-vfat', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'irda', 'task-base-irda', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'pci', 'task-base-pci', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'task-base-pcmcia', '',d)} \
> @@ -159,14 +161,7 @@ RRECOMMENDS_task-base-kernel24 = "\
>      kernel-module-input \
>      kernel-module-uinput"
> 
> -# utf8 - Standard FS encoding
> -# iso8859-1, cp437 - These 2 are default encodings used by VFAT
> -# If you don't need VFAT support - don't enable them in defconfig.
> -# If you build them, you want VFAT support and they're included by default.
>  RRECOMMENDS_task-base-kernel26 = "\
> -    kernel-module-nls-utf8 \
> -    kernel-module-nls-iso8859-1 \
> -    kernel-module-nls-cp437 \
>      kernel-module-input \
>      kernel-module-uinput \
>      kernel-module-rtc-dev \
> @@ -194,6 +189,15 @@ RDEPENDS_task-base-ext2 = "\
>      e2fsprogs-e2fsck \
>      e2fsprogs-mke2fs"
> 
> +# utf8 - Standard FS encoding
> +# iso8859-1, cp437 - These 2 are default encodings used by VFAT
> +# If you don't need VFAT support - don't enable them in defconfig.
> +# If you build them, you want VFAT support and they're included by default.
> +RRECOMMENDS_task-base-vfat = "\
> +    kernel-module-nls-utf8 \
> +    kernel-module-nls-iso8859-1 \
> +    kernel-module-nls-cp437"
> +
>  RDEPENDS_task-base-alsa = "\
>      alsa-utils-alsactl \
>      alsa-utils-alsamixer"

-- Rod


