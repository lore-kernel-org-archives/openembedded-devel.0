Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Q4wat-0002y7-58
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 16:41:59 +0200
Received: (qmail 27935 invoked by uid 2404007); 30 Mar 2011 14:33:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 87-206-60-144.dynamic.chello.pl (HELO ?192.168.1.112?)
	(marcin@juszkiewicz.com.pl@87.206.60.144)
	by host4.kei.pl with ESMTPA; 30 Mar 2011 14:33:18 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1301494030-10554-5-git-send-email-v2g.udel@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
	<1301494030-10554-5-git-send-email-v2g.udel@gmail.com>
Date: Wed, 30 Mar 2011 16:33:25 +0200
Message-ID: <1301495605.11614.10.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 5/6] Added images for the TS7500 ARM SBCs
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
X-List-Received-Date: Wed, 30 Mar 2011 14:41:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Dnia 2011-03-30, śro o godzinie 10:07 -0400, UDel V2G Team pisze:
> * This commit includes two images - one for building the initrd image and the other for
>   building the rootfs image.
> 
> Signed-off-by: UDel V2G Team <v2g.udel@gmail.com>

Please use real "name surname" instead.

> diff --git a/recipes/images/ts75xx-initrd-image.bb b/recipes/images/ts75xx-initrd-image.bb
> new file mode 100644
> index 0000000..306bf3a
> --- /dev/null
> +++ b/recipes/images/ts75xx-initrd-image.bb

> +# Use a newer version of busybox since it includes the nbd-client applet.
> +# We no longer need to build the nbd-client program since we enable this.
> +DEPENDS = "busybox-1.18.3"

This is ugly - please provide patch which will enable nbd-client in
default busybox instead.

> +IMAGE_INSTALL = "busybox 

> canctl dioctl dmxctl spictl ts-utils ts-initrd \

I suggest creating task-ts75xx for it. Will be easier to add them into
images.

> +# This should build all the correct device tables.
> +IMAGE_DEVICE_TABLES = "files/device_table-ts75xx.txt"

This should probably be set in machine config. What if I will build this
image for c7x0?

> +fix_image () {

s/fix_image/remove_any_files_we_do_not_want_in_initrd/

Some will be done by setting package management variable to "none".


> +++ b/recipes/images/ts75xx-rootfs-image.bb

> +IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp ; "

> +IMAGE_INIT_MANAGER = "sysvinit"

> +DISTRO_SSH_DAEMON = "openssh"

Do not override this - this is *distro* decision does it want openssh or
dropbear.

> +DEPENDS = "\
> +	task-proper-tools \
> +	${DISTRO_SSH_DAEMON} \
> +	${@base_contains('MACHINE_FEATURES', 'ext2', 'task-base-ext2', '', d)} \
> +	${@base_contains('MACHINE_FEATURES', 'usbhost', 'task-base-usbhost', '', d)} \
> +	canctl dioctl dmxctl spictl ts-utils ts-initrd \

> +	coreutils \
> +	findutils \
> +	bash \

Those are part of task-proper-tools iirc.

> +	python \

without extra modules?

> +KERNEL_MODULES = "\

why not install "kernel-modules" meta package instead?



