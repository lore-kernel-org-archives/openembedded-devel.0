Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JTZR3-0005Dy-0w
	for openembedded-devel@openembedded.org; Mon, 25 Feb 2008 10:15:50 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JTZQa-0008KH-Mo
	for openembedded-devel@openembedded.org; Mon, 25 Feb 2008 09:15:16 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 25 Feb 2008 09:15:16 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 25 Feb 2008 09:15:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Mon, 25 Feb 2008 10:15:11 +0100
Message-ID: <fpu0uv$oi8$1@ger.gmane.org>
References: <20080225014825.36e60782@widy.localdomain>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
In-Reply-To: <20080225014825.36e60782@widy.localdomain>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [RFC] initramfs support for linux-handhelds-2.6
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
X-List-Received-Date: Mon, 25 Feb 2008 09:15:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
| Hello,
|
| Failing to add generic and fully automated kernel-with-initramfs build,
| I have patch to add external initramfs to kernel for linux-hh. I'd
| still like to establish conventions for other kernel recipes to follow,
| so here're the patch for suggestion. The idea is simple:
|
| 1. KERNEL_INITRAMFS_PATH is set to the full path of cpio.gz image to
| use as initramfs. Empty value (default) means don't use initramfs. If
| file doesn't exist, build fails with an error message (content is left
| to specific recipe - there unfortunately doesn't seem to be a way to
| sensibly provide detailed one in generic case).
|
| 2. KERNEL_INITRAMFS_PATH is considered a distro realm, like for example
| kernel PREFERRED_VERSION. Below, angstrom distro config sets it.

| +KERNEL_INITRAMFS_PATH =
"${TMPDIR}/deploy/uclibc/images/${MACHINE}/initramfs-bootmenu-image-${MACHINE}.cpio.gz"

| +	if [ -n "${KERNEL_INITRAMFS_PATH}" -a "${ANGSTROM_MODE}" == "glibc"
]; then

A number of things:

1) Make the initramfs generation a seperate function (or task) that can
be called at will, instead of always being called in do_compile_prepend
2) Keep it simple and keep the kernel and initramfs in the same libc
realm, so a uclibc based initramfs needs a uclibc kernel (I known there
is no such thing, but you get the idea). That way you can just fish it
out of DEPLOY_DIR_IMAGE
3) Add an initramfs-<kernel-name_version>.bb that does

~  require <kernel-name_version>.bb
~  FILESPATH = "/path/magic/whatever"
~  do_compile_prepend() { do_initramfs}

This involves some extra build time ('uclibc' kernel build and a
'uclibc' initramfs kernel build), but is more transparent and less error
prone than your plan. I think it even avoids the dependency problems :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHwocfMkyGM64RGpERAg7gAJ0W2JIsJNjLiJoGwAVHdYvmNa8jPACfVc0x
0UDx1orbRuEtQB5eITl23N0=
=8LWE
-----END PGP SIGNATURE-----



