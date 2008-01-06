Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JBfJu-0005ng-DH
	for openembedded-devel@openembedded.org; Mon, 07 Jan 2008 00:54:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m06NlWbx026095;
	Sun, 6 Jan 2008 23:47:32 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25617-08; Sun,  6 Jan 2008 23:47:26 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m06NlOaA026083
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 6 Jan 2008 23:47:24 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <1068494393.20080104031751@gmail.com>
References: <1068494393.20080104031751@gmail.com>
Date: Sun, 06 Jan 2008 23:47:23 +0000
Message-Id: <1199663243.4658.71.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: Another weird case of PACKAGES_DYNAMIC and task deps, it seems
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
X-List-Received-Date: Sun, 06 Jan 2008 23:54:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Paul,

On Fri, 2008-01-04 at 03:17 +0200, Paul Sokolovsky wrote:
> Hello openembedded-devel,
> 
>   Situation (as reported by Thomas Kunze on IRC):
> 1. Build from scratch
> 2. Kernel has been built.
> 3. Bitbake of initramfs-image.
> 4. Failure with:
> 
> | ERROR: Cannot satisfy the following dependencies for initramfs-module-loop:
> |        update-modules update-modules update-modules
> | ERROR: Cannot satisfy the following dependencies for initramfs-module-nfs:
> |        update-modules
> 
> initramfs-module-* doesn't Depends: on update-modules directly, but
> they Suggest: some kernel-module-* which in turn Depends: on
> update-modules.

Hmm. Which kernel is this with?


> kernel.bbclass has:
> 
> DEPENDS += "virtual/${TARGET_PREFIX}depmod-${@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> 
> But as we now know, that doesn't mean there will be package written
> for update-modules, only that it will be "built".

Nearly but not quite. rootfs_ipk.bbclass says:

do_rootfs[recrdeptask] += "do_package_write_ipk"

This means that every RDEPENDS, RRECOMMENDS and DEPENDS is followed and
the package_write_ipk for every package found must have run.

I just did a:

"bitbake poky-image-minimal -g; cat task-depends.dot | grep update-modules"

which gave me this list:

"poky-image-minimal.do_rootfs" -> "update-modules.do_populate_staging"
"poky-image-minimal.do_rootfs" -> "update-modules.do_package_write_ipk"
"linux.do_package" -> "update-modules.do_package"
"linux.do_configure" -> "update-modules.do_populate_staging"

and a load of other dependencies which we aren't interested in. The key
line is:

"poky-image-minimal.do_rootfs" -> "update-modules.do_package_write_ipk"

So the question is why doesn't your test case have this (I'm assuming it
doesn't). My best guess is that the kernel .bb file in question alters
DEPENDS and that update-modules isn't really in DEPENDS. Which
kernel .bb file serves the machine in question?

Cheers,

Richard





