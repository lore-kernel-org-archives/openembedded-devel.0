Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JfKHk-000763-0V
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 20:30:44 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JfKHc-0007yP-9X
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 19:30:36 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 19:30:36 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 28 Mar 2008 19:30:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Fri, 28 Mar 2008 20:30:25 +0100
Message-ID: <fsjh0h$6k1$1@ger.gmane.org>
References: <47ED3CE1.7020000@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <47ED3CE1.7020000@bolloretelecom.eu>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: uImage generation: kernel.bbclass vs linux.inc
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
X-List-Received-Date: Fri, 28 Mar 2008 19:30:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeremy Lainé schreef:
| With the recent changes to kernel.bbclass it seems that uboot-mkimage is
| called twice:
|
| linux.inc: do_compile_append()
|
| 1/ uses uboot-mkimage to generate generates arch/${ARCH}/boot/uImage

That's needed to get the correct uImage packaged, some machines have the
uImage in the rootfs (don't turn on lzo in jffs2, uboot doesn't like that).

| kernel.bbclass: do_deploy()
|
| 1/ copies arch/${ARCH}/boot/uImage to
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
|
| 2/ does package_stagefile_shell
| ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.bin
|
| 3/ uses uboot-mkimage to generate
| ${DEPLOY_DIR_IMAGE}/uImage-${PV}-${PR}-${MACHINE}.bin
|
| This seems pretty inconsistent! Also, why the hard-coded uImage-xyz file
| name, shouldn't we be using KERNEL_IMAGE_BASE_NAME?
|
| To make things a bit more interesting, KERNEL_IMAGE_BASE_NAME is set
| differently in kernel.bbclass and linux.inc:
|
| kernel.bbclass :
| KERNEL_IMAGE_BASE_NAME =
| ${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
|
| linux.inc:
| KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}"

Looking at how OE mananges zImages, it probably should be something like:

${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE} with a
symlink to ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}

and

/boot/${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE} with a symlink to
/boot/${KERNEL_IMAGETYPE} on the target.

That raises the question how kexec handles uImage files and how we can
make it easy for people to generate uImage for flashing and zImage for
kexecing in the same build.

DATETIME in version strings should die, we have PR for that. If the
output changed, PR should have been bumped. Lazyness is not a valid
excuse for littering my deploydir with identical files with a different
timestamp each build. Your filesystem has mtime if you really want to
see a date.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH7UdRMkyGM64RGpERArOtAJ9rVNs9JEwyjwz8fSiQv1L5OrLdBgCeJafZ
WrJMEs48LDXwh5pS/tIx+pw=
=SUZJ
-----END PGP SIGNATURE-----



